-----------------------------------
-- Area: Grauberg [S]
--  NPC: ???
--  Quest - Fires of Discontent
-- pos 258 33 516
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    if
        player:getQuestStatus(invaderXim.questLog.CRYSTAL_WAR, invaderXim.quest.id.crystalWar.FIRES_OF_DISCONTENT) == invaderXim.questStatus.QUEST_ACCEPTED and
        player:getCharVar('FiresOfDiscProg') == 3
    then
        player:startEvent(11)
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 11 then
        player:setCharVar('FiresOfDiscProg', 4)
    end
end

return entity
