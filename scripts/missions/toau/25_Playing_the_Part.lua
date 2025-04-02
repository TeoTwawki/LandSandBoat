-----------------------------------
-- Playing the Part
-- Aht Uhrgan Mission 25
-----------------------------------
-- !addmission 4 24
-- Naja Salaheem : !pos 22.700 -8.804 -45.591 50
-----------------------------------

local mission = Mission:new(invaderXim.mission.log_id.TOAU, invaderXim.mission.id.toau.PLAYING_THE_PART)

mission.reward =
{
    nextMission = { invaderXim.mission.log_id.TOAU, invaderXim.mission.id.toau.SEAL_OF_THE_SERPENT },
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
            ['Naja_Salaheem'] = mission:progressEvent(3110),

            onEventFinish =
            {
                [3110] = function(player, csid, option, npc)
                    mission:complete(player)
                end,
            },
        },
    },
}

return mission
