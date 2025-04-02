-----------------------------------
-- Area: Jugner Forest
--  NPC: Mionie
-- Type: Outpost Vendor
-- !pos 54 0 -11 104
-----------------------------------
---@type TNpcEntity
local entity = {}

local vendorRegion  = invaderXim.region.NORVALLEN
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
