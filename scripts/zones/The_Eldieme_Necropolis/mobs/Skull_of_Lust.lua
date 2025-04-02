-----------------------------------
-- Area: The Eldieme Necropolis
-- NM: Skull of Lust
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 187)
    player:addTitle(invaderXim.title.SKULLCRUSHER)
end

return entity
