-----------------------------------
-- Eddies of Despair (I)
-- Rhapsodies of Vana'diel Mission 1-10
-----------------------------------
-- !addmission 13 22
-- Undulating Confluence : !pos -204.531 -20.027 75.318 126
-----------------------------------

local mission = Mission:new(invaderXim.mission.log_id.ROV, invaderXim.mission.id.rov.EDDIES_OF_DESPAIR_I)

mission.reward =
{
    nextMission = { invaderXim.mission.log_id.ROV, invaderXim.mission.id.rov.A_LAND_AFTER_TIME },
}

mission.sections =
{
    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == mission.missionId
        end,

        [invaderXim.zone.QUFIM_ISLAND] =
        {
            ['Undulating_Confluence'] =
            {
                onTrigger = function(player, npc)
                    local isLionGhost = player:hasCompletedMission(invaderXim.mission.log_id.ZILART, invaderXim.mission.id.zilart.THE_CELESTIAL_NEXUS) and 1 or 0

                    return mission:event(64, { [7] = isLionGhost }):setPriority(1005)
                end,
            },

            onEventFinish =
            {
                [64] = function(player, csid, option, npc)
                    invaderXim.teleport.to(player, invaderXim.teleport.id.ESCHA_ZITAH)
                end,
            },
        },

        [invaderXim.zone.ESCHA_ZITAH] =
        {
            onZoneIn = function(player, prevZone)
                return 1
            end,

            onEventUpdate =
            {
                [1] = function(player, csid, option, npc)
                    if option == 1 then
                        local isLionGhost = player:hasCompletedMission(invaderXim.mission.log_id.ZILART, invaderXim.mission.id.zilart.THE_CELESTIAL_NEXUS) and 2 or 0

                        player:updateEvent(0, 0, 0, 0, 0, 0, 0, isLionGhost)
                    end
                end,
            },

            onEventFinish =
            {
                [1] = function(player, csid, option, npc)
                    mission:complete(player)
                end,
            },
        },
    },
}

return mission
