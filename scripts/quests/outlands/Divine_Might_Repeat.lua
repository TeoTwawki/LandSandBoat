-----------------------------------
-- Divine Might (Repeat)
-----------------------------------
-- Log ID: 5, Quest ID: 164
-- blank_divine_might : !pos -40 0 -151 178
-- Qu'Hau Spring      : !pos 0 -29 64 122
-----------------------------------

local quest = Quest:new(invaderXim.questLog.OUTLANDS, invaderXim.quest.id.outlands.DIVINE_MIGHT_REPEAT)

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

quest.sections =
{
    {
        check = function(player, status, vars)
            return status ~= invaderXim.questStatus.QUEST_ACCEPTED and
                player:hasCompletedQuest(invaderXim.questLog.OUTLANDS, invaderXim.quest.id.outlands.DIVINE_MIGHT)
        end,

        [invaderXim.zone.THE_SHRINE_OF_RUAVITAU] =
        {
            ['blank_divine_might'] =
            {
                onTrigger = function(player, npc)
                    local numEarrings = 0
                    for itemId = invaderXim.item.SUPPANOMIMI, invaderXim.item.BUSHINOMIMI do
                        if player:hasItem(itemId) then
                            numEarrings = numEarrings + 1
                        end
                    end

                    if numEarrings < invaderXim.settings.main.NUMBER_OF_DM_EARRINGS then
                        return quest:progressEvent(57, player:getCharVar('DM_Earring'))
                    end
                end,
            },

            onEventFinish =
            {
                [57] = function(player, csid, option, npc)
                    player:delQuest(invaderXim.questLog.OUTLANDS, invaderXim.quest.id.outlands.DIVINE_MIGHT_REPEAT)
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
                    local hasMoonOre = player:hasKeyItem(invaderXim.ki.MOONLIGHT_ORE)

                    if quest:getVar(player, 'Prog') == 0 then
                        if not hasMoonOre then
                            return quest:event(58)
                        else
                            return quest:event(56, invaderXim.item.SHEET_OF_PARCHMENT, invaderXim.item.BOTTLE_OF_ILLUMININK, invaderXim.item.ARK_PENTASPHERE)
                        end
                    elseif hasMoonOre then
                        return quest:progressEvent(59)
                    end
                end,
            },

            onEventUpdate =
            {
                [59] = function(player, csid, option, npc)
                    if option == 2 then
                        player:updateEvent(invaderXim.item.SUPPANOMIMI, invaderXim.item.KNIGHTS_EARRING, invaderXim.item.ABYSSAL_EARRING, invaderXim.item.BEASTLY_EARRING, invaderXim.item.BUSHINOMIMI)
                    end
                end,
            },

            onEventFinish =
            {
                [59] = function(player, csid, option, npc)
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
                        (vanaHour >= 18 or vanaHour < 6)
                    then
                        if npcUtil.tradeHasExactly(trade, { invaderXim.item.BOTTLE_OF_ILLUMININK, invaderXim.item.SHEET_OF_PARCHMENT }) then
                            return quest:progressEvent(7, invaderXim.item.SHEET_OF_PARCHMENT, invaderXim.item.BOTTLE_OF_ILLUMININK)
                        elseif
                            npcUtil.tradeHasExactly(trade, invaderXim.item.CHUNK_OF_LIGHT_ORE) and
                            not player:hasKeyItem(invaderXim.ki.MOONLIGHT_ORE)
                        then
                            return quest:progressEvent(8)
                        end
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

                [8] = function(player, csid, option, npc)
                    npcUtil.giveKeyItem(player, invaderXim.ki.MOONLIGHT_ORE)
                    player:confirmTrade()
                end,
            },
        },

        [invaderXim.zone.LALOFF_AMPHITHEATER] =
        {
            onEventFinish =
            {
                [32001] = function(player, csid, option, npc)
                    if
                        player:getLocalVar('battlefieldWin') == invaderXim.battlefield.id.DIVINE_MIGHT and
                        player:hasKeyItem(invaderXim.ki.MOONLIGHT_ORE)
                    then
                        quest:setVar(player, 'Prog', 1)
                    end
                end,
            },
        },
    },
}

return quest
