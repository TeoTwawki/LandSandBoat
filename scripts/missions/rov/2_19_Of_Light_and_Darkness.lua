-----------------------------------
-- Of Light and Darkness
-- Rhapsodies of Vana'diel Mission 2-19
-----------------------------------
-- !addmission 13 92
-- Oaken Door : !pos 97 -7 -12 252
-----------------------------------

local mission = Mission:new(invaderXim.mission.log_id.ROV, invaderXim.mission.id.rov.OF_LIGHT_AND_DARKNESS)

mission.reward =
{
    nextMission = { invaderXim.mission.log_id.ROV, invaderXim.mission.id.rov.TEMPORARY_FAREWELLS },
}

mission.sections =
{
    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == mission.missionId
        end,

        [invaderXim.zone.NORG] =
        {
            -- NOTE: No observed impact between minimal requirements vs fully completed for
            -- the below event.

            ['_700'] = mission:progressEvent(285),

            onEventFinish =
            {
                [285] = function(player, csid, option, npc)
                    mission:complete(player)
                end,
            },
        },
    },
}

return mission
