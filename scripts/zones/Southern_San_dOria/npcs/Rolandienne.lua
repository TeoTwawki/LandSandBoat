-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Rolandienne
-- Records of Eminence NPC
-----------------------------------
local ID = zones[invaderXim.zone.SOUTHERN_SAN_DORIA]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.sparkshop.onTrade(player, npc, trade, 4601)
end

entity.onTrigger = function(player, npc)
    if player:getEminenceProgress(1) then
        player:startEvent(993)
    elseif not player:hasKeyItem(invaderXim.ki.MEMORANDOLL) then
        player:startEvent(994)
    else
        player:triggerRoeEvent(invaderXim.roeTrigger.TRIGGER_NPC)
        player:messageSpecial(ID.text.YOU_WISH_TO_EXCHANGE_SPARKS)
        invaderXim.sparkshop.onTrigger(player, npc, 995)
    end
end

entity.onEventUpdate = function(player, csid, option, npc)
    invaderXim.sparkshop.onEventUpdate(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 993 and option == 1 then
        invaderXim.roe.onRecordTrigger(player, 1)
        player:messageBasic(invaderXim.msg.basic.ROE_BONUS_ITEM_PLURAL, 4376, 6)
    end
end

return entity
