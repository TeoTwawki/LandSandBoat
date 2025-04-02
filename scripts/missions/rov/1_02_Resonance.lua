-----------------------------------
-- Resonance
-- Rhapsodies of Vana'diel Mission 1-2
-----------------------------------
-- !addmission 13 2
-----------------------------------

local mission = Mission:new(invaderXim.mission.log_id.ROV, invaderXim.mission.id.rov.RESONACE)

mission.reward =
{
    nextMission = { invaderXim.mission.log_id.ROV, invaderXim.mission.id.rov.EMISSARY_FROM_THE_SEAS },
}

mission.sections =
{
    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == mission.missionId and missionStatus == 0
        end,

        [invaderXim.zone.MHAURA] =
        {
            onZoneIn = function(player, prevZone)
                return 368
            end,

            onEventFinish =
            {
                [368] = function(player, csid, option, npc)
                    if mission:complete(player) then
                        -- Set Status for Emissary from the Seas - Mhaura Path
                        player:setMissionStatus(mission.areaId, 2)
                    end
                end,
            },
        },

        [invaderXim.zone.SELBINA] =
        {
            onZoneIn = function(player, prevZone)
                return 176
            end,

            onEventFinish =
            {
                [176] = function(player, csid, option, npc)
                    if mission:complete(player) then
                        -- Set Status for Emissary from the Seas - Selbina Path
                        player:setMissionStatus(mission.areaId, 1)
                    end
                end,
            },
        },
    },
}

return mission
