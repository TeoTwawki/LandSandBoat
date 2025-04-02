-----------------------------------
-- Bastion of Knowledge
-- Aht Uhrgan Mission 28
-----------------------------------
-- !addmission 4 27
-----------------------------------

local mission = Mission:new(invaderXim.mission.log_id.TOAU, invaderXim.mission.id.toau.BASTION_OF_KNOWLEDGE)

mission.reward =
{
    title       = invaderXim.title.APHMAUS_MERCENARY,
    nextMission = { invaderXim.mission.log_id.TOAU, invaderXim.mission.id.toau.PUPPET_IN_PERIL },
}

mission.sections =
{
    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == mission.missionId
        end,

        [invaderXim.zone.AHT_URHGAN_WHITEGATE] =
        {
            onTriggerAreaEnter =
            {
                [4] = function(player, triggerArea)
                    return mission:progressEvent(3112)
                end,
            },

            onEventFinish =
            {
                [3112] = function(player, csid, option, npc)
                    mission:complete(player)
                end,
            },
        },
    },
}

return mission
