-----------------------------------
-- Area: The Eldieme Necropolis
-- NM: Skull of Wrath
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 190)
    player:addTitle(invaderXim.title.SKULLCRUSHER)
end

return entity
