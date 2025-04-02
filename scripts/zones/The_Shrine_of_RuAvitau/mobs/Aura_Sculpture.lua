-----------------------------------
-- Area: The Shrine of Ru'Avitau
--  Mob: Aura Sculpture
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 749, 1, invaderXim.regime.type.GROUNDS)
    invaderXim.regime.checkRegime(player, mob, 754, 1, invaderXim.regime.type.GROUNDS)
end

return entity
