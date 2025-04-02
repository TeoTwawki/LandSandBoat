-----------------------------------
-- Area: Western Adoulin
--  NPC: Mastan
--  Involved with Quests: 'Order Up'
--                        'The Curious Case of Melvien'
-- !pos -9 0 67 256
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local tccom = player:getQuestStatus(invaderXim.questLog.ADOULIN, invaderXim.quest.id.adoulin.THE_CURIOUS_CASE_OF_MELVIEN)
    local tccomNeedKI = player:hasKeyItem(invaderXim.ki.MELVIENS_TURN) and not player:hasKeyItem(invaderXim.ki.MELVIENS_DEATH)
    local orderUp = player:getQuestStatus(invaderXim.questLog.ADOULIN, invaderXim.quest.id.adoulin.ORDER_UP)
    local orderMastan = utils.mask.getBit(player:getCharVar('Order_Up_NPCs'), 11)

    if orderUp == invaderXim.questStatus.QUEST_ACCEPTED and not orderMastan then
        -- Progresses Quest: 'Order Up'
        player:startEvent(70)
    elseif tccom == invaderXim.questStatus.QUEST_ACCEPTED and tccomNeedKI then
        -- Progresses Quest: 'The Curious Case of Melvien'
        player:startEvent(184)
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 70 then
        player:setCharVar('Order_Up_NPCs', utils.mask.setBit(player:getCharVar('Order_Up_NPCs'), 11, true))
    elseif csid == 184 and option == 1 then
        npcUtil.giveKeyItem(player, invaderXim.ki.MELVIENS_DEATH)
    end
end

return entity
