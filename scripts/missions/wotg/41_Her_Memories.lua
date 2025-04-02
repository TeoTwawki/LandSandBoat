-----------------------------------
-- Her Memories
-- Wings of the Goddess Mission 41
-----------------------------------
-- !addmission 5 40
-----------------------------------

local mission = Mission:new(invaderXim.mission.log_id.WOTG, invaderXim.mission.id.wotg.HER_MEMORIES)

mission.reward =
{
    nextMission = { invaderXim.mission.log_id.WOTG, invaderXim.mission.id.wotg.FORGET_ME_NOT },
}

mission.sections =
{
    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == mission.missionId
        end,

        -- NOTE: This mission is left intentionally blank at this time, as the entire mission logic
        -- is handled by subquests.  Completion of this mission is handled in
        -- invaderXim.wotg.helpers.checkMemoryFragments
    },
}

return mission
