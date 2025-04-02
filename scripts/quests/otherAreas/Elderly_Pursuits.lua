-----------------------------------
-- Elderly Pursuits
-----------------------------------
-- Log ID: 4, Quest ID: 75
-----------------------------------
-- Pre-requisite Completed Secrets of Oven Lost Log ID: 4, Quest ID: 73
-----------------------------------
-- Despachiaire     !pos 111.2090 -40.0148 -85.4810
-- Rouva            !pos -16.3326 2.1 10.3829
-- Para NM ???      !pos -414.915 0 -362.9870
-----------------------------------
local ID = zones[invaderXim.zone.CARPENTERS_LANDING]
-----------------------------------

local quest = Quest:new(invaderXim.questLog.OTHER_AREAS, invaderXim.quest.id.otherAreas.ELDERLY_PURSUITS)

quest.reward =
{
    item = invaderXim.item.ELEGANT_RIBBON,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE and
            player:hasCompletedQuest(invaderXim.questLog.OTHER_AREAS, invaderXim.quest.id.otherAreas.SECRETS_OF_OVENS_LOST)
        end,

        [invaderXim.zone.TAVNAZIAN_SAFEHOLD] =
        {
            ['Despachiaire'] = quest:progressEvent(517),

            onEventFinish =
            {
                [517] = function(player, csid, option, npc)
                    quest:begin(player)
                    npcUtil.giveKeyItem(player, invaderXim.ki.ANTIQUE_AMULET)
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED and vars.Prog <= 2
        end,

        [invaderXim.zone.SOUTHERN_SAN_DORIA] =
        {
            ['Rouva'] =
            {
                onTrigger = function(player, npc)
                    if player:hasKeyItem(invaderXim.ki.ANTIQUE_AMULET) then
                        return quest:progressEvent(747)
                    end
                end,
            },

            onEventFinish =
            {
                [747] = function(player, csid, option, npc)
                    quest:setVar(player, 'Prog', 1)
                end,
            },
        },

        [invaderXim.zone.CARPENTERS_LANDING] =
        {
            ['qm_para'] =
            {
                onTrigger = function(player, npc)
                    if
                        quest:getVar(player, 'Prog') == 1 and
                        npcUtil.popFromQM(player, npc, ID.mob.PARA, { claim = true, hide = 0 })
                    then
                        return quest:messageSpecial(ID.text.STENCH_OF_DECAY)
                    elseif
                        quest:getVar(player, 'Prog') == 2 and
                        player:hasKeyItem(invaderXim.ki.ANTIQUE_AMULET)
                    then
                        quest:setVar(player, 'Prog', 3)
                        player:delKeyItem(invaderXim.ki.ANTIQUE_AMULET)
                        player:addKeyItem(invaderXim.ki.CATHEDRAL_MEDALLION)
                        player:messageSpecial(ID.text.POLISH_MUSHROOM_SPORE, invaderXim.ki.ANTIQUE_AMULET)
                        return quest:messageSpecial(ID.text.KEYITEM_OBTAINED, invaderXim.ki.CATHEDRAL_MEDALLION)
                    end
                end,
            },

            --The player only needs to kill the original Para. There are player reports of them killing the original getting the KI and chaining the clones to zone.
            ['Para'] =
            {
                onMobDeath = function(mob, player, optParams)
                    if
                        mob:getID() == ID.mob.PARA and
                        quest:getVar(player, 'Prog') == 1
                    then
                        quest:setVar(player, 'Prog', 2)
                    end
                end,
            },

            -- Resets the progress if the player killed Para but didn't check the ??? before zoning. Will result in the player needing to refight.
            onZoneOut = function(player)
                if quest:getVar(player, 'Prog') == 2 then
                    quest:setVar(player, 'Prog', 1)
                end
            end,
        },
    },

    {

        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED and vars.Prog >= 3
        end,

        [invaderXim.zone.SOUTHERN_SAN_DORIA] =
        {
            ['Rouva'] =
            {
                onTrigger = function(player, npc)
                    if player:hasKeyItem(invaderXim.ki.CATHEDRAL_MEDALLION) then
                        return quest:progressEvent(748)
                    end
                end,
            },

            onEventFinish =
            {
                [748] = function(player, csid, option, npc)
                    quest:setVar(player, 'Prog', 4)
                end,
            },
        },

        [invaderXim.zone.TAVNAZIAN_SAFEHOLD] =
        {
            ['Despachiaire'] =
            {
                onTrigger = function(player, npc)
                    if quest:getVar(player, 'Prog') == 4 then
                        return quest:progressEvent(518)
                    end
                end,
            },

            onEventFinish =
            {
                [518] = function(player, csid, option, npc)
                    quest:complete(player)
                    player:delKeyItem(invaderXim.ki.CATHEDRAL_MEDALLION)
                end,
            },
        },
    },
}

return quest
