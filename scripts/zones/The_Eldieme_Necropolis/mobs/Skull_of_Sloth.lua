-----------------------------------
-- Area: The Eldieme Necropolis
-- NM: Skull of Sloth
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 186)
    player:addTitle(invaderXim.title.SKULLCRUSHER)
end

return entity
