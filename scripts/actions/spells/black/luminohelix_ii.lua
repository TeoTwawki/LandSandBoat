-----------------------------------
-- Spell: Luminohelix II
-- Deals light damage that gradually reduces a target's HP.
-----------------------------------
---@type TSpell
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local damage = invaderXim.spells.damage.useDamageSpell(caster, target, spell) -- Gets nuke power and sets messages.

    -- Can't apply if absorbed or nullified.
    if damage > 0 then
        local power    = utils.clamp(damage, 0, 9999)
        local duration = invaderXim.spells.enfeebling.calculateDuration(caster, target, spell:getID(), invaderXim.effect.HELIX, invaderXim.skill.ELEMENTAL_MAGIC)

        target:addStatusEffect(invaderXim.effect.HELIX, power, 10, duration, 0, 0, 2)
    end

    return damage
end

return spellObject
