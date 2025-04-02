-----------------------------------
-- Area: Jugner Forest [S]
--   NM: Vulkodlac
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 485)
end

return entity
