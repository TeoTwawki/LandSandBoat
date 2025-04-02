-----------------------------------
-- Area: East Ronfaure [S]
--   NM: Skogs Fru
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 479)
end

return entity
