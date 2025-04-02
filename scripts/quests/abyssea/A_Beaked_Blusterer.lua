-----------------------------------
-- A_Beaked_Blusterer
-----------------------------------
-- !addquest 8 176
-----------------------------------

local quest = Quest:new(invaderXim.questLog.ABYSSEA, invaderXim.quest.id.abyssea.A_BEAKED_BLUSTERER)

quest.reward = {}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE and
                invaderXim.abyssea.getHeldTraverserStones(player) >= 1 and
                player:getQuestStatus(invaderXim.questLog.ABYSSEA, invaderXim.quest.id.abyssea.DAWN_OF_DEATH) >= invaderXim.questStatus.QUEST_ACCEPTED
        end,

        [invaderXim.zone.SOUTH_GUSTABERG] =
        {
            ['Cavernous_Maw'] =
            {
                onTrigger = function(player, npc)
                    return quest:progressEvent(0)
                end,
            },

            onEventFinish =
            {
                [0] = function(player, csid, option, npc)
                    quest:begin(player)
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED and player:hasTitle(invaderXim.title.BENNU_DEPLUMER)
        end,

        [invaderXim.zone.SOUTH_GUSTABERG] =
        {
            onZoneIn = function(player, prevZone)
                return 1
            end,

            onEventUpdate =
            {
                [1] = function(player, csid, option, npc)
                    if option == 1 then
                        player:updateEvent(invaderXim.abyssea.getZoneKIReward(player))
                    end
                end,
            },

            onEventFinish =
            {
                [1] = function(player, csid, option, npc)
                    -- NOTE: Give the key item prior to completing the quest so that we reward the correct
                    -- KI!  If we complete first, it'll adjust the total completed count, and be off by one!
                    npcUtil.giveKeyItem(player, invaderXim.abyssea.getZoneKIReward(player))
                    quest:complete(player)
                end,
            },
        },
    },
}

return quest
