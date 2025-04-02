-----------------------------------
-- Area: The Eldieme Necropolis
-- NM: Skull of Gluttony
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 184)
    player:addTitle(invaderXim.title.SKULLCRUSHER)
end

return entity
