-----------------------------------
-- Ring My Bell
-- Rhapsodies of Vana'diel Mission 1-18
-----------------------------------
-- !addmission 13 42
-- Oaken Door : !pos 97 -7 -12 252
-----------------------------------

local mission = Mission:new(invaderXim.mission.log_id.ROV, invaderXim.mission.id.rov.RING_MY_BELL)

mission.reward =
{
    nextMission = { invaderXim.mission.log_id.ROV, invaderXim.mission.id.rov.SPIRITS_AWOKEN },
}

mission.sections =
{
    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == mission.missionId
        end,

        [invaderXim.zone.NORG] =
        {
            ['_700'] =
            {
                onTrigger = function(player, npc)
                    if invaderXim.rhapsodies.charactersAvailable(player) then
                        -- Below params change depending on how well you know COP characters. The precise COP mission values are
                        -- currently unknown. What's known from retail is that a character that has never started COP gets Tenzen
                        -- and Prishe params of 0, while characters who have completed it get Tenzen value of 2 and Prishe value of 1.
                        -- Currently chosen missions which assign Tenzen and Prishe values of 1 are guessed (first meeting in COP)

                        local promathiaMission = player:getCurrentMission(invaderXim.mission.log_id.COP)
                        local metPrishe = (promathiaMission >= invaderXim.mission.id.cop.DISTANT_BELIEFS) and 1 or 0
                        local metTenzen = (promathiaMission >= invaderXim.mission.id.cop.A_VESSEL_WITHOUT_A_CAPTAIN) and 1 or 0

                        if metTenzen == 1 then
                            metTenzen = (promathiaMission >= invaderXim.mission.id.cop.DAWN) and 2 or 1
                        end

                        return mission:event(284, metTenzen, metPrishe):setPriority(1005)
                    else
                        return mission:event(283):setPriority(1005)
                    end
                end,
            },

            onEventFinish =
            {
                [284] = function(player, csid, option, npc)
                    mission:complete(player)
                end,
            },
        },
    },
}

return mission
