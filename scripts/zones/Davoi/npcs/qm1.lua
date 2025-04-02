-----------------------------------
-- Area: Davoi
--  NPC: ??? (qm1)
-- Involved in Quest: To Cure a Cough
-- !pos -115.830 -0.427 -184.289 149
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    if
        player:getQuestStatus(invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.TO_CURE_A_COUGH) == invaderXim.questStatus.QUEST_ACCEPTED and
        not player:hasKeyItem(invaderXim.ki.THYME_MOSS)
    then
        npcUtil.giveKeyItem(player, invaderXim.ki.THYME_MOSS)
    end
end

return entity
