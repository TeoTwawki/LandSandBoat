-----------------------------------
-- Friction and Fissures
-- Seekers of Adoulin M2-5
-----------------------------------
-- !addmission 12 20
-- Levil : !pos -87.204 3.350 12.655 256
-----------------------------------

local mission = Mission:new(invaderXim.mission.log_id.SOA, invaderXim.mission.id.soa.FRICTION_AND_FISSURES)

mission.reward =
{
    nextMission = { invaderXim.mission.log_id.SOA, invaderXim.mission.id.soa.THE_CELENNIA_MEMORIAL_LIBRARY },
}

mission.sections =
{
    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == mission.missionId
        end,

        [invaderXim.zone.WESTERN_ADOULIN] =
        {
            ['Levil'] =
            {
                onTrigger = function(player, npc)
                    if mission:getVar(player, 'Timer') <= VanadielUniqueDay() then
                        return mission:progressEvent(123)
                    else
                        return mission:event(127)
                    end
                end,
            },

            onEventFinish =
            {
                [123] = function(player, csid, option, npc)
                    mission:complete(player)
                end,
            },
        },
    },
}

return mission
