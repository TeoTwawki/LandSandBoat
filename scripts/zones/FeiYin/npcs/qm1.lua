-----------------------------------
-- Area: FeiYin
--  NPC: qm1 (???)
-- Involved In Quest: Pieuje's Decision
-- !pos -55 -16 69 204
-----------------------------------
local ID = zones[invaderXim.zone.FEIYIN]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    if
        player:getQuestStatus(invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.PIEUJES_DECISION) == invaderXim.questStatus.QUEST_ACCEPTED and
        npcUtil.tradeHas(trade, invaderXim.item.TAVNAZIA_BELL) and
        not player:hasItem(invaderXim.item.TAVNAZIAN_MASK) and
        not GetMobByID(ID.mob.ALTEDOUR_I_TAVNAZIA):isSpawned()
    then
        player:confirmTrade()
        player:messageSpecial(ID.text.SENSE_OF_FOREBODING)
        SpawnMob(ID.mob.ALTEDOUR_I_TAVNAZIA):updateClaim(player)
    end
end

return entity
