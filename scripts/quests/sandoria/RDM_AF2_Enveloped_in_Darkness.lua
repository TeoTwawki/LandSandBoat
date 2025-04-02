-----------------------------------
-- Enveloped in Darkness
-- Variable Prefix: [0][85]
-----------------------------------
-- ZONE                 NPC          POS
-- Chateau d'Oraguille, Curilla,     !pos 27 0.1 0.1 233
-- Northern San'doria,  Pagisalis,   !pos 97 0.1 113 231
-----------------------------------
local crawlersID = zones[invaderXim.zone.CRAWLERS_NEST]
-----------------------------------

local quest = Quest:new(invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.ENVELOPED_IN_DARKNESS)

quest.reward =
{
    item     = invaderXim.item.WARLOCKS_BOOTS,
    fame     = 30,
    fameArea = invaderXim.fameArea.SANDORIA,
}

quest.sections =
{
    -- Section: Quest available.
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE and
                player:getQuestStatus(invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.THE_CRIMSON_TRIAL) == invaderXim.questStatus.QUEST_COMPLETED and
                player:getMainJob() == invaderXim.job.RDM and
                player:getMainLvl() >= invaderXim.settings.main.AF2_QUEST_LEVEL
        end,

        [invaderXim.zone.CHATEAU_DORAGUILLE] =
        {
            ['Curilla'] =
            {
                onTrigger = function(player, npc)
                    if quest:getVar(player, 'Prog') == 0 then
                        return quest:progressEvent(94) -- First starting event.
                    else
                        return quest:progressEvent(95) -- Next starting event if originaly declined.
                    end
                end,
            },

            onEventFinish =
            {
                [94] = function(player, csid, option, npc)
                    if option == 1 then -- Accept quest.
                        quest:begin(player)
                        npcUtil.giveKeyItem(player, invaderXim.ki.OLD_POCKET_WATCH)
                    else
                        quest:setVar(player, 'Prog', 1) -- You rejected the quest when first offered.
                    end
                end,

                [95] = function(player, csid, option, npc)
                    if option == 1 then -- Accept quest.
                        quest:begin(player)
                        npcUtil.giveKeyItem(player, invaderXim.ki.OLD_POCKET_WATCH)
                    end
                end,
            },
        },

        [invaderXim.zone.SOUTHERN_SAN_DORIA] =
        {
            ['Sharzalion'] = quest:event(68)
        },
    },

    -- Section: Quest accepted
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED
        end,

        [invaderXim.zone.CHATEAU_DORAGUILLE] =
        {
            ['Curilla'] =
            {
                onTrigger = function(player, npc)
                    if quest:getVar(player, 'Prog') <= 1 then
                        return quest:event(92) -- Church reminder.
                        -- NOTE: Curilla has a second posible reminder event in this step (event 93). From context, it seems time triggered.
                    elseif quest:getVar(player, 'Prog') == 2 then
                        return quest:progressEvent(101) -- Post church ghost event. (Optional)
                    else
                        return quest:event(107) -- Crawler blood reminder.
                    end
                end,
            },

            onEventFinish =
            {
                [101] = function(player, csid, option, npc)
                    quest:setVar(player, 'Prog', 3) -- Set optional event as seen.
                end,
            },
        },

        [invaderXim.zone.CRAWLERS_NEST] =
        {
            ['qm8'] =
            {
                onTrigger = function(player, npc)
                    if quest:getVar(player, 'Prog') >= 2 then
                        if quest:getVar(player, 'Time') > 0 then
                            if quest:getVar(player, 'Time') <= os.time() then
                                return quest:progressEvent(5) -- Quest complete.
                            else
                                return quest:messageSpecial(crawlersID.text.EQUIPMENT_NOT_PURIFIED) -- Purification incomplete.
                            end
                        else
                            if
                                player:hasKeyItem(invaderXim.ki.CRAWLER_BLOOD) and
                                player:hasKeyItem(invaderXim.ki.OLD_BOOTS)
                            then
                                return quest:progressEvent(4) -- Loose key items. Start boot purification.
                            else
                                return quest:messageSpecial(crawlersID.text.SOMEONE_HAS_BEEN_DIGGING_HERE)
                            end
                        end
                    end
                end,
            },

            onEventFinish =
            {
                [4] = function(player, csid, option, npc)
                    if option == 1 then
                        -- Set purification time.
                        quest:setVar(player, 'Time', os.time() + 30)

                        -- Delete Key items.
                        player:delKeyItem(invaderXim.ki.CRAWLER_BLOOD)
                        player:delKeyItem(invaderXim.ki.OLD_BOOTS)

                        -- Message when acepting to bury boots and blood.
                        player:messageSpecial(crawlersID.text.YOU_BURY_THE, invaderXim.ki.OLD_BOOTS, invaderXim.ki.CRAWLER_BLOOD)
                    end
                end,

                [5] = function(player, csid, option, npc)
                    quest:complete(player)
                end,
            },
        },

        [invaderXim.zone.NORTHERN_SAN_DORIA] =
        {
            ['Pagisalis'] =
            {
                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHasExactly(trade, invaderXim.item.SQUARE_OF_VELVET_CLOTH) then
                        return quest:progressEvent(37)
                    end
                end,

                onTrigger = function(player, npc)
                    if quest:getVar(player, 'Prog') >= 2 then
                        return quest:event(58) -- After seing ghost.
                    else
                        return quest:event(48)
                    end
                end,
            },

            onEventFinish =
            {
                [37] = function(player, csid, option, npc)
                    quest:setVar(player, 'Prog', 2) -- Saw ghost.
                    player:tradeComplete()
                    player:delKeyItem(invaderXim.ki.OLD_POCKET_WATCH)
                    npcUtil.giveKeyItem(player, invaderXim.ki.OLD_BOOTS)
                end,
            },
        },

        [invaderXim.zone.SOUTHERN_SAN_DORIA] =
        {
            ['Sharzalion'] =
            {
                onTrigger = function(player, npc)
                    if quest:getVar(player, 'Prog') >= 2 then
                        return quest:event(69) -- After seing ghost.
                    else
                        return quest:event(68)
                    end
                end,
            },
        },
    },
}

return quest
