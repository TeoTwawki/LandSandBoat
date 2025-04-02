-----------------------------------
-- Area: Meriphataud Mountains
--  NPC: Donmo-Boronmo, W.W.
-- Type: Outpost Conquest Guards
-- !pos -294.470 15.806 420.117 119
-----------------------------------
---@type TNpcEntity
local entity = {}

local guardNation = invaderXim.nation.WINDURST
local guardType   = invaderXim.conquest.guard.OUTPOST
local guardRegion = invaderXim.region.ARAGONEU
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
