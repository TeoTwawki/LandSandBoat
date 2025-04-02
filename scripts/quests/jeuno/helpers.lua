-----------------------------------
-- Helpers for Jeuno quests
-----------------------------------
xi = xi or {}
invaderXim.jeuno = invaderXim.jeuno or {}
invaderXim.jeuno.helpers = invaderXim.jeuno.helpers or {}

-- Base class for use by the Gobbiebag questline to reduce redundant code.
-- The quests differ slightly in requested items, inventory size key, text, etc.
-- The params parameter stores the tunable information needed to perform the proper quest in the chain.
invaderXim.jeuno.helpers.GobbiebagQuest = {}

setmetatable(invaderXim.jeuno.helpers.GobbiebagQuest, { __index = Quest })
invaderXim.jeuno.helpers.GobbiebagQuest.__index = invaderXim.jeuno.helpers.GobbiebagQuest

function invaderXim.jeuno.helpers.GobbiebagQuest:new(params)
    local quest = Quest:new(invaderXim.questLog.JEUNO, params.questId)

    quest.reward = params.reward

    local bagIncrease = 5

    -- If quest is available or accepted, the correct dialogue ID is the expected pre quest inventory size offset by 1
    local getPendingDialogueId = function(player)
        return (player:getContainerSize(invaderXim.inv.INVENTORY) + 1)
    end

    -- If quest is completed, the correct dialogue ID is the expected post quest inventory size offset by 1
    local getCompleteDiaglogueId = function(player)
        return (player:getContainerSize(invaderXim.inv.INVENTORY) + bagIncrease + 1)
    end

    local getReqsMet = function(player)
        return  player:getFameLevel(invaderXim.fameArea.JEUNO) >= params.fame and
                player:getContainerSize(invaderXim.inv.INVENTORY) == params.startInventorySize and
                (params.prerequisite == nil or player:hasCompletedQuest(invaderXim.questLog.JEUNO, params.prerequisite))
    end

    quest.sections =
    {
        {
            check = function(player, status, vars)
                return status == invaderXim.questStatus.QUEST_AVAILABLE and getReqsMet(player)
            end,

            [invaderXim.zone.LOWER_JEUNO] =
            {
                ['Bluffnix'] =
                {
                    onTrigger = function(player, npc)
                        return quest:progressEvent(43, getPendingDialogueId(player), invaderXim.questStatus.QUEST_AVAILABLE, getReqsMet(player) and 1 or 0)
                    end
                },

                onEventFinish =
                {
                    [43] = function(player, csid, option, npc)
                        if option == 0 then
                            quest:begin(player)
                        end
                    end
                },
            },
        },

        {
            check = function(player, status, vars)
                return status == invaderXim.questStatus.QUEST_ACCEPTED and getReqsMet(player)
            end,

            [invaderXim.zone.LOWER_JEUNO] =
            {
                ['Bluffnix'] =
                {
                    onTrade = function(player, npc, trade)
                        if
                            npcUtil.tradeHasExactly(trade, params.tradeItems) or
                            npcUtil.tradeHasExactly(trade, params.tradeStew)
                        then
                            return quest:progressEvent(73, getCompleteDiaglogueId(player))
                        else
                            return quest:progressEvent(43, getPendingDialogueId(player), invaderXim.questStatus.QUEST_ACCEPTED, 1)
                        end
                    end,

                    onTrigger = function(player, npc)
                        return quest:progressEvent(43, getPendingDialogueId(player), invaderXim.questStatus.QUEST_ACCEPTED, 1)
                    end,
                },

                onEventFinish =
                {
                    [73] = function(player, csid, option, npc)
                        if quest:complete(player) then
                            player:changeContainerSize(invaderXim.inv.INVENTORY, bagIncrease)
                            player:changeContainerSize(invaderXim.inv.MOGSATCHEL, bagIncrease)
                            player:messageSpecial(params.message)
                            player:confirmTrade()
                        end
                    end
                },
            },
        },
    }

    self.__index = self
    setmetatable(quest, self)
    return quest
end
