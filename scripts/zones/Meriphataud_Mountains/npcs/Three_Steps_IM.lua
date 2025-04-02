-----------------------------------
-- Area: Meriphataud Mountains
--  NPC: Three Steps, I.M.
-- Type: Border Conquest Guards
-- !pos -120.393 -25.822 -592.604 119
-----------------------------------
---@type TNpcEntity
local entity = {}

local guardNation = invaderXim.nation.BASTOK
local guardType   = invaderXim.conquest.guard.BORDER
local guardRegion = invaderXim.region.ARAGONEU
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
