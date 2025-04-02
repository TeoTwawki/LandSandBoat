-----------------------------------
-- Area: Xarcabard [S]
--   NM: Prince Orobas
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 541)
end

return entity
