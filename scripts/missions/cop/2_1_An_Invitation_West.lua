-----------------------------------
-- An Invitation West
-- Promathia 2-1
-----------------------------------
-- !addmission 6 138
-----------------------------------
local lufaiseID = zones[invaderXim.zone.LUFAISE_MEADOWS]
-----------------------------------

local mission = Mission:new(invaderXim.mission.log_id.COP, invaderXim.mission.id.cop.AN_INVITATION_WEST)

mission.reward =
{
    title       = invaderXim.title.DEAD_BODY,
    nextMission = { invaderXim.mission.log_id.COP, invaderXim.mission.id.cop.THE_LOST_CITY },
}

mission.sections =
{
    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == mission.missionId
        end,

        [invaderXim.zone.LUFAISE_MEADOWS] =
        {
            onZoneIn = function(player, prevZone)
                if mission:getVar(player, 'Status') == 0 then
                    return 110
                end
            end,

            onEventFinish =
            {
                [110] = function(player, csid, option, npc)
                    player:messageSpecial(lufaiseID.text.KI_STOLEN, 0, invaderXim.ki.MYSTERIOUS_AMULET)
                    player:delKeyItem(invaderXim.ki.MYSTERIOUS_AMULET)
                    mission:setVar(player, 'Status', 1)
                end,
            },
        },

        [invaderXim.zone.TAVNAZIAN_SAFEHOLD] =
        {
            onZoneIn = function(player, prevZone)
                if mission:getVar(player, 'Status') == 1 then
                    return 101
                end
            end,

            onEventFinish =
            {
                [101] = function(player, csid, option, npc)
                    mission:complete(player)
                end,
            },
        },
    },
}

return mission
