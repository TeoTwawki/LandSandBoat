-----------------------------------
-- Aphmau's Light
-- Rhapsodies of Vana'diel Mission 2-7
-----------------------------------
-- !addmission 13 62
-----------------------------------

local mission = Mission:new(invaderXim.mission.log_id.ROV, invaderXim.mission.id.rov.FROM_THE_RUINS)

mission.reward =
{
    keyItem = invaderXim.ki.RHAPSODY_IN_CRIMSON,
    nextMission = { invaderXim.mission.log_id.ROV, invaderXim.mission.id.rov.CAUTERIZE },
}

mission.sections =
{
    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == mission.missionId
        end,

        [invaderXim.zone.AHT_URHGAN_WHITEGATE] =
        {
            ['Imperial_Whitegate'] =
            {
                onTrigger = function(player, npc)
                    -- NOTE: The first two event parameters adjust based on WotG progress.  Implementation will need to be
                    -- adjusted as more captures become available, and is limited at this time to what has been observed.

                    local param0 = 0
                    local param1 = player:hasCompletedMission(invaderXim.mission.log_id.WOTG, invaderXim.mission.id.wotg.THE_WILL_OF_THE_WORLD)

                    return mission:progressEvent(169, { [0] = param0, [1] = param1, text_table = 0 })
                end,
            },

            onEventFinish =
            {
                [169] = function(player, csid, option, npc)
                    mission:complete(player)
                end,
            },
        },
    },
}

return mission
