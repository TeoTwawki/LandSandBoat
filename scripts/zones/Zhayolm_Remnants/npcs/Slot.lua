-----------------------------------
-- Area: Zhayolm Remnants
-- NPC: Slot
-- trade card to pop NM
-----------------------------------
local ID = zones[invaderXim.zone.ZHAYOLM_REMNANTS]
-----------------------------------

---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.salvage.handleSlot(player, npc, trade, invaderXim.item.SILVER_SEA_CARD, ID.mob.JAKKO)
end

entity.onTrigger = function(player, npc)
    player:messageSpecial(ID.text.SLOT_TRIGGER)
end

return entity
