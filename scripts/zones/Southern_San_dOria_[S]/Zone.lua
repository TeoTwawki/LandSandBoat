-----------------------------------
-- Zone: Southern_San_dOria_[S] (80)
-----------------------------------
local ID = zones[invaderXim.zone.SOUTHERN_SAN_DORIA_S]
-----------------------------------
---@type TZone
local zoneObject = {}

zoneObject.onInitialize = function(zone)
    invaderXim.chocobo.initZone(zone)
    invaderXim.extravaganza.shadowEraHide(ID.npc.SHIXO)
end

zoneObject.onZoneIn = function(player, prevZone)
    local cs = -1

    if prevZone == invaderXim.zone.EAST_RONFAURE_S then
        if
            player:getQuestStatus(invaderXim.questLog.CRYSTAL_WAR, invaderXim.quest.id.crystalWar.KNOT_QUITE_THERE) == invaderXim.questStatus.QUEST_ACCEPTED and
            player:getCharVar('KnotQuiteThere') == 2
        then
            cs = 62
        end
    end

    -- MOG HOUSE IXIMT
    if
        player:getXPos() == 0 and
        player:getYPos() == 0 and
        player:getZPos() == 0
    then
        player:setPos(161, -2, 161, 94)
    end

    return cs
end

zoneObject.onTriggerAreaEnter = function(player, triggerArea)
end

zoneObject.onEventUpdate = function(player, csid, option, npc)
end

zoneObject.onEventFinish = function(player, csid, option, npc)
    if csid == 62 then
        player:setCharVar('KnotQuiteThere', 3)
    end
end

return zoneObject
