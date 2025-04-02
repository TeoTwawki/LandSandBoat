-----------------------------------
-- Area: The Eldieme Necropolis
-- NM: Skull of Greed
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 185)
    player:addTitle(invaderXim.title.SKULLCRUSHER)
end

return entity
