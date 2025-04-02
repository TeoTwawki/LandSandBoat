-----------------------------------
-- Area: Port San d'Oria
--  NPC: Pomilla
-- Involved in Quest: Lure of the Wildcat (San d'Oria)
-- !pos -38 -4 -55 232
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local wildcatSandy = player:getCharVar('WildcatSandy')

    if
        player:getQuestStatus(invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.LURE_OF_THE_WILDCAT) == invaderXim.questStatus.QUEST_ACCEPTED and
        not utils.mask.getBit(wildcatSandy, 11)
    then
        player:startEvent(749)
    else
        player:startEvent(562)
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 749 then
        player:setCharVar('WildcatSandy', utils.mask.setBit(player:getCharVar('WildcatSandy'), 11, true))
    end
end

return entity
