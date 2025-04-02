-----------------------------------
-- The Cursed Temple
-- Rhapsodies of Vana'diel Mission 2-24
-----------------------------------
-- !addmission 13 102
-- Granite Door (_4fx) : !pos 340 -1.899 331.656 159
-----------------------------------
local uggalepihID = zones[invaderXim.zone.TEMPLE_OF_UGGALEPIH]
-----------------------------------

local mission = Mission:new(invaderXim.mission.log_id.ROV, invaderXim.mission.id.rov.THE_CURSED_TEMPLE)

mission.reward =
{
    nextMission = { invaderXim.mission.log_id.ROV, invaderXim.mission.id.rov.WISDOM_OF_OUR_FOREFATHERS },
}

mission.sections =
{
    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == mission.missionId
        end,

        [invaderXim.zone.TEMPLE_OF_UGGALEPIH] =
        {
            ['_4fx'] =
            {
                onTrigger = function(player, npc)
                    if
                        player:hasCompletedMission(invaderXim.mission.log_id.ZILART, invaderXim.mission.id.zilart.THE_TEMPLE_OF_UGGALEPIH)
                    then
                        -- NOTE: The below parameters are based on full mission completion status, and will require additional captures
                        -- to determine the first and second parameter breakdown.

                        return mission:progressEvent(94, 1, 3, 340159, utils.MAX_UINT32 - 10, 323822, utils.MAX_UINT32 - 1813, 640938, 0)
                    else
                        -- NOTE: This is an intential fallthrough to default action.  onZoneIn event will also not occur
                        player:messageSpecial(uggalepihID.text.UNABLE_TO_PROGRESS_MISSION, 4)
                    end
                end,
            },

            onZoneIn = function(player, prevZone)
                -- NOTE: This event appears to only be played if the player has completed ZM4 prior to logging this mission.  On
                -- ZM4 complete, if this mission is active, the player will be moved to Wisdom of our Forefathers, where this
                -- is not present.

                if
                    player:hasCompletedMission(invaderXim.mission.log_id.ZILART, invaderXim.mission.id.zilart.THE_TEMPLE_OF_UGGALEPIH) and
                    mission:getVar(player, 'Status') == 0
                then
                    return 93
                end
            end,

            onEventFinish =
            {
                [93] = function(player, csid, option, npc)
                    mission:setVar(player, 'Status', 1)
                end,

                [94] = function(player, csid, option, npc)
                    mission:complete(player)

                    player:addMission(invaderXim.mission.log_id.ROV, invaderXim.mission.id.rov.WISDOM_OF_OUR_FOREFATHERS)
                    player:completeMission(invaderXim.mission.log_id.ROV, invaderXim.mission.id.rov.WISDOM_OF_OUR_FOREFATHERS)

                    player:addMission(invaderXim.mission.log_id.ROV, invaderXim.mission.id.rov.WHERE_DIVINITIES_COLLIDE)
                end,
            },
        },
    },
}

return mission
