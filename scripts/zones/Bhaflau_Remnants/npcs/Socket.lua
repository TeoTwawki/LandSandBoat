-----------------------------------
-- Area: Bhaflau Remnants
-- NPC: Socket
-- 50% chance to spawn east or west upon opening door
-- Trade Salvage Cells to pop Flux Flan
-- Flux Flan drops 2x the Cells traded
-----------------------------------
local ID = zones[invaderXim.zone.BHAFLAU_REMNANTS]
-----------------------------------

---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.salvage.handleSocket(player, npc, trade, ID.mob.FLUX_FLAN)
end

entity.onTrigger = function(player, npc)
    player:messageSpecial(ID.text.SOCKET_TRIGGER)
end

return entity
