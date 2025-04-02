-----------------------------------
-- Cait in the Woods
-- Wings of the Goddess Mission 49
-----------------------------------
-- !addmission 5 48
-- Blank (Cait Sith) : !pos 221.857 -49.213 176.24 81
-----------------------------------

local mission = Mission:new(invaderXim.mission.log_id.WOTG, invaderXim.mission.id.wotg.CAIT_IN_THE_WOODS)

mission.reward =
{
    keyItem     = invaderXim.ki.RONFAURE_DAWNDROP,
    nextMission = { invaderXim.mission.log_id.WOTG, invaderXim.mission.id.wotg.FORK_IN_THE_ROAD },
}

mission.sections =
{
    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == mission.missionId
        end,

        [invaderXim.zone.EAST_RONFAURE_S] =
        {
            ['blank_cait'] = mission:progressEvent(16, 81, 300, 200, 100, 0, 7405585, 0, 22292),

            onEventFinish =
            {
                [16] = function(player, csid, option, npc)
                    mission:complete(player)
                end,
            },
        },
    },
}

return mission
