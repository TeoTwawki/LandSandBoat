-----------------------------------
-- Area: Arrapago Remnants
--   NM: Armored Chariot
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    player:addTitle(invaderXim.title.SUN_CHARIOTEER)
end

return entity
