-----------------------------------
-- Area: Port Windurst
--  NPC: Five of Clubs
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    if player:getQuestStatus(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.A_GREETING_CARDIAN) == invaderXim.questStatus.QUEST_ACCEPTED then
        player:startEvent(448)
    else
        player:startEvent(221)
    end
end

return entity
