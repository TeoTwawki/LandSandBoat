-----------------------------------
-- The Shadow Awaits
-- Windurst M5-2
-----------------------------------
-- !addmission 2 15
-- Rakoh Buuma      : !pos 106 -5 -23 241
-- Mokyokyo         : !pos -55 -8 227 238
-- Janshura-Rashura : !pos -227 -8 184 240
-- Zokima-Rokima    : !pos 0 -16 124 239
-- Vestal Chamber   : !pos 0.1 -49 37 242
-- Zubaba           : !pos 15 -27 18 242
-- Thone Room Door  : !pos -111 -6 0 165
-----------------------------------

local mission = Mission:new(invaderXim.mission.log_id.WINDURST, invaderXim.mission.id.windurst.THE_SHADOW_AWAITS)

mission.reward =
{
    gil = 20000,
    rank = 6,
}

local handleAcceptMission = function(player, csid, option, npc)
    if option == 15 then
        mission:begin(player)
        player:messageSpecial(zones[player:getZoneID()].text.YOU_ACCEPT_THE_MISSION)
        npcUtil.giveKeyItem(player, invaderXim.ki.STAR_CRESTED_SUMMONS_1)
    end
end

mission.sections =
{
    -- Player has no active missions
    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == invaderXim.mission.id.nation.NONE and
                player:getNation() == mission.areaId
        end,

        [invaderXim.zone.PORT_WINDURST] =
        {
            onEventFinish =
            {
                [78] = handleAcceptMission,
            },
        },

        [invaderXim.zone.WINDURST_WALLS] =
        {
            onEventFinish =
            {
                [93] = handleAcceptMission,
            },
        },

        [invaderXim.zone.WINDURST_WATERS] =
        {
            onEventFinish =
            {
                [111] = handleAcceptMission,
            },
        },

        [invaderXim.zone.WINDURST_WOODS] =
        {
            onEventFinish =
            {
                [114] = handleAcceptMission,
            },
        },
    },

    -- Player has accepted the mission
    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == mission.missionId
        end,

        [invaderXim.zone.HEAVENS_TOWER] =
        {
            ['_6q2'] =
            {
                onTrigger = function(player, npc)
                    if player:hasKeyItem(invaderXim.ki.STAR_CRESTED_SUMMONS_1) then
                        return mission:progressEvent(214)
                    elseif player:hasKeyItem(invaderXim.ki.SHADOW_FRAGMENT) then
                        return mission:progressEvent(216)
                    end
                end,
            },

            ['Zubaba'] =
            {
                onTrigger = function(player, npc)
                    if player:hasKeyItem(invaderXim.ki.STAR_CRESTED_SUMMONS_1) then
                        return mission:progressEvent(157)
                    elseif player:hasKeyItem(invaderXim.ki.SHADOW_FRAGMENT) then
                        return mission:progressEvent(194)
                    end
                end,
            },

            onEventFinish =
            {
                [214] = function(player, csid, option, npc)
                    player:setMissionStatus(mission.areaId, 2)
                    player:addTitle(invaderXim.title.STAR_ORDAINED_WARRIOR)
                    player:delKeyItem(invaderXim.ki.STAR_CRESTED_SUMMONS_1)
                end,

                [216] = function(player, csid, option, npc)
                    if mission:complete(player) then
                        player:delKeyItem(invaderXim.ki.SHADOW_FRAGMENT)
                    end
                end,
            },
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

                        -- TODO: Check captures, the player is most likely zoned and this even triggered via onZoneIn
                        player:startEvent(7)
                    end
                end,

                [6] = function(player, csid, option, npc)
                    player:setMissionStatus(mission.areaId, 3)
                end,

                [7] = function(player, csid, option, npc)
                    player:setMissionStatus(mission.areaId, 4)
                    player:setPos(378, -12, -20, 125, 161)
                end,
            },
        },

        [invaderXim.zone.CASTLE_ZVAHL_BAILEYS] =
        {
            afterZoneIn = function(player)
                if
                    player:getMissionStatus(mission.areaId) == 4 and
                    not player:hasKeyItem(invaderXim.ki.SHADOW_FRAGMENT)
                then
                    npcUtil.giveKeyItem(player, invaderXim.ki.SHADOW_FRAGMENT)
                end
            end,
        },
    },
}

return mission
