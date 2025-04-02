-----------------------------------
-- Area: Grauberg [S]
--  NPC: qm2 (???)
-- Involved In Quest: The Fumbling Friar
-- !pos 80 -1 457 89
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    if
        player:getQuestStatus(invaderXim.questLog.CRYSTAL_WAR, invaderXim.quest.id.crystalWar.THE_FUMBLING_FRIAR) == invaderXim.questStatus.QUEST_ACCEPTED and
        not player:hasKeyItem(invaderXim.ki.ORNATE_PACKAGE)
    then
        npcUtil.giveKeyItem(player, invaderXim.ki.ORNATE_PACKAGE)
    end
end

return entity
