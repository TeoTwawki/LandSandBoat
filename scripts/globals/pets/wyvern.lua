-----------------------------------
--  PET: Wyvern
-----------------------------------
require('scripts/globals/ability')
require('scripts/globals/job_utils/dragoon')
-----------------------------------
xi = xi or {}
invaderXim.pets = invaderXim.pets or {}
invaderXim.pets.wyvern = {}

local wyvernCapabilities =
{
    OFFENSIVE = 1,
    DEFENSIVE = 2,
    MULTI     = 3,
}

local wyvernTypes =
{
    [invaderXim.job.NONE] = wyvernCapabilities.OFFENSIVE,
    [invaderXim.job.WAR]  = wyvernCapabilities.OFFENSIVE,
    [invaderXim.job.MNK]  = wyvernCapabilities.OFFENSIVE,
    [invaderXim.job.WHM]  = wyvernCapabilities.DEFENSIVE,
    [invaderXim.job.BLM]  = wyvernCapabilities.DEFENSIVE,
    [invaderXim.job.RDM]  = wyvernCapabilities.DEFENSIVE,
    [invaderXim.job.THF]  = wyvernCapabilities.OFFENSIVE,
    [invaderXim.job.PLD]  = wyvernCapabilities.MULTI,
    [invaderXim.job.DRK]  = wyvernCapabilities.MULTI,
    [invaderXim.job.BST]  = wyvernCapabilities.OFFENSIVE,
    [invaderXim.job.BRD]  = wyvernCapabilities.MULTI,
    [invaderXim.job.RNG]  = wyvernCapabilities.OFFENSIVE,
    [invaderXim.job.SAM]  = wyvernCapabilities.OFFENSIVE,
    [invaderXim.job.NIN]  = wyvernCapabilities.MULTI,
    [invaderXim.job.DRG]  = wyvernCapabilities.OFFENSIVE,
    [invaderXim.job.SMN]  = wyvernCapabilities.DEFENSIVE,
    [invaderXim.job.BLU]  = wyvernCapabilities.DEFENSIVE,
    [invaderXim.job.COR]  = wyvernCapabilities.OFFENSIVE,
    [invaderXim.job.PUP]  = wyvernCapabilities.OFFENSIVE,
    [invaderXim.job.DNC]  = wyvernCapabilities.OFFENSIVE,
    [invaderXim.job.SCH]  = wyvernCapabilities.DEFENSIVE,
    [invaderXim.job.GEO]  = wyvernCapabilities.DEFENSIVE,
    [invaderXim.job.RUN]  = wyvernCapabilities.MULTI,
}

-- healing breath uses ratios, so use a divisor as input
local function doHealingBreath(player, divisor)
    local breathHealRange = 14

    local healingbreath = invaderXim.jobAbility.HEALING_BREATH
    local wyvernType    = wyvernTypes[player:getSubJob()]

    if player:getMainLvl() >= 80 then
        healingbreath = invaderXim.jobAbility.HEALING_BREATH_IV
    elseif player:getMainLvl() >= 40 then
        healingbreath = invaderXim.jobAbility.HEALING_BREATH_III
    elseif player:getMainLvl() >= 20 then
        healingbreath = invaderXim.jobAbility.HEALING_BREATH_II
    end

    -- zone ID check? is this some strange master zoning but pet hasn't despawned in the other zone check?
    local function inBreathRange(target)
        return player:getPet():getZoneID() == target:getZoneID() and player:getPet():checkDistance(target) <= breathHealRange
    end

    if
        player:getHP() <= math.floor(player:getMaxHP() / divisor) and
        inBreathRange(player)
    then
        player:getPet():useJobAbility(healingbreath, player)
    elseif wyvernType == wyvernCapabilities.DEFENSIVE then
        local party = player:getPartyWithTrusts()
        for _, member in pairs(party) do
            if
                member:getHP() <= math.floor(member:getMaxHP() / divisor) and
                inBreathRange(member) and
                not member:isDead()
            then
                player:getPet():useJobAbility(healingbreath, member)
                break
            end
        end
    end
end

local function doStatusBreath(target, player)
    local wyvern = player:getPet()
    -- https://forum.square-enix.com/ffxi/threads/22659-dev1108-Job-Adjustments-Dragoon
    local removeBreathTable =
    {
    --  { lvl, ability                      , { statuses            } },
        { 40, invaderXim.jobAbility.REMOVE_PARALYSIS, { invaderXim.effect.PARALYSIS } },
        { 60, invaderXim.jobAbility.REMOVE_CURSE    , { invaderXim.effect.CURSE_I, invaderXim.effect.BANE, invaderXim.effect.DOOM } },
        { 80, invaderXim.jobAbility.REMOVE_DISEASE  , { invaderXim.effect.DISEASE, invaderXim.effect.PLAGUE } },
        { 20, invaderXim.jobAbility.REMOVE_BLINDNESS, { invaderXim.effect.BLINDNESS } },
        {  1, invaderXim.jobAbility.REMOVE_POISON   , { invaderXim.effect.POISON    } },
    }

    local breathRange = 14

    for k, v in pairs(removeBreathTable) do
        local minLevel = v[1]
        local ability = v[2]
        local statusEffects = v[3]

        if wyvern:getMainLvl() >= minLevel then
            for _, effect in pairs(statusEffects) do
                if
                    target:hasStatusEffect(effect) and
                    wyvern:checkDistance(target) <= breathRange
                then
                    wyvern:useJobAbility(ability, target)
                    return true
                end
            end
        end
    end

    return false
end

invaderXim.pets.wyvern.onMobSpawn = function(mob)
    local master = mob:getMaster()

    if master:getMod(invaderXim.mod.WYVERN_SUBJOB_TRAITS) > 0 then
        mob:addJobTraits(master:getSubJob(), master:getSubLvl())
    end

    local wyvernType = wyvernTypes[master:getSubJob()]

    if wyvernType == wyvernCapabilities.DEFENSIVE then
        master:addListener('WEAPONSKILL_USE', 'PET_WYVERN_WS', function(player, target, skillid)
            if not doStatusBreath(player, player) then
                local party = player:getParty()
                for _, member in pairs(party) do
                    if doStatusBreath(member, player) then
                        break
                    end
                end
            end
        end)

        -- 1/3 and 1/2 divisor for healing breath
        master:addListener('MAGIC_USE', 'PET_WYVERN_MAGIC', function(player, target, spell, action)
            local divisor = 3
            if player:getMod(invaderXim.mod.WYVERN_EFFECTIVE_BREATH) > 0 then
                divisor = 2
            end

            doHealingBreath(player, divisor)
        end)
    elseif
        wyvernType == wyvernCapabilities.OFFENSIVE or
        wyvernType == wyvernCapabilities.MULTI
    then
        master:addListener('WEAPONSKILL_USE', 'PET_WYVERN_WS', function(player, target, skillid)
            invaderXim.job_utils.dragoon.pickAndUseDamageBreath(player, target)
        end)
    end

    -- 1/4 and 1/3rd divisors for HP
    if wyvernType == wyvernCapabilities.MULTI then
        master:addListener('MAGIC_USE', 'PET_WYVERN_MAGIC', function(player, target, spell, action)
            local divisor = 4
            if player:getMod(invaderXim.mod.WYVERN_EFFECTIVE_BREATH) > 0 then
                divisor = 3
            end

            doHealingBreath(player, divisor)
        end)
    end

    master:addListener('ATTACK', 'PET_WYVERN_ENGAGE', function(player, target, action)
        local pet = player:getPet()
        if pet:getTarget() == nil or target:getID() ~= pet:getTarget():getID() then
            player:petAttack(target)
        end
    end)

    master:addListener('DISENGAGE', 'PET_WYVERN_DISENGAGE', function(player)
        player:petRetreat()
    end)

    -- https://www.bg-wiki.com/ffxi/Wyvern_(Dragoon_Pet)#Parameter_Increase
    master:addListener('EXPERIENCE_POINTS', 'PET_WYVERN_EXP', function(playerObj, mobObj, exp)
        invaderXim.job_utils.dragoon.addWyvernExp(playerObj, exp)
    end)
end

local function removeWyvernLevels(mob)
    local master  = mob:getMaster()
    local numLvls = mob:getLocalVar('level_Ups')

    if numLvls ~= 0 then
        local wyvernAttributeIncreaseEffectJP = master:getJobPointLevel(invaderXim.jp.WYVERN_ATTR_BONUS)
        local wyvernBonusDA = master:getMod(invaderXim.mod.WYVERN_ATTRIBUTE_DA)

        master:delMod(invaderXim.mod.ATT, wyvernAttributeIncreaseEffectJP * numLvls)
        master:delMod(invaderXim.mod.DEF, wyvernAttributeIncreaseEffectJP * numLvls)
        master:delMod(invaderXim.mod.ATTP, 4 * numLvls)
        master:delMod(invaderXim.mod.DEFP, 4 * numLvls)
        master:delMod(invaderXim.mod.HASTE_ABILITY, 200 * numLvls)
        master:delMod(invaderXim.mod.DOUBLE_ATTACK, wyvernBonusDA * numLvls)
        master:delMod(invaderXim.mod.ALL_WSDMG_ALL_HITS, 2 * numLvls)
    end
end

invaderXim.pets.wyvern.onMobDeath = function(mob, player)
    removeWyvernLevels(mob)

    local master  = mob:getMaster()
    master:removeListener('PET_WYVERN_WS')
    master:removeListener('PET_WYVERN_MAGIC')
    master:removeListener('PET_WYVERN_ENGAGE')
    master:removeListener('PET_WYVERN_DISENGAGE')
    master:removeListener('PET_WYVERN_EXP')
end

invaderXim.pets.wyvern.onPetLevelRestriction = function(pet)
    removeWyvernLevels(pet)
    pet:setLocalVar('wyvern_exp', 0)
    pet:setLocalVar('level_Ups', 0)
end
