-----------------------------------
-- Brushing Up
-- Rhapsodies of Vana'diel Mission 2-21
-----------------------------------
-- !addmission 13 96
-- qm_rov2_20 : !pos -44.741 -23.753 568.504 25
-----------------------------------

local mission = Mission:new(invaderXim.mission.log_id.ROV, invaderXim.mission.id.rov.BRUSHING_UP)

mission.reward =
{
    nextMission = { invaderXim.mission.log_id.ROV, invaderXim.mission.id.rov.KEEP_ON_GIVING },
}

mission.sections =
{
    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == mission.missionId
        end,

        [invaderXim.zone.MISAREAUX_COAST] =
        {
            -- NOTE: No observed impact between minimal requirements vs fully completed for
            -- the below event.

            ['qm_rov2_20'] = mission:progressEvent(16, 25),

            onEventFinish =
            {
                [16] = function(player, csid, option, npc)
                    if option ~= 0 then
                        mission:complete(player)
                        invaderXim.mission.setVar(player, invaderXim.mission.log_id.ROV, invaderXim.mission.id.rov.KEEP_ON_GIVING, 'Option', option - 1)
                    end
                end,
            },
        },
    },
}

return mission
