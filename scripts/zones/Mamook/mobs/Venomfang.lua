-----------------------------------
-- Area: Mamook
--   NM: Venomfang
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 459)
end

return entity
