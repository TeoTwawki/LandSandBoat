-----------------------------------
-- Area: Attohwa Chasm
--  NPC: Cradle_of_Rebirth
-----------------------------------
local ID = zones[invaderXim.zone.ATTOHWA_CHASM]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    -- Trade Flaxen Pouch
    if trade:hasItemQty(invaderXim.item.FLAXEN_POUCH, 1) and trade:getItemCount() == 1 then
        if player:getFreeSlotsCount() == 0 then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, invaderXim.item.POUCH_OF_PARRADAMO_STONES) -- Parradamo Stones
        else
            player:tradeComplete()
            player:addItem(invaderXim.item.POUCH_OF_PARRADAMO_STONES)
            player:messageSpecial(ID.text.ITEM_OBTAINED, invaderXim.item.POUCH_OF_PARRADAMO_STONES) -- Parradamo Stones
        end
    end
end

return entity
