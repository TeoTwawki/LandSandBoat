-----------------------------------
-- Area: Windurst Woods
--  NPC: Cha Lebagta
-- !pos 58.385 -6.249 216.670 241
-- Involved in Quests: As Thick as Thieves, Mihgo's Amigo
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local mihgosAmigo = player:getQuestStatus(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.MIHGOS_AMIGO)

    if mihgosAmigo == invaderXim.questStatus.QUEST_ACCEPTED then
        player:startEvent(85, 0, 498) -- Migho's Amigo hint dialog
    elseif mihgosAmigo == invaderXim.questStatus.QUEST_COMPLETED then
        player:startEvent(91, 0, 498) -- New standard dialog after Mihgo's Amigo completion
    end
end

return entity
