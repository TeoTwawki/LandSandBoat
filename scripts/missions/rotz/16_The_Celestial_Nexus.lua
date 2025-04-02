-----------------------------------
-- The Celestial Nexus
-- Zilart M16
-----------------------------------
-- !addmission 3 28
-- Gilgamesh          : !pos 122.452 -9.009 -12.052 252
-- _515 (BCNM Entry)  : !pos -665.2291 -5.8232 -32.4834 181
-----------------------------------

local mission = Mission:new(invaderXim.mission.log_id.ZILART, invaderXim.mission.id.zilart.THE_CELESTIAL_NEXUS)

mission.reward =
{
    nextMission = { invaderXim.mission.log_id.ZILART, invaderXim.mission.id.zilart.AWAKENING },
    title = invaderXim.title.BURIER_OF_THE_ILLUSION,
}

mission.sections =
{
    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == mission.missionId
        end,

        [invaderXim.zone.NORG] =
        {
            ['Gilgamesh'] = mission:event(173),
        },

        [invaderXim.zone.THE_CELESTIAL_NEXUS] =
        {
            onEventFinish =
            {
                [32001] = function(player, csid, option, npc)
                    if player:getLocalVar('battlefieldWin') == invaderXim.battlefield.id.CELESTIAL_NEXUS then
                        mission:complete(player)
                    end

                    player:setPos(0.003, -18.897, 137.112, 64, invaderXim.zone.HALL_OF_THE_GODS)
                end,
            },
        },
    },
}

return mission
