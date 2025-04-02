-----------------------------------
-- Area: Windurst Waters
--  NPC: Chamama
-- Involved In Quest: Inspector's Gadget
-- Starts Quest: In a Pickle
-----------------------------------
local ID = zones[invaderXim.zone.WINDURST_WATERS]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    local inAPickle = player:getQuestStatus(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.IN_A_PICKLE)

    if
        (inAPickle == invaderXim.questStatus.QUEST_ACCEPTED or inAPickle == invaderXim.questStatus.QUEST_COMPLETED) and
        trade:hasItemQty(invaderXim.item.SMOOTH_STONE, 1) and
        trade:getItemCount() == 1 and
        trade:getGil() == 0
    then
        local rand = math.random(1, 4)
        if rand <= 2 then
            if inAPickle == invaderXim.questStatus.QUEST_ACCEPTED then
                player:startEvent(659) -- IN A PICKLE: Quest Turn In (1st Time)
            elseif inAPickle == invaderXim.questStatus.QUEST_COMPLETED then
                player:startEvent(662, 200)
            end
        elseif rand == 3 then
            player:startEvent(657) -- IN A PICKLE: Too Light
            player:tradeComplete()
        elseif rand == 4 then
            player:startEvent(658) -- IN A PICKLE: Too Small
            player:tradeComplete()
        end
    end
end

entity.onTrigger = function(player, npc)
    local inAPickle = player:getQuestStatus(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.IN_A_PICKLE)
    local needToZone = player:needToZone()

    if inAPickle == invaderXim.questStatus.QUEST_AVAILABLE and not needToZone then
        local rand = math.random(1, 2)
        if rand == 1 then
            player:startEvent(654, 0, invaderXim.item.RARAB_TAIL) -- IN A PICKLE + RARAB TAIL: Quest Begin
        else
            player:startEvent(651) -- Standard Conversation
        end
    elseif
        inAPickle == invaderXim.questStatus.QUEST_ACCEPTED or
        player:getCharVar('QuestInAPickle_var') == 1
    then
        player:startEvent(655, 0, invaderXim.item.RARAB_TAIL) -- IN A PICKLE + RARAB TAIL: Quest Objective Reminder
    elseif inAPickle == invaderXim.questStatus.QUEST_COMPLETED and needToZone then
        player:startEvent(660) -- IN A PICKLE: After Quest
    elseif
        inAPickle == invaderXim.questStatus.QUEST_COMPLETED and
        not needToZone and
        player:getCharVar('QuestInAPickle_var') ~= 1
    then
        local rand = math.random(1, 2)
        if rand == 1 then
            player:startEvent(661) -- IN A PICKLE: Repeatable Quest Begin
        else
            player:startEvent(651) -- Standard Conversation
        end
    else
        player:startEvent(651) -- Standard Conversation
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 654 and option == 1 then -- IN A PICKLE + RARAB TAIL: Quest Begin
        player:addQuest(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.IN_A_PICKLE)
    elseif csid == 659 then -- IN A PICKLE: Quest Turn In (1st Time)
        player:tradeComplete()
        player:completeQuest(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.IN_A_PICKLE)
        player:needToZone(true)
        player:addItem(invaderXim.item.BONE_HAIRPIN)
        player:messageSpecial(ID.text.ITEM_OBTAINED, invaderXim.item.BONE_HAIRPIN)
        npcUtil.giveCurrency(player, 'gil', 200)
        player:addFame(invaderXim.fameArea.WINDURST, 75)
    elseif csid == 661 and option == 1 then
        player:setCharVar('QuestInAPickle_var', 1)
    elseif csid == 662 then -- IN A PICKLE + 200 GIL: Repeatable Quest Turn In
        player:tradeComplete()
        player:needToZone(true)
        player:addGil(invaderXim.settings.main.GIL_RATE * 200)
        player:addFame(invaderXim.fameArea.WINDURST, 8)
        player:setCharVar('QuestInAPickle_var', 0)
    end
end

return entity
