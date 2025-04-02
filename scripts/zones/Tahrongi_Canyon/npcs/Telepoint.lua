-----------------------------------
-- Area: Tahrongi Canyon
--  NPC: Telepoint
-- !pos 100.000 35.150 340.000 117
-----------------------------------
local ID = zones[invaderXim.zone.TAHRONGI_CANYON]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    -- Trade any normal crystal for a faded crystal.
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
    if not player:hasKeyItem(invaderXim.ki.MEA_GATE_CRYSTAL) then
        player:startEvent(32)
    else
        player:messageSpecial(ID.text.ALREADY_OBTAINED_TELE)
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 32 then
        npcUtil.giveKeyItem(player, invaderXim.ki.MEA_GATE_CRYSTAL)
    end
end

return entity
