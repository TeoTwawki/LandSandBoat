-----------------------------------
-- Area: Windurst Walls
--  NPC: Ambrosius
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local postman = player:getQuestStatus(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.THE_POSTMAN_ALWAYS_KOS_TWICE)

    if postman == invaderXim.questStatus.QUEST_AVAILABLE then
        player:startEvent(48)
    elseif postman == invaderXim.questStatus.QUEST_ACCEPTED then
        player:startEvent(49)
    elseif postman == invaderXim.questStatus.QUEST_COMPLETED then
        player:startEvent(56)
    end
end

entity.onTrade = function(player, npc, trade)
    local postman = player:getQuestStatus(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.THE_POSTMAN_ALWAYS_KOS_TWICE)

    if postman ~= invaderXim.questStatus.QUEST_AVAILABLE then
        local reward = 0

        -- TODO: Table this on converting to Interaction
        if trade:hasItemQty(invaderXim.item.TORN_EPISTLE, 1) then
            reward = reward + 1
        end

        if trade:hasItemQty(invaderXim.item.MUDDY_BAR_TAB, 1) then
            reward = reward + 1
        end

        if trade:hasItemQty(invaderXim.item.ODD_POSTCARD, 1) then
            reward = reward + 1
        end

        if trade:hasItemQty(invaderXim.item.DAMP_ENVELOPE, 1) then
            reward = reward + 1
        end

        if trade:getItemCount() == reward then
            if reward == 1 then
                if postman == invaderXim.questStatus.QUEST_ACCEPTED then
                    player:startEvent(52, invaderXim.settings.main.GIL_RATE * 50)
                elseif postman == invaderXim.questStatus.QUEST_COMPLETED then
                    player:startEvent(57, invaderXim.settings.main.GIL_RATE * 50)
                end
            elseif reward == 2 then
                if postman == invaderXim.questStatus.QUEST_ACCEPTED then
                    player:startEvent(53, invaderXim.settings.main.GIL_RATE * 150, 2)
                elseif postman == invaderXim.questStatus.QUEST_COMPLETED then
                    player:startEvent(58, invaderXim.settings.main.GIL_RATE * 150, 2)
                end
            elseif reward == 3 then
                if postman == invaderXim.questStatus.QUEST_ACCEPTED then
                    player:startEvent(54, invaderXim.settings.main.GIL_RATE * 250, 3)
                elseif postman == invaderXim.questStatus.QUEST_COMPLETED then
                    player:startEvent(59, invaderXim.settings.main.GIL_RATE * 250, 3)
                end
            elseif reward == 4 then
                if postman == invaderXim.questStatus.QUEST_ACCEPTED then
                    player:startEvent(55, invaderXim.settings.main.GIL_RATE * 500, 4)
                elseif postman == invaderXim.questStatus.QUEST_COMPLETED then
                    player:startEvent(60, invaderXim.settings.main.GIL_RATE * 500, 4)
                end
            end
        end
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 48 and option == 0 then
        player:addQuest(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.THE_POSTMAN_ALWAYS_KOS_TWICE)
    elseif csid == 52 then
        player:tradeComplete()
        player:addGil(invaderXim.settings.main.GIL_RATE * 50)
        player:addFame(invaderXim.fameArea.WINDURST, 80)
        player:completeQuest(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.THE_POSTMAN_ALWAYS_KOS_TWICE)
    elseif csid == 53 then
        player:tradeComplete()
        player:addGil(invaderXim.settings.main.GIL_RATE * 150)
        player:addFame(invaderXim.fameArea.WINDURST, 80)
        player:completeQuest(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.THE_POSTMAN_ALWAYS_KOS_TWICE)
    elseif csid == 54 then
        player:tradeComplete()
        player:addGil(invaderXim.settings.main.GIL_RATE * 250)
        player:addFame(invaderXim.fameArea.WINDURST, 80)
        player:completeQuest(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.THE_POSTMAN_ALWAYS_KOS_TWICE)
    elseif csid == 55 then
        player:tradeComplete()
        player:addGil(invaderXim.settings.main.GIL_RATE * 500)
        player:addFame(invaderXim.fameArea.WINDURST, 80)
        player:completeQuest(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.THE_POSTMAN_ALWAYS_KOS_TWICE)
    elseif csid == 57 then
        player:tradeComplete()
        player:addGil(invaderXim.settings.main.GIL_RATE * 50)
        player:addFame(invaderXim.fameArea.WINDURST, 5)
    elseif csid == 58 then
        player:tradeComplete()
        player:addGil(invaderXim.settings.main.GIL_RATE * 150)
        player:addFame(invaderXim.fameArea.WINDURST, 15)
    elseif csid == 59 then
        player:tradeComplete()
        player:addGil(invaderXim.settings.main.GIL_RATE * 250)
        player:addFame(invaderXim.fameArea.WINDURST, 25)
    elseif csid == 60 then
        player:tradeComplete()
        player:addGil(invaderXim.settings.main.GIL_RATE * 500)
        player:addFame(invaderXim.fameArea.WINDURST, 50)
    end
end

return entity
