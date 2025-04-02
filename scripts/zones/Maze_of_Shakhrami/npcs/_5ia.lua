-----------------------------------
-- Area: Maze of Shakhrami
--  NPC: Strange Apparatus
-- !pos 375 20 -259 198
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.strangeApparatus.onTrade(player, trade, 55)
end

entity.onTrigger = function(player, npc)
    invaderXim.strangeApparatus.onTrigger(player, 53)
end

entity.onEventUpdate = function(player, csid, option, npc)
    if csid == 53 then
        invaderXim.strangeApparatus.onEventUpdate(player, option)
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 55 then
        invaderXim.strangeApparatus.onEventFinish(player)
    end
end

return entity
