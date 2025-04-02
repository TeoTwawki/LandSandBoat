-----------------------------------
-- Area: Valkurm Dunes
--  NPC: Swirling Vortex
-- Entrance to Lufaise Meadows
-- !pos 420.057 0.000 -199.905 103
-----------------------------------
local ID = zones[invaderXim.zone.VALKURM_DUNES]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    if player:hasCompletedMission(invaderXim.mission.log_id.COP, invaderXim.mission.id.cop.THE_MOTHERCRYSTALS) then
        player:startEvent(12)
    else
        player:messageSpecial(ID.text.AN_EMPTY_LIGHT_SWIRLS)
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 12 and option == 1 then
        invaderXim.teleport.to(player, invaderXim.teleport.id.LUFAISE_VORTEX)
    end
end

return entity
