-----------------------------------
-- Area: South Gustaberg
--   NM: Carnero
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 202)
end

return entity
