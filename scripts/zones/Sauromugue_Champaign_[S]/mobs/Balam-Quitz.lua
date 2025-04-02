-----------------------------------
-- Area: Sauromugue Champaign [S]
--   NM: Balam-Quitz
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 529)
end

return entity
