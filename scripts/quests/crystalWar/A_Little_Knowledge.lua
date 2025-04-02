-----------------------------------
-- A Little Knowledge
-----------------------------------
-- !addquest 7 6
-- Erlene : !pos 376.936 -39.999 17.914 175
-----------------------------------
local eldiemeSID = zones[invaderXim.zone.THE_ELDIEME_NECROPOLIS_S]
-----------------------------------

local quest = Quest:new(invaderXim.questLog.CRYSTAL_WAR, invaderXim.quest.id.crystalWar.A_LITTLE_KNOWLEDGE)

quest.reward =
{
    keyItem = { invaderXim.ki.GRIMOIRE, invaderXim.ki.JOB_GESTURE_SCHOLAR },
    title   = invaderXim.title.SCHULTZ_SCHOLAR,
}

local validMageJobs = set{ invaderXim.job.BLM, invaderXim.job.RDM, invaderXim.job.SMN, invaderXim.job.BLU }

local tuckerEventFinish = function(player, csid, option, npc)
    local numAwarded = quest:getLocalVar(player, 'numAwarded')

    if npcUtil.giveItem(player, { { invaderXim.item.SHEET_OF_VELLUM, numAwarded } }) then
        player:confirmTrade()
        quest:incrementVar(player, 'Option', 1)
    end
end

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE and
                player:getMainLvl() >= invaderXim.settings.main.ADVANCED_JOB_LEVEL
        end,

        [invaderXim.zone.THE_ELDIEME_NECROPOLIS_S] =
        {
            ['Erlene'] = quest:progressEvent(10, 1),

            onEventFinish =
            {
                [10] = function(player, csid, option, npc)
                    if option == 0 then
                        quest:begin(player)
                    end
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED
        end,

        [invaderXim.zone.CRAWLERS_NEST_S] =
        {
            ['Tucker'] =
            {
                onTrade = function(player, npc, trade)
                    local questOption = quest:getVar(player, 'Option')

                    -- Note: The number of vellum rewarded per trade is determined by the number of stacks traded, so
                    -- the below condition checks if the player is in the correct state, has only rolanberries in the trade
                    -- container, and has at _least_ one stack in the trade.  The minimum one stack needs to be verified.

                    -- In addition, need to determine if partial stacks are consumed and implement that if needed.

                    if
                        questOption >= 1 and
                        questOption <= 3 and
                        trade:getItemQty(invaderXim.item.ROLANBERRY) >= 12 and
                        trade:hasItemQty(invaderXim.item.ROLANBERRY, trade:getItemCount())
                    then
                        local numAwardedVellum = math.min(4, math.floor(trade:getItemCount() / 12))

                        trade:confirmItem(invaderXim.item.ROLANBERRY, numAwardedVellum * 12)
                        quest:setLocalVar(player, 'numAwarded', numAwardedVellum)

                        if questOption == 1 then
                            return quest:progressEvent(8)
                        elseif questOption == 2 then
                            return quest:progressEvent(10)
                        elseif questOption == 3 then
                            return quest:progressEvent(11)
                        end
                    else
                        return quest:progressEvent(14)
                    end
                end,

                onTrigger = function(player, npc)
                    if quest:getVar(player, 'Prog') == 0 then
                        local questOption = quest:getVar(player, 'Option')

                        if questOption == 0 then
                            return quest:progressEvent(6)
                        elseif questOption == 1 then
                            return quest:event(7)
                        elseif questOption <= 3 then
                            return quest:event(9)
                        elseif questOption == 4 then
                            return quest:event(12)
                        end
                    end
                end,
            },

            onEventFinish =
            {
                [6] = function(player, csid, option, npc)
                    quest:setVar(player, 'Option', 1)
                end,

                [8]  = tuckerEventFinish,
                [10] = tuckerEventFinish,
                [11] = tuckerEventFinish,
            },
        },

        [invaderXim.zone.THE_ELDIEME_NECROPOLIS_S] =
        {
            ['Erlene'] =
            {
                onTrade = function(player, npc, trade)
                    if
                        quest:getVar(player, 'Prog') == 0 and
                        npcUtil.tradeHasExactly(trade, { { invaderXim.item.SHEET_OF_VELLUM, 12 } })
                    then
                        local isMageJob = validMageJobs[player:getMainJob()] and 1 or 0

                        return quest:progressEvent(12, isMageJob)
                    end
                end,

                onTrigger = function(player, npc)
                    local questProgress = quest:getVar(player, 'Prog')

                    if questProgress == 0 then
                        return quest:event(11)
                    elseif questProgress == 1 then
                        if
                            player:hasStatusEffect(invaderXim.effect.MANAFONT) or
                            player:hasStatusEffect(invaderXim.effect.CHAINSPELL) or
                            player:hasStatusEffect(invaderXim.effect.ASTRAL_FLOW) or
                            player:hasStatusEffect(invaderXim.effect.AZURE_LORE)
                        then
                            return quest:progressEvent(14)
                        else
                            return quest:event(13)
                        end
                    end
                end,
            },

            onEventFinish =
            {
                [12] = function(player, csid, option, npc)
                    player:confirmTrade()
                    quest:setVar(player, 'Prog', 1)
                end,

                [14] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:unlockJob(invaderXim.job.SCH)
                        player:messageSpecial(eldiemeSID.text.YOU_CAN_NOW_BECOME_A_SCHOLAR)
                    end
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_COMPLETED
        end,

        [invaderXim.zone.THE_ELDIEME_NECROPOLIS_S] =
        {
            ['Erlene'] =
            {
                onTrigger = function(player, npc)
                    if
                        player:canLearnSpell(invaderXim.magic.spell.EMBRAVA) and
                        player:canLearnSpell(invaderXim.magic.spell.KAUSTRA)
                    then
                        return quest:progressEvent(47)
                    else
                        return quest:event(15):replaceDefault()
                    end
                end
            },

            onEventFinish =
            {
                [47] = function(player, csid, option, npc)
                    player:addSpell(invaderXim.magic.spell.EMBRAVA, true)
                    player:addSpell(invaderXim.magic.spell.KAUSTRA, true)
                    player:messageSpecial(eldiemeSID.text.YOU_LEARN_EMBRAVA_AND_KAUSTRA)
                end,
            }
        },
    },
}

return quest
