-----------------------------------
-- Area: North Gustaberg
--  NPC: Ennigreaud, R.K.
-- Type: Outpost Conquest Guards
-- !pos -584.687 39.107 54.281 106
-----------------------------------
---@type TNpcEntity
local entity = {}

local guardNation = invaderXim.nation.SANDORIA
local guardType   = invaderXim.conquest.guard.OUTPOST
local guardRegion = invaderXim.region.GUSTABERG
local guardEvent  = 32763

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
