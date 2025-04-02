-----------------------------------
-- Seal of the Serpent
-- Aht Uhrgan Mission 26
-----------------------------------
-- !addmission 4 25
-- Imperial Whitegate : !pos 152 -2 0 50
-----------------------------------

local mission = Mission:new(invaderXim.mission.log_id.TOAU, invaderXim.mission.id.toau.SEAL_OF_THE_SERPENT)

mission.reward =
{
    nextMission = { invaderXim.mission.log_id.TOAU, invaderXim.mission.id.toau.MISPLACED_NOBILITY },
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
                    if
                        player:getEquipID(invaderXim.slot.MAIN) == 0 and
                        player:getEquipID(invaderXim.slot.SUB) == 0
                    then
                        return mission:progressEvent(3111)
                    end
                end,
            },

            onEventFinish =
            {
                [3111] = function(player, csid, option, npc)
                    mission:complete(player)
                end,
            },
        },
    },
}

return mission
