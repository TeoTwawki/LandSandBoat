-----------------------------------
-- Area: The Eldieme Necropolis
--  NPC: Strange Apparatus
-- !pos 104 0 -179 195
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.strangeApparatus.onTrade(player, trade, 3)
end

entity.onTrigger = function(player, npc)
    invaderXim.strangeApparatus.onTrigger(player, 1)
end

entity.onEventUpdate = function(player, csid, option, npc)
    if csid == 1 then
        invaderXim.strangeApparatus.onEventUpdate(player, option)
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 3 then
        invaderXim.strangeApparatus.onEventFinish(player)
    end
end

return entity
