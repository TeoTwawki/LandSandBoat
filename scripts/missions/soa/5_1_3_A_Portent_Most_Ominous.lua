-----------------------------------
-- A Portent Most Ominous
-- Seekers of Adoulin M5-1-3
-----------------------------------
-- !addmission 12 111
-- Levil      : !pos -87.204 3.350 12.655 256
-- Aged Stump : !pos -27.233 -2 33.508 281
-----------------------------------

local mission = Mission:new(invaderXim.mission.log_id.SOA, invaderXim.mission.id.soa.A_PORTENT_MOST_OMINOUS)

mission.reward =
{
    keyItem     = { invaderXim.ki.SKY_BLUE_POME, invaderXim.ki.SUN_YELLOW_POME },
    nextMission = { invaderXim.mission.log_id.SOA, invaderXim.mission.id.soa.YGGDRASIL_BECKONS },
}

mission.sections =
{
    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == mission.missionId
        end,

        [invaderXim.zone.WESTERN_ADOULIN] =
        {
            ['Levil'] = mission:event(40, 256, 0, 256),
        },

        [invaderXim.zone.LEAFALLIA] =
        {
            ['Aged_Stump'] = mission:progressEvent(10, 281, 3447009, 1756, 0, 13991935, 5668390, 4095, 131184),

            onEventFinish =
            {
                [10] = function(player, csid, option, npc)
                    mission:complete(player)
                end,
            },
        },
    },
}

return mission
