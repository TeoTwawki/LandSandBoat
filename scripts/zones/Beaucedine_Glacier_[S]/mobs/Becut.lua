-----------------------------------
-- Area: Beaucedine Glacier [S]
--   NM: Becut
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 537)
end

return entity
