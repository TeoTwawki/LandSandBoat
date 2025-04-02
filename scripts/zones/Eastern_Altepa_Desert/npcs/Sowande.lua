-----------------------------------
-- Area: Eastern Altepa Desert
--  NPC: Sowande
-- Type: Outpost Vendor
-- !pos -257 8 -249 114
-----------------------------------
---@type TNpcEntity
local entity = {}

local vendorRegion  = invaderXim.region.KUZOTZ
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
