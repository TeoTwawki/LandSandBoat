-----------------------------------
-- Area: The Eldieme Necropolis
--  Mob: Lich C Magnus
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    player:addTitle(invaderXim.title.LICH_BANISHER)
end

return entity
