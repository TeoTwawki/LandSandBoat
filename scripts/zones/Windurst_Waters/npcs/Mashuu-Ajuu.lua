-----------------------------------
-- Area: Windurst Waters
--  NPC: Mashuu-Ajuu
-- Starts and Finished Quest: Reap What You Sow
-- Involved in Quest: Making the Grade
-- !pos 129 -6 167 238
-----------------------------------
local ID = zones[invaderXim.zone.WINDURST_WATERS]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    local reapstatus = player:getQuestStatus(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.REAP_WHAT_YOU_SOW)
    if reapstatus >= 1 and trade:getItemCount() == 1 and trade:getGil() == 0 then
        if trade:hasItemQty(invaderXim.item.SOBBING_FUNGUS, 1) then
            player:startEvent(475, 500, invaderXim.item.STATIONERY_SET)                     -- REAP WHAT YOU SOW + GIL: Quest Turn In: Sobbing Fungus turned in
        elseif trade:hasItemQty(invaderXim.item.DEATHBALL, 1) then
            player:startEvent(477, 700)                     -- REAP WHAT YOU SOW + GIL + Stationary Set: Deathball turned in
        end
    end
end

entity.onTrigger = function(player, npc)
    local reapstatus = player:getQuestStatus(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.REAP_WHAT_YOU_SOW)

    if reapstatus == invaderXim.questStatus.QUEST_AVAILABLE then
        local rand = math.random(1, 2)
        if rand == 1 then
            player:startEvent(463, 0, invaderXim.item.SOBBING_FUNGUS, invaderXim.item.BAG_OF_HERB_SEEDS)                 -- REAP WHAT YOU SOW + HERB SEEDS: QUEST START
        end
    elseif reapstatus == invaderXim.questStatus.QUEST_ACCEPTED then
        local rand = math.random(1, 2)
        if rand == 1 then
            player:startEvent(464, 0, invaderXim.item.SOBBING_FUNGUS, invaderXim.item.BAG_OF_HERB_SEEDS)                  -- REAP WHAT YOU SOW + HERB SEEDS: OBJECTIVE REMINDER
        else
            player:startEvent(476)                          -- Another Conversation During Quest
        end
    elseif reapstatus == invaderXim.questStatus.QUEST_COMPLETED and player:needToZone() then
        player:startEvent(478)                              -- REAP WHAT YOU SOW: After Quest
    elseif
        reapstatus == invaderXim.questStatus.QUEST_COMPLETED and
        not player:needToZone() and
        player:getCharVar('QuestReapSow_var') == 0
    then
        local rand = math.random(1, 2)
        if rand == 1 then
            player:startEvent(479, 0, invaderXim.item.SOBBING_FUNGUS, invaderXim.item.BAG_OF_HERB_SEEDS)                -- REAP WHAT YOU SOW + HERB SEEDS: REPEATABLE QUEST START
        end
    elseif
        reapstatus == invaderXim.questStatus.QUEST_COMPLETED and
        player:getCharVar('QuestReapSow_var') == 1
    then
        local rand = math.random(1, 2)
        if rand == 1 then
            player:startEvent(464, 0, invaderXim.item.SOBBING_FUNGUS, invaderXim.item.BAG_OF_HERB_SEEDS)                  -- REAP WHAT YOU SOW + HERB SEEDS: OBJECTIVE REMINDER
        else
            player:startEvent(476)                          -- Another Conversation During Quest
        end
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if
        ((csid == 463 and option == 3) or (csid == 479 and option == 3)) and
        player:getFreeSlotsCount() == 0
    then
        -- REAP WHAT YOU SOW + HERB SEEDS: QUEST START - ACCEPTED - INVENTORY FULL
        player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, invaderXim.item.BAG_OF_HERB_SEEDS)
    elseif csid == 463 and option == 3 then                      -- REAP WHAT YOU SOW + HERB SEEDS: QUEST START - ACCEPTED
        player:addQuest(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.REAP_WHAT_YOU_SOW)
        player:addItem(invaderXim.item.BAG_OF_HERB_SEEDS)
        player:messageSpecial(ID.text.ITEM_OBTAINED, invaderXim.item.BAG_OF_HERB_SEEDS)
    elseif
        (csid == 475 or csid == 477) and
        player:getQuestStatus(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.REAP_WHAT_YOU_SOW) == invaderXim.questStatus.QUEST_ACCEPTED and
        player:getFreeSlotsCount() == 0
    then
        -- inventory full on quest turn in
        player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, invaderXim.item.STATIONERY_SET)
    elseif csid == 475 then                                -- REAP WHAT YOU SOW + 500 GIL: Quest Turn In: Sobbing Fungus turned in
        player:addGil(invaderXim.settings.main.GIL_RATE * 500)
        player:tradeComplete()
        player:needToZone(true)
        if player:getQuestStatus(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.REAP_WHAT_YOU_SOW) == invaderXim.questStatus.QUEST_ACCEPTED then
            player:completeQuest(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.REAP_WHAT_YOU_SOW)
            player:addFame(invaderXim.fameArea.WINDURST, 75)
            player:addItem(invaderXim.item.STATIONERY_SET)
            player:messageSpecial(ID.text.ITEM_OBTAINED, invaderXim.item.STATIONERY_SET)
        elseif player:getQuestStatus(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.REAP_WHAT_YOU_SOW) == invaderXim.questStatus.QUEST_COMPLETED then
            player:addFame(invaderXim.fameArea.WINDURST, 8)
            player:setCharVar('QuestReapSow_var', 0)
        end
    elseif csid == 477 then                                -- REAP WHAT YOU SOW + GIL + Stationary Set: Quest Turn In: Deathball turned in
        player:addGil(invaderXim.settings.main.GIL_RATE * 700)
        player:tradeComplete()
        player:needToZone(true)
        if player:getQuestStatus(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.REAP_WHAT_YOU_SOW) == invaderXim.questStatus.QUEST_ACCEPTED then
            player:completeQuest(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.REAP_WHAT_YOU_SOW)
            player:addFame(invaderXim.fameArea.WINDURST, 75)
            player:addItem(invaderXim.item.STATIONERY_SET)
            player:messageSpecial(ID.text.ITEM_OBTAINED, invaderXim.item.STATIONERY_SET)
        elseif player:getQuestStatus(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.REAP_WHAT_YOU_SOW) == invaderXim.questStatus.QUEST_COMPLETED then
            player:addFame(invaderXim.fameArea.WINDURST, 8)
            player:setCharVar('QuestReapSow_var', 0)
        end
    elseif csid == 479 and option == 3 then                 -- REAP WHAT YOU SOW + HERB SEEDS: REPEATABLE QUEST START - ACCEPTED
        player:setCharVar('QuestReapSow_var', 1)
        player:addItem(invaderXim.item.BAG_OF_HERB_SEEDS)
        player:messageSpecial(ID.text.ITEM_OBTAINED, invaderXim.item.BAG_OF_HERB_SEEDS)
    end
end

return entity
