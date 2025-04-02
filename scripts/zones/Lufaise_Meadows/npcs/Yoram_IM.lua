-----------------------------------
-- Area: Lufaise Meadows
--  NPC: Yoram, I.M.
-- Outpost Conquest Guards
-- !pos -542.418 -7.124 -53.521 24
-----------------------------------
---@type TNpcEntity
local entity = {}

local guardNation = invaderXim.nation.BASTOK
local guardType   = invaderXim.conquest.guard.OUTPOST
local guardRegion = invaderXim.region.TAVNAZIANARCH
local guardEvent  = 32761

entity.onTrade = function(player, npc, trade)
    invaderXim.conquest.overseerOnTrade(player, npc, trade, guardNation, guardType)
end

entity.onTrigger = function(player, npc)
    invaderXim.conquest.overseerOnTrigger(player, npc, guardNation, guardType, guardEvent, guardRegion)
end

entity.onEventUpdate = function(player, csid, option, npc)
    invaderXim.conquest.overseerOnEventUpdate(player, csid, option, guardNation)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.conquest.overseerOnEventFinish(player, csid, option, guardNation, guardType, guardRegion)
end

return entity
