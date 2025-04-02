-----------------------------------
-- Take Wing
-- Rhapsodies of Vana'diel Mission 2-7
-----------------------------------
-- !addmission 13 68
-----------------------------------

local mission = Mission:new(invaderXim.mission.log_id.ROV, invaderXim.mission.id.rov.PRIME_NUMBER)

mission.reward =
{
    nextMission = { invaderXim.mission.log_id.ROV, invaderXim.mission.id.rov.FROM_THE_RUINS },
}

mission.sections =
{
    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == mission.missionId
        end,

        [invaderXim.zone.ALZADAAL_UNDERSEA_RUINS] =
        {
            onZoneIn = function(player, prevZone)
                return 124
            end,

            onEventFinish =
            {
                [124] = function(player, csid, option, npc)
                    if mission:complete(player) then
                        mission:setVar(player, 'Option', 1)
                    end
                end,
            },
        },
    },

    {
        check = function(player, currentMission, missionStatus, vars)
            return player:hasCompletedMission(mission.areaId, mission.missionId) and
                mission:getVar(player, 'Option') == 1
        end,

        [invaderXim.zone.THE_SHROUDED_MAW] =
        {
            onZoneIn = function(player, prevZone)
                return 12
            end,

            onEventFinish =
            {
                [12] = function(player, csid, option, npc)
                    mission:setVar(player, 'Option', 0)
                end,
            },
        },
    },
}

return mission
