-----------------------------------
-- Megadrile Menace
-----------------------------------
-- !addquest 8 165
-----------------------------------
local tahrongiID = zones[invaderXim.zone.TAHRONGI_CANYON]
-----------------------------------

local quest = Quest:new(invaderXim.questLog.ABYSSEA, invaderXim.quest.id.abyssea.MEGADRILE_MENACE)

quest.reward = { }

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE and
                invaderXim.abyssea.getHeldTraverserStones(player) >= 1 and
                player:getQuestStatus(invaderXim.questLog.ABYSSEA, invaderXim.quest.id.abyssea.DAWN_OF_DEATH) >= invaderXim.questStatus.QUEST_ACCEPTED
        end,

        [invaderXim.zone.LA_THEINE_PLATEAU] =
        {
            ['Cavernous_Maw'] =
            {
                onTrigger = function(player, npc)
                    return quest:progressEvent(38)
                end,
            },

            onEventFinish =
            {
                [38] = function(player, csid, option, npc)
                    quest:begin(player)
                    player:addCurrency('cruor', 50)
                    player:messageSpecial(tahrongiID.text.CRUOR_OBTAINED, 50, player:getCurrency('cruor'))
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED and player:hasTitle(invaderXim.title.GLAVOID_STAMPEDER)
        end,

        [invaderXim.zone.LA_THEINE_PLATEAU] =
        {
            onZoneIn = function(player, prevZone)
                return 39
            end,

            onEventUpdate =
            {
                [39] = function(player, csid, option, npc)
                    if option == 1 then
                        player:updateEvent(invaderXim.abyssea.getZoneKIReward(player))
                    end
                end,
            },

            onEventFinish =
            {
                [39] = function(player, csid, option, npc)
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
