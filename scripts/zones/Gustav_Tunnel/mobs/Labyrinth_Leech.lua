-----------------------------------
-- Area: Gustav Tunnel
--  Mob: Labyrinth Leech
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 763, 2, invaderXim.regime.type.GROUNDS)
end

return entity
