-----------------------------------
-- Area: Eastern Altepa Desert
--   NM: Donnergugi
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 410)
end

return entity
