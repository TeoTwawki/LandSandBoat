-----------------------------------
-- Area: Aydeewa Subterrane
--   NM: Bluestreak Gyugyuroon
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 464)
end

return entity
