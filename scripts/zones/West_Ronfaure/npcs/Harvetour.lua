-----------------------------------
-- Area: West Ronfaure
--  NPC: Harvetour
-- Type: Outpost Vendor
-- !pos -448 -19 -214 100
-----------------------------------
---@type TNpcEntity
local entity = {}

local vendorRegion  = invaderXim.region.RONFAURE
local vendorEvent   = 32756

entity.onTrigger = function(player, npc)
    invaderXim.conquest.vendorOnTrigger(player, vendorRegion, vendorEvent)
end

entity.onEventUpdate = function(player, csid, option, npc)
    invaderXim.conquest.vendorOnEventUpdate(player, vendorRegion)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.conquest.vendorOnEventFinish(player, option, vendorRegion)
end

return entity
