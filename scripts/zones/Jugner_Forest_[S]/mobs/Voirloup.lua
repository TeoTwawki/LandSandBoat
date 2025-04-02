-----------------------------------
-- Area: Jugner Forest [S]
--   NM: Voirloup
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 486)
end

return entity
