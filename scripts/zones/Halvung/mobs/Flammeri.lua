-----------------------------------
-- Area: Halvung
--   NM: Flammeri
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 467)
end

return entity
