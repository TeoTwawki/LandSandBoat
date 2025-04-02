-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Castilchat
-- Starts Quest: Trial Size Trial by Ice
-- !pos -186 0 107 231
-----------------------------------
local ID = zones[invaderXim.zone.NORTHERN_SAN_DORIA]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    local count = trade:getItemCount()
    if
        trade:hasItemQty(invaderXim.item.MINI_TUNING_FORK_OF_ICE, 1) and
        player:getQuestStatus(invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.TRIAL_SIZE_TRIAL_BY_ICE) == invaderXim.questStatus.QUEST_ACCEPTED and
        player:getMainJob() == invaderXim.job.SMN and
        count == 1
    then -- Trade mini fork of ice
        player:startEvent(734, 0, invaderXim.item.MINI_TUNING_FORK_OF_ICE, 4, 20)
    end
end

entity.onTrigger = function(player, npc)
    local trialSizeByIce = player:getQuestStatus(invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.TRIAL_SIZE_TRIAL_BY_ICE)

    if
        player:getMainLvl() >= 20 and
        player:getMainJob() == invaderXim.job.SMN and
        trialSizeByIce == invaderXim.questStatus.QUEST_AVAILABLE and
        player:getFameLevel(invaderXim.fameArea.SANDORIA) >= 2
    then -- Requires player to be Summoner at least lvl 20
        player:startEvent(733, 0, invaderXim.item.MINI_TUNING_FORK_OF_ICE, 4, 20)     --mini tuning fork of ice, zone, level
    elseif trialSizeByIce == invaderXim.questStatus.QUEST_ACCEPTED then
        local iceFork = player:hasItem(invaderXim.item.MINI_TUNING_FORK_OF_ICE)

        if iceFork then
            player:startEvent(708) --Dialogue given to remind player to be prepared
        else
            player:startEvent(737, 0, invaderXim.item.MINI_TUNING_FORK_OF_ICE, 4, 20) -- Need another mini tuning fork
        end
    elseif trialSizeByIce == invaderXim.questStatus.QUEST_COMPLETED then
        player:startEvent(736) -- Defeated Avatar
    else
        player:startEvent(711) -- Standard dialog
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 733 and option == 1 then
        if player:getFreeSlotsCount() == 0 then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, invaderXim.item.MINI_TUNING_FORK_OF_ICE)
        else
            player:addQuest(invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.TRIAL_SIZE_TRIAL_BY_ICE)
            player:addItem(invaderXim.item.MINI_TUNING_FORK_OF_ICE)
            player:messageSpecial(ID.text.ITEM_OBTAINED, invaderXim.item.MINI_TUNING_FORK_OF_ICE)
        end
    elseif csid == 734 and option == 0 or csid == 737 then
        if player:getFreeSlotsCount() == 0 then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, invaderXim.item.MINI_TUNING_FORK_OF_ICE)
        else
            player:addItem(invaderXim.item.MINI_TUNING_FORK_OF_ICE)
            player:messageSpecial(ID.text.ITEM_OBTAINED, invaderXim.item.MINI_TUNING_FORK_OF_ICE)
        end
    elseif csid == 734 and option == 1 then
        invaderXim.teleport.to(player, invaderXim.teleport.id.CLOISTER_OF_FROST)
    end
end

return entity
