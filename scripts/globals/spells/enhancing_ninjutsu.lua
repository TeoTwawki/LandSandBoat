-----------------------------------
-- Enhancing Spell Utilities
-----------------------------------
xi = xi or {}
invaderXim.spells = invaderXim.spells or {}
invaderXim.spells.enhancing = invaderXim.spells.enhancing or {}
-----------------------------------

local column =
{
    EFFECT_TIER           = 1,
    EFFECT_ID             = 2,
    EFFECT_POWER          = 3,
    EFFECT_DURATION       = 4,
    EFFECT_WILL_OVERWRITE = 5,
}
-- Table variables.
local pTable =
{
-- Structure:            [spellId] = { Tier, Main_Effect, Power, Duration, Always_Overwrite },
    [invaderXim.magic.spell.GEKKA_ICHI   ] = { 1, invaderXim.effect.ENMITY_BOOST,     30, 300, true  },
    [invaderXim.magic.spell.KAKKA_ICHI   ] = { 1, invaderXim.effect.STORE_TP,         10, 180, true  },
    [invaderXim.magic.spell.MIGAWARI_ICHI] = { 1, invaderXim.effect.MIGAWARI,          0,  60, true  },
    [invaderXim.magic.spell.MONOMI_ICHI  ] = { 1, invaderXim.effect.SNEAK,             0, 420, false },
    [invaderXim.magic.spell.MYOSHU_ICHI  ] = { 1, invaderXim.effect.SUBTLE_BLOW_PLUS, 10, 180, true  },
    [invaderXim.magic.spell.TONKO_ICHI   ] = { 1, invaderXim.effect.INVISIBLE,         0, 420, false },
    [invaderXim.magic.spell.TONKO_NI     ] = { 2, invaderXim.effect.INVISIBLE,         0, 600, false },
    [invaderXim.magic.spell.UTSUSEMI_ICHI] = { 1, invaderXim.effect.COPY_IMAGE,        3,   0, false },
    [invaderXim.magic.spell.UTSUSEMI_NI  ] = { 1, invaderXim.effect.COPY_IMAGE,        4,   0, false },
    [invaderXim.magic.spell.UTSUSEMI_SAN ] = { 1, invaderXim.effect.COPY_IMAGE,        5,   0, false },
    [invaderXim.magic.spell.YAIN_ICHI    ] = { 1, invaderXim.effect.PAX,              15, 300, true  },
}

-- Ninjutsu Potency function.
invaderXim.spells.enhancing.calculateNinjutsuPower = function(caster, target, spell, spellId, tier, spellEffect)
    local power    = pTable[spellId][column.EFFECT_POWER]
    local subPower = 0

    -- Migawari
    if spellEffect == invaderXim.effect.MIGAWARI then
        power = math.floor(caster:getSkillLevel(invaderXim.skill.NINJUTSU) / 5)
        subPower = 100

    -- Utsusemi
    elseif spellEffect == invaderXim.effect.COPY_IMAGE then
        power    = power + target:getMod(invaderXim.mod.UTSUSEMI_BONUS)
        subPower = invaderXim.effect.COPY_IMAGE_3

        -- Utsusemi: Ni non-ninja penalty
        if
            spellId == invaderXim.magic.spell.UTSUSEMI_NI and
            caster:getMainJob() ~= invaderXim.job.NIN
        then
            power = power - 1
        end

        if power > 3 then
            subPower = subPower + 1
        end
    end

    return power, subPower
end

-- Main function for Enhancing Spells.
invaderXim.spells.enhancing.useEnhancingNinjutsu = function(caster, target, spell)
    local spellId = spell:getID()

    -- Get Variables from Parameters Table.
    local tier            = pTable[spellId][column.EFFECT_TIER]
    local spellEffect     = pTable[spellId][column.EFFECT_ID]
    local duration        = pTable[spellId][column.EFFECT_DURATION]
    local alwaysOverwrite = pTable[spellId][column.EFFECT_WILL_OVERWRITE]

    -- Other
    local paramThree = 0
    --------------------------------------------------
    -- Calculate Spell Potency and subpower.
    --------------------------------------------------
    local power, subPower = invaderXim.spells.enhancing.calculateNinjutsuPower(caster, target, spell, spellId, tier, spellEffect)

    ------------------------------
    -- Handle exceptions.
    ------------------------------
    -- Gekka
    if spellEffect == invaderXim.effect.ENMITY_BOOST then
        target:delStatusEffect(invaderXim.effect.PAX)

    -- Monomi / Tonko
    elseif spellEffect == invaderXim.effect.SNEAK or spellEffect == invaderXim.effect.INVISIBLE then
        paramThree = 10

    -- Yain
    elseif spellEffect == invaderXim.effect.PAX then
        target:delStatusEffect(invaderXim.effect.ENMITY_BOOST)
    end

    ------------------------------------------------------------
    -- Change message when higher effect or "Always overwrite".
    ------------------------------------------------------------
    if alwaysOverwrite then
        target:delStatusEffect(spellEffect)
        target:addStatusEffect(spellEffect, power, paramThree, duration, 0, subPower)

    -- Utsusemi exception.
    elseif not alwaysOverwrite and spellEffect == invaderXim.effect.COPY_IMAGE then
        local targetEffect = target:getStatusEffect(invaderXim.effect.COPY_IMAGE)

        -- Third Eye and Utsusemi don't stack. Utsusemi removes Third Eye.
        if target:hasStatusEffect(invaderXim.effect.THIRD_EYE) then
            target:delStatusEffect(invaderXim.effect.THIRD_EYE)
        end

        paramThree = pTable[spellId][column.EFFECT_POWER] - 2

        if targetEffect == nil or targetEffect:getPower() <= paramThree then
            target:addStatusEffectEx(invaderXim.effect.COPY_IMAGE, subPower, paramThree, duration, 900, 0, power) -- Not a mistake.
            spell:setMsg(invaderXim.msg.basic.MAGIC_GAIN_EFFECT)
        else
            spell:setMsg(invaderXim.msg.basic.MAGIC_NO_EFFECT)
        end

    else
        if target:addStatusEffect(spellEffect, power, paramThree, duration, 0, subPower) then
            spell:setMsg(invaderXim.msg.basic.MAGIC_GAIN_EFFECT)
        else
            spell:setMsg(invaderXim.msg.basic.MAGIC_NO_EFFECT) -- No effect.
        end
    end

    return spellEffect
end
