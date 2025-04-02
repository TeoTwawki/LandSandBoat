-----------------------------------
-- Area: Yhoator Jungle
--  NPC: Mugha Dovajaiho
-- Type: Outpost Vendor
-- !pos 202 0 -82 124
-----------------------------------
---@type TNpcEntity
local entity = {}

local vendorRegion  = invaderXim.region.ELSHIMOUPLANDS
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
