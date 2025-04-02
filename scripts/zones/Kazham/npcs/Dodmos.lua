-----------------------------------
-- Area: Kazham
--  NPC: Dodmos
--  Starts Quest: Trial Size Trial By Fire
-- !pos 102.647 -14.999 -97.664 250
-----------------------------------
local ID = zones[invaderXim.zone.KAZHAM]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    if
        trade:hasItemQty(invaderXim.item.MINI_TUNING_FORK_OF_FIRE, 1) and
        player:getQuestStatus(invaderXim.questLog.OUTLANDS, invaderXim.quest.id.outlands.TRIAL_SIZE_TRIAL_BY_FIRE) == invaderXim.questStatus.QUEST_ACCEPTED and
        player:getMainJob() == invaderXim.job.SMN
    then
        player:startEvent(287, 0, invaderXim.item.MINI_TUNING_FORK_OF_FIRE, 0, 20)
    end
end

entity.onTrigger = function(player, npc)
    local trialSizeFire = player:getQuestStatus(invaderXim.questLog.OUTLANDS, invaderXim.quest.id.outlands.TRIAL_SIZE_TRIAL_BY_FIRE)

    if
        player:getMainLvl() >= 20 and
        player:getMainJob() == invaderXim.job.SMN and
        trialSizeFire == invaderXim.questStatus.QUEST_AVAILABLE and
        player:getFameLevel(invaderXim.fameArea.WINDURST) >= 2
    then --Requires player to be Summoner at least lvl 20
        player:startEvent(286, 0, invaderXim.item.MINI_TUNING_FORK_OF_FIRE, 0, 20)     --mini tuning fork, zone, level
    elseif trialSizeFire == invaderXim.questStatus.QUEST_ACCEPTED then
        local hasFireFork = player:hasItem(invaderXim.item.MINI_TUNING_FORK_OF_FIRE)

        if hasFireFork then
            player:startEvent(272) --Dialogue given to remind player to be prepared
        else
            player:startEvent(290, 0, invaderXim.item.MINI_TUNING_FORK_OF_FIRE, 0, 20) --Need another mini tuning fork
        end
    elseif trialSizeFire == invaderXim.questStatus.QUEST_COMPLETED then
        player:startEvent(289) --Defeated Avatar
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 286 and option == 1 then
        if player:getFreeSlotsCount() == 0 then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, 1544) --Mini tuning fork
        else
            player:addQuest(invaderXim.questLog.OUTLANDS, invaderXim.quest.id.outlands.TRIAL_SIZE_TRIAL_BY_FIRE)
            player:addItem(invaderXim.item.MINI_TUNING_FORK_OF_FIRE)
            player:messageSpecial(ID.text.ITEM_OBTAINED, invaderXim.item.MINI_TUNING_FORK_OF_FIRE)
        end
    elseif csid == 290 and option == 1 then
        if player:getFreeSlotsCount() == 0 then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, invaderXim.item.MINI_TUNING_FORK_OF_FIRE) --Mini tuning fork
        else
            player:addItem(invaderXim.item.MINI_TUNING_FORK_OF_FIRE)
            player:messageSpecial(ID.text.ITEM_OBTAINED, invaderXim.item.MINI_TUNING_FORK_OF_FIRE)
        end
    elseif csid == 287 and option == 1 then
        invaderXim.teleport.to(player, invaderXim.teleport.id.CLOISTER_OF_FLAMES)
    end
end

return entity
