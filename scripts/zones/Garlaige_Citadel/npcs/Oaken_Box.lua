-----------------------------------
-- Area: Garlaige Citadel
--  NPC: Oaken Box
-- Involved In Quest: Peace for the Spirit
-- !pos -164 0.1 225 200
-----------------------------------
local ID = zones[invaderXim.zone.GARLAIGE_CITADEL]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    if
        player:getQuestStatus(invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.PEACE_FOR_THE_SPIRIT) == invaderXim.questStatus.QUEST_ACCEPTED and
        npcUtil.tradeHas(trade, invaderXim.item.NAIL_PULLER)
    then
        player:startEvent(14)
    end
end

entity.onTrigger = function(player, npc)
    if
        player:getCharVar('peaceForTheSpiritCS') == 4 and
        not player:hasItem(invaderXim.item.NAIL_PULLER) and
        not GetMobByID(ID.mob.GUARDIAN_STATUE):isSpawned()
    then
        player:messageSpecial(ID.text.SENSE_OF_FOREBODING)
        SpawnMob(ID.mob.GUARDIAN_STATUE):updateClaim(player)
    else
        player:messageSpecial(ID.text.YOU_FIND_NOTHING)
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 14 then
        player:confirmTrade()
        player:setCharVar('peaceForTheSpiritCS', 5)
    end
end

return entity
