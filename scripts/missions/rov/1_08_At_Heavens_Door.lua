-----------------------------------
-- At Heaven's Door
-- Rhapsodies of Vana'diel Mission 1-8
-----------------------------------
-- !addmission 13 18
-- Undulating Confluence : !pos -204.531 -20.027 75.318 126
-----------------------------------
local norgID = zones[invaderXim.zone.NORG]
-----------------------------------

local mission = Mission:new(invaderXim.mission.log_id.ROV, invaderXim.mission.id.rov.AT_THE_HEAVENS_DOOR)

mission.reward =
{
    nextMission = { invaderXim.mission.log_id.ROV, invaderXim.mission.id.rov.THE_LIONS_ROAR },
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

                    return mission:event(63, { [7] = isLionGhost }):setPriority(1005)
                end,
            },

            onEventFinish =
            {
                [63] = function(player, csid, option, npc)
                    mission:complete(player)
                end,
            },
        },

        [invaderXim.zone.NORG] =
        {
            ['_700'] = mission:messageSpecial(norgID.text.DOOR_IS_LOCKED),
        },
    },
}

return mission
