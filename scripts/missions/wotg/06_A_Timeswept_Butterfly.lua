-----------------------------------
-- A Timeswept Butterfly
-- Wings of the Goddess Mission 6
-----------------------------------
-- !addmission 5 5
-- JUGNER_FOREST_S : !zone 82
-- LA_VAULE_S       : !zone 85
-----------------------------------

local mission = Mission:new(invaderXim.mission.log_id.WOTG, invaderXim.mission.id.wotg.A_TIMESWEPT_BUTTERFLY)

mission.reward =
{
    nextMission = { invaderXim.mission.log_id.WOTG, invaderXim.mission.id.wotg.PURPLE_THE_NEW_BLACK },
}

mission.sections =
{
    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == mission.missionId
        end,

        [invaderXim.zone.LA_VAULE_S] =
        {
            onZoneIn = function(player, prevZone)
                if prevZone == invaderXim.zone.JUGNER_FOREST_S then
                    return 1
                end
            end,

            onEventFinish =
            {
                [1] = function(player, csid, option, npc)
                    mission:complete(player)
                end,
            },
        },
    },
}

return mission
