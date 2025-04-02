-----------------------------------
-- Messenger From Beyond
-----------------------------------
-- Log ID: 0, Quest ID: 87
-----------------------------------
-- Narcheral : !pos 129 -11 126 231
-- qm2       : !pos -716 -10 66 103
-----------------------------------
local ID = zones[invaderXim.zone.VALKURM_DUNES]

local quest = Quest:new(invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.MESSENGER_FROM_BEYOND)

quest.reward =
{
    item = invaderXim.item.BLESSED_HAMMER,
    fame = 20,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE and
                player:getMainLvl() >= invaderXim.settings.main.AF1_QUEST_LEVEL and
                player:getMainJob() == invaderXim.job.WHM
        end,

        [invaderXim.zone.NORTHERN_SAN_DORIA] =
        {
            ['Narcheral'] = quest:progressEvent(689),

            onEventFinish =
            {
                [689] = function(player, csid, option, npc)
                    quest:begin(player)
                end,
            },
        },
    },
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED
        end,

        [invaderXim.zone.VALKURM_DUNES] =
        {
            ['qm2'] =
            {
                onTrigger = function(player, npc)
                    if
                        not player:hasItem(invaderXim.item.TAVNAZIA_PASS) and
                        npcUtil.popFromQM(player, npc, ID.mob.MARCHELUTE, { hide = 0 })
                    then
                        return quest:messageSpecial(ID.text.FOUL_PRESENCE)
                    end
                end,
            },
        },

        [invaderXim.zone.NORTHERN_SAN_DORIA] =
        {
            ['Narcheral'] =
            {
                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHasExactly(trade, invaderXim.item.TAVNAZIA_PASS) then
                        return quest:progressEvent(690)
                    end
                end,
            },

            onEventFinish =
            {
                [690] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:confirmTrade()
                    end
                end,
            },
        },
    },
}

return quest
