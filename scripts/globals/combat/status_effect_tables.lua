-----------------------------------
-- Table defining diferent status effect properties.
-----------------------------------
-- Info
-- Resistance:  https://wiki-ffo-jp.translate.goog/html/1801.html?_x_tr_sl=ja&_x_tr_tl=en&_x_tr_hl=en&_x_tr_pto=sc
-- Effects:     https://wiki-ffo-jp.translate.goog/html/1720.html?_x_tr_sl=ja&_x_tr_tl=en&_x_tr_hl=en&_x_tr_pto=sc
-- Resist:      https://wiki-ffo-jp.translate.goog/html/795.html?_x_tr_sl=ja&_x_tr_tl=en&_x_tr_hl=en&_x_tr_pto=sc
-- Immunobreak: https://wiki-ffo-jp.translate.goog/html/27204.html?_x_tr_sl=ja&_x_tr_tl=en&_x_tr_hl=en&_x_tr_pto=sc

-- NOTE: I have yet to find a case where the effect "associated element" isnt determined by the element of the action that causes it.
-- Example: Siren's elegy is wind while spell elegies are earth. Same effect, diferent elements.
-- Unlike sleep, elegy effect doesnt have an associated "effect resistance rank" and uses "element resistance rank" instead.
-----------------------------------
require('scripts/globals/utils')
-----------------------------------
xi = xi or {}
invaderXim.combat = invaderXim.combat or {}
invaderXim.combat.statusEffect = invaderXim.combat.statusEffect or {}
-----------------------------------

-- Table column names.
local column =
{
    EFFECT_NULLIFIED_BY = 1, -- [effect] is nullified by { effect }. In other words, [effect] cant be applied because { effect } is active.
    EFFECT_NULLIFIES    = 2, -- TODO: IMPLEMENT. [effect] nullifies { effect }.
    EFFECT_ELEMENT      = 3, -- Players and most effects dont have "effect resistance ranks", so they always use the effect "associated element" "resistance rank".
    EFFECT_IMMUNITY     = 4, -- Detected by "Completely resists" message. Cant immunobreak/resistance-hack it.
    MOD_RESIST_TRAIT    = 5, -- Detected by "Resist!" message. Cant immunobreak/resistance-hack it if triggered.
    MOD_RESIST_RANK     = 6, -- TODO: IMPLEMENT. For mobs, status effects can either: Use an specific status effect ressistance rank OR use their associated element resistance rank.
    MOD_MAGIC_EVASION   = 7,
    MOD_IMMUNOBREAK     = 8,
}

-- Table associating an status effect with their corresponding immunobreak, MEVA and resistance modifiers and immunities.
invaderXim.combat.statusEffect.dataTable =
{
    [invaderXim.effect.ADDLE        ] = { 0,               invaderXim.effect.NOCTURNE, invaderXim.element.FIRE,    invaderXim.immunity.ADDLE,      invaderXim.mod.SLOWRES,     0, 0,                    invaderXim.mod.ADDLE_IMMUNOBREAK    }, -- Addle cant be immunobroken?
    [invaderXim.effect.BIND         ] = { 0,               0,                  invaderXim.element.ICE,     invaderXim.immunity.BIND,       invaderXim.mod.BINDRES,     0, invaderXim.mod.BIND_MEVA,     invaderXim.mod.BIND_IMMUNOBREAK     },
    [invaderXim.effect.BLINDNESS    ] = { 0,               0,                  invaderXim.element.DARK,    invaderXim.immunity.BLIND,      invaderXim.mod.BLINDRES,    0, invaderXim.mod.BLIND_MEVA,    invaderXim.mod.BLIND_IMMUNOBREAK    },
    [invaderXim.effect.BURN         ] = { invaderXim.effect.DROWN, 0,                  invaderXim.element.FIRE,    0,                      0,                  0, 0,                    0                           },
    [invaderXim.effect.CHOKE        ] = { invaderXim.effect.FROST, 0,                  invaderXim.element.WIND,    0,                      0,                  0, 0,                    0                           },
    [invaderXim.effect.CURSE_I      ] = { 0,               0,                  invaderXim.element.DARK,    invaderXim.immunity.NONE,       invaderXim.mod.CURSERES,    0, invaderXim.mod.CURSE_MEVA,    0                           },
    [invaderXim.effect.DROWN        ] = { invaderXim.effect.SHOCK, 0,                  invaderXim.element.WATER,   0,                      0,                  0, 0,                    0                           },
    [invaderXim.effect.FLASH        ] = { 0,               0,                  invaderXim.element.LIGHT,   invaderXim.immunity.BLIND,      invaderXim.mod.BLINDRES,    0, invaderXim.mod.BLIND_MEVA,    invaderXim.mod.BLIND_IMMUNOBREAK    },
    [invaderXim.effect.FROST        ] = { invaderXim.effect.BURN,  0,                  invaderXim.element.ICE,     0,                      0,                  0, 0,                    0                           },
    [invaderXim.effect.NOCTURNE     ] = { invaderXim.effect.ADDLE, 0,                  invaderXim.element.FIRE,    invaderXim.immunity.ADDLE,      invaderXim.mod.SLOWRES,     0, 0,                    0                           },
    [invaderXim.effect.NONE         ] = { 0,               0,                  invaderXim.element.DARK,    invaderXim.immunity.DISPEL,     0,                  0, 0,                    0                           },
    [invaderXim.effect.PARALYSIS    ] = { 0,               0,                  invaderXim.element.ICE,     invaderXim.immunity.PARALYZE,   invaderXim.mod.PARALYZERES, 0, invaderXim.mod.PARALYZE_MEVA, invaderXim.mod.PARALYZE_IMMUNOBREAK },
    [invaderXim.effect.PETRIFICATION] = { 0,               0,                  invaderXim.element.EARTH,   invaderXim.immunity.PETRIFY,    invaderXim.mod.PETRIFYRES,  0, invaderXim.mod.PETRIFY_MEVA,  invaderXim.mod.PETRIFY_IMMUNOBREAK  },
    [invaderXim.effect.PLAGUE       ] = { 0,               0,                  invaderXim.element.FIRE,    invaderXim.immunity.PLAGUE,     invaderXim.mod.VIRUSRES,    0, invaderXim.mod.VIRUS_MEVA,    0                           },
    [invaderXim.effect.POISON       ] = { 0,               0,                  invaderXim.element.WATER,   invaderXim.immunity.POISON,     invaderXim.mod.POISONRES,   0, invaderXim.mod.POISON_MEVA,   invaderXim.mod.POISON_IMMUNOBREAK   },
    [invaderXim.effect.RASP         ] = { invaderXim.effect.CHOKE, 0,                  invaderXim.element.EARTH,   0,                      0,                  0, 0,                    0                           },
    [invaderXim.effect.SHOCK        ] = { invaderXim.effect.RASP,  0,                  invaderXim.element.THUNDER, 0,                      0,                  0, 0,                    0                           },
    [invaderXim.effect.SILENCE      ] = { 0,               0,                  invaderXim.element.WIND,    invaderXim.immunity.SILENCE,    invaderXim.mod.SILENCERES,  0, invaderXim.mod.SILENCE_MEVA,  invaderXim.mod.SILENCE_IMMUNOBREAK  },
    [invaderXim.effect.SLEEP_I      ] = { 0,               0,                  invaderXim.element.DARK,    invaderXim.immunity.DARK_SLEEP, invaderXim.mod.SLEEPRES,    0, invaderXim.mod.SLEEP_MEVA,    invaderXim.mod.SLEEP_IMMUNOBREAK    },
    [invaderXim.effect.SLOW         ] = { 0,               0,                  invaderXim.element.EARTH,   invaderXim.immunity.SLOW,       invaderXim.mod.SLOWRES,     0, invaderXim.mod.SLOW_MEVA,     invaderXim.mod.SLOW_IMMUNOBREAK     },
    [invaderXim.effect.STUN         ] = { 0,               0,                  invaderXim.element.THUNDER, invaderXim.immunity.STUN,       invaderXim.mod.STUNRES,     0, invaderXim.mod.STUN_MEVA,     0                           },
    [invaderXim.effect.WEIGHT       ] = { 0,               0,                  invaderXim.element.WIND,    invaderXim.immunity.GRAVITY,    invaderXim.mod.GRAVITYRES,  0, invaderXim.mod.GRAVITY_MEVA,  invaderXim.mod.GRAVITY_IMMUNOBREAK  },
}

-----------------------------------
-- Helper functions to easily fetch table data.
-----------------------------------
invaderXim.combat.statusEffect.getNullificatingEffect = function(effectId)
    -- Sanitize fed value
    local effectToCheck = utils.defaultIfNil(effectId, 0)

    -- Fetch effect ID from table if entry exists.
    if invaderXim.combat.statusEffect.dataTable[effectToCheck] then
        return invaderXim.combat.statusEffect.dataTable[effectToCheck][column.EFFECT_NULLIFIED_BY]
    end

    return 0
end

invaderXim.combat.statusEffect.getEffectToRemove = function(effectId)
    -- Sanitize fed value
    local effectToCheck = utils.defaultIfNil(effectId, 0)

    -- Fetch effect ID from table if entry exists.
    if invaderXim.combat.statusEffect.dataTable[effectToCheck] then
        return invaderXim.combat.statusEffect.dataTable[effectToCheck][column.EFFECT_NULLIFIES]
    end

    return 0
end

invaderXim.combat.statusEffect.getAssociatedElement = function(effectId, actionElement)
    -- Sanitize fed values
    local effectToCheck  = utils.defaultIfNil(effectId, 0)
    local elementToCheck = utils.defaultIfNil(actionElement, 0)

    -- Sleep exception.
    if effectToCheck == invaderXim.effect.SLEEP_I then
        return elementToCheck
    end

    -- Fetch element from table if entry exists.
    if invaderXim.combat.statusEffect.dataTable[effectToCheck] then
        return invaderXim.combat.statusEffect.dataTable[effectToCheck][column.EFFECT_ELEMENT]
    end

    -- Assume the effect "element" is the same as the action element.
    return elementToCheck
end

invaderXim.combat.statusEffect.getAssociatedImmunity = function(effectId, actionElement)
    -- Sanitize fed values
    local effectToCheck  = utils.defaultIfNil(effectId, 0)
    local elementToCheck = utils.defaultIfNil(actionElement, 0)

    -- Sleep exception.
    if
        effectToCheck == invaderXim.effect.SLEEP_I and
        elementToCheck == invaderXim.element.LIGHT
    then
        return invaderXim.immunity.LIGHT_SLEEP
    end

    -- Fetch immunity from table if entry exists.
    if invaderXim.combat.statusEffect.dataTable[effectToCheck] then
        return invaderXim.combat.statusEffect.dataTable[effectToCheck][column.EFFECT_IMMUNITY]
    end

    return 0
end

invaderXim.combat.statusEffect.getAssociatedResistTraitModifier = function(effectId)
    -- Sanitize fed value
    local effectToCheck  = utils.defaultIfNil(effectId, 0)

    -- Fetch modifier ID from table if entry exists.
    if invaderXim.combat.statusEffect.dataTable[effectToCheck] then
        return invaderXim.combat.statusEffect.dataTable[effectToCheck][column.MOD_RESIST_TRAIT]
    end

    return 0
end

invaderXim.combat.statusEffect.getAssociatedResistanceRankModifier = function(effectId)
    -- Sanitize fed value
    local effectToCheck  = utils.defaultIfNil(effectId, 0)

    -- Fetch modifier ID from table if entry exists.
    if invaderXim.combat.statusEffect.dataTable[effectToCheck] then
        return invaderXim.combat.statusEffect.dataTable[effectToCheck][column.MOD_RESIST_RANK]
    end

    return 0
end

invaderXim.combat.statusEffect.getAssociatedMagicEvasionModifier = function(effectId)
    -- Sanitize fed value
    local effectToCheck  = utils.defaultIfNil(effectId, 0)

    -- Fetch modifier ID from table if entry exists.
    if invaderXim.combat.statusEffect.dataTable[effectToCheck] then
        return invaderXim.combat.statusEffect.dataTable[effectToCheck][column.MOD_MAGIC_EVASION]
    end

    return 0
end

invaderXim.combat.statusEffect.getAssociatedImmunobreakModifier = function(effectId)
    -- Sanitize fed value
    local effectToCheck  = utils.defaultIfNil(effectId, 0)

    -- Fetch modifier ID from table if entry exists.
    if invaderXim.combat.statusEffect.dataTable[effectToCheck] then
        return invaderXim.combat.statusEffect.dataTable[effectToCheck][column.MOD_IMMUNOBREAK]
    end

    return 0
end

-----------------------------------
-- Helper functions to check target effect nullification.
-----------------------------------
invaderXim.combat.statusEffect.isTargetImmune = function(target, effectId, actionElement)
    if not target:isMob() then
        return false
    end

    local immunityId = invaderXim.combat.statusEffect.getAssociatedImmunity(effectId, actionElement)
    if
        immunityId > 0 and
        target:hasImmunity(immunityId)
    then
        return true
    end

    return false
end

invaderXim.combat.statusEffect.isTargetResistant = function(actor, target, effectId)
    local modifierId = invaderXim.combat.statusEffect.getAssociatedResistTraitModifier(effectId)
    if modifierId == 0 then
        return false
    end

    local resistancePower = target:getMod(modifierId) + target:getMod(invaderXim.mod.STATUSRES) + 5
    if resistancePower <= 5 then
        return false
    end

    -- TODO: Investigate if this happens always or not. Ex: Terror.
    if actor:isNM() then
        resistancePower = math.floor(resistancePower / 2)
    end

    if math.random(1, 100) <= resistancePower then
        return true
    end

    return false
end

invaderXim.combat.statusEffect.isEffectNullified = function(target, effectId)
    local nullificatingEffect = invaderXim.combat.statusEffect.getNullificatingEffect(effectId)
    if
        nullificatingEffect > 0 and
        target:hasStatusEffect(nullificatingEffect)
    then
        return true
    end

    return false
end
