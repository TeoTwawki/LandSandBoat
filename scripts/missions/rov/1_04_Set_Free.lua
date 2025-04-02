-----------------------------------
-- Emissary from the Seas
-- Rhapsodies of Vana'diel Mission 1-4
-----------------------------------
-- !addmission 13 4
-- Abelard : !pos -52 -11 -13 248
-- Ekokoko : !pos -78 -24 28 249
-----------------------------------

local mission = Mission:new(invaderXim.mission.log_id.ROV, invaderXim.mission.id.rov.SET_FREE)

mission.reward =
{
    nextMission = { invaderXim.mission.log_id.ROV, invaderXim.mission.id.rov.THE_BEGINNING },
}

local handleTradeEventFinish = function(player, csid, option, npc)
    if not player:hasJob(0) then
        npcUtil.giveKeyItem(player, invaderXim.ki.GILGAMESHS_INTRODUCTORY_LETTER)
    else
        if not npcUtil.giveItem(player, invaderXim.item.COPPER_AMAN_VOUCHER) then
            -- Do not complete mission or confirm trade if the player is not
            -- able to receive the reward.  Instead, bail out here.
            return
        end
    end

    local pathId = player:getMissionStatus(mission.areaId)

    player:confirmTrade()
    mission:complete(player)
    player:setMissionStatus(mission.areaId, pathId)
end

mission.sections =
{
    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == mission.missionId
        end,

        [invaderXim.zone.SELBINA] =
        {
            ['Abelard'] =
            {
                onTrade = function(player, npc, trade)
                    if
                        npcUtil.tradeHasExactly(trade, { { invaderXim.item.CLUMP_OF_BEE_POLLEN, 3 } }) and
                        player:getMissionStatus(mission.areaId) == 1
                    then
                        return mission:progressEvent(178, 0, 0, 0, 0, 0, 0, player:hasJob(0) and 1 or 0)
                    end
                end,

                onTrigger = function(player, npc)
                    return mission:event(181):importantOnce()
                end,
            },

            onEventFinish =
            {
                [178] = handleTradeEventFinish,
            },
        },

        [invaderXim.zone.MHAURA] =
        {
            ['Ekokoko'] =
            {
                onTrade = function(player, npc, trade)
                    if
                        npcUtil.tradeHasExactly(trade, { { invaderXim.item.MANDRAGORA_DEWDROP, 3 } }) and
                        player:getMissionStatus(mission.areaId) == 2
                    then
                        return mission:progressEvent(370, 0, 0, 0, 0, 0, 0, player:hasJob(0) and 1 or 0)
                    end
                end,

                onTrigger = function(player, npc)
                    return mission:event(373):importantOnce()
                end,
            },

            -- TODO: There may be reminder dialog here, need captures to confirm (Possibly Event 369)

            onEventFinish =
            {
                [370] = handleTradeEventFinish,
            },
        },
    },
}

return mission
