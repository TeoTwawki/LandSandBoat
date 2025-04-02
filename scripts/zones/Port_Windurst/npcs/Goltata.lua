-----------------------------------
-- Area: Port Windurst
--  NPC: Goltata
--  Involved in Quests: Wonder Wands
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local wonderWands = player:getQuestStatus(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.WONDER_WANDS)

    if wonderWands == invaderXim.questStatus.QUEST_ACCEPTED then
        player:startEvent(257, 0, 0, 17091)
    elseif wonderWands == invaderXim.questStatus.QUEST_COMPLETED then
        player:startEvent(269)
    else
        player:startEvent(232)
    end
end

return entity
