-----------------------------------
-- Allied Rumblings
-- Aht Uhrgan Mission 39
-----------------------------------
-- !addmission 4 38
-----------------------------------

local mission = Mission:new(invaderXim.mission.log_id.TOAU, invaderXim.mission.id.toau.ALLIED_RUMBLINGS)

mission.reward =
{
    nextMission = { invaderXim.mission.log_id.TOAU, invaderXim.mission.id.toau.UNRAVELING_REASON },
}

mission.sections =
{
    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == mission.missionId
        end,

        [invaderXim.zone.RULUDE_GARDENS] =
        {
            onTriggerAreaEnter =
            {
                [1] = function(player, triggerArea)
                    return mission:progressEvent(10097)
                end,
            },

            onEventFinish =
            {
                [10097] = function(player, csid, option, npc)
                    mission:complete(player)
                end,
            },
        },
    },
}

return mission
