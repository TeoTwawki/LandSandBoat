-----------------------------------
-- Area: FeiYin
--  Mob: Drone
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 711, 2, invaderXim.regime.type.GROUNDS)
end

return entity
