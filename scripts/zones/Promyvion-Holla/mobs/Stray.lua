-----------------------------------
-- Area: Promyvion-Holla
--   NM: Stray
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    invaderXim.promyvion.emptyOnMobSpawn(mob, invaderXim.promyvion.mobType.STRAY)
end

return entity
