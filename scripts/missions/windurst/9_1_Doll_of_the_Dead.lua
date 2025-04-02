-----------------------------------
-- Doll of the Dead
-- Windurst M9-1
-----------------------------------
-- !addmission 2 22
-- Rakoh Buuma       : !pos 106 -5 -23 241
-- Mokyokyo          : !pos -55 -8 227 238
-- Janshura-Rashura  : !pos -227 -8 184 240
-- Zokima-Rokima     : !pos 0 -16 124 239
-- Apururu           : !pos -11 -2 13 241
-- Yoran-Oran        : !pos -109.987 -14 203.338 239
-- Mandragora Warden : !pos 81.981 7.593 139.556 153
-----------------------------------
local boyahdaTreeID   = zones[invaderXim.zone.THE_BOYAHDA_TREE]
local windurstWoodsID = zones[invaderXim.zone.WINDURST_WOODS]
-----------------------------------

local mission = Mission:new(invaderXim.mission.log_id.WINDURST, invaderXim.mission.id.windurst.DOLL_OF_THE_DEAD)

mission.reward =
{
    title      = invaderXim.title.GUIDING_STAR,
    rankPoints = 800,
}

local handleAcceptMission = function(player, csid, option, npc)
    if option == 22 then
        mission:begin(player)
        player:messageSpecial(zones[player:getZoneID()].text.YOU_ACCEPT_THE_MISSION)
    end
end

mission.sections =
{
    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == invaderXim.mission.id.nation.NONE and
                player:getNation() == mission.areaId
        end,

        [invaderXim.zone.PORT_WINDURST] =
        {
            onEventFinish =
            {
                [78] = handleAcceptMission,
            },
        },

        [invaderXim.zone.WINDURST_WALLS] =
        {
            onEventFinish =
            {
                [93] = handleAcceptMission,
            },
        },

        [invaderXim.zone.WINDURST_WATERS] =
        {
            onEventFinish =
            {
                [111] = handleAcceptMission,
            },
        },

        [invaderXim.zone.WINDURST_WOODS] =
        {
            onEventFinish =
            {
                [114] = handleAcceptMission,
            },
        },
    },

    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == mission.missionId
        end,

        [invaderXim.zone.FULL_MOON_FOUNTAIN] =
        {
            onZoneIn = function(player, prevZone)
                if player:getMissionStatus(mission.areaId) == 7 then
                    return 61
                end
            end,

            onEventFinish =
            {
                [61] = function(player, csid, option, npc)
                    mission:complete(player)
                end,
            },
        },

        [invaderXim.zone.HEAVENS_TOWER] =
        {
            -- TODO: Kupipi, Zubaba, and other guards around Star Sybil's Chamber are missing dialogue
            ['_6q2'] =
            {
                onTrigger = function(player, npc)
                    if player:getMissionStatus(mission.areaId) == 2 then
                        return mission:progressEvent(362)
                    end
                end,
            },

            onZoneIn = function(player, prevZone)
                if player:getMissionStatus(mission.areaId) == 1 then
                    return 335
                end
            end,

            onEventFinish =
            {
                [335] = function(player, csid, option, npc)
                    player:setMissionStatus(mission.areaId, 2)
                end,

                [362] = function(player, csid, option, npc)
                    player:setMissionStatus(mission.areaId, 3)
                end,
            },
        },

        [invaderXim.zone.THE_BOYAHDA_TREE] =
        {
            ['Mandragora_Warden'] =
            {
                onTrade = function(player, npc, trade)
                    local missionStatus = player:getMissionStatus(mission.areaId)

                    if
                        (missionStatus == 4 or missionStatus == 5) and
                        npcUtil.tradeHasExactly(trade, invaderXim.item.CLUMP_OF_GOOBBUE_HUMUS)
                    then
                        return mission:progressEvent(13)
                    end
                end,

                onTrigger = function(player, npc)
                    local missionStatus = player:getMissionStatus(mission.areaId)

                    if missionStatus == 4 or missionStatus == 5 then
                        player:messageText(npc, boyahdaTreeID.text.WARDEN_SPEECH)
                        return mission:messageSpecial(boyahdaTreeID.text.WARDEN_TRANSLATION)
                    end
                end,
            },

            onEventFinish =
            {
                [13] = function(player, csid, option, npc)
                    player:setMissionStatus(mission.areaId, 6)
                    npcUtil.giveKeyItem(player, invaderXim.ki.LETTER_FROM_ZONPA_ZIPPA)
                end,
            },
        },

        [invaderXim.zone.WINDURST_WALLS] =
        {
            ['Yoran-Oran'] =
            {
                onTrigger = function(player, npc)
                    if player:getMissionStatus(mission.areaId) == 4 then
                        return mission:progressEvent(439, 0, invaderXim.item.JUG_OF_HUMUS, invaderXim.item.CLUMP_OF_GOOBBUE_HUMUS)
                    end
                end,
            },

            onEventFinish =
            {
                [439] = function(player, csid, option, npc)
                    player:setMissionStatus(mission.areaId, 5)
                end,
            },
        },

        [invaderXim.zone.WINDURST_WOODS] =
        {
            ['Apururu'] =
            {
                onTrigger = function(player, npc)
                    local missionStatus = player:getMissionStatus(mission.areaId)

                    if missionStatus == 0 then
                        return mission:progressEvent(619)
                    elseif missionStatus == 3 then
                        return mission:progressEvent(620)
                    elseif missionStatus == 6 then
                        return mission:progressEvent(621)
                    end
                end,
            },

            onEventFinish =
            {
                [619] = function(player, csid, option, npc)
                    player:setMissionStatus(mission.areaId, 1)
                end,

                [620] = function(player, csid, option, npc)
                    player:setMissionStatus(mission.areaId, 4)
                end,

                [621] = function(player, csid, option, npc)
                    player:setMissionStatus(mission.areaId, 7)
                    player:messageSpecial(windurstWoodsID.text.KEYITEM_LOST, invaderXim.ki.LETTER_FROM_ZONPA_ZIPPA)
                    player:delKeyItem(invaderXim.ki.LETTER_FROM_ZONPA_ZIPPA)
                end,
            },
        },
    },
}

return mission
