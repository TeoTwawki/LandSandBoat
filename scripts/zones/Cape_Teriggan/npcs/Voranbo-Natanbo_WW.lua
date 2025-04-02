-----------------------------------
-- Area: Cape Teriggan
--  NPC: Voranbo-Natanbo, W.W.
-- Type: Outpost Conquest Guards
-- !pos -185 7 -63 113
-----------------------------------
---@type TNpcEntity
local entity = {}

local guardNation = invaderXim.nation.WINDURST
local guardType   = invaderXim.conquest.guard.OUTPOST
local guardRegion = invaderXim.region.VOLLBOW
local guardEvent  = 32759

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
