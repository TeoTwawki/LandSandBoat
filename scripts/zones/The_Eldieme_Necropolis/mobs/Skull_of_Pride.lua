-----------------------------------
-- Area: The Eldieme Necropolis
-- NM: Skull of Pride
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 188)
    player:addTitle(invaderXim.title.SKULLCRUSHER)
end

return entity
