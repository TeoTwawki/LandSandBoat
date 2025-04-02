-----------------------------------
-- Take Wing
-- Rhapsodies of Vana'diel Mission 2-7
-----------------------------------
-- !addmission 13 66
-----------------------------------

local mission = Mission:new(invaderXim.mission.log_id.ROV, invaderXim.mission.id.rov.TAKE_WING)

mission.reward =
{
    nextMission = { invaderXim.mission.log_id.ROV, invaderXim.mission.id.rov.PRIME_NUMBER },
}

mission.sections =
{
    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == mission.missionId
        end,

        [invaderXim.zone.AHT_URHGAN_WHITEGATE] =
        {
            onTriggerAreaEnter =
            {
                [5] = function(player, triggerArea)
                    local hasCompletedPath = player:hasCompletedMission(invaderXim.mission.log_id.COP, invaderXim.mission.id.cop.THE_WARRIORS_PATH) and 1 or 0

                    return mission:progressEvent(168, { [0] = hasCompletedPath, text_table = 0 })
                end,
            },

            onEventFinish =
            {
                [168] = function(player, csid, option, npc)
                    mission:complete(player)
                end,
            },
        },
    },
}

return mission
