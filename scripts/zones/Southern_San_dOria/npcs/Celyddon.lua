-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Celyddon
--  General Info NPC
-- !pos -129 -6 90 230
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local aSquiresTest = player:getQuestStatus(invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.A_SQUIRES_TEST)

    if aSquiresTest == (invaderXim.questStatus.QUEST_AVAILABLE) then
        player:startEvent(618) -- im looking for the examiner
    elseif aSquiresTest == (invaderXim.questStatus.QUEST_ACCEPTED) then
        player:startEvent(619) -- i found the examiner but said i had to use sword
    else
        player:startEvent(620) -- says i needs a revival tree root
    end
end

return entity
