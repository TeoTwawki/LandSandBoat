-----------------------------------
-- Area: Pashhow Marshlands
--  NPC: Ioupie, R.K.
-- Type: Border Conquest Guards
-- !pos 536.291 23.517 694.063 109
-----------------------------------
---@type TNpcEntity
local entity = {}

local guardNation = invaderXim.nation.SANDORIA
local guardType   = invaderXim.conquest.guard.BORDER
local guardRegion = invaderXim.region.DERFLAND
local guardEvent  = 32762

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
