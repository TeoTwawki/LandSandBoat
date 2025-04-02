-----------------------------------
-- Area: West Sarutabaruta
--  NPC: Slow Axe, I.M.
-- Type: Border Conquest Guards
-- !pos 399.450 -25.858 727.545 115
-----------------------------------
---@type TNpcEntity
local entity = {}

local guardNation = invaderXim.nation.BASTOK
local guardType   = invaderXim.conquest.guard.BORDER
local guardRegion = invaderXim.region.SARUTABARUTA
local guardEvent  = 32760

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
