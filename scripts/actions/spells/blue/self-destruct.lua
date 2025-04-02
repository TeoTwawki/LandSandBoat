-----------------------------------
-- Spell: Self-Destruct
-- Sacrifices HP to damage enemies within range. Affects caster with Weakness
-- Spell cost: 100 MP
-- Monster Type: Arcana
-- Spell Type: Magical (Fire)
-- Blue Magic Points: 3
-- Stat Bonus: STR+2
-- Level: 50
-- Casting Time: 3.25 seconds
-- Recast Time: 21 seconds
-- Magic Bursts on: Liquefaction, Fusion, and Light
-- Combos: Auto Refresh
-----------------------------------
---@type TSpell
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    caster:setLocalVar('selfdestructHp', caster:getHP())
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local params = {}
    params.attackType = invaderXim.attackType.MAGICAL
    params.damageType = invaderXim.damageType.FIRE
    local playerHP = caster:getLocalVar('selfdestructHp')
    local damage = playerHP - 1

    if damage > 0 then
        damage = invaderXim.spells.blue.applySpellDamage(caster, target, spell, damage, params)
        caster:setHP(1)
        caster:delStatusEffectSilent(invaderXim.effect.WEAKNESS)
        caster:addStatusEffect(invaderXim.effect.WEAKNESS, 1, 0, 300)
    else
        spell:setMsg(invaderXim.msg.basic.MAGIC_NO_EFFECT)
    end

    return damage
end

return spellObject
