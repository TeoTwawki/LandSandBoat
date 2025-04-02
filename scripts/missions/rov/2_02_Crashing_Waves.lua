-----------------------------------
-- Crashing Waves
-- Rhapsodies of Vana'diel Mission 2-2
-----------------------------------
-- !addmission 13 46
-- Ru'Lude Homepoint 1 : !pos -6 3 0.001 243
-----------------------------------
local ruludeID = zones[invaderXim.zone.RULUDE_GARDENS]
-----------------------------------

local mission = Mission:new(invaderXim.mission.log_id.ROV, invaderXim.mission.id.rov.CRASHING_WAVES)

mission.reward =
{
    nextMission = { invaderXim.mission.log_id.ROV, invaderXim.mission.id.rov.CALL_TO_SERVE },
}

mission.sections =
{
    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == mission.missionId
        end,

        [invaderXim.zone.RULUDE_GARDENS] =
        {
            -- Receiving this Alter Ego is required for completing the mission, so we can handle it here.
            ['Mystic_Retriever'] =
            {
                onTrigger = function(player, npc)
                    if
                        mission:getVar(player, 'Retrieve') == 1 and
                        npcUtil.giveItem(player, invaderXim.item.CIPHER_OF_TENZENS_ALTER_EGO_II)
                    then
                        mission:complete(player)
                    end
                end,
            },

            onTriggerAreaEnter =
            {
                [1] = function(player, triggerArea)
                    if
                        invaderXim.rhapsodies.charactersAvailable(player) and
                        player:hasCompletedMission(invaderXim.mission.log_id.COP, invaderXim.mission.id.cop.A_VESSEL_WITHOUT_A_CAPTAIN) and
                        mission:getVar(player, 'Retrieve') == 0
                    then
                        -- Note: There are 4 parameters that impact the message shown in this state which all appear to revolve
                        -- around Tenzen's knowledge of Prishe, and the status of the mission 'Darkness Named.'  This mission is
                        -- when the two meet for the first time, and it is possible that these parameters become more granular
                        -- during the different status in that mission.  We know that a player who just meets minimum requirements
                        -- returns all 0 for the first 4 parameters, and Darkness Named completed returns below.  Param 3 is inferred,
                        -- as it indicates needing to complete business in Pso'Xja as Prishe recovers.

                        -- Phoenix (sword) CS -----------------.
                        -- Pso'Xja Business (1 is cleared) -.  |
                        -- Tenzen knowing Prishe --------.  |  |
                        -- Soiree in Norg ------------.  |  |  |
                        --                            |  |  |  |
                        -- Minimum Progress         : 0, 0, 0, 0
                        -- Darkness Named Completed : 1, 1, 1, 0

                        -- Fourth parameter involves a no-text addition with Tenzen looking at his sword.  This has not been observed
                        -- in any caps to date, and is not included in this implementation.

                        -- Additional Note: These seem to be progressive bits.  Each previous value must be set for the next parameter
                        -- to cause an impact.

                        local hasProgressed = player:getCurrentMission(invaderXim.mission.log_id.COP) >= invaderXim.mission.id.cop.DARKNESS_NAMED and 1 or 0
                        local isCurrent     = player:getCurrentMission(invaderXim.mission.log_id.COP) <= invaderXim.mission.id.cop.DARKNESS_NAMED and 0 or 1

                        return mission:progressEvent(10244, hasProgressed, hasProgressed, isCurrent, 0)
                    elseif mission:getVar(player, 'Status') == 0 then
                        return mission:event(10245)
                    end
                end,
            },

            onEventFinish =
            {
                [10244] = function(player, csid, option, npc)
                    if player:getFreeSlotsCount() == 0 then
                        player:messageSpecial(ruludeID.text.MYSTIC_RETRIEVER, invaderXim.item.CIPHER_OF_TENZENS_ALTER_EGO_II)
                        mission:setVar(player, 'Retrieve', 1)
                    else
                        npcUtil.giveItem(player, invaderXim.item.CIPHER_OF_TENZENS_ALTER_EGO_II)
                        mission:complete(player)
                    end
                end,

                [10245] = function(player, csid, option, npc)
                    -- Unable to proceed message is only displayed once ever.
                    mission:setVar(player, 'Status', 1)
                end,
            },
        },
    },
}

return mission
