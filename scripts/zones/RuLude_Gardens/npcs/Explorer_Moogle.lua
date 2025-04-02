-----------------------------------
-- Area: Ru'Lude Gardens
--  NPC: Explorer Moogle
-- Type: Mog Tablet
-- !pos -5.687 8.999 -41.341 243
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    invaderXim.mogTablet.moogleOnTrigger(player, npc)
end

entity.onEventUpdate = function(player, csid, option, npc)
    invaderXim.mogTablet.moogleOnEventUpdate(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.mogTablet.moogleOnEventFinish(player, csid, option, npc)
end

return entity
