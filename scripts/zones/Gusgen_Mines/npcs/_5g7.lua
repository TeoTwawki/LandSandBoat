-----------------------------------
-- Area: Gusgen Mines
--  NPC: Strange Apparatus
-- !pos 219 -39 255 196
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.strangeApparatus.onTrade(player, trade, 2)
end

entity.onTrigger = function(player, npc)
    invaderXim.strangeApparatus.onTrigger(player, 0)
end

entity.onEventUpdate = function(player, csid, option, npc)
    if csid == 0 then
        invaderXim.strangeApparatus.onEventUpdate(player, option)
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 2 then
        invaderXim.strangeApparatus.onEventFinish(player)
    end
end

return entity
