-----------------------------------
-- Area: The Shrine of Ru'Avitau
--  Mob: Fire Elemental
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 750, 1, invaderXim.regime.type.GROUNDS)
end

return entity
