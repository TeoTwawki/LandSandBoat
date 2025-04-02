-----------------------------------
-- Area: Buburimu Peninsula
--  NPC: Lobho Ukipturi
-- Type: Outpost Vendor
-- !pos -485 -31 50 118
-----------------------------------
---@type TNpcEntity
local entity = {}

local vendorRegion  = invaderXim.region.KOLSHUSHU
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
