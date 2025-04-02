-----------------------------------
-- A Shantotto Ascension
-- A Shantotto Ascension M2
-----------------------------------
-- !addmission 11 1
-----------------------------------

local mission = Mission:new(invaderXim.mission.log_id.ASA, invaderXim.mission.id.asa.BURGEONING_DREAD)

mission.reward =
{
    nextMission = { invaderXim.mission.log_id.ASA, invaderXim.mission.id.asa.THAT_WHICH_CURDLES_BLOOD },
}

mission.sections =
{
    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == mission.missionId
        end,

        [invaderXim.zone.EAST_SARUTABARUTA] =
        {
            onZoneIn = function(player, prevZone)
                if
                    prevZone == invaderXim.zone.WINDURST_WOODS and
                    not player:hasStatusEffect(invaderXim.effect.MOUNTED)
                then
                    return mission:event(71)
                end
            end,

            onEventUpdate =
            {
                [71] = function(player, csid, option, npc)
                    local kit = 2779 + math.random(0, 3)
                    player:updateEvent(kit)
                    invaderXim.mission.setVar(player, invaderXim.mission.log_id.ASA, invaderXim.mission.id.asa.THAT_WHICH_CURDLES_BLOOD, 'Option', kit)
                end,
            },

            onEventFinish =
            {
                [71] = function(player, csid, option, npc)
                    mission:complete(player)
                end,
            },
        },

        [invaderXim.zone.WEST_SARUTABARUTA] =
        {
            onZoneIn = function(player, prevZone)
                if prevZone == invaderXim.zone.WINDURST_WATERS then
                    return 62
                elseif prevZone == invaderXim.zone.PORT_WINDURST then
                    return 63
                end
            end,

            onEventUpdate =
            {
                [62] = function(player, csid, option, npc)
                    local kit = 2779 + math.random(0, 3)
                    player:updateEvent(kit)
                    invaderXim.mission.setVar(player, invaderXim.mission.log_id.ASA, invaderXim.mission.id.asa.THAT_WHICH_CURDLES_BLOOD, 'Option', kit)
                end,

                [63] = function(player, csid, option, npc)
                    local kit = 2779 + math.random(0, 3)
                    player:updateEvent(kit)
                    invaderXim.mission.setVar(player, invaderXim.mission.log_id.ASA, invaderXim.mission.id.asa.THAT_WHICH_CURDLES_BLOOD, 'Option', kit)
                end,
            },

            onEventFinish =
            {
                [62] = function(player, csid, option, npc)
                    mission:complete(player)
                end,

                [63] = function(player, csid, option, npc)
                    mission:complete(player)
                end,
            },
        },
    },
}

return mission
