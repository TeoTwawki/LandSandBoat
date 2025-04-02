-----------------------------------
-- Volto Oscuro
-- Rhapsodies of Vana'diel Mission 1-17
-----------------------------------
-- !addmission 13 40
-- Oaken Door : !pos 97 -7 -12 252
-----------------------------------

local mission = Mission:new(invaderXim.mission.log_id.ROV, invaderXim.mission.id.rov.VOLTO_OSCURO)

mission.reward =
{
    item        = invaderXim.item.CIPHER_OF_ZEIDS_ALTER_EGO_II,
    nextMission = { invaderXim.mission.log_id.ROV, invaderXim.mission.id.rov.RING_MY_BELL },
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
                    if mission:getVar(player, 'hasSeenEvent') == 0 then
                        -- Tenzen parameter causes a small difference in dialogue if you answer that you do not know
                        -- who he is.  This uses the logic previously implemented in 1-18 for determining the value.

                        local promathiaMission = player:getCurrentMission(invaderXim.mission.log_id.COP)
                        local metTenzen = (promathiaMission >= invaderXim.mission.id.cop.A_VESSEL_WITHOUT_A_CAPTAIN) and 1 or 0

                        return mission:event(279, { [7] = metTenzen }):setPriority(1005)
                    else
                        mission:complete(player)
                        return mission:noAction()
                    end
                end,
            },

            onEventFinish =
            {
                [279] = function(player, csid, option, npc)
                    if not mission:complete(player) then
                        mission:setVar(player, 'hasSeenEvent', 1)
                    end
                end,
            },
        },
    },
}

return mission
