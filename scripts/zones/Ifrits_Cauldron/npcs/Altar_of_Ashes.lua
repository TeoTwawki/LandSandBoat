-----------------------------------
-- Area: Ifrit's Cauldron
--  NPC: Altar of Ashes
-- Involved in Quest: Greetings to the Guardian
-- !pos 16 .1 -58 205
-----------------------------------
local ID = zones[invaderXim.zone.IFRITS_CAULDRON]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    local guardian = player:getQuestStatus(invaderXim.questLog.OUTLANDS, invaderXim.quest.id.outlands.GREETINGS_TO_THE_GUARDIAN)

    if
        guardian == invaderXim.questStatus.QUEST_ACCEPTED and
        trade:hasItemQty(invaderXim.item.BUNCH_OF_WILD_PAMAMAS, 1)
    then
        player:messageSpecial(ID.text.ALTAR_OFFERING, 0, invaderXim.item.BUNCH_OF_WILD_PAMAMAS)
        player:setCharVar('PamamaVar', 1) -- Set variable to reflect first completion of quest
        player:tradeComplete()
    elseif
        guardian == invaderXim.questStatus.QUEST_COMPLETED and
        trade:hasItemQty(invaderXim.item.BUNCH_OF_WILD_PAMAMAS, 1)
    then
        player:messageSpecial(ID.text.ALTAR_OFFERING, 0, invaderXim.item.BUNCH_OF_WILD_PAMAMAS)
        player:setCharVar('PamamaVar', 2) -- Set variable to reflect repeat of quest, not first time
        player:tradeComplete()
    end
end

entity.onTrigger = function(player, npc)
    local guardian = player:getQuestStatus(invaderXim.questLog.OUTLANDS, invaderXim.quest.id.outlands.GREETINGS_TO_THE_GUARDIAN)

    if
        guardian == invaderXim.questStatus.QUEST_ACCEPTED and
        (player:getCharVar('PamamaVar') == 1 or player:getCharVar('PamamaVar') == 2)
    then
        player:messageSpecial(ID.text.ALTAR_COMPLETED)
    elseif
        guardian == invaderXim.questStatus.QUEST_ACCEPTED and
        player:getCharVar('PamamaVar') == 0
    then
        player:messageSpecial(ID.text.ALTAR_INSPECT)
    else
        player:messageSpecial(ID.text.ALTAR_STANDARD)
    end
end

return entity
