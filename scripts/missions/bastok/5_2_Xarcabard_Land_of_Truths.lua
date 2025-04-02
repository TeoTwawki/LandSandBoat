-----------------------------------
-- Xarcabard, Land of Truths
-- Bastok M5-2
-----------------------------------
-- !addmission 1 15
-- Argus   : !pos 132.157 7.496 -2.187 236
-- Cleades : !pos -358 -10 -168 235
-- Malduc  : !pos 66.200 -14.999 4.426 237
-- Rashid  : !pos -8.444 -2 -123.575 234
-- _6ld    : !pos 92 -19 0.1 237
-- Karst   : !pos 106 -21 0 237
-----------------------------------
local bastokMarketsID = zones[invaderXim.zone.BASTOK_MARKETS]
local bastokMinesID   = zones[invaderXim.zone.BASTOK_MINES]
local metalworksID    = zones[invaderXim.zone.METALWORKS]
local portBastokID    = zones[invaderXim.zone.PORT_BASTOK]
-----------------------------------

local mission = Mission:new(invaderXim.mission.log_id.BASTOK, invaderXim.mission.id.bastok.XARCABARD_LAND_OF_TRUTHS)

mission.reward =
{
    gil = 20000,
    rank = 6,
}

local handleAcceptMission = function(player, csid, option, npc)
    if option == 15 then
        mission:begin(player)
        player:messageSpecial(zones[player:getZoneID()].text.YOU_ACCEPT_THE_MISSION)
    end
end

mission.sections =
{
    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == invaderXim.mission.id.nation.NONE and
                player:getNation() == mission.areaId
        end,

        [invaderXim.zone.BASTOK_MARKETS] =
        {
            onEventFinish =
            {
                [1001] = handleAcceptMission,
            },
        },

        [invaderXim.zone.BASTOK_MINES] =
        {
            onEventFinish =
            {
                [1001] = handleAcceptMission,
            },
        },

        [invaderXim.zone.METALWORKS] =
        {
            onEventFinish =
            {
                [1001] = handleAcceptMission,
            },
        },

        [invaderXim.zone.PORT_BASTOK] =
        {
            onEventFinish =
            {
                [1001] = handleAcceptMission,
            },
        },
    },

    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == mission.missionId
        end,

        [invaderXim.zone.BASTOK_MARKETS] =
        {
            ['Cleades'] = mission:messageSpecial(bastokMarketsID.text.ORIGINAL_MISSION_OFFSET + 39),
        },

        [invaderXim.zone.BASTOK_MINES] =
        {
            ['Rashid'] = mission:messageSpecial(bastokMinesID.text.ORIGINAL_MISSION_OFFSET + 39),
        },

        [invaderXim.zone.METALWORKS] =
        {
            ['_6ld'] =
            {
                onTrigger = function(player, npc)
                    if player:hasKeyItem(invaderXim.ki.SHADOW_FRAGMENT) then
                        return mission:progressEvent(603)
                    end
                end,
            },

            ['Karst'] =
            {
                onTrigger = function(player, npc)
                    if player:getMissionStatus(mission.areaId) == 0 then
                        return mission:progressEvent(602)
                    end
                end,
            },

            ['Malduc'] = mission:messageSpecial(metalworksID.text.ORIGINAL_MISSION_OFFSET + 39),

            onEventFinish =
            {
                [602] = function(player, csid, option, npc)
                    player:setMissionStatus(mission.areaId, 2)
                end,

                [603] = function(player, csid, option, npc)
                    if mission:complete(player) then
                        player:delKeyItem(invaderXim.ki.SHADOW_FRAGMENT)
                    end
                end,
            },
        },

        [invaderXim.zone.PORT_BASTOK] =
        {
            ['Argus'] = mission:messageSpecial(portBastokID.text.ORIGINAL_MISSION_OFFSET + 39),
        },

        [invaderXim.zone.THRONE_ROOM] =
        {
            ['_4l1'] =
            {
                onTrigger = function(player, npc)
                    if player:getMissionStatus(mission.areaId) == 2 then
                        return mission:progressEvent(6)
                    end
                end
            },

            onEventFinish =
            {
                [32001] = function(player, csid, option, npc)
                    if
                        player:getMissionStatus(mission.areaId) == 3 and
                        player:getLocalVar('battlefieldWin') == invaderXim.battlefield.id.SHADOW_LORD_BATTLE
                    then
                        if
                            player:getCurrentMission(invaderXim.mission.log_id.ZILART) ~= invaderXim.mission.id.zilart.THE_NEW_FRONTIER and
                            not player:hasCompletedMission(invaderXim.mission.log_id.ZILART, invaderXim.mission.id.zilart.THE_NEW_FRONTIER)
                        then
                            -- Don't add missions we already completed. Players who change nation will hit this.
                            player:addMission(invaderXim.mission.log_id.ZILART, invaderXim.mission.id.zilart.THE_NEW_FRONTIER)
                        end

                        -- TODO: This is most likely a pos change followed by onZoneIn event
                        player:startEvent(7)
                    end
                end,

                [6] = function(player, csid, option, npc)
                    player:setMissionStatus(mission.areaId, 3)
                end,

                [7] = function(player, csid, option, npc)
                    npcUtil.giveKeyItem(player, invaderXim.ki.SHADOW_FRAGMENT)
                    player:setMissionStatus(mission.areaId, 4)
                    player:setPos(378, -12, -20, 125, 161)
                end,
            },
        },
    },

    {
        check = function(player, currentMission, missionStatus, vars)
            return player:getNation() == invaderXim.nation.BASTOK and
                player:getCurrentMission(mission.areaId) == invaderXim.mission.id.bastok.NONE and
                player:hasCompletedMission(mission.areaId, mission.missionId) and
                not player:hasCompletedMission(invaderXim.mission.log_id.BASTOK, invaderXim.mission.id.bastok.RETURN_OF_THE_TALEKEEPER)
        end,

        [invaderXim.zone.BASTOK_MINES] =
        {
            ['Pavvke'] = mission:event(76):importantOnce(),
        },
    },
}

return mission
