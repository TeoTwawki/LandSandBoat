-----------------------------------
-- Kazham's Chieftainess
-- Zilart M3
-----------------------------------
-- !addmission 3 6
-- Gilgamesh        : !pos 122.452 -9.009 -12.052 252
-- Jakoh Wahcondalo : !pos 101 -16 -115 250
-----------------------------------

local mission = Mission:new(invaderXim.mission.log_id.ZILART, invaderXim.mission.id.zilart.KAZHAMS_CHIEFTAINESS)

mission.reward =
{
    keyItem     = invaderXim.ki.SACRIFICIAL_CHAMBER_KEY,
    nextMission = { invaderXim.mission.log_id.ZILART, invaderXim.mission.id.zilart.THE_TEMPLE_OF_UGGALEPIH },
}

mission.sections =
{
    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == mission.missionId
        end,

        [invaderXim.zone.NORG] =
        {
            ['Gilgamesh']  = mission:event(7),
        },

        [invaderXim.zone.KAZHAM] =
        {
            ['Jakoh_Wahcondalo'] = mission:progressEvent(114),

            onEventFinish =
            {
                [114] = function(player, csid, option, npc)
                    mission:complete(player)
                end,
            },
        },
    },
}

return mission
