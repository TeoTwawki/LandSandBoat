-----------------------------------
-- Area: Tavnazian Safehold
--  NPC: ???
-- Involved in Quest: Unforgiven
-- !pos 110.714 -40.856 -53.154 26
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local unforgiven = player:getQuestStatus(invaderXim.questLog.OTHER_AREAS, invaderXim.quest.id.otherAreas.UNFORGIVEN)

    if
        unforgiven == invaderXim.questStatus.QUEST_ACCEPTED and
        not player:hasKeyItem(invaderXim.ki.ALABASTER_HAIRPIN)
    then
        npcUtil.giveKeyItem(player, invaderXim.ki.ALABASTER_HAIRPIN) -- ALABASTER HAIRPIN for Unforgiven Quest
    end
end

return entity
