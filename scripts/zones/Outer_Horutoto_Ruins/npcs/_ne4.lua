-----------------------------------
-- Area: Outer Horutoto Ruins
--  NPC: Strange Apparatus
-- !pos -574 0 739 194
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.strangeApparatus.onTrade(player, trade, 66)
end

entity.onTrigger = function(player, npc)
    invaderXim.strangeApparatus.onTrigger(player, 64)
end

entity.onEventUpdate = function(player, csid, option, npc)
    if csid == 64 then
        invaderXim.strangeApparatus.onEventUpdate(player, option)
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 66 then
        invaderXim.strangeApparatus.onEventFinish(player)
    end
end

return entity
