-----------------------------------
-- Area: Port Windurst
--  NPC: Hakkuru-Rinkuru
-- Involved In Quest: Making Amends
-- Starts and Ends Quest: Wonder Wands
-- !pos -111 -4 101 240
-----------------------------------
local ID = zones[invaderXim.zone.PORT_WINDURST]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    if player:getQuestStatus(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.MAKING_AMENDS) == invaderXim.questStatus.QUEST_ACCEPTED then
        if
            trade:hasItemQty(invaderXim.item.BLOCK_OF_ANIMAL_GLUE, 1) and
            trade:getItemCount() == 1
        then
            player:startEvent(277, 1500)
        else
            player:startEvent(275, 0, invaderXim.item.BLOCK_OF_ANIMAL_GLUE)
        end
    elseif player:getQuestStatus(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.WONDER_WANDS) == invaderXim.questStatus.QUEST_ACCEPTED then
        if
            trade:hasItemQty(invaderXim.item.OAK_STAFF, 1) and
            trade:hasItemQty(invaderXim.item.MYTHRIL_ROD, 1) and
            trade:hasItemQty(invaderXim.item.ROSE_WAND, 1) and
            trade:getItemCount() == 3
        then
            -- Check that all 3 items have been traded, one each
            player:setCharVar('SecondRewardVar', 1)
            player:startEvent(265, 0, invaderXim.item.OAK_STAFF, invaderXim.item.MYTHRIL_ROD, invaderXim.item.ROSE_WAND) -- Completion of quest cutscene for Wondering Wands
        else
            player:startEvent(260, 0, invaderXim.item.OAK_STAFF, invaderXim.item.MYTHRIL_ROD, invaderXim.item.ROSE_WAND) -- Remind player which items are needed ifquest is accepted and items are not traded
        end
    end
end

entity.onTrigger = function(player, npc)
    local makingAmends = player:getQuestStatus(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.MAKING_AMENDS)
    local makingAmens  = player:getQuestStatus(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.MAKING_AMENS) --Second quest in series
    local wonderWands  = player:getQuestStatus(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.WONDER_WANDS) --Third and final quest in series
    local needToZone   = player:needToZone()
    local pFame        = player:getFameLevel(invaderXim.fameArea.WINDURST)

-- Begin Making Amends Section
    if makingAmends == invaderXim.questStatus.QUEST_AVAILABLE and pFame >= 2 then
            player:startEvent(274, 0, invaderXim.item.BLOCK_OF_ANIMAL_GLUE) -- MAKING AMENDS + ANIMAL GLUE: Quest Start
    elseif makingAmends == invaderXim.questStatus.QUEST_ACCEPTED then
            player:startEvent(275, 0, invaderXim.item.BLOCK_OF_ANIMAL_GLUE) -- MAKING AMENDS + ANIMAL GLUE: Quest Objective Reminder
    elseif makingAmends == invaderXim.questStatus.QUEST_COMPLETED and needToZone then
            player:startEvent(278) -- MAKING AMENDS: After Quest
--End Making Amends Section; Begin Wonder Wands Section
    elseif
        makingAmends == invaderXim.questStatus.QUEST_COMPLETED and
        makingAmens == invaderXim.questStatus.QUEST_COMPLETED and
        wonderWands == invaderXim.questStatus.QUEST_AVAILABLE and
        pFame >= 5 and
        not needToZone
    then
            player:startEvent(259) --Starts Wonder Wands
    elseif wonderWands == invaderXim.questStatus.QUEST_ACCEPTED then
            player:startEvent(260) --Reminder for Wonder Wands
    elseif wonderWands == invaderXim.questStatus.QUEST_COMPLETED then
        if player:getCharVar('SecondRewardVar') == 1 then
            player:startEvent(267) --Initiates second reward ifWonder Wands has been completed.
        end
    end
-- End Wonder Wands Section
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 274 and option == 1 then
            player:addQuest(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.MAKING_AMENDS)
    elseif csid == 277 then
            player:addGil(invaderXim.settings.main.GIL_RATE * 1500)
            player:completeQuest(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.MAKING_AMENDS)
            player:addFame(invaderXim.fameArea.WINDURST, 75)
            player:addTitle(invaderXim.title.QUICK_FIXER)
            player:needToZone(true)
            player:tradeComplete()
    elseif csid == 259 and option == 1 then
            player:addQuest(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.WONDER_WANDS)
    elseif csid == 267 then
        local rand = math.random(1, 3) --Setup random variable to determine which 2 items are returned upon quest completion
        if rand == 1 then
            if player:getFreeSlotsCount() == 1 then
                player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, invaderXim.item.MYTHRIL_ROD)
            elseif player:getFreeSlotsCount() == 0 then
                player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, invaderXim.item.OAK_STAFF)
                player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, invaderXim.item.MYTHRIL_ROD)
            else
                player:addItem(invaderXim.item.OAK_STAFF, 1)
                player:addItem(invaderXim.item.MYTHRIL_ROD, 1) --Returns the Oak Staff and the Mythril Rod
                player:messageSpecial(ID.text.ITEM_OBTAINED, invaderXim.item.OAK_STAFF)
                player:messageSpecial(ID.text.ITEM_OBTAINED, invaderXim.item.MYTHRIL_ROD)
                player:setCharVar('SecondRewardVar', 0)
            end
        elseif rand == 2 then
            if player:getFreeSlotsCount() == 1 then
                player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, invaderXim.item.ROSE_WAND)
            elseif player:getFreeSlotsCount() == 0 then
                player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, invaderXim.item.OAK_STAFF)
                player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, invaderXim.item.ROSE_WAND)
            else
                player:addItem(invaderXim.item.OAK_STAFF, 1)
                player:addItem(invaderXim.item.ROSE_WAND, 1) --Returns the Oak Staff and the Rose Wand
                player:messageSpecial(ID.text.ITEM_OBTAINED, invaderXim.item.OAK_STAFF)
                player:messageSpecial(ID.text.ITEM_OBTAINED, invaderXim.item.ROSE_WAND)
                player:setCharVar('SecondRewardVar', 0)
            end
        elseif rand == 3 then
            if player:getFreeSlotsCount() == 1 then
                player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, invaderXim.item.ROSE_WAND)
            elseif player:getFreeSlotsCount() == 0 then
                player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, invaderXim.item.MYTHRIL_ROD)
                player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, invaderXim.item.ROSE_WAND)
            else
                player:addItem(invaderXim.item.MYTHRIL_ROD, 1)
                player:addItem(invaderXim.item.ROSE_WAND, 1) --Returns the Rose Wand and the Mythril Rod
                player:messageSpecial(ID.text.ITEM_OBTAINED, invaderXim.item.MYTHRIL_ROD)
                player:messageSpecial(ID.text.ITEM_OBTAINED, invaderXim.item.ROSE_WAND)
                player:setCharVar('SecondRewardVar', 0)
            end
        end
    elseif csid == 265 then
        if player:getFreeSlotsCount() == 0 then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, invaderXim.item.NEW_MOON_ARMLETS)
        else
            player:tradeComplete()
            npcUtil.giveCurrency(player, 'gil', 4800)
            player:addItem(invaderXim.item.NEW_MOON_ARMLETS)
            player:messageSpecial(ID.text.ITEM_OBTAINED, invaderXim.item.NEW_MOON_ARMLETS)
            player:addFame(invaderXim.fameArea.WINDURST, 150)
            player:addTitle(invaderXim.title.DOCTOR_SHANTOTTOS_GUINEA_PIG)
            player:completeQuest(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.WONDER_WANDS)
        end
    end
end

return entity
