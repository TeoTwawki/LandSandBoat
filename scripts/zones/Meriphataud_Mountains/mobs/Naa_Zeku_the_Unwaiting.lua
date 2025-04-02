-----------------------------------
-- Area: Meriphataud Mountains
--   NM: Naa Zeku the Unwaiting
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 271)
end

return entity
