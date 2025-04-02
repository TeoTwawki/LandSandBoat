-----------------------------------
-- Area: Alzadaal Undersea Ruins
--  NPC: Runic Portal
-- Arrapago Reef Teleporter Back to Aht Urhgan Whitegate
-- !pos 206.500 -1.220 33.500 72
-- !pos 206.500 -1.220 6.500 72
-----------------------------------
local ID = zones[invaderXim.zone.ALZADAAL_UNDERSEA_RUINS]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local npcid = npc:getID()
    local event = nil

    if
        player:getCurrentMission(invaderXim.mission.log_id.TOAU) >= invaderXim.mission.id.toau.IMMORTAL_SENTRIES and
        not player:hasKeyItem(invaderXim.ki.SUPPLIES_PACKAGE)
    then
        if invaderXim.besieged.hasRunicPortal(player, invaderXim.teleport.runic_portal.NYZUL) then
            event = npcid == ID.npc.RUNIC_PORTAL_OFFSET and 117 or 118
        else
            event = npcid == ID.npc.RUNIC_PORTAL_OFFSET and 121 or 122
        end
    else
        player:messageSpecial(ID.text.RESPONSE)
    end

    if event then
        player:startEvent(event)
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if option == 1 then
        if csid == 121 or csid == 122 then
            invaderXim.besieged.addRunicPortal(player, invaderXim.teleport.runic_portal.NYZUL)
        end

        invaderXim.teleport.toChamberOfPassage(player)
    end
end

return entity
