-----------------------------------
-- Geomancer Job Utilities
-----------------------------------
require('scripts/globals/ability')
require('scripts/globals/pets')
require('scripts/globals/weaponskills')
require('scripts/globals/jobpoints')
-----------------------------------
xi = xi or {}
invaderXim.job_utils = invaderXim.job_utils or {}
invaderXim.job_utils.geomancer = invaderXim.job_utils.geomancer or {}
-----------------------------------

local luopanModels =
{
    FIRE    = 2850,
    ICE     = 2851,
    WIND    = 2852,
    EARTH   = 2853,
    THUNDER = 2854,
    WATER   = 2855,
    LIGHT   = 2856,
    DARK    = 2865,
}

local indiVisualEffect =
{
    FIRE    = { ALLIES = 0, ENEMIES = 8  },
    ICE     = { ALLIES = 1, ENEMIES = 9  },
    WIND    = { ALLIES = 2, ENEMIES = 10 },
    EARTH   = { ALLIES = 3, ENEMIES = 11 },
    THUNDER = { ALLIES = 4, ENEMIES = 12 },
    WATER   = { ALLIES = 5, ENEMIES = 13 },
    LIGHT   = { ALLIES = 6, ENEMIES = 14 },
    DARK    = { ALLIES = 7, ENEMIES = 15 },
}

local geoData =
{
    [invaderXim.magic.spell.GEO_REGEN]      = { luopanModel = luopanModels.LIGHT,   effect = invaderXim.effect.GEO_REGEN,               targetType = invaderXim.auraTarget.ALLIES  },
    [invaderXim.magic.spell.GEO_POISON]     = { luopanModel = luopanModels.WATER,   effect = invaderXim.effect.GEO_POISON,              targetType = invaderXim.auraTarget.ENEMIES },
    [invaderXim.magic.spell.GEO_REFRESH]    = { luopanModel = luopanModels.LIGHT,   effect = invaderXim.effect.GEO_REFRESH,             targetType = invaderXim.auraTarget.ALLIES  },
    [invaderXim.magic.spell.GEO_HASTE]      = { luopanModel = luopanModels.WIND,    effect = invaderXim.effect.GEO_HASTE,               targetType = invaderXim.auraTarget.ALLIES  },
    [invaderXim.magic.spell.GEO_STR]        = { luopanModel = luopanModels.FIRE,    effect = invaderXim.effect.GEO_STR_BOOST,           targetType = invaderXim.auraTarget.ALLIES  },
    [invaderXim.magic.spell.GEO_DEX]        = { luopanModel = luopanModels.THUNDER, effect = invaderXim.effect.GEO_DEX_BOOST,           targetType = invaderXim.auraTarget.ALLIES  },
    [invaderXim.magic.spell.GEO_VIT]        = { luopanModel = luopanModels.EARTH,   effect = invaderXim.effect.GEO_VIT_BOOST,           targetType = invaderXim.auraTarget.ALLIES  },
    [invaderXim.magic.spell.GEO_AGI]        = { luopanModel = luopanModels.WIND,    effect = invaderXim.effect.GEO_AGI_BOOST,           targetType = invaderXim.auraTarget.ALLIES  },
    [invaderXim.magic.spell.GEO_INT]        = { luopanModel = luopanModels.ICE,     effect = invaderXim.effect.GEO_INT_BOOST,           targetType = invaderXim.auraTarget.ALLIES  },
    [invaderXim.magic.spell.GEO_MND]        = { luopanModel = luopanModels.WATER,   effect = invaderXim.effect.GEO_MND_BOOST,           targetType = invaderXim.auraTarget.ALLIES  },
    [invaderXim.magic.spell.GEO_CHR]        = { luopanModel = luopanModels.LIGHT,   effect = invaderXim.effect.GEO_CHR_BOOST,           targetType = invaderXim.auraTarget.ALLIES  },
    [invaderXim.magic.spell.GEO_FURY]       = { luopanModel = luopanModels.FIRE,    effect = invaderXim.effect.GEO_ATTACK_BOOST,        targetType = invaderXim.auraTarget.ALLIES  },
    [invaderXim.magic.spell.GEO_BARRIER]    = { luopanModel = luopanModels.EARTH,   effect = invaderXim.effect.GEO_DEFENSE_BOOST,       targetType = invaderXim.auraTarget.ALLIES  },
    [invaderXim.magic.spell.GEO_ACUMEN]     = { luopanModel = luopanModels.ICE,     effect = invaderXim.effect.GEO_MAGIC_ATK_BOOST,     targetType = invaderXim.auraTarget.ALLIES  },
    [invaderXim.magic.spell.GEO_FEND]       = { luopanModel = luopanModels.WATER,   effect = invaderXim.effect.GEO_MAGIC_DEF_BOOST,     targetType = invaderXim.auraTarget.ALLIES  },
    [invaderXim.magic.spell.GEO_PRECISION]  = { luopanModel = luopanModels.THUNDER, effect = invaderXim.effect.GEO_ACCURACY_BOOST,      targetType = invaderXim.auraTarget.ALLIES  },
    [invaderXim.magic.spell.GEO_VOIDANCE]   = { luopanModel = luopanModels.WIND,    effect = invaderXim.effect.GEO_EVASION_BOOST,       targetType = invaderXim.auraTarget.ALLIES  },
    [invaderXim.magic.spell.GEO_FOCUS]      = { luopanModel = luopanModels.DARK,    effect = invaderXim.effect.GEO_MAGIC_ACC_BOOST,     targetType = invaderXim.auraTarget.ALLIES  },
    [invaderXim.magic.spell.GEO_ATTUNEMENT] = { luopanModel = luopanModels.LIGHT,   effect = invaderXim.effect.GEO_MAGIC_EVASION_BOOST, targetType = invaderXim.auraTarget.ALLIES  },
    [invaderXim.magic.spell.GEO_WILT]       = { luopanModel = luopanModels.WATER,   effect = invaderXim.effect.GEO_ATTACK_DOWN,         targetType = invaderXim.auraTarget.ENEMIES },
    [invaderXim.magic.spell.GEO_FRAILTY]    = { luopanModel = luopanModels.WIND,    effect = invaderXim.effect.GEO_DEFENSE_DOWN,        targetType = invaderXim.auraTarget.ENEMIES },
    [invaderXim.magic.spell.GEO_FADE]       = { luopanModel = luopanModels.FIRE,    effect = invaderXim.effect.GEO_MAGIC_ATK_DOWN,      targetType = invaderXim.auraTarget.ENEMIES },
    [invaderXim.magic.spell.GEO_MALAISE]    = { luopanModel = luopanModels.THUNDER, effect = invaderXim.effect.GEO_MAGIC_DEF_DOWN,      targetType = invaderXim.auraTarget.ENEMIES },
    [invaderXim.magic.spell.GEO_SLIP]       = { luopanModel = luopanModels.EARTH,   effect = invaderXim.effect.GEO_ACCURACY_DOWN,       targetType = invaderXim.auraTarget.ENEMIES },
    [invaderXim.magic.spell.GEO_TORPOR]     = { luopanModel = luopanModels.ICE,     effect = invaderXim.effect.GEO_EVASION_DOWN,        targetType = invaderXim.auraTarget.ENEMIES },
    [invaderXim.magic.spell.GEO_VEX]        = { luopanModel = luopanModels.LIGHT,   effect = invaderXim.effect.GEO_MAGIC_ACC_DOWN,      targetType = invaderXim.auraTarget.ENEMIES },
    [invaderXim.magic.spell.GEO_LANGUOR]    = { luopanModel = luopanModels.DARK,    effect = invaderXim.effect.GEO_MAGIC_EVASION_DOWN,  targetType = invaderXim.auraTarget.ENEMIES },
    [invaderXim.magic.spell.GEO_SLOW]       = { luopanModel = luopanModels.EARTH,   effect = invaderXim.effect.GEO_SLOW,                targetType = invaderXim.auraTarget.ENEMIES },
    [invaderXim.magic.spell.GEO_PARALYSIS]  = { luopanModel = luopanModels.ICE,     effect = invaderXim.effect.GEO_PARALYSIS,           targetType = invaderXim.auraTarget.ENEMIES },
    [invaderXim.magic.spell.GEO_GRAVITY]    = { luopanModel = luopanModels.WIND,    effect = invaderXim.effect.GEO_WEIGHT,              targetType = invaderXim.auraTarget.ENEMIES },
}

local indiData =
{
    [invaderXim.magic.spell.INDI_REGEN]      = { visualEffect = indiVisualEffect.LIGHT.ALLIES,    effect = invaderXim.effect.GEO_REGEN,               targetType = invaderXim.auraTarget.ALLIES  },
    [invaderXim.magic.spell.INDI_POISON]     = { visualEffect = indiVisualEffect.WATER.ENEMIES,   effect = invaderXim.effect.GEO_POISON,              targetType = invaderXim.auraTarget.ENEMIES },
    [invaderXim.magic.spell.INDI_REFRESH]    = { visualEffect = indiVisualEffect.LIGHT.ALLIES,    effect = invaderXim.effect.GEO_REFRESH,             targetType = invaderXim.auraTarget.ALLIES  },
    [invaderXim.magic.spell.INDI_HASTE]      = { visualEffect = indiVisualEffect.WIND.ALLIES,     effect = invaderXim.effect.GEO_HASTE,               targetType = invaderXim.auraTarget.ALLIES  },
    [invaderXim.magic.spell.INDI_STR]        = { visualEffect = indiVisualEffect.FIRE.ALLIES,     effect = invaderXim.effect.GEO_STR_BOOST,           targetType = invaderXim.auraTarget.ALLIES  },
    [invaderXim.magic.spell.INDI_DEX]        = { visualEffect = indiVisualEffect.THUNDER.ALLIES,  effect = invaderXim.effect.GEO_DEX_BOOST,           targetType = invaderXim.auraTarget.ALLIES  },
    [invaderXim.magic.spell.INDI_VIT]        = { visualEffect = indiVisualEffect.EARTH.ALLIES,    effect = invaderXim.effect.GEO_VIT_BOOST,           targetType = invaderXim.auraTarget.ALLIES  },
    [invaderXim.magic.spell.INDI_AGI]        = { visualEffect = indiVisualEffect.WIND.ALLIES,     effect = invaderXim.effect.GEO_AGI_BOOST,           targetType = invaderXim.auraTarget.ALLIES  },
    [invaderXim.magic.spell.INDI_INT]        = { visualEffect = indiVisualEffect.ICE.ALLIES,      effect = invaderXim.effect.GEO_INT_BOOST,           targetType = invaderXim.auraTarget.ALLIES  },
    [invaderXim.magic.spell.INDI_MND]        = { visualEffect = indiVisualEffect.WATER.ALLIES,    effect = invaderXim.effect.GEO_MND_BOOST,           targetType = invaderXim.auraTarget.ALLIES  },
    [invaderXim.magic.spell.INDI_CHR]        = { visualEffect = indiVisualEffect.LIGHT.ALLIES,    effect = invaderXim.effect.GEO_CHR_BOOST,           targetType = invaderXim.auraTarget.ALLIES  },
    [invaderXim.magic.spell.INDI_FURY]       = { visualEffect = indiVisualEffect.FIRE.ALLIES,     effect = invaderXim.effect.GEO_ATTACK_BOOST,        targetType = invaderXim.auraTarget.ALLIES  },
    [invaderXim.magic.spell.INDI_BARRIER]    = { visualEffect = indiVisualEffect.EARTH.ALLIES,    effect = invaderXim.effect.GEO_DEFENSE_BOOST,       targetType = invaderXim.auraTarget.ALLIES  },
    [invaderXim.magic.spell.INDI_ACUMEN]     = { visualEffect = indiVisualEffect.ICE.ALLIES,      effect = invaderXim.effect.GEO_MAGIC_ATK_BOOST,     targetType = invaderXim.auraTarget.ALLIES  },
    [invaderXim.magic.spell.INDI_FEND]       = { visualEffect = indiVisualEffect.WATER.ALLIES,    effect = invaderXim.effect.GEO_MAGIC_DEF_BOOST,     targetType = invaderXim.auraTarget.ALLIES  },
    [invaderXim.magic.spell.INDI_PRECISION]  = { visualEffect = indiVisualEffect.THUNDER.ALLIES,  effect = invaderXim.effect.GEO_ACCURACY_BOOST,      targetType = invaderXim.auraTarget.ALLIES  },
    [invaderXim.magic.spell.INDI_VOIDANCE]   = { visualEffect = indiVisualEffect.WIND.ALLIES,     effect = invaderXim.effect.GEO_EVASION_BOOST,       targetType = invaderXim.auraTarget.ALLIES  },
    [invaderXim.magic.spell.INDI_FOCUS]      = { visualEffect = indiVisualEffect.DARK.ALLIES,     effect = invaderXim.effect.GEO_MAGIC_ACC_BOOST,     targetType = invaderXim.auraTarget.ALLIES  },
    [invaderXim.magic.spell.INDI_ATTUNEMENT] = { visualEffect = indiVisualEffect.LIGHT.ALLIES,    effect = invaderXim.effect.GEO_MAGIC_EVASION_BOOST, targetType = invaderXim.auraTarget.ALLIES  },
    [invaderXim.magic.spell.INDI_WILT]       = { visualEffect = indiVisualEffect.WATER.ENEMIES,   effect = invaderXim.effect.GEO_ATTACK_DOWN,         targetType = invaderXim.auraTarget.ENEMIES },
    [invaderXim.magic.spell.INDI_FRAILTY]    = { visualEffect = indiVisualEffect.WIND.ENEMIES,    effect = invaderXim.effect.GEO_DEFENSE_DOWN,        targetType = invaderXim.auraTarget.ENEMIES },
    [invaderXim.magic.spell.INDI_FADE]       = { visualEffect = indiVisualEffect.FIRE.ENEMIES,    effect = invaderXim.effect.GEO_MAGIC_ATK_DOWN,      targetType = invaderXim.auraTarget.ENEMIES },
    [invaderXim.magic.spell.INDI_MALAISE]    = { visualEffect = indiVisualEffect.THUNDER.ENEMIES, effect = invaderXim.effect.GEO_MAGIC_DEF_DOWN,      targetType = invaderXim.auraTarget.ENEMIES },
    [invaderXim.magic.spell.INDI_SLIP]       = { visualEffect = indiVisualEffect.EARTH.ENEMIES,   effect = invaderXim.effect.GEO_ACCURACY_DOWN,       targetType = invaderXim.auraTarget.ENEMIES },
    [invaderXim.magic.spell.INDI_TORPOR]     = { visualEffect = indiVisualEffect.ICE.ENEMIES,     effect = invaderXim.effect.GEO_EVASION_DOWN,        targetType = invaderXim.auraTarget.ENEMIES },
    [invaderXim.magic.spell.INDI_VEX]        = { visualEffect = indiVisualEffect.LIGHT.ENEMIES,   effect = invaderXim.effect.GEO_MAGIC_ACC_DOWN,      targetType = invaderXim.auraTarget.ENEMIES },
    [invaderXim.magic.spell.INDI_LANGUOR]    = { visualEffect = indiVisualEffect.DARK.ENEMIES,    effect = invaderXim.effect.GEO_MAGIC_EVASION_DOWN,  targetType = invaderXim.auraTarget.ENEMIES },
    [invaderXim.magic.spell.INDI_SLOW]       = { visualEffect = indiVisualEffect.EARTH.ENEMIES,   effect = invaderXim.effect.GEO_SLOW,                targetType = invaderXim.auraTarget.ENEMIES },
    [invaderXim.magic.spell.INDI_PARALYSIS]  = { visualEffect = indiVisualEffect.ICE.ENEMIES,     effect = invaderXim.effect.GEO_PARALYSIS,           targetType = invaderXim.auraTarget.ENEMIES },
    [invaderXim.magic.spell.INDI_GRAVITY]    = { visualEffect = indiVisualEffect.WIND.ENEMIES,    effect = invaderXim.effect.GEO_WEIGHT,              targetType = invaderXim.auraTarget.ENEMIES },
}

local potencyData =
{
    [invaderXim.effect.GEO_REGEN]               = { divisor =  20.00, minPotency = 1.0, maxPotency = 30.0, geoModMultiplier = 2.0 },
    [invaderXim.effect.GEO_POISON]              = { divisor =  20.00, minPotency = 1.0, maxPotency = 30.0, geoModMultiplier = 3.0 },
    [invaderXim.effect.GEO_REFRESH]             = { divisor = 150.00, minPotency = 1.0, maxPotency =  6.0, geoModMultiplier = 1.0 },
    [invaderXim.effect.GEO_STR_BOOST]           = { divisor =  36.00, minPotency = 1.0, maxPotency = 25.0, geoModMultiplier = 2.0 },
    [invaderXim.effect.GEO_DEX_BOOST]           = { divisor =  36.00, minPotency = 1.0, maxPotency = 25.0, geoModMultiplier = 2.0 },
    [invaderXim.effect.GEO_VIT_BOOST]           = { divisor =  36.00, minPotency = 1.0, maxPotency = 25.0, geoModMultiplier = 2.0 },
    [invaderXim.effect.GEO_AGI_BOOST]           = { divisor =  36.00, minPotency = 1.0, maxPotency = 25.0, geoModMultiplier = 2.0 },
    [invaderXim.effect.GEO_INT_BOOST]           = { divisor =  36.00, minPotency = 1.0, maxPotency = 25.0, geoModMultiplier = 2.0 },
    [invaderXim.effect.GEO_MND_BOOST]           = { divisor =  36.00, minPotency = 1.0, maxPotency = 25.0, geoModMultiplier = 2.0 },
    [invaderXim.effect.GEO_CHR_BOOST]           = { divisor =  36.00, minPotency = 1.0, maxPotency = 25.0, geoModMultiplier = 2.0 },
    [invaderXim.effect.GEO_ATTACK_BOOST]        = { divisor =  25.93, minPotency = 4.6, maxPotency = 34.7, geoModMultiplier = 2.7 },
    [invaderXim.effect.GEO_DEFENSE_BOOST]       = { divisor =  22.61, minPotency = 9.7, maxPotency = 39.8, geoModMultiplier = 4.6 },
    [invaderXim.effect.GEO_MAGIC_ATK_BOOST]     = { divisor =  60.00, minPotency = 3.0, maxPotency = 15.0, geoModMultiplier = 3.0 },
    [invaderXim.effect.GEO_MAGIC_DEF_BOOST]     = { divisor =  45.00, minPotency = 5.0, maxPotency = 20.0, geoModMultiplier = 4.0 },
    [invaderXim.effect.GEO_ACCURACY_BOOST]      = { divisor =  18.00, minPotency = 1.0, maxPotency = 50.0, geoModMultiplier = 5.0 },
    [invaderXim.effect.GEO_EVASION_BOOST]       = { divisor =  13.84, minPotency = 1.0, maxPotency = 65.0, geoModMultiplier = 5.0 },
    [invaderXim.effect.GEO_MAGIC_ACC_BOOST]     = { divisor =  18.00, minPotency = 1.0, maxPotency = 50.0, geoModMultiplier = 5.0 },
    [invaderXim.effect.GEO_MAGIC_EVASION_BOOST] = { divisor =  13.84, minPotency = 1.0, maxPotency = 65.0, geoModMultiplier = 6.0 },
    [invaderXim.effect.GEO_ATTACK_DOWN]         = { divisor =  36.00, minPotency = 4.6, maxPotency = 25.0, geoModMultiplier = 4.6 },
    [invaderXim.effect.GEO_DEFENSE_DOWN]        = { divisor =  60.81, minPotency = 2.7, maxPotency = 14.8, geoModMultiplier = 2.7 },
    [invaderXim.effect.GEO_MAGIC_ATK_DOWN]      = { divisor =  45.00, minPotency = 5.0, maxPotency = 20.0, geoModMultiplier = 4.0 },
    [invaderXim.effect.GEO_MAGIC_DEF_DOWN]      = { divisor =  60.00, minPotency = 3.0, maxPotency = 15.0, geoModMultiplier = 3.0 },
    [invaderXim.effect.GEO_ACCURACY_DOWN]       = { divisor =  13.84, minPotency = 1.0, maxPotency = 65.0, geoModMultiplier = 6.0 },
    [invaderXim.effect.GEO_EVASION_DOWN]        = { divisor =  18.00, minPotency = 1.0, maxPotency = 50.0, geoModMultiplier = 5.0 },
    [invaderXim.effect.GEO_MAGIC_ACC_DOWN]      = { divisor =  13.84, minPotency = 1.0, maxPotency = 65.0, geoModMultiplier = 6.0 },
    [invaderXim.effect.GEO_MAGIC_EVASION_DOWN]  = { divisor =  18.00, minPotency = 1.0, maxPotency = 50.0, geoModMultiplier = 5.0 },
    [invaderXim.effect.GEO_SLOW]                = { divisor =  60.4,  minPotency = 0.9, maxPotency = 14.9, geoModMultiplier = 0.5 },
    [invaderXim.effect.GEO_PARALYSIS]           = { divisor =  60.00, minPotency = 1.0, maxPotency = 15.0, geoModMultiplier = 1.0 },
    [invaderXim.effect.GEO_WEIGHT]              = { divisor =  45.22, minPotency = 3.9, maxPotency = 19.9, geoModMultiplier = 1.1 },
    [invaderXim.effect.GEO_HASTE]               = { divisor =  30.1,  minPotency = 2.4, maxPotency = 29.9, geoModMultiplier = 1.1 },
}

local function getLuopan(player)
    local pet = player:getPet()

    if pet and pet:getPetID() == invaderXim.petId.LUOPAN then
        return pet
    end

    return nil
end

local function hasLuopan(player)
    return getLuopan(player) and true or false
end

-----------------------------------
-- Ability Check Functions
-----------------------------------
invaderXim.job_utils.geomancer.geoOnAbilityCheck = function(player, target, ability)
    if hasLuopan(player) then
        return 0, 0
    end

    if ability == invaderXim.jobAbility.LIFE_CYCLE then
        if player:getHP() <= 2 then
            return invaderXim.msg.basic.UNABLE_TO_USE_JA
        end
    end

    return invaderXim.msg.basic.REQUIRE_LUOPAN, 0
end

invaderXim.job_utils.geomancer.geoOnLifeCycleAbilityCheck = function(player, target, ability)
    if not hasLuopan(player) then
        return invaderXim.msg.basic.REQUIRE_LUOPAN, 0
    end

    if player:getHP() <= 2 then
        return invaderXim.msg.basic.UNABLE_TO_USE_JA
    end

    return 0, 0
end

invaderXim.job_utils.geomancer.geoOnEclipticAttritionCheck = function(player, target, ability)
    local luopan = getLuopan(player)

    -- TODO: this never fires if you dont have a bubble up and says "Unable to attack that target." Core issue?
    if not luopan then
        return invaderXim.msg.basic.REQUIRE_LUOPAN, 0
    end

    if luopan:getLocalVar('eclipticAttrition') ~= 0 then
        -- This message is guessed
        return invaderXim.msg.basic.UNABLE_TO_USE_JA, 0
    end

    return 0, 0
end

-----------------------------------
-- GEO/INDI Potency Function
-----------------------------------
local function getEffectPotency(player, effect)
    -- Note: only one 'Geomancy +' item takes effect so highest value on a single item wins.
    -- Potency from a skill level perspective caps out once your combined hand bell skill and geomancy skill reaches 900.
    local geoSkill      = player:getSkillLevel(invaderXim.skill.GEOMANCY)
    local handbellSkill = player:getSkillLevel(invaderXim.skill.HANDBELL)
    local geomancyMod   = 0

    if player:getObjType() ~= invaderXim.objType.PC then
        geoSkill      = player:getMod(invaderXim.mod.GEOMANCY_SKILL)
        geomancyMod   = player:getMod(invaderXim.mod.GEOMANCY_BONUS)
    else
        geomancyMod = player:getMaxGearMod(invaderXim.mod.GEOMANCY_BONUS)
    end

    if
        player:getEquipID(invaderXim.slot.RANGED) == 0 or
        player:getWeaponSkillType(invaderXim.slot.RANGED) ~= invaderXim.skill.HANDBELL
    then
        handbellSkill = 0
    end

    local combinedSkillLevel = utils.clamp(handbellSkill + geoSkill, 0, 900)
    local divisor            = potencyData[effect].divisor
    local minPotency         = potencyData[effect].minPotency
    local maxPotency         = potencyData[effect].maxPotency
    local potency            = utils.clamp(combinedSkillLevel / divisor, minPotency, maxPotency)

    if geomancyMod > 0 and not player:hasStatusEffect(invaderXim.effect.ENTRUST) then
        -- Geomancy bonus is a mod value * the multiplier then added to the final potency of the effect
        potency = potency + (geomancyMod * potencyData[effect].geoModMultiplier)
    end

    -- Boost potency calculations for Haste/Slow into the no-longer-human-readable-format
    if effect == invaderXim.effect.GEO_HASTE or effect == invaderXim.effect.GEO_SLOW then
        potency = math.floor(potency * 100)
    end

    return potency
end

-----------------------------------
-- Check for Widened Compass
-- Apply mod as needed
-----------------------------------
local function windenedCompassCheck(player)
    -- As the extended range does not change on an active indi spell if Widened Compass wears,
    -- we need to set this mod each time we cast an indi spell to affect the aura range,
    -- this is because we cannot delete the mod on onEffectLose or the range will reduce after a tick
    if player:hasStatusEffect(invaderXim.effect.WIDENED_COMPASS) then
        player:setMod(invaderXim.mod.AURA_SIZE, 625)
    else
        player:setMod(invaderXim.mod.AURA_SIZE, 0)
    end
end

-----------------------------------
-- Ability Use Functions
-----------------------------------
invaderXim.job_utils.geomancer.bolster = function(player, target, ability)
    local bonusTime = player:getMod(invaderXim.mod.BOLSTER_EFFECT)
    player:addStatusEffect(invaderXim.effect.BOLSTER, 0, 3, 240 + bonusTime)
end

invaderXim.job_utils.geomancer.fullCircle = function(player, target, ability)
    local hppRemaining = target:getHPP()
    local mpCost       = player:getLocalVar('MP_COST')
    local fcMerit      = player:getMerit(invaderXim.merit.FULL_CIRCLE_EFFECT)
    local crMerit      = player:getMerit(invaderXim.merit.CURATIVE_RECANTATION)
    local fcMod        = player:getMod(invaderXim.mod.FULL_CIRCLE)
    local crMod        = player:getMod(invaderXim.mod.CURATIVE_RECANTATION)
    local mpMultiplier = 0.5 + (fcMerit / 10) + (fcMod / 10)
    local hpMultiplier = 0.5 + (0.7 * crMerit) + (crMod / 10)
    local mpReturned   = 0
    local hpReturned   = 0

    -- calculate final mp value
    mpReturned = math.floor(mpMultiplier * mpCost * (hppRemaining / 100))

    if crMerit > 0 then
        -- calculate final hp value
        hpReturned = math.floor(hpMultiplier * mpCost * (hppRemaining / 100))
        player:restoreHP(hpReturned)
    end

    player:restoreMP(mpReturned)
    player:despawnPet()
end

invaderXim.job_utils.geomancer.lastingEmanation = function(player, target, ability)
    local hpDrain = target:getMod(invaderXim.mod.REGEN_DOWN)
    target:setMod(invaderXim.mod.REGEN_DOWN, hpDrain - math.floor(target:getMainLvl() / 14))
end

-- TODO: allegedly Blaze of Glory is additive to this, but we aren't keeping track of that potency, so BoG + Ecliptic Attrition is stronger than it should be.
--       That is probably fixable with some localvars on the bubble...?
invaderXim.job_utils.geomancer.eclipticAttrition = function(player, target, ability)
    if target:getLocalVar('eclipticAttrition') ~= 0 then
        return
    end

    local hpDrain = target:getMod(invaderXim.mod.REGEN_DOWN)
    target:setMod(invaderXim.mod.REGEN_DOWN, hpDrain + math.floor(target:getMainLvl() / 16))

    if player:hasStatusEffect(invaderXim.effect.BOLSTER) then
        return
    end

    local effect = target:getStatusEffect(invaderXim.effect.COLURE_ACTIVE)
    if effect then
        local finalPotency = math.floor(1.25 * effect:getSubPower())

        -- This floors https://www.bg-wiki.com/ffxi/Ecliptic_Attrition
        effect:setSubPower(finalPotency)
        target:setLocalVar('eclipticAttrition', 1)
    end
end

invaderXim.job_utils.geomancer.collimatedFervor = function(player, target, ability)
    target:addStatusEffect(invaderXim.effect.COLLIMATED_FERVOR, 0, 0, 60)
end

invaderXim.job_utils.geomancer.lifeCycle = function(player, target, ability)
    local hpAmount   = math.floor(0.25 * player:getHP())
    local hpTransfer = hpAmount

    if player:getMod(invaderXim.mod.LIFE_CYCLE_EFFECT) > 0 then
        hpTransfer = hpAmount * player:getMod(invaderXim.mod.LIFE_CYCLE_EFFECT) / 10
    end

    target:restoreHP(hpTransfer)
    player:delHP(hpAmount)
    return hpTransfer
end

invaderXim.job_utils.geomancer.blazeOfGlory = function(player, target, ability)
    player:addStatusEffect(invaderXim.effect.BLAZE_OF_GLORY, 0, 3, 60)
end

invaderXim.job_utils.geomancer.dematerialize = function(player, target, ability)
    target:addStatusEffect(invaderXim.effect.DEMATERIALIZE, 0, 3, 60)
    return invaderXim.effect.DEMATERIALIZE
end

invaderXim.job_utils.geomancer.theurgicFocus = function(player, target, ability)
end

invaderXim.job_utils.geomancer.widenedCompass = function(player, target, ability)
    player:addStatusEffect(invaderXim.effect.WIDENED_COMPASS, 0, 3, 60)
end

-----------------------------------
-- Magic Casting Checks
-----------------------------------
invaderXim.job_utils.geomancer.indiOnMagicCastingCheck = function(caster, target, spell)
    if caster ~= target and not caster:hasStatusEffect(invaderXim.effect.ENTRUST) then
        return invaderXim.msg.basic.MAGIC_CANNOT_BE_CAST
    end

    return 0
end

invaderXim.job_utils.geomancer.geoOnMagicCastingCheck = function(caster, target, spell)
    if hasLuopan(caster) then
        return invaderXim.msg.basic.LUOPAN_ALREADY_PLACED
    elseif caster:getPet() then
        return invaderXim.msg.basic.ALREADY_HAS_A_PET
    elseif not caster:canUseMisc(invaderXim.zoneMisc.PET) then
        return invaderXim.msg.basic.CANT_BE_USED_IN_AREA
    elseif caster:getMainJob() ~= invaderXim.job.GEO then
        -- wikis are incorrect, does not require handbell
        return invaderXim.msg.basic.MAGIC_CANNOT_CAST
    else
        return 0
    end
end

-----------------------------------
-- Aura Function
-- duration:   Length of the aura effect, not ticks of the aura's effect
--             0 = does not wear off
-- tickEffect: The effect being granted/imposed by the aura
--             Use invaderXim.effect table: invaderXim.effect.GEO_POISON for example,
--               but doesn't _need_ to be a GEO_ effect)
-- tickPower:  The power of the tick (healing amount, damage amount, etc.)
-- targetType: Target allies or enemies with:
--             invaderXim.auraTarget.ALLIES or invaderXim.auraTarget.ENEMIES
-----------------------------------
invaderXim.job_utils.geomancer.addAura = function(target, duration, tickEffect, tickPower, targetType)
    target:addStatusEffectEx(invaderXim.effect.COLURE_ACTIVE, invaderXim.effect.COLURE_ACTIVE, 0, 3, duration, tickEffect, tickPower, targetType, invaderXim.effectFlag.AURA)
end

-----------------------------------
-- Indi Spell Function
-----------------------------------
invaderXim.job_utils.geomancer.doIndiSpell = function(caster, target, spell)
    local spellID      = spell:getID()
    local effect       = indiData[spellID].effect
    local potency      = getEffectPotency(caster, effect)
    local targetType   = indiData[spellID].targetType
    local visualEffect = indiData[spellID].visualEffect
    local duration = 180 + caster:getMod(invaderXim.mod.INDI_DURATION)

    -- set a local var to adjust potency values after an ability has worn off
    target:setLocalVar('INDI_POTENCY', potency)

    if target:hasStatusEffect(invaderXim.effect.BOLSTER) then
        potency = potency * 2
    end

    windenedCompassCheck(caster)

    target:addStatusEffectEx(invaderXim.effect.COLURE_ACTIVE, invaderXim.effect.COLURE_ACTIVE, visualEffect, 3, duration, effect, potency, targetType, invaderXim.effectFlag.AURA)

    if caster:hasStatusEffect(invaderXim.effect.ENTRUST) then
        caster:delStatusEffectSilent(invaderXim.effect.ENTRUST)
    end

    return effect
end

-----------------------------------
-- Spawn Luopan Function
-----------------------------------
invaderXim.job_utils.geomancer.spawnLuopan = function(player, target, spell)
    if target then
        invaderXim.pet.spawnPet(player, invaderXim.petId.LUOPAN)
    else
        return
    end

    local luopan       = player:getPet()
    local spellID      = spell:getID()
    local modelID      = geoData[spellID].luopanModel
    local effect       = geoData[spellID].effect
    local potency      = getEffectPotency(player, effect)
    local finalPotency = potency
    local targetType   = geoData[spellID].targetType
    local bolsterValue = 0

    -- set a local var to adjust potency values after an ability has worn off
    luopan:setLocalVar('GEO_POTENCY', potency)

    if player:hasStatusEffect(invaderXim.effect.BLAZE_OF_GLORY) then
        finalPotency = potency + 0.5 * potency
    end

    if player:hasStatusEffect(invaderXim.effect.BOLSTER) then
        finalPotency = potency * 2
    end

    windenedCompassCheck(player)

    -- Attach effect
    invaderXim.job_utils.geomancer.addAura(luopan, 0, effect, finalPotency, targetType)

    -- Save the mp cost for use with Full Circle on the luopan
    player:setLocalVar('MP_COST', spell:getMPCost())

    -- Change the luopans appearance to match the effect
    luopan:setModelId(modelID)

    -- get the job point value of BOLSTER_EFFECT if Bolster is active
    if player:hasStatusEffect(invaderXim.effect.BOLSTER) then
        bolsterValue = player:getJobPointLevel(invaderXim.jp.BOLSTER_EFFECT)
    end

    if player:hasStatusEffect(invaderXim.effect.BLAZE_OF_GLORY) then
        player:delStatusEffect(invaderXim.effect.BLAZE_OF_GLORY)
        luopan:setHP((luopan:getMaxHP() / 2) + (luopan:getMaxHP() * (0.01 * player:getJobPointLevel(invaderXim.jp.BLAZE_OF_GLORY_EFFECT))))
    end

    -- Set HP loss over time
    luopan:addMod(invaderXim.mod.REGEN_DOWN, math.floor(luopan:getMainLvl() / 4) - bolsterValue)

    -- Innate Damage Taken -50%
    luopan:addMod(invaderXim.mod.DMG, -5000)
end

-----------------------------------
-- Ability Effect Gain Adjustments
-----------------------------------
invaderXim.job_utils.geomancer.bolsterOnEffectGain = function(target, effect)
    -- Luopans need to be recast to add this effect to them so we ignore them here
    if target:hasStatusEffect(invaderXim.effect.COLURE_ACTIVE) then
        local indiPotency = target:getLocalVar('INDI_POTENCY')
        target:getStatusEffect(invaderXim.effect.COLURE_ACTIVE):setSubPower(indiPotency * 2)
    end
end

-----------------------------------
-- Ability Effect Wear Adjustments
-----------------------------------
invaderXim.job_utils.geomancer.bolsterOnEffectLose = function(target, effect)
    local bolsterJP = target:getJobPointLevel(invaderXim.jp.BOLSTER_EFFECT)
    local pet       = target:getPet()

    -- Luopan Geo effect
    if pet and pet:getPetID() == invaderXim.petId.LUOPAN then
        local geoPotency     = pet:getLocalVar('GEO_POTENCY')
        local currentPotency = pet:getStatusEffect(invaderXim.effect.COLURE_ACTIVE):getSubPower()
        if currentPotency == geoPotency * 2 then -- will always be this value with Bolster or Blaze of Glory active
            pet:getStatusEffect(invaderXim.effect.COLURE_ACTIVE):setSubPower(geoPotency)
            pet:setMod(invaderXim.mod.REGEN_DOWN, pet:getMod(invaderXim.mod.REGEN_DOWN) + bolsterJP)
        end
    end

    -- Player Indi effect
    if target:hasStatusEffect(invaderXim.effect.COLURE_ACTIVE) then
        local indiPotency = target:getLocalVar('INDI_POTENCY')
        local currentPotency = target:getStatusEffect(invaderXim.effect.COLURE_ACTIVE):getSubPower()
        if currentPotency == indiPotency * 2 then -- will always be this value with Bolster active
            target:getStatusEffect(invaderXim.effect.COLURE_ACTIVE):setSubPower(indiPotency)
        end
    end
end
