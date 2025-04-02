-----------------------------------
-- Area: Port Windurst (240)
--  NPC: Kuriodo-Moido
-- Involved In Quest: Making Amends, Wonder Wands,
-- Starts and Finishes: Making Amens!, Orastery Woes
-- !pos -112.5 -4.2 102.9 240
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local makingAmends = player:getQuestStatus(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.MAKING_AMENDS) --First quest in series
    local makingAmens = player:getQuestStatus(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.MAKING_AMENS) --Second quest in series
    local wonderWands = player:getQuestStatus(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.WONDER_WANDS) --Third and final quest in series
    local pfame = player:getFameLevel(invaderXim.fameArea.WINDURST)
    local needToZone = player:needToZone()
    local brokenWand = player:hasKeyItem(invaderXim.ki.BROKEN_WAND)

    if makingAmends == invaderXim.questStatus.QUEST_ACCEPTED then -- MAKING AMENDS: During Quest
        player:startEvent(276)
    elseif
        makingAmends == invaderXim.questStatus.QUEST_COMPLETED and
        makingAmens ~= invaderXim.questStatus.QUEST_COMPLETED and
        wonderWands ~= invaderXim.questStatus.QUEST_COMPLETED and
        needToZone
    then
        -- MAKING AMENDS: After Quest
        player:startEvent(279)
    elseif
        makingAmends == invaderXim.questStatus.QUEST_COMPLETED and
        makingAmens == invaderXim.questStatus.QUEST_AVAILABLE
    then
        if pfame >= 4 and not needToZone then
            player:startEvent(280) -- Start Making Amens! if prerequisites are met
        else
            player:startEvent(279) -- MAKING AMENDS: After Quest
        end
    elseif makingAmens == invaderXim.questStatus.QUEST_ACCEPTED and not brokenWand then -- Reminder for Making Amens!
        player:startEvent(283)
    elseif makingAmens == invaderXim.questStatus.QUEST_ACCEPTED and brokenWand then -- Complete Making Amens!
        player:startEvent(284, invaderXim.settings.main.GIL_RATE * 6000)
    elseif makingAmens == invaderXim.questStatus.QUEST_COMPLETED then
        if wonderWands == invaderXim.questStatus.QUEST_ACCEPTED then -- During Wonder Wands dialogue
            player:startEvent(261)
        elseif wonderWands == invaderXim.questStatus.QUEST_COMPLETED then -- Post Wonder Wands dialogue
            player:startEvent(266)
        else
            player:startEvent(286, 0, 937) -- Post Making Amens! dialogue (before Wonder Wands)
        end
    else
        local rand = math.random(1, 2)
        if rand == 1 then
            player:startEvent(225)   -- Standard Conversation
        else
            player:startEvent(226)   -- Standard Conversation
        end
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 280 then
        player:addQuest(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.MAKING_AMENS)
    elseif csid == 284 then
        player:needToZone(true)
        player:delKeyItem(invaderXim.ki.BROKEN_WAND)
        player:addTitle(invaderXim.title.HAKKURU_RINKURUS_BENEFACTOR)
        npcUtil.giveCurrency(player, 'gil', 6000)
        player:addFame(invaderXim.fameArea.WINDURST, 150)
        player:completeQuest(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.MAKING_AMENS)
    end
end

return entity
