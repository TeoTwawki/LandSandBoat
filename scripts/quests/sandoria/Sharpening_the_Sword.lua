-----------------------------------
-- Sharpening the Sword
-----------------------------------
-- Log ID: 0, Quest ID: 90
-----------------------------------
-- Ailbeche   : !pos 4 -1 24 231
-- Sobane     : !pos -190 -3 97 230
-- Stalagmite : !pos -51 0.1 3 193
-----------------------------------
local northID = zones[invaderXim.zone.NORTHERN_SAN_DORIA]
local cavesID = zones[invaderXim.zone.ORDELLES_CAVES]

local quest = Quest:new(invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.SHARPENING_THE_SWORD)

quest.reward =
{
    item = invaderXim.item.HONOR_SWORD,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE and
                player:hasTitle(invaderXim.title.FAMILY_COUNSELOR) and
                player:getMainLvl() >= invaderXim.settings.main.AF1_QUEST_LEVEL and
                player:getMainJob() == invaderXim.job.PLD
        end,

        [invaderXim.zone.NORTHERN_SAN_DORIA] =
        {
            ['Ailbeche'] =
            {
                onTrigger = function(player, npc)
                    if quest:getVar(player, 'Option') == 0 then
                        return quest:progressEvent(45)
                    else
                        return quest:event(43):setPriority(200)
                    end
                end,
            },

            onEventFinish =
            {
                [43] = function(player, csid, option, npc)
                    if option == 1 then
                        quest:setVar(player, 'Option', 0)
                        quest:begin(player)
                    end
                end,

                [45] = function(player, csid, option, npc)
                    if option == 1 then
                        quest:begin(player)
                    else
                        quest:setVar(player, 'Option', 1)
                    end
                end,
            },
        },
    },
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED and
                not player:hasKeyItem(invaderXim.ki.ORDELLE_WHETSTONE)
        end,

        [invaderXim.zone.NORTHERN_SAN_DORIA] =
        {
            ['Ailbeche'] = quest:event(42),
        },

        [invaderXim.zone.SOUTHERN_SAN_DORIA] =
        {
            ['Sobane'] = quest:event(52),
        },

        [invaderXim.zone.ORDELLES_CAVES] =
        {
            ['Stalagmite'] =
            {
                onTrigger = function(player, npc)
                    local hasKilled = quest:getLocalVar(player, 'Stage')
                    if hasKilled == 1 then
                        quest:setLocalVar(player, 'Stage', 0)
                        return quest:keyItem(invaderXim.ki.ORDELLE_WHETSTONE)
                    elseif npcUtil.popFromQM(player, npc, cavesID.mob.POLEVIK, { hide = 0 }) then
                        return quest:noAction()
                    else
                        player:messageSpecial(cavesID.text.DRY_WIND + 1, invaderXim.ki.ORDELLE_WHETSTONE)
                        return quest:messageSpecial(cavesID.text.DRY_WIND)
                    end
                end,
            },

            ['Polevik'] =
            {
                onMobDeath = function(mob, player, optParams)
                    quest:setLocalVar(player, 'Stage', 1)
                end,
            },
        },
    },
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED and
                player:hasKeyItem(invaderXim.ki.ORDELLE_WHETSTONE)
        end,

        [invaderXim.zone.SOUTHERN_SAN_DORIA] =
        {
            ['Sobane'] = quest:event(52),
        },

        [invaderXim.zone.NORTHERN_SAN_DORIA] =
        {
            ['Ailbeche'] = quest:progressEvent(44),

            onEventFinish =
            {
                [44] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:delKeyItem(invaderXim.ki.ORDELLE_WHETSTONE)
                    end
                end,
            },
        },
    },
    {
        check = function(player, status)
            return status == invaderXim.questStatus.QUEST_COMPLETED and
                player:getQuestStatus(invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.A_BOY_S_DREAM) == invaderXim.quest.status.AVAILABLE
        end,

        [invaderXim.zone.NORTHERN_SAN_DORIA] =
        {
            ['Ailbeche'] = quest:message(northID.text.AILBECHE_WHEN_FISHING):replaceDefault()
        },
    },
}

return quest
