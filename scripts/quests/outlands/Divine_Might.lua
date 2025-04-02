-----------------------------------
-- Divine Might
-----------------------------------
-- Log ID: 5, Quest ID: 163
-- blank_divine_might : !pos -40 0 -151 178
-- Qu'Hau Spring      : !pos 0 -29 64 122
-----------------------------------

local quest = Quest:new(invaderXim.questLog.OUTLANDS, invaderXim.quest.id.outlands.DIVINE_MIGHT)

quest.reward =
{
    title = invaderXim.title.PENTACIDE_PERPETRATOR,
}

local earringRewards =
{
    [1] = invaderXim.item.SUPPANOMIMI,
    [2] = invaderXim.item.KNIGHTS_EARRING,
    [3] = invaderXim.item.ABYSSAL_EARRING,
    [4] = invaderXim.item.BEASTLY_EARRING,
    [5] = invaderXim.item.BUSHINOMIMI,
}

local onTriggerIncomplete = function(player, npc)
    local currentMission = player:getCurrentMission(invaderXim.mission.log_id.ZILART)

    if
        currentMission == invaderXim.mission.id.zilart.ARK_ANGELS and
        player:getMissionStatus(invaderXim.mission.log_id.ZILART) == 1
    then
        return quest:event(54, invaderXim.item.SHEET_OF_PARCHMENT, invaderXim.item.BOTTLE_OF_ILLUMININK, invaderXim.item.ARK_PENTASPHERE)
    elseif currentMission >= invaderXim.mission.id.zilart.ARK_ANGELS then
        -- NOTE: In order for a player to have the appropriate KI for an event to be displayed, they will be at least
        -- at missionStatus 1, so no need to verify greater than.

        for keyItemId = invaderXim.ki.SHARD_OF_APATHY, invaderXim.ki.SHARD_OF_RAGE do
            if player:hasKeyItem(keyItemId) then
                return quest:event(56, invaderXim.item.SHEET_OF_PARCHMENT, invaderXim.item.BOTTLE_OF_ILLUMININK, invaderXim.item.ARK_PENTASPHERE)
            end
        end
    end
end

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE
        end,

        [invaderXim.zone.THE_SHRINE_OF_RUAVITAU] =
        {
            ['blank_divine_might'] = onTriggerIncomplete,

            onEventFinish =
            {
                [54] = function(player, csid, option, npc)
                    quest:begin(player)
                end,

                [56] = function(player, csid, option, npc)
                    quest:begin(player)
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED
        end,

        [invaderXim.zone.THE_SHRINE_OF_RUAVITAU] =
        {
            ['blank_divine_might'] =
            {
                onTrigger = function(player, npc)
                    if quest:getVar(player, 'Prog') == 1 then
                        return quest:progressEvent(55, invaderXim.item.SUPPANOMIMI, invaderXim.item.KNIGHTS_EARRING, invaderXim.item.ABYSSAL_EARRING, invaderXim.item.BEASTLY_EARRING, invaderXim.item.BUSHINOMIMI)
                    else
                        return onTriggerIncomplete(player, npc)
                    end
                end,
            },

            onEventUpdate =
            {
                [55] = function(player, csid, option, npc)
                    if option == 2 then
                        player:updateEvent(invaderXim.item.SUPPANOMIMI, invaderXim.item.KNIGHTS_EARRING, invaderXim.item.ABYSSAL_EARRING, invaderXim.item.BEASTLY_EARRING, invaderXim.item.BUSHINOMIMI)
                    end
                end,
            },

            onEventFinish =
            {
                [55] = function(player, csid, option, npc)
                    local selectedReward = earringRewards[option]

                    if
                        selectedReward and
                        npcUtil.giveItem(player, selectedReward)
                    then
                        quest:complete(player)

                        -- TODO: Find a way to prevent the need for using a forever charVar here.
                        player:setCharVar('DM_Earring', selectedReward)
                    end
                end,
            },
        },

        [invaderXim.zone.ROMAEVE] =
        {
            ['QuHau_Spring'] =
            {
                onTrade = function(player, npc, trade)
                    local vanaHour = VanadielHour()

                    if
                        IsMoonFull() and
                        (vanaHour >= 18 or vanaHour < 6) and
                        npcUtil.tradeHasExactly(trade, { invaderXim.item.BOTTLE_OF_ILLUMININK, invaderXim.item.SHEET_OF_PARCHMENT })
                    then
                        return quest:progressEvent(7, invaderXim.item.SHEET_OF_PARCHMENT, invaderXim.item.BOTTLE_OF_ILLUMININK)
                    end
                end,
            },

            onEventFinish =
            {
                [7] = function(player, csid, option, npc)
                    if npcUtil.giveItem(player, invaderXim.item.ARK_PENTASPHERE) then
                        player:confirmTrade()
                    end
                end,
            },
        },

        [invaderXim.zone.LALOFF_AMPHITHEATER] =
        {
            onEventFinish =
            {
                [32001] = function(player, csid, option, npc)
                    if player:getLocalVar('battlefieldWin') == invaderXim.battlefield.id.DIVINE_MIGHT then
                        quest:setVar(player, 'Prog', 1)
                    end
                end,
            },
        },
    },
}

return quest
