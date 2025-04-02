-----------------------------------
-- Area: Rabao
--  NPC: Irmilant
-- Starts and Ends Quests: The Immortal Lu Shang and Indomitable Spirit
-- !pos 3.78 9.54 56.21 247
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    local Indomitable = player:getQuestStatus(invaderXim.questLog.OUTLANDS, invaderXim.quest.id.outlands.INDOMITABLE_SPIRIT)
    local ImmortalLuShang = player:getQuestStatus(invaderXim.questLog.OUTLANDS, invaderXim.quest.id.outlands.THE_IMMORTAL_LU_SHANG)

    if
        (ImmortalLuShang == invaderXim.questStatus.QUEST_ACCEPTED or ImmortalLuShang == invaderXim.questStatus.QUEST_COMPLETED) and
        npcUtil.tradeHas(trade, { 720, invaderXim.item.BROKEN_LU_SHANGS_FISHING_ROD, invaderXim.item.LIGHT_CRYSTAL })
    then
        player:startEvent(78)
    elseif
        (Indomitable == invaderXim.questStatus.QUEST_ACCEPTED or Indomitable == invaderXim.questStatus.QUEST_COMPLETED) and
        npcUtil.tradeHas(trade, { 1837, 1826 })
    then
        player:startEvent(132)
    end
end

entity.onTrigger = function(player, npc)
    local Indomitable = player:getQuestStatus(invaderXim.questLog.OUTLANDS, invaderXim.quest.id.outlands.INDOMITABLE_SPIRIT)
    local ImmortalLuShang = player:getQuestStatus(invaderXim.questLog.OUTLANDS, invaderXim.quest.id.outlands.THE_IMMORTAL_LU_SHANG)
    local indomitableTimer = player:getCharVar('IndomitableSpiritTimer')

    if
        player:hasItem(invaderXim.item.BROKEN_LU_SHANGS_FISHING_ROD) and
        (ImmortalLuShang == invaderXim.questStatus.QUEST_AVAILABLE or ImmortalLuShang == invaderXim.questStatus.QUEST_COMPLETED)
    then
        player:startEvent(77) --Offer the quest if the player has the broken rod
    elseif
        player:hasKeyItem(invaderXim.ki.SERPENT_RUMORS) and
        Indomitable == invaderXim.questStatus.QUEST_AVAILABLE
    then
        player:startEvent(131) --Begins Indomitable Spirit
    elseif indomitableTimer ~= 0 and indomitableTimer > os.time() then
        player:startEvent(133) --Asks the player to wait (next CQ tally)
    elseif indomitableTimer ~= 0 then
        player:startEvent(134) --Ends the Quest
    elseif Indomitable == invaderXim.questStatus.QUEST_COMPLETED then
        player:startEvent(135) --Dialogue for those who have completed Indomitable Spirit
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 77 then
        player:addQuest(invaderXim.questLog.OUTLANDS, invaderXim.quest.id.outlands.THE_IMMORTAL_LU_SHANG)
    elseif
        csid == 78 and
        npcUtil.completeQuest(player, invaderXim.questLog.OUTLANDS, invaderXim.quest.id.outlands.THE_IMMORTAL_LU_SHANG, { item = 17386, fameArea = invaderXim.fameArea.SELBINA_RABAO, fame = 60, title = invaderXim.title.THE_IMMORTAL_FISHER_LU_SHANG })
    then
        player:confirmTrade()
    elseif csid == 131 then
        player:addQuest(invaderXim.questLog.OUTLANDS, invaderXim.quest.id.outlands.INDOMITABLE_SPIRIT)
    elseif csid == 132 then
        player:confirmTrade()
        player:setCharVar('IndomitableSpiritTimer', NextConquestTally()) -- Player must wait until next CQ tally
    elseif csid == 134 then
        npcUtil.completeQuest(player, invaderXim.questLog.OUTLANDS, invaderXim.quest.id.outlands.INDOMITABLE_SPIRIT, { item = 17011, fameArea = invaderXim.fameArea.SELBINA_RABAO, fame = 100, title = invaderXim.title.INDOMITABLE_FISHER, var = 'IndomitableSpiritTimer' })
    end
end

return entity
