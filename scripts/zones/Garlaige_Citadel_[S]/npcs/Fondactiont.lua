-----------------------------------
-- Area: Garlaige Citadel [S]
--  NPC: Fondactiont
-- Starts and Finishes Quest: The Fumbling Friar
-- !pos -95 0 196 164
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local theFumblingFriar = player:getQuestStatus(invaderXim.questLog.CRYSTAL_WAR, invaderXim.quest.id.crystalWar.THE_FUMBLING_FRIAR)

    -- Change to BRASS_RIBBON_OF_SERVICE later when Campaign has been added.
    if
        theFumblingFriar == invaderXim.questStatus.QUEST_AVAILABLE and
        player:hasKeyItem(invaderXim.ki.BRONZE_RIBBON_OF_SERVICE) and
        player:getMainLvl() >= 30
    then
        player:startEvent(26) -- Start quest "The Fumbling Friar"
    elseif theFumblingFriar == invaderXim.questStatus.QUEST_ACCEPTED then
        if player:hasKeyItem(invaderXim.ki.ORNATE_PACKAGE) then
            player:startEvent(28) -- During quest "The Fumbling Friar" (with Ornate Package KI)
        else
            player:startEvent(27) -- During quest "The Fumbling Friar" (before retrieving KI Ornate Package)
        end
    elseif theFumblingFriar == invaderXim.questStatus.QUEST_COMPLETED then
        player:startEvent(29) -- New standard dialog after "The Fumbling Friar"
    else
        player:startEvent(25) -- Standard dialog
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 26 then
        player:addQuest(invaderXim.questLog.CRYSTAL_WAR, invaderXim.quest.id.crystalWar.THE_FUMBLING_FRIAR)
    elseif
        csid == 28 and
        npcUtil.completeQuest(player, invaderXim.questLog.CRYSTAL_WAR, invaderXim.quest.id.crystalWar.THE_FUMBLING_FRIAR, { item = invaderXim.item.SCROLL_OF_RECALL_PASHH })
    then
        player:delKeyItem(invaderXim.ki.ORNATE_PACKAGE)
    end
end

return entity
