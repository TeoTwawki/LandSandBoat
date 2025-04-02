-----------------------------------
-- Ability: Pflug
-- Enhances resistance. The types of resistance enhanced depend upon the runes you harbor.
-- Obtained: Rune Fencer Level 40
-- Recast Time: 3:00
-- Duration: 2:00
-----------------------------------
---@type TAbility
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return invaderXim.job_utils.rune_fencer.checkHaveRunes(player)
end

abilityObject.onUseAbility = function(player, target, ability, action)
    return invaderXim.job_utils.rune_fencer.usePflug(player, target, ability, action)
end

return abilityObject
