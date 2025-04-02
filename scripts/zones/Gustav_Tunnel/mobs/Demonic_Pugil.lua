-----------------------------------
-- Area: Gustav Tunnel
--  Mob: Demonic Pugil
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 766, 2, invaderXim.regime.type.GROUNDS)
end

return entity
