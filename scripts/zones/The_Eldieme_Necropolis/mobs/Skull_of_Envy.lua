-----------------------------------
-- Area: The Eldieme Necropolis
-- NM: Skull of Envy
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 189)
    player:addTitle(invaderXim.title.SKULLCRUSHER)
end

return entity
