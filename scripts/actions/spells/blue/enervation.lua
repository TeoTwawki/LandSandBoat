-----------------------------------
-- Spell: Enervation
-- Lowers the defense and magical defense of enemies within range
-- Spell cost: 48 MP
-- Monster Type: Beastmen
-- Spell Type: Magical (Dark)
-- Blue Magic Points: 5
-- Stat Bonus: HP-5, MP+5
-- Level: 67
-- Casting Time: 6 seconds
-- Recast Time: 60 seconds
-- Magic Bursts on: Compression, Gravitation, and Darkness
-- Combos: Counter
-----------------------------------
---@type TSpell
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local params = {}
    params.ecosystem = invaderXim.ecosystem.BEASTMEN
    params.effect = invaderXim.effect.DEFENSE_DOWN
    params.attribute = invaderXim.mod.INT
    params.skillType = invaderXim.skill.BLUE_MAGIC
    local duration = 30
    local resistThreshold = 0.5
    local returnEffect = invaderXim.effect.DEFENSE_DOWN

    local resist = applyResistanceEffect(caster, target, spell, params)
    if resist >= resistThreshold then

        local actionOne = target:addStatusEffect(invaderXim.effect.DEFENSE_DOWN, 10, 0, duration * resist)
        local actionTwo = target:addStatusEffect(invaderXim.effect.MAGIC_DEF_DOWN, 8, 0, duration * resist)

        -- If at least one of effects got applied, set the message type
        if actionOne or actionTwo then
            spell:setMsg(invaderXim.msg.basic.MAGIC_ENFEEB_IS)
        end

        -- Set the returnEffect to effectTwo if the first one failed
        if not actionOne and actionTwo then
            returnEffect = invaderXim.effect.MAGIC_DEF_DOWN
        end

    else
        spell:setMsg(invaderXim.msg.basic.MAGIC_RESIST)
    end

    return returnEffect
end

return spellObject
