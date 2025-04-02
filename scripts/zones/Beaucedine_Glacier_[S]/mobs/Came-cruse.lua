-----------------------------------
-- Area: Beaucedine Glacier [S]
--   NM: Came-cruse
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 536)
end

return entity
