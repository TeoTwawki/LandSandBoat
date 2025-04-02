-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Nonterene
-- Type: Adventurer's Assistant NPC
-- !pos -6.347 0.000 -11.265 231
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    if player:getQuestStatus(invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.IXIMT_THE_GAMBLER) == invaderXim.questStatus.QUEST_ACCEPTED then
        player:startEvent(523)
    else
        player:startEvent(503)
    end
end

return entity
