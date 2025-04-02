-----------------------------------
-- Area: Maze of Shakhrami
--   NM: Trembler Tabitha
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 293)
    invaderXim.magian.onMobDeath(mob, player, optParams, set{ 943 })
end

return entity
