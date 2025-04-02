-----------------------------------
-- Reunited
-- Rhapsodies of Vana'diel Mission 2-7
-----------------------------------
-- !addmission 13 64
-----------------------------------

local mission = Mission:new(invaderXim.mission.log_id.ROV, invaderXim.mission.id.rov.REUNITED)

mission.reward =
{
    nextMission = { invaderXim.mission.log_id.ROV, invaderXim.mission.id.rov.TAKE_WING },
}

mission.sections =
{
    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == mission.missionId
        end,

        [invaderXim.zone.AHT_URHGAN_WHITEGATE] =
        {
            ['Nadeey'] = mission:progressEvent(167, { [0] = invaderXim.besieged.getAstralCandescence(), text_table = 0 }),

            onEventFinish =
            {
                [167] = function(player, csid, option, npc)
                    mission:complete(player)
                end,
            },
        },
    },
}

return mission
