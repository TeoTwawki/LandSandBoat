-----------------------------------
-- Summoner Job Utilities
-----------------------------------
require('scripts/globals/ability')
require('scripts/globals/jobpoints')
require('scripts/globals/combat/tp')
-----------------------------------
xi = xi or {}
invaderXim.job_utils = invaderXim.job_utils or {}
invaderXim.job_utils.summoner = invaderXim.job_utils.summoner or {}
-----------------------------------

-- sort of a misnomer, as if Apogee is up, the 'base' mp cost rises.
local function getBaseMPCost(player, ability)
    local baseMPCostMap =
    {
        -- Carbuncle
        [invaderXim.jobAbility.HEALING_RUBY]     =   6,
        [invaderXim.jobAbility.POISON_NAILS]     =  11,
        [invaderXim.jobAbility.SHINING_RUBY]     =  44,
        [invaderXim.jobAbility.GLITTERING_RUBY]  =  62,
        [invaderXim.jobAbility.SOOTHING_RUBY]    =  74,
        [invaderXim.jobAbility.PACIFYING_RUBY]   =  83,
        [invaderXim.jobAbility.METEORITE]        = 108,
        [invaderXim.jobAbility.HEALING_RUBY_II]  = 124,
        [invaderXim.jobAbility.HOLY_MIST]        = 152,
        -- Leviathan
        [invaderXim.jobAbility.BARRACUDA_DIVE]   =   8,
        [invaderXim.jobAbility.WATER_II]         =  24,
        [invaderXim.jobAbility.SLOWGA]           =  48,
        [invaderXim.jobAbility.TAIL_WHIP]        =  49,
        [invaderXim.jobAbility.SOOTHING_CURRENT] =  95,
        [invaderXim.jobAbility.SPRING_WATER]     =  99,
        [invaderXim.jobAbility.WATER_IV]         = 118,
        [invaderXim.jobAbility.TIDAL_ROAR]       = 138,
        [invaderXim.jobAbility.SPINNING_DIVE]    = 164,
        [invaderXim.jobAbility.GRAND_FALL]       = 182,
        -- Garuda
        [invaderXim.jobAbility.CLAW]             =   7,
        [invaderXim.jobAbility.AERO_II]          =  24,
        [invaderXim.jobAbility.AERIAL_ARMOR]     =  92,
        [invaderXim.jobAbility.FLEET_WIND]       = 114,
        [invaderXim.jobAbility.AERO_IV]          = 118,
        [invaderXim.jobAbility.WHISPERING_WIND]  = 119,
        [invaderXim.jobAbility.HASTEGA]          = 129,
        [invaderXim.jobAbility.PREDATOR_CLAWS]   = 164,
        [invaderXim.jobAbility.WIND_BLADE]       = 182,
        [invaderXim.jobAbility.HASTEGA_II]       = 248,
        -- Titan
        [invaderXim.jobAbility.ROCK_THROW]       =  10,
        [invaderXim.jobAbility.STONE_II]         =  24,
        [invaderXim.jobAbility.ROCK_BUSTER]      =  39,
        [invaderXim.jobAbility.MEGALITH_THROW]   =  62,
        [invaderXim.jobAbility.EARTHEN_WARD]     =  92,
        [invaderXim.jobAbility.STONE_IV]         = 118,
        [invaderXim.jobAbility.CRAG_THROW]       = 124,
        [invaderXim.jobAbility.EARTHEN_ARMOR]    = 156,
        [invaderXim.jobAbility.MOUNTAIN_BUSTER]  = 164,
        [invaderXim.jobAbility.GEOCRUSH]         = 182,
        -- Titan
        [invaderXim.jobAbility.PUNCH]            =   9,
        [invaderXim.jobAbility.FIRE_II]          =  24,
        [invaderXim.jobAbility.BURNING_STRIKE]   =  48,
        [invaderXim.jobAbility.DOUBLE_PUNCH]     =  56,
        [invaderXim.jobAbility.INFERNO_HOWL]     =  72,
        [invaderXim.jobAbility.CRIMSON_HOWL]     =  84,
        [invaderXim.jobAbility.FIRE_IV]          = 118,
        [invaderXim.jobAbility.CONFLAG_STRIKE]   = 141,
        [invaderXim.jobAbility.FLAMING_CRUSH]    = 164,
        [invaderXim.jobAbility.METEOR_STRIKE]    = 182,
        -- Fenrir
        [invaderXim.jobAbility.MOONLIT_CHARGE]   =  17,
        [invaderXim.jobAbility.CRESCENT_FANG]    =  19,
        [invaderXim.jobAbility.LUNAR_ROAR]       =  27,
        [invaderXim.jobAbility.LUNAR_CRY]        =  41,
        [invaderXim.jobAbility.ECLIPTIC_GROWL]   =  46,
        [invaderXim.jobAbility.ECLIPTIC_HOWL]    =  57,
        [invaderXim.jobAbility.HEAVENWARD_HOWL]  =  96,
        [invaderXim.jobAbility.ECLIPSE_BITE]     = 109,
        [invaderXim.jobAbility.LUNAR_BAY]        = 174,
        [invaderXim.jobAbility.IMPACT]           = 222,
        -- Shiva
        [invaderXim.jobAbility.AXE_KICK]         =  10,
        [invaderXim.jobAbility.BLIZZARD_II]      =  24,
        [invaderXim.jobAbility.SLEEPGA]          =  56,
        [invaderXim.jobAbility.FROST_ARMOR]      =  63,
        [invaderXim.jobAbility.DOUBLE_SLAP]      =  96,
        [invaderXim.jobAbility.BLIZZARD_IV]      = 118,
        [invaderXim.jobAbility.DIAMOND_STORM]    = 138,
        [invaderXim.jobAbility.RUSH]             = 164,
        [invaderXim.jobAbility.HEAVENLY_STRIKE]  = 182,
        [invaderXim.jobAbility.CRYSTAL_BLESSING] = 201,
        -- Ramuh
        [invaderXim.jobAbility.SHOCK_STRIKE]     =   6,
        [invaderXim.jobAbility.THUNDER_II]       =  24,
        [invaderXim.jobAbility.THUNDERSPARK]     =  38,
        [invaderXim.jobAbility.ROLLING_THUNDER]  =  52,
        [invaderXim.jobAbility.SHOCK_SQUALL]     =  67,
        [invaderXim.jobAbility.LIGHTNING_ARMOR]  =  91,
        [invaderXim.jobAbility.THUNDER_IV]       = 118,
        [invaderXim.jobAbility.CHAOTIC_STRIKE]   = 164,
        [invaderXim.jobAbility.THUNDERSTORM]     = 182,
        [invaderXim.jobAbility.VOLT_STRIKE]      = 229,
        -- Diabolos
        [invaderXim.jobAbility.CAMISADO]         =  20,
        [invaderXim.jobAbility.ULTIMATE_TERROR]  =  27,
        [invaderXim.jobAbility.SOMNOLENCE]       =  30,
        [invaderXim.jobAbility.NIGHTMARE]        =  42,
        [invaderXim.jobAbility.NOCTOSHIELD]      =  92,
        [invaderXim.jobAbility.NETHER_BLAST]     = 109,
        [invaderXim.jobAbility.DREAM_SHROUD]     = 121,
        [invaderXim.jobAbility.BLINDSIDE]        = 147,
        [invaderXim.jobAbility.NIGHT_TERROR]     = 177,
        [invaderXim.jobAbility.PAVOR_NOCTURNUS]  = 246,
        -- Cait Sith
        [invaderXim.jobAbility.REGAL_SCRATCH]    = 5,
        [invaderXim.jobAbility.MEWING_LULLABY]   = 61,
        [invaderXim.jobAbility.EARIE_EYE]        = 134,
        [invaderXim.jobAbility.LEVEL_QM_HOLY]    = 235,
        [invaderXim.jobAbility.RAISE_II]         = 160,
        [invaderXim.jobAbility.RERAISE_II]       = 80,
        -- Siren
        [invaderXim.jobAbility.WELT]             =   9,
        [invaderXim.jobAbility.ROUNDHOUSE]       =  52,
        [invaderXim.jobAbility.SONIC_BUFFET]     = 164,
        [invaderXim.jobAbility.TORNADO_II]       = 182,
        [invaderXim.jobAbility.HYSTERIC_ASSAULT] = 222,
    }

    local baseMPCost = nil

    if ability then
        if ability:getAddType() == invaderXim.addType.ADDTYPE_ASTRAL_FLOW then
            baseMPCost = player:getMainLvl() * 2
        else
            baseMPCost = baseMPCostMap[ability:getID()]
        end
    end

    if baseMPCost == nil then
        printf('[warning] scripts/globals/job_utils/summoner.lua::getBaseMPCost(): MP cost for invaderXim.jobAbility with id %d not implemented.', ability:getID())
        return 9999
    end

    -- https://www.bg-wiki.com/ffxi/Apogee
    -- Apogee, 1.5x MP cost, don't delete effect here because we need to reset BP: Ward/Rage timer upon use
    if player:hasStatusEffect(invaderXim.effect.APOGEE) then
        baseMPCost = baseMPCost * 1.5
    end

    return baseMPCost
end

local function getMPCost(baseMPCost, player, petskill)
    local mpCost = baseMPCost

    -- don't proc blood boon on Astral Flow
    if petskill:getAddType() ~= invaderXim.addType.ADDTYPE_ASTRAL_FLOW then
        local bloodBoonRate = player:getMod(invaderXim.mod.BLOOD_BOON)
        -- assuming it works like Conserve MP... https://www.bg-wiki.com/ffxi/Conserve_MP
        if math.random(1, 100) <= bloodBoonRate then
            mpCost = mpCost * math.random(8, 15) / 16
        end
    end

    return mpCost
end

-- Bloodpact Delay is handled in charentity.cpp
invaderXim.job_utils.summoner.canUseBloodPact = function(player, pet, target, petAbility)
    -- TODO: verify order of out of MP/range/etc checks.
    if pet ~= nil then
        -- There is some complex interaction here.
        -- First off, you will get out of range message if the pet isn't within the abilities range to it's target.
        -- Second, if your pet is in range, but you're out of range of your pet, retail provides no message for some reason but the pet does nothing.
        -- No out of range error message is unhelpful so we are setting that message anyway.

        -- TODO: The hardcoded ranges of 21/22 need to take into account mob size.
        -- TODO: add "era" setting or setting in general for this. Era used to have a smaller range for BPs.
        -- This is a "new" change -- https://forum.square-enix.com/ffxi/threads/48564-Sep-16-2015-%28JST%29-Version-Update
        -- TODO: verify who/what is "out of range" for out of range messages

        -- check if target is too far from pet for ability
        if pet:checkDistance(target) >= petAbility:getRange() then
            return invaderXim.msg.basic.TARG_OUT_OF_RANGE, 0
        end

        -- check if player is too far from pet
        if pet:checkDistance(player) >= 21 then
            return invaderXim.msg.basic.TARG_OUT_OF_RANGE, 0
        end

        -- check if player is too far from target
        if target:checkDistance(player) >= 22 then
            return invaderXim.msg.basic.TARG_OUT_OF_RANGE, 0
        end

        local petAction = pet:getCurrentAction()

        -- check if avatar is under status effect
        if petAction == invaderXim.action.SLEEP or petAction == invaderXim.action.STUN then
            return invaderXim.msg.basic.PET_CANNOT_DO_ACTION, 0 -- TODO: verify exact message in packet.
        end

        -- check if avatar is using a move already
        if petAction == invaderXim.action.PET_MOBABILITY_FINISH then
            return 0, 0
        end

        local baseMPCost = getBaseMPCost(player, petAbility)

        if player:getMP() < baseMPCost then
            return invaderXim.msg.basic.UNABLE_TO_USE_JA2, 0 -- TODO: verify exact message in packet.
        end

        return 0, 0
    end

    return invaderXim.msg.basic.UNABLE_TO_USE_JA2, 0 -- TODO: verify exact message in packet.
end

invaderXim.job_utils.summoner.onUseBloodPact = function(target, petskill, summoner, action)
    local bloodPactAbility = GetAbility(petskill:getID()) -- Player abilities and Avatar abilities are mapped 1:1
    if not bloodPactAbility then
        return
    end

    local baseMPCost       = getBaseMPCost(summoner, bloodPactAbility)
    local mpCost           = getMPCost(baseMPCost, summoner, bloodPactAbility)
    local bloodPactRecast  = math.max(0, summoner:getLocalVar('bpRecastTime'))

    if target:getID() == action:getPrimaryTargetID() then
        -- MP and Cooldown is only consumed if the ability goes off
        summoner:delMP(mpCost)
        if summoner:hasStatusEffect(invaderXim.effect.APOGEE) then
            summoner:resetRecast(invaderXim.recast.ABILITY, bloodPactAbility:getRecastID())
            summoner:delStatusEffect(invaderXim.effect.APOGEE)
        else
            if invaderXim.settings.map.BLOOD_PACT_SHARED_TIMER then
                summoner:addRecast(invaderXim.recast.ABILITY, invaderXim.recastID.BLOODPACT_RAGE, bloodPactRecast)
                summoner:addRecast(invaderXim.recast.ABILITY, invaderXim.recastID.BLOODPACT_WARD, bloodPactRecast)
            else
                summoner:addRecast(invaderXim.recast.ABILITY, bloodPactAbility:getRecastID(), bloodPactRecast)
            end
        end
    end
end

-- to be removed once damage is overhauled
invaderXim.job_utils.summoner.calculateTPReturn = function(avatar, target, damage, numHits)
    if damage ~= 0 and numHits > 0 then -- absorbed hits still give TP, though we can't know how many hits actually connected in the current avatar damage formulas
        local tpReturn = invaderXim.combat.tp.getSingleMeleeHitTPReturn(avatar, target)
        tpReturn = tpReturn + 10 * (numHits - 1) -- extra hits give 10 TP each
        avatar:setTP(tpReturn)
    else
        avatar:setTP(0)
    end
end

invaderXim.job_utils.summoner.useManaCede = function(player, ability, action)
    local avatar = player:getPet()

    if avatar ~= nil then
        local avatarTP = avatar:getTP()
        local bonusTP = 1000 + player:getJobPointLevel(invaderXim.jp.MANA_CEDE_EFFECT) * 50
        local manaCedeBonus = (100 + player:getMod(invaderXim.mod.ENHANCES_MANA_CEDE)) / 100
        local avatarNewTP = utils.clamp(avatarTP + bonusTP * manaCedeBonus, 1000, 3000)

        action:ID(player:getID(), avatar:getID())
        avatar:setTP(avatarNewTP)
        player:delMP(100)
    end
end

invaderXim.job_utils.summoner.useSoothingRuby = function(target, pet, petskill, summoner, action)
    local targetEffectTable = target:getStatusEffects()

    -- Generate table with erasable effects from target effect table.
    local erasableEffectTable        = {}
    local additionalRemovableEffects =
    set{
        invaderXim.effect.POISON,
        invaderXim.effect.BLINDNESS,
        invaderXim.effect.PARALYSIS,
        invaderXim.effect.SILENCE,
        invaderXim.effect.CURSE_I,
        invaderXim.effect.PLAGUE,
        invaderXim.effect.DISEASE
    }

    for _, effect in pairs(targetEffectTable) do
        local id = effect:getEffectType()
        if
            bit.band(effect:getEffectFlags(), invaderXim.effectFlag.ERASABLE) == invaderXim.effectFlag.ERASABLE or
            additionalRemovableEffects[id]
        then
            table.insert(erasableEffectTable, id)
        end
    end

    -- Calculate the ammount of effects this skill can potentialy erase.
    local summoningSkillFactor = math.floor((summoner:getSkillLevel(invaderXim.skill.SUMMONING_MAGIC) + 99) / 100)
    local soothingRubyPower    = utils.clamp(summoningSkillFactor, 1, 6)

    -- Erase effects.
    local effectsErased = math.min(#erasableEffectTable, soothingRubyPower)

    if effectsErased > 0 then
        for i = 1, effectsErased do
            local index = math.random(1, #erasableEffectTable)

            target:delStatusEffect(erasableEffectTable[index])
            table.remove(erasableEffectTable, index)
        end

        petskill:setMsg(invaderXim.msg.basic.MAGIC_REMOVE_EFFECT_2)
    else
        petskill:setMsg(invaderXim.msg.basic.JA_NO_EFFECT_2)
    end

    return effectsErased
end
