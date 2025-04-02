-----------------------------------
-- Area: East Sarutabaruta
--   NM: Spiny Spipi
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 253)
end

return entity
