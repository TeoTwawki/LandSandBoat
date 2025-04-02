-----------------------------------
-- Area: Carpenters Landing
--   NM: Hercules Beetle
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 165)
end

return entity
