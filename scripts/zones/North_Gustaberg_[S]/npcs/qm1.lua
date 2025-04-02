-----------------------------------
-- Area: North Gustaberg (S) (F-8)
--  NPC: ???
-- Involved in Quests
-- !pos -232 41 425
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    if
        player:getQuestStatus(invaderXim.questLog.CRYSTAL_WAR, invaderXim.quest.id.crystalWar.BETTER_PART_OF_VALOR) == invaderXim.questStatus.QUEST_ACCEPTED and
        player:getCharVar('BetterPartOfValProg') == 1
    then
        player:startEvent(3)
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 3 then
        player:setCharVar('BetterPartOfValProg', 2)
    end
end

return entity
