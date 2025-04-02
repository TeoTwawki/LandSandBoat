-----------------------------------
-- Undersea Scouting
-- Aht Uhrgan Mission 9
-----------------------------------
-- !addmission 4 8
-- Naja Salaheem : !pos 22.700 -8.804 -45.591 50
-----------------------------------

local mission = Mission:new(invaderXim.mission.log_id.TOAU, invaderXim.mission.id.toau.UNDERSEA_SCOUTING)

mission.reward =
{
    keyItem     = invaderXim.ki.ASTRAL_COMPASS,
    nextMission = { invaderXim.mission.log_id.TOAU, invaderXim.mission.id.toau.ASTRAL_WAVES },
}

mission.sections =
{
    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == mission.missionId
        end,

        [invaderXim.zone.AHT_URHGAN_WHITEGATE] =
        {
            ['Naja_Salaheem'] = mission:progressEvent(3051, { text_table = 0 })
        },

        [invaderXim.zone.ALZADAAL_UNDERSEA_RUINS] =
        {
            onTriggerAreaEnter =
            {
                [23] = function(player, triggerArea)
                    return mission:progressEvent(1, invaderXim.besieged.getMercenaryRank(player))
                end,
            },

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
