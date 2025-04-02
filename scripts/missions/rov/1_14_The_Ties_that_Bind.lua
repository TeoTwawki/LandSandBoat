-----------------------------------
-- The Ties that Bind
-- Rhapsodies of Vana'diel Mission 1-14
-----------------------------------
-- !addmission 13 32
-- qm7 : !pos 110.909 -0.095 -6.851 176
-----------------------------------

local mission = Mission:new(invaderXim.mission.log_id.ROV, invaderXim.mission.id.rov.THE_TIES_THAT_BIND)

mission.reward =
{
    nextMission = { invaderXim.mission.log_id.ROV, invaderXim.mission.id.rov.IMPURITY },
}

mission.sections =
{
    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == mission.missionId
        end,

        [invaderXim.zone.SEA_SERPENT_GROTTO] =
        {
            ['qm7'] = mission:progressEvent(34),

            onEventFinish =
            {
                [34] = function(player, csid, option, npc)
                    mission:complete(player)
                end,
            },
        },
    },
}

return mission
