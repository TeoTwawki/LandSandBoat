-----------------------------------
-- Area: Eastern Altepa Desert
--  NPC: Telepoint
-- !pos -61.942 3.949 224.900 114
-----------------------------------
local ID = zones[invaderXim.zone.EASTERN_ALTEPA_DESERT]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    -- Trade any normal crystal for a faded crystal
    local item = trade:getItemId()
    if
        trade:getItemCount() == 1 and
        item >= invaderXim.item.FIRE_CRYSTAL and
        item <= invaderXim.item.DARK_CRYSTAL and
        npcUtil.giveItem(player, invaderXim.item.FADED_CRYSTAL)
    then
        player:tradeComplete()
    end
end

entity.onTrigger = function(player, npc)
    if not player:hasKeyItem(invaderXim.ki.ALTEPA_GATE_CRYSTAL) then
        player:startEvent(1)
    else
        player:messageSpecial(ID.text.ALREADY_OBTAINED_TELE)
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 1 then
        npcUtil.giveKeyItem(player, invaderXim.ki.ALTEPA_GATE_CRYSTAL)
    end
end

return entity
