-----------------------------------
-- The Three Kingdoms San d'Oria
-- Windurst M2-3 (Part 2)
-----------------------------------
-- !addmission 2 8
-- Kasaroro : !pos -72 -3 34 231
-- Halver   : !pos 2 0.1 0.1 233
-----------------------------------
local chateauID          = zones[invaderXim.zone.CHATEAU_DORAGUILLE]
local northernSandoriaID = zones[invaderXim.zone.NORTHERN_SAN_DORIA]
-----------------------------------

local mission = Mission:new(invaderXim.mission.log_id.WINDURST, invaderXim.mission.id.windurst.THE_THREE_KINGDOMS_SANDORIA2)

mission.reward = {}

mission.sections =
{
    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == mission.missionId
        end,

        [invaderXim.zone.CHATEAU_DORAGUILLE] =
        {
            ['Halver'] =
            {
                onTrigger = function(player, npc)
                    local missionStatus = player:getMissionStatus(mission.areaId)

                    if missionStatus == 8 then
                        if invaderXim.settings.main.ENABLE_TRUST_QUESTS == 1 then
                            local needsHalverTrust = (not player:hasSpell(invaderXim.magic.spell.HALVER) and not player:findItem(invaderXim.item.CIPHER_OF_HALVERS_ALTER_EGO)) and 1 or 0

                            return mission:progressEvent(504, { [7] = needsHalverTrust })
                        else
                            return mission:progressEvent(504)
                        end
                    else
                        return mission:messageText(chateauID.text.HALVER_OFFSET + 279)
                    end
                end,
            },

            onEventFinish =
            {
                [504] = function(player, csid, option, npc)
                    player:setMissionStatus(mission.areaId, 9)

                    if
                        invaderXim.settings.main.ENABLE_TRUST_QUESTS == 1 and
                        not player:hasSpell(invaderXim.magic.spell.HALVER) and
                        not player:findItem(invaderXim.item.CIPHER_OF_HALVERS_ALTER_EGO)
                    then
                        npcUtil.giveItem(player, invaderXim.item.CIPHER_OF_HALVERS_ALTER_EGO)
                    end
                end,
            },
        },

        [invaderXim.zone.HORLAIS_PEAK] =
        {
            onEventFinish =
            {
                [32001] = function(player, csid, option, npc)
                    if
                        player:getMissionStatus(mission.areaId) == 9 and
                        player:getLocalVar('battlefieldWin') == invaderXim.battlefield.id.RANK_2_MISSION_1
                    then
                        npcUtil.giveKeyItem(player, invaderXim.ki.KINDRED_CREST)
                        player:delKeyItem(invaderXim.ki.DARK_KEY)
                        player:setMissionStatus(mission.areaId, 10)
                    end
                end,
            },
        },

        [invaderXim.zone.NORTHERN_SAN_DORIA] =
        {
            ['Kasaroro'] =
            {
                onTrigger = function(player, npc)
                    local missionStatus = player:getMissionStatus(mission.areaId)

                    if missionStatus == 8 then
                        return mission:messageText(northernSandoriaID.text.KASARORO_DIALOG)
                    elseif missionStatus == 10 then
                        return mission:progressEvent(551)
                    end
                end,
            },

            onEventFinish =
            {
                [551] = function(player, csid, option, npc)
                    if mission:complete(player) then
                        player:addMission(invaderXim.mission.log_id.WINDURST, invaderXim.mission.id.windurst.THE_THREE_KINGDOMS)
                        player:delKeyItem(invaderXim.ki.KINDRED_CREST)
                        npcUtil.giveKeyItem(player, invaderXim.ki.KINDRED_REPORT)
                        player:setMissionStatus(mission.areaId, 11)
                    end
                end,
            },
        },
    },
}

return mission
