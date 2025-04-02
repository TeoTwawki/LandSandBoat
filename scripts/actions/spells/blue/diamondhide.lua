-----------------------------------
-- Spell: Diamondhide
-- Gives party members within area of effect the effect of "Stoneskin"
-- Spell cost: 99 MP
-- Monster Type: Beastmen
-- Spell Type: Magical (Earth)
-- Blue Magic Points: 3
-- Stat Bonus: VIT+1
-- Level: 67
-- Casting Time: 7 seconds
-- Recast Time: 1 minute 30 seconds
-- 5 minutes
-----------------------------------
-- Combos: None
-----------------------------------
---@type TSpell
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local blueSkill = utils.clamp(caster:getSkillLevel(invaderXim.skill.BLUE_MAGIC), 0, 500)
    local power = (blueSkill / 3) * 2
    local duration = invaderXim.spells.blue.calculateDurationWithDiffusion(caster, 300)

    if not target:addStatusEffect(invaderXim.effect.STONESKIN, power, 0, duration, 0, 0, 2) then
        spell:setMsg(invaderXim.msg.basic.MAGIC_NO_EFFECT)
    end

    return invaderXim.effect.STONESKIN
end

return spellObject
