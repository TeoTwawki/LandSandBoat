-----------------------------------
-- Spell: Stinking Gas
-- Lowers Vitality of enemies within range
-- Spell cost: 37 MP
-- Monster Type: Undead
-- Spell Type: Magical (Wind)
-- Blue Magic Points: 2
-- Stat Bonus: AGI+1
-- Level: 44
-- Casting Time: 4 seconds
-- Recast Time: 60 seconds
-- Magic Bursts on: Detonation, Fragmentation, and Light
-- Combos: Auto Refresh
-----------------------------------
---@type TSpell
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local power           = 10
    local tick            = 0
    local duration        = 60
    local resistThreshold = 0.5
    local isGaze          = false
    local isConal         = false
    local params          = {}
    params.ecosystem      = invaderXim.ecosystem.UNDEAD
    params.effect         = invaderXim.effect.VIT_DOWN

    return invaderXim.spells.blue.useEnfeeblingSpell(caster, target, spell, params, power, tick, duration, resistThreshold, isGaze, isConal)
end

return spellObject
