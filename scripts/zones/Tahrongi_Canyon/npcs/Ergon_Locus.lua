-----------------------------------
-- Area: Tahrongi Canyon
--  NPC: Ergon Locus ???
-- Involved in quest Dances with Luopans
-- pos 90.846 40.448 339.803
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    -- DANCES WITH LUOPANS
    if
        player:getQuestStatus(invaderXim.questLog.ADOULIN, invaderXim.quest.id.adoulin.DANCES_WITH_LUOPANS) == invaderXim.questStatus.QUEST_ACCEPTED and
        player:getNation() == invaderXim.nation.WINDURST
    then
        if
            not player:hasKeyItem(invaderXim.ki.FISTFUL_OF_HOMELAND_SOIL) and
            not player:hasKeyItem(invaderXim.ki.LUOPAN)
        then
            npcUtil.giveKeyItem(player, invaderXim.ki.FISTFUL_OF_HOMELAND_SOIL)
        end
    end
end

return entity
