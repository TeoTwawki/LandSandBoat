-----------------------------------
-- Area: Garlaige Citadel [S]
--   NM: Elatha
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 535)
end

return entity
