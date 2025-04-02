-----------------------------------
-- True Strength
-----------------------------------
-- Log ID: 1, Quest ID: 53
-- Ayame           : !pos 133 -19 34 237
-- qm_truestrength : !pos -100 -71 -132 151
-----------------------------------
local oztrojaID = zones[invaderXim.zone.CASTLE_OZTROJA]
-----------------------------------

local quest = Quest:new(invaderXim.questLog.BASTOK, invaderXim.quest.id.bastok.TRUE_STRENGTH)

quest.reward =
{
    fame     = 60,
    fameArea = invaderXim.fameArea.BASTOK,
    item     = invaderXim.item.TEMPLE_HOSE,
    title    = invaderXim.title.PARAGON_OF_MONK_EXCELLENCE,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE and
                player:hasCompletedQuest(invaderXim.questLog.BASTOK, invaderXim.quest.id.bastok.THE_FIRST_MEETING) and
                player:getMainJob() == invaderXim.job.MNK and
                player:getMainLvl() >= invaderXim.settings.main.AF3_QUEST_LEVEL
        end,

        [invaderXim.zone.METALWORKS] =
        {
            ['Ayame'] = quest:progressEvent(748),

            onEventFinish =
            {
                [748] = function(player, csid, option, npc)
                    quest:begin(player)
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED
        end,

        [invaderXim.zone.CASTLE_OZTROJA] =
        {
            ['qm_truestrength'] =
            {
                onTrade = function(player, npc, trade)
                    if
                        npcUtil.tradeHasExactly(trade, invaderXim.item.BOTTLE_OF_YAGUDO_DRINK) and
                        not player:hasItem(invaderXim.item.XALMO_FEATHER) and
                        npcUtil.popFromQM(player, npc, oztrojaID.mob.HUU_XALMO_THE_SAVAGE, { hide = 0 })
                    then
                        player:confirmTrade()

                        return quest:messageSpecial(oztrojaID.text.SENSE_OF_FOREBODING)
                    end
                end,
            },
        },

        [invaderXim.zone.METALWORKS] =
        {
            ['Ayame'] =
            {
                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHasExactly(trade, invaderXim.item.XALMO_FEATHER) then
                        return quest:progressEvent(749)
                    end
                end,
            },

            onEventFinish =
            {
                [749] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:confirmTrade()
                    end
                end,
            },
        },
    },
}

return quest
