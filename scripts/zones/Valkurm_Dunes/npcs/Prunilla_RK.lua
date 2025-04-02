-----------------------------------
-- Area: Valkurm Dunes
--  NPC: Prunilla, R.K.
-- Type: Border Conquest Guards
-- !pos 908.245 -1.171 -411.504 103
-----------------------------------
---@type TNpcEntity
local entity = {}

local guardNation = invaderXim.nation.SANDORIA
local guardType   = invaderXim.conquest.guard.BORDER
local guardRegion = invaderXim.region.ZULKHEIM
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
