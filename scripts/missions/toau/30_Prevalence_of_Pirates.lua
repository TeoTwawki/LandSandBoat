-----------------------------------
-- Prevalence of Pirates
-- Aht Uhrgan Mission 30
-----------------------------------
-- !addmission 4 29
-----------------------------------

local mission = Mission:new(invaderXim.mission.log_id.TOAU, invaderXim.mission.id.toau.PREVALENCE_OF_PIRATES)

mission.reward =
{
    keyItem     = invaderXim.ki.PERIQIA_ASSAULT_AREA_ENTRY_PERMIT,
    nextMission = { invaderXim.mission.log_id.TOAU, invaderXim.mission.id.toau.SHADES_OF_VENGEANCE },
}

mission.sections =
{
    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == mission.missionId
        end,

        [invaderXim.zone.ARRAPAGO_REEF] =
        {
            onZoneIn = function(player, prevZone)
                if
                    prevZone == invaderXim.zone.CAEDARVA_MIRE and
                    player:getMissionStatus(mission.areaId) == 0
                then
                    return 13
                end
            end,

            onTriggerAreaEnter =
            {
                [1] = function(player, triggerArea)
                    if player:getMissionStatus(mission.areaId) == 1 then
                        return mission:progressEvent(14)
                    end
                end,
            },

            onEventFinish =
            {
                [13] = function(player, csid, option, npc)
                    player:setMissionStatus(mission.areaId, 1)
                end,

                [14] = function(player, csid, option, npc)
                    mission:complete(player)
                end,
            },
        },
    },
}

return mission
