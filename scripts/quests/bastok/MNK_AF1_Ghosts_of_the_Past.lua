-----------------------------------
-- Ghosts of the Past
-----------------------------------
-- Log ID: 1, Quest ID: 51
-- Oggbi : !pos -159 -7 5 236
-- qm4   : !pos -174 0 369 196
-----------------------------------
local gusgenMinesID = zones[invaderXim.zone.GUSGEN_MINES]
-----------------------------------

local quest = Quest:new(invaderXim.questLog.BASTOK, invaderXim.quest.id.bastok.GHOSTS_OF_THE_PAST)

quest.reward =
{
    fame     = 20,
    fameArea = invaderXim.fameArea.BASTOK,
    item     = invaderXim.item.BEAT_CESTI,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE and
                player:getMainJob() == invaderXim.job.MNK and
                player:getMainLvl() >= invaderXim.settings.main.AF1_QUEST_LEVEL
        end,

        [invaderXim.zone.PORT_BASTOK] =
        {
            ['Oggbi'] = quest:progressEvent(231),

            onEventFinish =
            {
                [231] = function(player, csid, option, npc)
                    quest:begin(player)
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED
        end,

        [invaderXim.zone.GUSGEN_MINES] =
        {
            ['qm4'] =
            {
                onTrade = function(player, npc, trade)
                    if
                        npcUtil.tradeHasExactly(trade, invaderXim.item.PICKAXE) and
                        not player:hasItem(invaderXim.item.MINERS_PENDANT) and
                        not GetMobByID(gusgenMinesID.mob.WANDERING_GHOST):isSpawned()
                    then
                        player:confirmTrade()
                        SpawnMob(gusgenMinesID.mob.WANDERING_GHOST):updateClaim(player)

                        -- TODO: Determine if this spawn has a message associated with it.
                        return quest:noAction()
                    end
                end,
            },
        },

        [invaderXim.zone.PORT_BASTOK] =
        {
            ['Oggbi'] =
            {
                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHasExactly(trade, invaderXim.item.MINERS_PENDANT) then
                        return quest:progressEvent(232)
                    end
                end,
            },

            onEventFinish =
            {
                [232] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:confirmTrade()

                        invaderXim.quest.setMustZone(player, invaderXim.questLog.BASTOK, invaderXim.quest.id.bastok.THE_FIRST_MEETING)
                    end
                end,
            },
        },
    },
}

return quest
