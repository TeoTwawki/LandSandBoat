-----------------------------------
-- Area: Lufaise Meadows
--  NPC: Jersey
-- Type: Outpost Vendor
-- !pos -548.706 -7.197 -53.897 24
-----------------------------------
---@type TNpcEntity
local entity = {}

local vendorRegion  = invaderXim.region.TAVNAZIANARCH
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
