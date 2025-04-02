-----------------------------------
-- Salvation
-- Seekers of Adoulin M3-6-4
-----------------------------------
-- !addmission 12 69
-- Crawling Cave : !pos -349.302 40.339 -379.79 267
-----------------------------------
local kamihrID = zones[invaderXim.zone.KAMIHR_DRIFTS]
-----------------------------------

local mission = Mission:new(invaderXim.mission.log_id.SOA, invaderXim.mission.id.soa.SALVATION)

mission.reward =
{
    nextMission = { invaderXim.mission.log_id.SOA, invaderXim.mission.id.soa.GLIMMER_OF_PORTENT },
}

mission.sections =
{
    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == mission.missionId
        end,

        [invaderXim.zone.WESTERN_ADOULIN] =
        {
            ['Levil'] = mission:event(152),
        },

        [invaderXim.zone.KAMIHR_DRIFTS] =
        {
            ['Crawling_Cave'] = mission:progressEvent(33),

            onEventUpdate =
            {
                [33] = function(player, csid, option, npc)
                    if option == 1 then
                        player:updateEvent(1, 0, 0, 0)
                    elseif option == 2 then
                        player:updateEvent(4, 1, 0, 0)
                    elseif option == 3 then
                        player:updateEvent(3, 0, 0, 0)
                    end
                end,
            },

            onEventFinish =
            {
                [33] = function(player, csid, option, npc)
                    if option == 3 then
                        player:delKeyItem(invaderXim.ki.SOUL_SIPHON)
                        player:messageSpecial(kamihrID.text.LOST_KEYITEM, invaderXim.ki.SOUL_SIPHON)
                        invaderXim.mission.setVar(player, invaderXim.mission.log_id.SOA, invaderXim.mission.id.soa.GLIMMER_OF_PORTENT, 'Timer', VanadielUniqueDay() + 1)
                        mission:complete(player)
                    end
                end,
            },
        },
    },
}

return mission
