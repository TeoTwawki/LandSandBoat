-----------------------------------
-- Passing Glory
-- Aht Uhrgan Mission 18
-----------------------------------
-- !addmission 4 17
-- Naja Salaheem : !pos 22.700 -8.804 -45.591 50
-----------------------------------

local mission = Mission:new(invaderXim.mission.log_id.TOAU, invaderXim.mission.id.toau.PASSING_GLORY)

mission.reward =
{
    nextMission = { invaderXim.mission.log_id.TOAU, invaderXim.mission.id.toau.SWEETS_FOR_THE_SOUL },
}

mission.sections =
{
    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == mission.missionId and
                not mission:getMustZone(player) and
                VanadielUniqueDay() >= mission:getVar(player, 'Timer')
        end,

        [invaderXim.zone.AHT_URHGAN_WHITEGATE] =
        {
            onTriggerAreaEnter =
            {
                [3] = function(player, triggerArea)
                    return mission:progressEvent(3090, { text_table = 0 })
                end,
            },

            onEventFinish =
            {
                [3090] = function(player, csid, option, npc)
                    -- TODO: Verify event update options from captures for this CS.
                    mission:complete(player)
                end,
            },
        },
    },
}

return mission
