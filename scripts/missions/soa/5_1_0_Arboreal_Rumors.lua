-----------------------------------
-- Arboreal Rumors
-- Seekers of Adoulin M5-1
-----------------------------------
-- !addmission 12 108
-- Levil           : !pos -87.204 3.350 12.655 256
-- Ploh Trishbahk  : !pos 100.580 -40.150 -63.830 257
-----------------------------------

local mission = Mission:new(invaderXim.mission.log_id.SOA, invaderXim.mission.id.soa.ARBOREAL_RUMORS)

mission.reward =
{
    keyItem     = invaderXim.ki.HASTILY_SCRIBBLED_NOTE,
    nextMission = { invaderXim.mission.log_id.SOA, invaderXim.mission.id.soa.ARCIELAS_MISSIVE },
}

mission.sections =
{
    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == mission.missionId
        end,

        [invaderXim.zone.WESTERN_ADOULIN] =
        {
            ['Levil'] = mission:event(183, 256, 0, 3, 0, 67108863, 2811819, 4095, 4),
        },

        [invaderXim.zone.EASTERN_ADOULIN] =
        {
            ['Ploh_Trishbahk'] = mission:progressEvent(1539, 257, 8),

            onEventFinish =
            {
                [1539] = function(player, csid, option, npc)
                    mission:complete(player)
                end,
            },
        },
    },
}

return mission
