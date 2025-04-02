-----------------------------------
-- Area: Windurst Waters
--  NPC: Five of Hearts
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    if player:getQuestStatus(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.A_GREETING_CARDIAN) == invaderXim.questStatus.QUEST_ACCEPTED then
        player:startEvent(686)
    else
        player:startEvent(273)
    end
end

return entity
