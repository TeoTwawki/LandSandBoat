-----------------------------------
-- Area: Ordelle's Caves
--  NPC: Strange Apparatus
-- !pos -294 28 -100 193
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.strangeApparatus.onTrade(player, trade, 5)
end

entity.onTrigger = function(player, npc)
    invaderXim.strangeApparatus.onTrigger(player, 3)
end

entity.onEventUpdate = function(player, csid, option, npc)
    if csid == 3 then
        invaderXim.strangeApparatus.onEventUpdate(player, option)
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 5 then
        invaderXim.strangeApparatus.onEventFinish(player)
    end
end

return entity
