-----------------------------------
-- Area: West Ronfaure
--  NPC: Tottoto, W.W.
-- Type: Border Conquest Guards
-- !pos -560.292 -0.961 -576.655 100
-----------------------------------
---@type TNpcEntity
local entity = {}

local guardNation = invaderXim.nation.WINDURST
local guardType   = invaderXim.conquest.guard.BORDER
local guardRegion = invaderXim.region.RONFAURE
local guardEvent  = 32758

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
