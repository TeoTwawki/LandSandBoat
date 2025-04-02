-----------------------------------
-- Ragnarok
-- Aht Uhrgan Mission 45
-----------------------------------
-- !addmission 4 44
-----------------------------------

local mission = Mission:new(invaderXim.mission.log_id.TOAU, invaderXim.mission.id.toau.RAGNAROK)

mission.reward =
{
    title       = invaderXim.title.NASHMEIRAS_LOYALIST,
    nextMission = { invaderXim.mission.log_id.TOAU, invaderXim.mission.id.toau.IMPERIAL_CORONATION },
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
                [3] = function(player, triggerArea)
                    return mission:progressEvent(3139, { text_table = 0 })
                end,
            },

            onEventFinish =
            {
                [3139] = function(player, csid, option, npc)
                    mission:complete(player)
                end,
            },
        },
    },
}

return mission
