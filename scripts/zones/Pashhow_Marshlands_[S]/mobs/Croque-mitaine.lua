-----------------------------------
-- Area: Pashhow Marshlands [S]
--   NM: Croque-mitaine
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 506)
end

return entity
