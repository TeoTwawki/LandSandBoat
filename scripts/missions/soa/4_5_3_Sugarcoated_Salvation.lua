-----------------------------------
-- Sugarcoated Salvation
-- Seekers of Adoulin M4-5-3
-----------------------------------
-- !addmission 12 102
-- Levil          : !pos -87.204 3.350 12.655 256
-- Andreine       : !pos -91.944 -2.14 -91.538 284
-- Ploh Trishbahk : !pos 100.580 -40.150 -63.830 257
-----------------------------------
local easternAdoulinID = zones[invaderXim.zone.EASTERN_ADOULIN]
-----------------------------------

local mission = Mission:new(invaderXim.mission.log_id.SOA, invaderXim.mission.id.soa.SUGARCOATED_SALVATION)

mission.reward =
{
    keyItem     = invaderXim.ki.SEPULCHER_ENSIGN,
    nextMission = { invaderXim.mission.log_id.SOA, invaderXim.mission.id.soa.ARCIELAS_RESOLVE },
}

mission.sections =
{
    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == mission.missionId
        end,

        [invaderXim.zone.WESTERN_ADOULIN] =
        {
            ['Levil'] = mission:event(40, 256, 0, 255, 0, 0, 26018, 4095, 4),
        },

        [invaderXim.zone.CELENNIA_MEMORIAL_LIBRARY] =
        {
            ['Andreine'] = mission:event(8, 284, 1316886, 2963, 28635, 0, 0, 0, 0),
        },

        [invaderXim.zone.EASTERN_ADOULIN] =
        {
            ['Ploh_Trishbahk'] = mission:progressEvent(1537, 257, utils.MAX_UINT32, 255, 0, 66977790, 8338494, 4095, 0),

            onEventFinish =
            {
                [1537] = function(player, csid, option, npc)
                    player:delKeyItem(invaderXim.ki.SUFFERING_SACCHARIFEROUS)
                    player:messageSpecial(easternAdoulinID.text.LOST_KEYITEM, invaderXim.ki.SUFFERING_SACCHARIFEROUS)
                    mission:complete(player)
                end,
            },
        },
    },
}

return mission
