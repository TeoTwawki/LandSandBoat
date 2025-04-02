-----------------------------------
-- Stirrings of War
-- Aht Uhrgan Mission 38
-----------------------------------
-- !addmission 4 37
-----------------------------------

local mission = Mission:new(invaderXim.mission.log_id.TOAU, invaderXim.mission.id.toau.STIRRINGS_OF_WAR)

mission.reward =
{
    keyItem     = invaderXim.ki.ALLIED_COUNCIL_SUMMONS,
    nextMission = { invaderXim.mission.log_id.TOAU, invaderXim.mission.id.toau.ALLIED_RUMBLINGS },
}

mission.sections =
{
    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == mission.missionId and
                not mission:getMustZone(player) and
                VanadielUniqueDay() >= mission:getVar(player, 'Timer')
        end,

        [invaderXim.zone.AHT_URHGAN_WHITEGATE] =
        {
            onTriggerAreaEnter =
            {
                [5] = function(player, triggerArea)
                    return mission:progressEvent(3136, { text_table = 0 })
                end,
            },

            onEventFinish =
            {
                [3136] = function(player, csid, option, npc)
                    mission:complete(player)
                end,
            },
        },
    },
}

return mission
