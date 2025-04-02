-----------------------------------
-- Testing the Waters
-- Aht Uhrgan Mission 34
-----------------------------------
-- !addmission 4 33
-----------------------------------

local mission = Mission:new(invaderXim.mission.log_id.TOAU, invaderXim.mission.id.toau.TESTING_THE_WATERS)

mission.reward =
{
    keyItem     = invaderXim.ki.PERCIPIENT_EYE,
    title       = invaderXim.title.TREASURE_TROVE_TENDER,
    nextMission = { invaderXim.mission.log_id.TOAU, invaderXim.mission.id.toau.LEGACY_OF_THE_LOST },
}

mission.sections =
{
    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == mission.missionId
        end,

        [invaderXim.zone.ARRAPAGO_REEF] =
        {
            onTriggerAreaEnter =
            {
                [1] = function(player, triggerArea)
                    if player:hasKeyItem(invaderXim.ki.EPHRAMADIAN_GOLD_COIN) then
                        return mission:progressEvent(15)
                    end
                end,
            },

            onEventFinish =
            {
                [15] = function(player, csid, option, npc)
                    if option == 1 then
                        player:setMissionStatus(mission.areaId, 1)
                        player:setPos(-88.879, -7.318, -109.233, 173, 57)
                    end
                end,
            },
        },

        [invaderXim.zone.TALACCA_COVE] =
        {
            onZoneIn = function(player, prevZone)
                if player:getMissionStatus(mission.areaId) == 1 then
                    return 106
                end
            end,

            onEventFinish =
            {
                [106] = function(player, csid, option, npc)
                    if mission:complete(player) then
                        player:delKeyItem(invaderXim.ki.EPHRAMADIAN_GOLD_COIN)
                    end
                end,
            },
        },
    },
}

return mission
