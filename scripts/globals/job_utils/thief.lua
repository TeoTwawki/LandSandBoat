-----------------------------------
-- Thief Job Utilities
-----------------------------------
require('scripts/globals/quests')
require('scripts/globals/utils')
-----------------------------------
xi = xi or {}
invaderXim.job_utils = invaderXim.job_utils or {}
invaderXim.job_utils.thief = invaderXim.job_utils.thief or {}

-----------------------------------
-- Variable Definitions
-----------------------------------

local despoilDebuffs =
{
    invaderXim.effect.EVASION_DOWN,
    invaderXim.effect.DEFENSE_DOWN,
    invaderXim.effect.ACCURACY_DOWN,
    invaderXim.effect.ATTACK_DOWN,
    invaderXim.effect.MAGIC_ATK_DOWN,
    invaderXim.effect.MAGIC_DEF_DOWN,
    invaderXim.effect.SLOW
}

local stealableSPEffects =
{
    invaderXim.effect.MIGHTY_STRIKES,   invaderXim.effect.HUNDRED_FISTS, invaderXim.effect.MANAFONT,     invaderXim.effect.CHAINSPELL,
    invaderXim.effect.PERFECT_DODGE,    invaderXim.effect.INVINCIBLE,    invaderXim.effect.BLOOD_WEAPON, invaderXim.effect.SOUL_VOICE,
    invaderXim.effect.MEIKYO_SHISUI,    invaderXim.effect.AZURE_LORE,    invaderXim.effect.TRANCE,       invaderXim.effect.BOLSTER,
    invaderXim.effect.ELEMENTAL_SFORZO
}

-----------------------------------
-- Local Functions
-----------------------------------
local function processDebuff(player, target, ability, debuff)
    local power = 10

    if debuff == invaderXim.effect.ATTACK_DOWN then
        ability:setMsg(invaderXim.msg.basic.DESPOIL_ATT_DOWN)
        power = 20
    elseif debuff == invaderXim.effect.DEFENSE_DOWN then
        ability:setMsg(invaderXim.msg.basic.DESPOIL_DEF_DOWN)
        power = 30
    elseif debuff == invaderXim.effect.MAGIC_ATK_DOWN then
        ability:setMsg(invaderXim.msg.basic.DESPOIL_MATT_DOWN)
    elseif debuff == invaderXim.effect.MAGIC_DEF_DOWN then
        ability:setMsg(invaderXim.msg.basic.DESPOIL_MDEF_DOWN)
        power = 20
    elseif debuff == invaderXim.effect.EVASION_DOWN then
        ability:setMsg(invaderXim.msg.basic.DESPOIL_EVA_DOWN)
        power = 30
    elseif debuff == invaderXim.effect.ACCURACY_DOWN then
        ability:setMsg(invaderXim.msg.basic.DESPOIL_ACC_DOWN)
        power = 20
    elseif debuff == invaderXim.effect.SLOW then
        ability:setMsg(invaderXim.msg.basic.DESPOIL_SLOW)

        local dMND = player:getStat(invaderXim.mod.MND) - target:getStat(invaderXim.mod.MND)

        if dMND >= 0 then
            power = 2 * dMND + 1500
        else
            power = dMND + 1500
        end

        power = utils.clamp(power, 750, 3000)
    end

    return power
end

-----------------------------------
-- Ability Check Functions
-----------------------------------
invaderXim.job_utils.thief.checkAccomplice = function(player, target, ability)
    if target == nil or target:getID() == player:getID() or not target:isPC() then
        return invaderXim.msg.basic.CANNOT_ON_THAT_TARG, 0
    else
        return 0, 0
    end
end

invaderXim.job_utils.thief.checkCollaborator = function(player, target, ability)
    if target == nil or target:getID() == player:getID() or not target:isPC() then
        return invaderXim.msg.basic.CANNOT_ON_THAT_TARG, 0
    else
        return 0, 0
    end
end

invaderXim.job_utils.thief.checkDespoil = function(player, target, ability)
    if player:getObjType() == invaderXim.objType.TRUST then -- Trust
        if
            player:getMaster():getFreeSlotsCount() == 0 or
            not target:getDespoilItem()
        then
            return 1, 0
        end
    else -- Player
        if player:getFreeSlotsCount() == 0 then
            return invaderXim.msg.basic.FULL_INVENTORY, 0
        end
    end

    return 0, 0
end

invaderXim.job_utils.thief.checkLarceny = function(player, target, ability)
    ability:setRecast(math.max(0, ability:getRecast() - player:getMod(invaderXim.mod.ONE_HOUR_RECAST) * 60))

    return 0, 0
end

invaderXim.job_utils.thief.checkPerfectDodge = function(player, target, ability)
    ability:setRecast(math.max(0, ability:getRecast() - player:getMod(invaderXim.mod.ONE_HOUR_RECAST) * 60))

    return 0, 0
end

invaderXim.job_utils.thief.checkSteal = function(player, target, ability)
    if player:getFreeSlotsCount() == 0 then
        return invaderXim.msg.basic.FULL_INVENTORY, 0
    else
        -- JP Recast Reduction
        local jpValue = player:getJobPointLevel(invaderXim.jp.STEAL_RECAST)

        ability:setRecast(ability:getRecast() - 2 * jpValue)

        return 0, 0
    end
end

-----------------------------------
-- Ability Use Functions
-----------------------------------
invaderXim.job_utils.thief.useAccomplice = function(player, target, ability)
    target:transferEnmity(player, 50 + player:getMod(invaderXim.mod.ACC_COLLAB_EFFECT), 20.6)
end

invaderXim.job_utils.thief.useAssassinsCharge = function(player, target, ability)
    local merits = player:getMerit(invaderXim.merit.ASSASSINS_CHARGE)
    local crit   = 0

    if player:getMod(invaderXim.mod.AUGMENTS_ASSASSINS_CHARGE) > 0 then
        crit = merits / 5
    end

    player:addStatusEffect(invaderXim.effect.ASSASSINS_CHARGE, merits - 5, 0, 60, 0, crit)
end

invaderXim.job_utils.thief.useBully = function(player, target, ability)
    local jpValue = player:getJobPointLevel(invaderXim.jp.BULLY_EFFECT)

    target:addStatusEffectEx(invaderXim.effect.DOUBT, invaderXim.effect.INTIMIDATE, 15 + jpValue, 0, 30)

    return invaderXim.effect.INTIMIDATE
end

invaderXim.job_utils.thief.useCollaborator = function(player, target, ability)
    target:transferEnmity(player, 25 + player:getMod(invaderXim.mod.ACC_COLLAB_EFFECT), 20.6)
end

invaderXim.job_utils.thief.useConspirator = function(player, target, ability)
    local subtleBlow = 0
    local accuracy   = 0
    local scale      = 1
    local mob        = player:getTarget()

    if mob then
        local enmityList = mob:getEnmityList()

        if enmityList and #enmityList > 0 then
            if #enmityList < 6 then
                subtleBlow = 20
                accuracy = 15
            elseif #enmityList < 18 then
                subtleBlow = 50
                accuracy = 25
            else
                subtleBlow = 50
                accuracy = 49
            end
        end

        -- See if we should apply the effects to the player at the top of the hate list
        if mob:getTarget() == target then
            scale = player:getMod(invaderXim.mod.AUGMENTS_CONSPIRATOR)
        end
    end

    target:addStatusEffect(invaderXim.effect.CONSPIRATOR, subtleBlow * scale, 0, 60, 0, accuracy * scale)
end

invaderXim.job_utils.thief.useDespoil = function(player, target, ability, action)
    local level         = utils.getActiveJobLevel(player, invaderXim.job.THF)
    local despoilMod    = player:getMod(invaderXim.mod.DESPOIL)
    local despoilChance = 50 + despoilMod * 2 + level - target:getMainLvl() -- Same math as Steal

    -- TODO: Need to verify if there's a message associated with this
    local jpValue = player:getJobPointLevel(invaderXim.jp.DESPOIL_EFFECT)

    if jpValue > 0 and player:getMainJob() == invaderXim.job.THF then
        local tpSteal = jpValue * 0.02
        local mobTP = target:getTP()

        if tpSteal > mobTP then
            tpSteal = mobTP
        end

        target:addTP(-tpSteal)
        player:addTP(tpSteal)
    end

    local stolen = target:getDespoilItem()

    if
        target:isMob() and
        math.random(1, 100) <= despoilChance and
        stolen ~= 0
    then
        if player:getObjType() == invaderXim.objType.TRUST then
            player:getMaster():addItem(stolen)
        else
            player:addItem(stolen)
        end

        target:itemStolen()

        -- Attempt to grab the debuff from the DB
        -- If there isn't a debuff assigned to the item stolen, select one at random
        local debuff = player:getDespoilDebuff(stolen)

        if not debuff then
            debuff = despoilDebuffs[math.random(#despoilDebuffs)]
        end

        local power = processDebuff(player, target, ability, debuff) -- Also sets ability message

        target:addStatusEffect(debuff, power, 0, 90)
    else
        action:setAnimation(target:getID(), 182)
        ability:setMsg(invaderXim.msg.basic.STEAL_FAIL) -- Failed
    end

    return stolen
end

invaderXim.job_utils.thief.useFeint = function(player, target, ability)
    local bonus = player:getMod(invaderXim.mod.AUGMENTS_FEINT) * player:getMerit(invaderXim.merit.FEINT) / 25 -- Divide by the merit value (feint is 25) to get the number of merit points

    -- Subpower is the proc rate bonus for TH procs
    player:addStatusEffect(invaderXim.effect.FEINT, 150 + bonus, 0, 60, 0, player:getMerit(invaderXim.merit.FEINT) - 25) -- -150 Evasion base, 0% base TREASURE_HUNTER_PROC, every merit past 1 gives 25%
end

invaderXim.job_utils.thief.useFlee = function(player, target, ability)
    local duration = 30 + player:getMod(invaderXim.mod.FLEE_DURATION)

    -- TODO: Flee will not override all types of weight effect. Find out which aren't overriden.
    if player:hasStatusEffect(invaderXim.effect.WEIGHT) then
        player:delStatusEffect(invaderXim.effect.WEIGHT)
    end

    player:addStatusEffect(invaderXim.effect.FLEE, 10000, 0, duration)
end

invaderXim.job_utils.thief.useHide = function(player, target, ability)
    local duration = math.random(30, 300)

    duration = duration * (1 + player:getMod(invaderXim.mod.HIDE_DURATION) / 100)

    player:addStatusEffect(invaderXim.effect.HIDE, 1, 0, math.floor(duration * invaderXim.settings.main.SNEAK_INVIS_DURATION_MULTIPLIER))
end

invaderXim.job_utils.thief.useLarceny = function(player, target, ability, action)
    local effectStolen
    local effectID = 0
    local jpValue  = player:getJobPointLevel(invaderXim.jp.LARCENY_EFFECT)

    -- SP Abilities have priority, check if one is present first
    for i = 1, #stealableSPEffects do
        if target:hasStatusEffect(stealableSPEffects[i]) then
            effectStolen = target:getStatusEffect(stealableSPEffects[i])
            break
        end
    end

    -- Default is no SP Ability found
    if effectStolen == nil then
        effectID = player:stealStatusEffect(target)

        local newStatus = player:getStatusEffect(effectID)

        if newStatus then
            newStatus:setDuration((newStatus:getDuration() + jpValue) * 1000)
        end
    -- Copy an SP Ability if found
    else
        local newID       = effectStolen:getEffectType()
        local newIcon     = effectStolen:getIcon()
        local newPower    = effectStolen:getPower()
        local newTick     = effectStolen:getTick()
        local newDuration = effectStolen:getDuration() + jpValue
        local newSubType  = effectStolen:getSubType()
        local newSubPower = effectStolen:getSubPower()
        local newTier     = effectStolen:getTier()
        local newFlags    = effectStolen:getEffectFlags()

        player:addStatusEffectEx(newID, newIcon, newPower, newTick, newDuration, newSubType, newSubPower, newTier, newFlags)
        target:delStatusEffect(newID)

        effectID = newID
    end

    if effectID == 0 then
        action:setAnimation(target:getID(), 182)
        ability:setMsg(invaderXim.msg.basic.STEAL_FAIL)
    end

    target:updateClaim(player)

    return effectID
end

invaderXim.job_utils.thief.useMug = function(player, target, ability, action)
    local thfLevel = utils.getActiveJobLevel(player, invaderXim.job.THF)
    local gil      = 0
    -- TODO: Need to verify if there's a message associated with this
    local jpValue = player:getJobPointLevel(invaderXim.jp.MUG_EFFECT)

    if jpValue > 0 and player:getMainJob() == invaderXim.job.THF then
        local hpSteal = ((player:getStat(invaderXim.mod.AGI) + player:getStat(invaderXim.mod.DEX)) * jpValue) * 0.05
        local mobHP = target:getHP()

        if hpSteal > mobHP then
            hpSteal = mobHP
        end

        target:addHP(-hpSteal)
        player:addHP(hpSteal)
    end

    local mugChance = 90 + thfLevel - target:getMainLvl()

    if
        target:isMob() and
        math.random(1, 100) <= mugChance and
        target:getMobMod(invaderXim.mobMod.MUG_GIL) > 0
    then
        local purse    = target:getMobMod(invaderXim.mobMod.MUG_GIL)
        local fatpurse = target:getGil()

        gil = fatpurse / (8 + math.random(0, 8))

        if gil == 0 then
            gil = fatpurse / 2
        end

        if gil == 0 then
            gil = fatpurse
        end

        if gil > purse then
            gil = purse
        end

        if gil <= 0 then
            ability:setMsg(invaderXim.msg.basic.MUG_FAIL)
        else
            gil = gil * (1 + player:getMod(invaderXim.mod.MUG_EFFECT))

            player:addGil(gil)
            target:setMobMod(invaderXim.mobMod.MUG_GIL, target:getMobMod(invaderXim.mobMod.MUG_GIL) - gil)
            ability:setMsg(invaderXim.msg.basic.MUG_SUCCESS)
        end
    else
        ability:setMsg(invaderXim.msg.basic.MUG_FAIL)
        action:setAnimation(target:getID(), 184)
    end

    return gil
end

invaderXim.job_utils.thief.usePerfectDodge = function(player, target, ability)
    local duration = 30 + player:getMod(invaderXim.mod.PERFECT_DODGE)

    player:addStatusEffect(invaderXim.effect.PERFECT_DODGE, 1, 0, duration)
end

invaderXim.job_utils.thief.useSneakAttack = function(player, target, ability)
    player:addStatusEffect(invaderXim.effect.SNEAK_ATTACK, 1, 0, 60)
end

invaderXim.job_utils.thief.useSteal = function(player, target, ability, action)
    local thfLevel    = utils.getActiveJobLevel(player, invaderXim.job.THF)
    local stolen      = action:getParam(target:getID())
    local stealMod    = player:getMod(invaderXim.mod.STEAL)
    local stealChance = 50 + stealMod * 2 + thfLevel - target:getMainLvl()

    if stolen == 0 then
        stolen = target:getStealItem()
    end

    if target:isMob() and math.random(1, 100) <= stealChance and stolen ~= 0 then
        player:addItem(stolen)
        target:itemStolen()
        ability:setMsg(invaderXim.msg.basic.STEAL_SUCCESS) -- Item stolen successfully
        target:triggerListener('ITEM_STOLEN', target, player, stolen)
        -- Aura Steal does not trigger on successful item steal
        return stolen
    else
        ability:setMsg(invaderXim.msg.basic.STEAL_FAIL) -- Failed to steal
        action:setAnimation(target:getID(), 182)
    end

    -- Attempt Aura steal
    -- local effect = invaderXim.effect.NONE
    if player:hasTrait(invaderXim.trait.AURA_STEAL) then
        local resist = applyResistanceAbility(player, target, invaderXim.element.NONE, 0, 0)
        -- local effectStealSuccess = false
        if resist > 0.0625 then
            local auraStealChance = math.min(player:getMerit(invaderXim.merit.AURA_STEAL), 95)
            if math.random(1, 100) <= auraStealChance then
                local targetShadows = target:getMod(invaderXim.mod.UTSUSEMI)

                stolen = player:stealStatusEffect(target)
                if stolen ~= 0 then
                    ability:setMsg(invaderXim.msg.basic.STEAL_EFFECT)
                    action:setAnimation(target:getID(), 181)

                    if stolen == invaderXim.effect.COPY_IMAGE then
                        if targetShadows > 0 then
                            player:setMod(invaderXim.mod.UTSUSEMI, targetShadows)
                        end
                    end
                end
            -- else
            --     effect = target:dispelStatusEffect()
            end

            -- Try for a second effect if we have the augment
            --[[
            TODO: This implementation is currently broken and inaccurate.  20% chance of a second aura being
            stolen per merit.

            if (effect ~= invaderXim.effect.NONE or stolen ~= 0) and player:getMod(invaderXim.mod.AUGMENTS_AURA_STEAL) > 0 then
                if math.random(1, 100) <= auraStealChance then
                    if stolenEffect2 ~= nil and math.random(1, 100) <= auraStealChance then
                        player:stealStatusEffect(target)
                    else
                        target:dispelStatusEffect()
                    end
                end
            end
            ]]--
        end
    end

    return stolen
end

invaderXim.job_utils.thief.useTrickAttack = function(player, target, ability)
    player:addStatusEffect(invaderXim.effect.TRICK_ATTACK, 1, 0, 60)
end
