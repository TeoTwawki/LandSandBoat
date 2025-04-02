-----------------------------------
-- Beauty and the Beast
-- Seekers of Adoulin M3-5
-----------------------------------
-- !addmission 12 57
-- Ploh Trishbahk : !pos 100.580 -40.150 -63.830 257
-----------------------------------

local mission = Mission:new(invaderXim.mission.log_id.SOA, invaderXim.mission.id.soa.BEAUTY_AND_THE_BEAST)

mission.reward =
{
    keyItem     = invaderXim.ki.PRISTINE_HAIR_RIBBON,
    nextMission = { invaderXim.mission.log_id.SOA, invaderXim.mission.id.soa.WILDCAT_WITH_A_GOLD_PELT },
}

mission.sections =
{
    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == mission.missionId
        end,

        [invaderXim.zone.CEIZAK_BATTLEGROUNDS] =
        {
            ['Signs_of_a_Struggle'] = mission:progressEvent(21),

            onEventFinish =
            {
                [21] = function(player, csid, option, npc)
                    mission:complete(player)
                end,
            },
        },

        [invaderXim.zone.EASTERN_ADOULIN] =
        {
            ['Ploh_Trishbahk'] = mission:event(5063):importantOnce(),
        },

        [invaderXim.zone.WESTERN_ADOULIN] =
        {
            ['Levil'] = mission:event(143),
        },
    },
}

return mission
