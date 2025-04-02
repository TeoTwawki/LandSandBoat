-----------------------------------
-- A Fate Decided
-- Promathia 8-2
-----------------------------------
-- !addmission 6 818
-- _iyq : !pos 420 0 401 34
-----------------------------------
local huxoiID = zones[invaderXim.zone.GRAND_PALACE_OF_HUXZOI]
-----------------------------------

local mission = Mission:new(invaderXim.mission.log_id.COP, invaderXim.mission.id.cop.A_FATE_DECIDED)

mission.reward =
{
    nextMission = { invaderXim.mission.log_id.COP, invaderXim.mission.id.cop.WHEN_ANGELS_FALL },
}

mission.sections =
{
    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == mission.missionId
        end,

        [invaderXim.zone.GRAND_PALACE_OF_HUXZOI] =
        {
            ['_iyq'] =
            {
                onTrigger = function(player, npc)
                    local missionStatus = mission:getVar(player, 'Status')

                    if
                        missionStatus == 0 and
                        not GetMobByID(huxoiID.mob.IXGHRAH):isSpawned()
                    then
                        SpawnMob(huxoiID.mob.IXGHRAH):updateClaim(player)
                        return mission:messageSpecial(huxoiID.text.PRESENCE_HAS_DRAWN)
                    elseif missionStatus == 1 then
                        return mission:progressEvent(3)
                    end
                end,
            },

            ['Ixghrah'] =
            {
                onMobDeath = function(mob, player, optParams)
                    if mission:getVar(player, 'Status') == 0 then
                        mission:setVar(player, 'Status', 1)
                    end
                end
            },

            onEventFinish =
            {
                [3] = function(player, csid, option, npc)
                    mission:complete(player)
                end,
            },
        },
    },
}

return mission
