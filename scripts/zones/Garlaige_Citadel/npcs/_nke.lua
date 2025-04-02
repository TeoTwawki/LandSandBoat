-----------------------------------
-- Area: Garlaige Citadel
--  NPC: Strange Apparatus
-- !pos 255 0 19 200
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.strangeApparatus.onTrade(player, trade, 22)
end

entity.onTrigger = function(player, npc)
    invaderXim.strangeApparatus.onTrigger(player, 20)
end

entity.onEventUpdate = function(player, csid, option, npc)
    if csid == 20 then
        invaderXim.strangeApparatus.onEventUpdate(player, option)
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 22 then
        invaderXim.strangeApparatus.onEventFinish(player)
    end
end

return entity
