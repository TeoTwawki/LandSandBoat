-----------------------------------
-- Area: Korroloka Tunnel
--  Mob: Spool Leech
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 734, 2, invaderXim.regime.type.GROUNDS)
end

return entity
