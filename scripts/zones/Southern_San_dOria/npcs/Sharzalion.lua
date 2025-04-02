-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Sharzalion
-- !pos 95 0 111 230
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local envelopedInDarkness = player:getQuestStatus(invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.ENVELOPED_IN_DARKNESS)
    local peaceForTheSpirit   = player:getQuestStatus(invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.PEACE_FOR_THE_SPIRIT)
    local peaceForTheSpiritCS = player:getCharVar('peaceForTheSpiritCS')

    if
        envelopedInDarkness == invaderXim.questStatus.QUEST_COMPLETED and
        peaceForTheSpirit == invaderXim.questStatus.QUEST_AVAILABLE
    then
        player:startEvent(69)
    elseif
        peaceForTheSpirit == invaderXim.questStatus.QUEST_ACCEPTED and
        peaceForTheSpiritCS == 0
    then
        player:startEvent(64)
    elseif
        peaceForTheSpirit == invaderXim.questStatus.QUEST_ACCEPTED and
        peaceForTheSpiritCS == 1
    then
        player:startEvent(65)
    elseif
        peaceForTheSpirit == invaderXim.questStatus.QUEST_ACCEPTED and
        (peaceForTheSpiritCS == 2 or peaceForTheSpiritCS == 3)
    then
        player:startEvent(66)
    else
        player:startEvent(15)
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 64 then
        player:setCharVar('peaceForTheSpiritCS', 1)
    elseif csid == 66 then
        player:setCharVar('peaceForTheSpiritCS', 3)
    end
end

return entity
