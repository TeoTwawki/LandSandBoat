-----------------------------------
-- Abomination
-- Seekers of Adoulin M5-4-1
-----------------------------------
-- !addmission 12 123
-- Ominous Postern : !pos 118 37.5 20 277
-----------------------------------

local mission = Mission:new(invaderXim.mission.log_id.SOA, invaderXim.mission.id.soa.ABOMINATION)

mission.reward =
{
    nextMission = { invaderXim.mission.log_id.SOA, invaderXim.mission.id.soa.UNDYING_LIGHT },
}

mission.sections =
{
    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == mission.missionId
        end,

        [invaderXim.zone.RAKAZNAR_TURRIS] =
        {
            onZoneIn = function(player, prevZone)
                if mission:getVar(player, 'Status') == 1 then
                    return 4
                end
            end,

            onEventFinish =
            {
                [4] = function(player, csid, option, npc)
                    mission:setVar(player, 'Status', 2)
                    player:setPos(273.43, 0.071, -233.61, 168, invaderXim.zone.CEIZAK_BATTLEGROUNDS)
                end,

                [32001] = function(player, csid, option, npc)
                    -- TODO: In the BCNM script, check that the appropriate Battlefield ID
                    -- is set as a condition for the below two lines.
                    mission:setVar(player, 'Status', 1)
                    player:setPos(132.2, 39.75, 20, 0, invaderXim.zone.RAKAZNAR_TURRIS)
                end,
            },
        },

        [invaderXim.zone.CEIZAK_BATTLEGROUNDS] =
        {
            onZoneIn = function(player, prevZone)
                if mission:getVar(player, 'Status') == 2 then
                    return 29
                end
            end,

            onEventFinish =
            {
                [29] = function(player, csid, option, npc)
                    mission:complete(player)
                end,
            },
        },

        [invaderXim.zone.RAKAZNAR_INNER_COURT] =
        {
            afterZoneIn = function(player)
                if
                    not player:hasKeyItem(invaderXim.ki.AWAKENED_CRYSTALLIZED_PSYCHE) and
                    mission:getVar(player, 'Status') == 0
                then
                    -- TODO: This message needs verification, and need to determine if there
                    -- is a unique event or message.
                    npcUtil.giveKeyItem(player, invaderXim.ki.AWAKENED_CRYSTALLIZED_PSYCHE)
                end
            end,
        },
    },
}

return mission
