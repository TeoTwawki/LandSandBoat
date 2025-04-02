-----------------------------------
-- Area: La Theine Plateau
--  NPC:??? (qm3)
-- Involved in Quest: I Can Hear A Rainbow
-----------------------------------
local ID = zones[invaderXim.zone.LA_THEINE_PLATEAU]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    if
        player:getQuestStatus(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.I_CAN_HEAR_A_RAINBOW) == invaderXim.questStatus.QUEST_ACCEPTED and
        npcUtil.tradeHas(trade, invaderXim.item.CARBUNCLES_RUBY) and
        utils.mask.isFull(player:getCharVar('I_CAN_HEAR_A_RAINBOW'), 7)
    then
        player:startEvent(124)
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 124 then
        player:completeQuest(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.I_CAN_HEAR_A_RAINBOW)
        player:addTitle(invaderXim.title.RAINBOW_WEAVER)
        player:unlockJob(invaderXim.job.SMN)
        player:addSpell(invaderXim.magic.spell.CARBUNCLE)
        player:messageSpecial(ID.text.UNLOCK_SUMMONER)
        player:messageSpecial(ID.text.UNLOCK_CARBUNCLE)
        player:setCharVar('I_CAN_HEAR_A_RAINBOW', 0)
        player:confirmTrade()

        local rainbow = GetNPCByID(ID.npc.RAINBOW)
        if rainbow then
            rainbow:setLocalVar('setRainbow', 1)
        end
    end
end

return entity
