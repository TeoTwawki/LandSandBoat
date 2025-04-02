-----------------------------------
-- Welcome to Bastok
-----------------------------------
-- Log ID: 1, Quest ID: 3
-- Powhatan    : !pos -152.135 -7.48 19.014 236
-- Steel Bones : !pos -185.766 1.999 -57.631 236
-----------------------------------

local quest = Quest:new(invaderXim.questLog.BASTOK, invaderXim.quest.id.bastok.GUEST_OF_HAUTEUR)

quest.reward =
{
    fame     = 80,
    fameArea = invaderXim.fameArea.BASTOK,
    item     = invaderXim.item.TARGE,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE and
                player:getFameLevel(invaderXim.fameArea.BASTOK) >= 3 and
                player:getMainLvl() >= 31 and
                player:hasCompletedQuest(invaderXim.questLog.BASTOK, invaderXim.quest.id.bastok.WELCOME_TO_BASTOK)
        end,

        [invaderXim.zone.PORT_BASTOK] =
        {
            ['Powhatan'] = quest:progressEvent(55),

            onEventFinish =
            {
                [55] = function(player, csid, option, npc)
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

        [invaderXim.zone.PORT_BASTOK] =
        {
            ['Powhatan'] =
            {
                onTrigger = function(player, npc)
                    if not player:hasKeyItem(invaderXim.ki.LETTER_FROM_DOMIEN) then
                        return quest:event(56)
                    else
                        return quest:progressEvent(58)
                    end
                end,
            },

            ['Steel_Bones'] =
            {
                onTrigger = function(player, npc)
                    local mainSlot = player:getEquipID(invaderXim.slot.MAIN)

                    if
                        not player:hasKeyItem(invaderXim.ki.LETTER_FROM_DOMIEN) and
                        (mainSlot == invaderXim.item.MAUL or
                        mainSlot == invaderXim.item.REPLICA_MAUL)
                    then
                        return quest:progressEvent(57)
                    end
                end,
            },

            onEventFinish =
            {
                [57] = function(player, csid, option, npc)
                    npcUtil.giveKeyItem(player, invaderXim.ki.LETTER_FROM_DOMIEN)
                end,

                [58] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:delKeyItem(invaderXim.ki.LETTER_FROM_DOMIEN)
                    end
                end,
            },
        },
    },
}

return quest
