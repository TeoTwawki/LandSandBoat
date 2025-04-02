-----------------------------------
-- Area: Tavnazian Safehold
--  NPC: Elysia
-- Starts Quest: Unforgiven
-- !pos -50.410 -22.204 -41.640 26
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local unforgiven = player:getQuestStatus(invaderXim.questLog.OTHER_AREAS, invaderXim.quest.id.otherAreas.UNFORGIVEN)

    if unforgiven == invaderXim.questStatus.QUEST_AVAILABLE then
        player:startEvent(200) -- start quest
    elseif
        unforgiven == invaderXim.questStatus.QUEST_ACCEPTED and
        player:getCharVar('UnforgivenVar') == 1
    then
        player:startEvent(203) -- player hasn't talked to Pradiulot (2nd stage of Quest)
    elseif
        unforgiven == invaderXim.questStatus.QUEST_ACCEPTED and
        not player:hasKeyItem(invaderXim.ki.ALABASTER_HAIRPIN)
    then
        player:startEvent(201) -- player doesn't have keyitem
    elseif unforgiven == invaderXim.questStatus.QUEST_ACCEPTED then
        player:startEvent(202) -- player has keyitem (1st stage of Quest)
    else
        player:startEvent(190)
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 200 then
        player:addQuest(invaderXim.questLog.OTHER_AREAS, invaderXim.quest.id.otherAreas.UNFORGIVEN)
    elseif csid == 202 then
        player:setCharVar('UnforgivenVar', 1)
    end
end

return entity
