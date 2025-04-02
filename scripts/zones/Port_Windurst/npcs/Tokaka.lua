-----------------------------------
-- Area: Port Windurst
--  NPC: Tokaka
-- Starts & Finishes Repeatable Quest: Something Fishy
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    local tokakaSpokenTo = player:getCharVar('TokakaSpokenTo')
    local needToZone     = player:needToZone()

    if tokakaSpokenTo == 1 and not needToZone then
        if
            trade:hasItemQty(invaderXim.item.BASTORE_SARDINE, 1) and
            trade:getItemCount() == 1
        then
            player:startEvent(210, invaderXim.settings.main.GIL_RATE * 70, invaderXim.item.BASTORE_SARDINE)
        end
    end
end

entity.onTrigger = function(player, npc)
    local somethingFishy = player:getQuestStatus(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.SOMETHING_FISHY)

    if somethingFishy >= invaderXim.questStatus.QUEST_ACCEPTED then
        if player:needToZone() then
            player:startEvent(211)
        else
            player:startEvent(209, 0, invaderXim.item.BASTORE_SARDINE)
        end
    elseif somethingFishy == invaderXim.questStatus.QUEST_AVAILABLE then
        player:startEvent(208, 0, invaderXim.item.BASTORE_SARDINE)
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 208 then
        player:addQuest(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.SOMETHING_FISHY)
        player:setCharVar('TokakaSpokenTo', 1)
    elseif csid == 210 then
        local somethingFishy = player:getQuestStatus(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.SOMETHING_FISHY)

        if somethingFishy == invaderXim.questStatus.QUEST_ACCEPTED then
            player:completeQuest(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.SOMETHING_FISHY)
            player:addFame(invaderXim.fameArea.WINDURST, 60)
        else
            player:addFame(invaderXim.fameArea.WINDURST, 10)
        end

        player:tradeComplete()
        player:addGil(invaderXim.settings.main.GIL_RATE * 70)
        player:setCharVar('TokakaSpokenTo', 0)
        player:needToZone(true)
    elseif csid == 209 then
        player:setCharVar('TokakaSpokenTo', 1)
    end
end

return entity
