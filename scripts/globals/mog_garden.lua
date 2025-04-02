-----------------------------------
-- Mog Garden Global
-----------------------------------
require('scripts/globals/utils')
local ID = zones[invaderXim.zone.MOG_GARDEN]
-----------------------------------
xi = xi or {}
invaderXim.mog_garden = invaderXim.mog_garden or {}

invaderXim.mog_garden.onInitialize = function(zone)
    -- Hide all NPCs by default
    local npcs = zone:getNPCs()
    if next(npcs) ~= nil then -- Check to see if table is empty
        for _, npc in ipairs(npcs) do
            npc:setStatus(invaderXim.status.DISAPPEAR)
        end

        -- Un-hide default NPCS
        GetNPCByID(ID.npc.GREEN_THUMB_MOOGLE):setStatus(invaderXim.status.NORMAL)
        GetNPCByID(ID.npc.MOG_DINGHY):setStatus(invaderXim.status.NORMAL)
        GetNPCByID(ID.npc.PORTER_MOOGLE):setStatus(invaderXim.status.NORMAL)
    end
end

invaderXim.mog_garden.onZoneIn = function(player, prevZone)
    -- TODO: Announcement about GPS Crystals etc.
    -- TODO: System to un-hide specific NPCs for specific players
end

invaderXim.mog_garden.onTriggerAreaEnter = function(player, triggerArea)
end

invaderXim.mog_garden.onEventUpdate = function(player, csid, option, npc)
end

invaderXim.mog_garden.onEventFinish = function(player, csid, option, npc)
end
