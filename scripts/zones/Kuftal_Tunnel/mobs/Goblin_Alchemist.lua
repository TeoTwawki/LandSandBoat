-----------------------------------
-- Area: Kuftal Tunnel
--  Mob: Goblin Alchemist
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 740, 2, invaderXim.regime.type.GROUNDS)
end

return entity
