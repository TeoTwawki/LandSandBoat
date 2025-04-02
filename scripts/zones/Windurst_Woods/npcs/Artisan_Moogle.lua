-----------------------------------
-- Area: Windurst Woods
--  NPC: Artisan Moogle
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    invaderXim.artisan.moogleOnTrigger(player, npc)
end

entity.onEventUpdate = function(player, csid, option, npc)
    invaderXim.artisan.moogleOnUpdate(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.artisan.moogleOnFinish(player, csid, option, npc)
end

return entity
