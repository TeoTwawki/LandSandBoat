-----------------------------------
-- Ability: Immanence
-- Makes it possible for your next elemental magic spell to be used in a skillchain, but not a magic burst.
-- Obtained: Scholar Level 87
-- Duration: 1 Black Magic Spell or 60 seconds, whichever occurs first.
-----------------------------------
---@type TAbility
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    if player:hasStatusEffect(invaderXim.effect.IMMANENCE) then
        return invaderXim.msg.basic.EFFECT_ALREADY_ACTIVE, 0
    end

    return 0, 0
end

abilityObject.onUseAbility = function(player, target, ability)
    player:addStatusEffect(invaderXim.effect.IMMANENCE, 1, 0, 60)

    return invaderXim.effect.IMMANENCE
end

return abilityObject
