-----------------------------------
-- Area: La Theine Plateau
--  NPC: Telepoint
-- !pos 420.000 19.104 20.000 102
-----------------------------------
local ID = zones[invaderXim.zone.LA_THEINE_PLATEAU]
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
    if not player:hasKeyItem(invaderXim.ki.HOLLA_GATE_CRYSTAL) then
        player:startEvent(116)
    else
        player:messageSpecial(ID.text.ALREADY_OBTAINED_TELE)
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 116 then
        npcUtil.giveKeyItem(player, invaderXim.ki.HOLLA_GATE_CRYSTAL)
    end
end

return entity
