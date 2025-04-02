-----------------------------------
-- Whispers of Dawn
-- Wings of the Goddess Mission 47
-----------------------------------
-- !addmission 5 46
-- Veridical Conflux : !pos -142.279 -6.749 585.239 89
-----------------------------------

local mission = Mission:new(invaderXim.mission.log_id.WOTG, invaderXim.mission.id.wotg.WHISPERS_OF_DAWN)

mission.reward =
{
    nextMission = { invaderXim.mission.log_id.WOTG, invaderXim.mission.id.wotg.A_DREAMY_INTERLUDE },
}

mission.sections =
{
    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == mission.missionId
        end,

        [invaderXim.zone.GRAUBERG_S] =
        {
            ['Veridical_Conflux'] =
            {
                onTrigger = function(player, npc)
                    local hasWeapons = (player:getEquipID(invaderXim.slot.MAIN) ~= 0 or player:getEquipID(invaderXim.slot.SUB) ~= 0) and 1 or 0

                    return mission:progressEvent(26, 89, 23, 1756, 0, 0, 8323073, 0, hasWeapons)
                end,
            },

            onEventFinish =
            {
                [26] = function(player, csid, option, npc)
                    if option == 1 then
                        invaderXim.mission.setVar(player, invaderXim.mission.log_id.WOTG, invaderXim.mission.id.wotg.A_DREAMY_INTERLUDE, 'Timer', VanadielUniqueDay() + 1)
                        invaderXim.mission.setMustZone(player, invaderXim.mission.log_id.WOTG, invaderXim.mission.id.wotg.A_DREAMY_INTERLUDE)

                        mission:complete(player)
                    end
                end,
            },
        },

    },
}

return mission
