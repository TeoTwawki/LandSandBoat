-----------------------------------
-- The Temple of Desolation
-- Zilart M10
-----------------------------------
-- !addmission 3 20
-- Kamui : !pos 120.121 -8.009 -7.298 252
-- _6z0  : !pos 0 -12 48 251
-----------------------------------

local mission = Mission:new(invaderXim.mission.log_id.ZILART, invaderXim.mission.id.zilart.THE_TEMPLE_OF_DESOLATION)

mission.reward =
{
    title       = invaderXim.title.SEALER_OF_THE_PORTAL_OF_THE_GODS,
    nextMission = { invaderXim.mission.log_id.ZILART, invaderXim.mission.id.zilart.THE_HALL_OF_THE_GODS },
}

mission.sections =
{
    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == mission.missionId
        end,

        [invaderXim.zone.NORG] =
        {
            ['Gilgamesh'] = mission:event(10),
            ['Kamui']     = mission:event(11),
        },

        [invaderXim.zone.HALL_OF_THE_GODS] =
        {
            ['_6z0'] = mission:progressEvent(1),

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
