-----------------------------------
-- Token of Troth
-- Wings of the Goddess Mission 53
-----------------------------------
-- !addmission 5 52
-- Bulwark Gate : !pos -447.174 -1.831 342.417 98
-----------------------------------

local mission = Mission:new(invaderXim.mission.log_id.WOTG, invaderXim.mission.id.wotg.A_TOKEN_OF_TROTH)

mission.reward =
{
    nextMission = { invaderXim.mission.log_id.WOTG, invaderXim.mission.id.wotg.LEST_WE_FORGET },
}

mission.sections =
{
    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == mission.missionId
        end,

        [invaderXim.zone.SAUROMUGUE_CHAMPAIGN_S] =
        {
            ['Bulwark_Gate'] =
            {
                onTrigger = function(player, npc)
                    if
                        player:getEquipID(invaderXim.slot.MAIN) ~= 0 or
                        player:getEquipID(invaderXim.slot.SUB) ~= 0
                    then
                        return mission:event(117, 0, 23, 1756, 0, 0, 0, 1, 1)
                    elseif mission:getVar(player, 'Status') == 0 then
                        return mission:progressEvent(115, 98, 5, 1756, 0, 0, 1, 0)
                    else
                        return mission:progressEvent(116, 98, 5, 1756, 0, 0, 0, 1, 0)
                    end
                end,
            },

            onEventFinish =
            {
                [115] = function(player, csid, option, npc)
                    mission:setVar(player, 'Status', 1)
                end,

                [116] = function(player, csid, option, npc)
                    if mission:complete(player) then
                        player:delKeyItem(invaderXim.ki.WEDDING_INVITATION)

                        -- NOTE: To prevent forever charvars, this status is reset to 0 upon claiming a moonshade
                        -- earring reward.
                        invaderXim.mission.setVar(player, invaderXim.mission.log_id.WOTG, invaderXim.mission.id.wotg.LEST_WE_FORGET, 'Status', 1)
                    end
                end,
            },
        },
    },
}

return mission
