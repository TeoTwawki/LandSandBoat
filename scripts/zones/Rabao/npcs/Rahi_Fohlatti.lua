-----------------------------------
-- Area: Rabao
--  NPC: Rahi Fohlatti
-- Starts Quest: Trial Size Trial by Wind
-- !pos -17 7 -10 247
-----------------------------------
local ID = zones[invaderXim.zone.RABAO]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    if
        trade:hasItemQty(invaderXim.item.MINI_TUNING_FORK_OF_WIND, 1) and
        player:getQuestStatus(invaderXim.questLog.OUTLANDS, invaderXim.quest.id.outlands.TRIAL_SIZE_TRIAL_BY_WIND) == invaderXim.questStatus.QUEST_ACCEPTED and
        player:getMainJob() == invaderXim.job.SMN
    then
        player:startEvent(109, 0, invaderXim.item.MINI_TUNING_FORK_OF_WIND, 3, 20)
    end
end

entity.onTrigger = function(player, npc)
    local trialSizeWind = player:getQuestStatus(invaderXim.questLog.OUTLANDS, invaderXim.quest.id.outlands.TRIAL_SIZE_TRIAL_BY_WIND)

    if
        player:getMainLvl() >= 20 and
        player:getMainJob() == invaderXim.job.SMN and
        trialSizeWind == invaderXim.questStatus.QUEST_AVAILABLE and
        player:getFameLevel(invaderXim.fameArea.SELBINA_RABAO) >= 2
    then
        --Requires player to be Summoner at least lvl 20
        player:startEvent(108, 0, invaderXim.item.MINI_TUNING_FORK_OF_WIND, 3, 20)     --mini tuning fork, zone, level
    elseif trialSizeWind == invaderXim.questStatus.QUEST_ACCEPTED then
        local windFork = player:hasItem(invaderXim.item.MINI_TUNING_FORK_OF_WIND)

        if windFork then
            player:startEvent(68) -- Dialogue given to remind player to be prepared
        else
            player:startEvent(112, 0, invaderXim.item.MINI_TUNING_FORK_OF_WIND, 3, 20) -- Need another mini tuning fork
        end
    elseif trialSizeWind == invaderXim.questStatus.QUEST_COMPLETED then
        player:startEvent(111) -- Defeated Avatar
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 108 and option == 1 then
        if player:getFreeSlotsCount() == 0 then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, invaderXim.item.MINI_TUNING_FORK_OF_WIND) --Mini tuning fork
        else
            player:addQuest(invaderXim.questLog.OUTLANDS, invaderXim.quest.id.outlands.TRIAL_SIZE_TRIAL_BY_WIND)
            player:addItem(invaderXim.item.MINI_TUNING_FORK_OF_WIND)
            player:messageSpecial(ID.text.ITEM_OBTAINED, invaderXim.item.MINI_TUNING_FORK_OF_WIND)
        end
    elseif csid == 112 and option == 1 then
        if player:getFreeSlotsCount() == 0 then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, invaderXim.item.MINI_TUNING_FORK_OF_WIND) --Mini tuning fork
        else
            player:addItem(invaderXim.item.MINI_TUNING_FORK_OF_WIND)
            player:messageSpecial(ID.text.ITEM_OBTAINED, invaderXim.item.MINI_TUNING_FORK_OF_WIND)
        end
    elseif csid == 109 and option == 1 then
        invaderXim.teleport.to(player, invaderXim.teleport.id.CLOISTER_OF_GALES)
    end
end

return entity
