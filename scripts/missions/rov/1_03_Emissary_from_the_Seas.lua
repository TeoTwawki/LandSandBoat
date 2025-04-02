-----------------------------------
-- Emissary from the Seas
-- Rhapsodies of Vana'diel Mission 1-3
-----------------------------------
-- !addmission 13 3
-- Naillina     : !pos -66.8 -11.3 -0.8 248
-- Numi Adaligo : !pos -80.3 -24 34.8 249
-----------------------------------

local mission = Mission:new(invaderXim.mission.log_id.ROV, invaderXim.mission.id.rov.EMISSARY_FROM_THE_SEAS)

mission.reward =
{
    nextMission = { invaderXim.mission.log_id.ROV, invaderXim.mission.id.rov.SET_FREE },
}

mission.sections =
{
    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == mission.missionId
        end,

        [invaderXim.zone.SELBINA] =
        {
            ['Naillina'] =
            {
                onTrigger = function(player, npc)
                    if player:getMissionStatus(mission.areaId) == 1 then
                        return mission:progressEvent(14, 0, 0, 0, 0, 0, 0, 0, 1)
                    end
                end,
            },

            onEventFinish =
            {
                [14] = function(player, csid, option, npc)
                    if option == 1 then
                        -- Note: missionStatus is reset on mission:complete(), both event
                        -- finish functions should restore their previous values.
                        mission:complete(player)
                        player:setMissionStatus(mission.areaId, 1)
                    end
                end,
            },
        },

        [invaderXim.zone.MHAURA] =
        {
            ['Numi_Adaligo'] =
            {
                onTrigger = function(player, npc)
                    if player:getMissionStatus(mission.areaId) == 2 then
                        return mission:progressEvent(50, 0, 0, 0, 0, 0, 0, 0, 1)
                    end
                end,
            },

            onEventFinish =
            {
                [50] = function(player, csid, option, npc)
                    if option == 1 then
                        mission:complete(player)
                        player:setMissionStatus(mission.areaId, 2)
                    end
                end,
            },
        },
    },
}

return mission
