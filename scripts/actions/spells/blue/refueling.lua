-----------------------------------
-- Spell: Refueling
-- Increases attack speed
-- Spell cost: 29 MP
-- Monster Type: Arcana
-- Spell Type: Magical (Wind)
-- Blue Magic Points: 4
-- Stat Bonus: AGI+2
-- Level: 48
-- Casting Time: 1.5 seconds
-- Recast Time: 30 seconds
-- Duration: 5 minutes
-----------------------------------
-- Combos: None
-----------------------------------
---@type TSpell
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local power = 1000 -- 10%
    local duration = invaderXim.spells.blue.calculateDurationWithDiffusion(caster, 300)

    if not target:addStatusEffect(invaderXim.effect.HASTE, power, 0, duration) then
        spell:setMsg(invaderXim.msg.basic.MAGIC_NO_EFFECT)
    end

    return invaderXim.effect.HASTE
end

return spellObject
