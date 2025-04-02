-----------------------------------
-- Area: Temple of Uggalepih
--  NPC: ??? (Spawns Sozu Rogberry NM)
-----------------------------------
local ID = zones[invaderXim.zone.TEMPLE_OF_UGGALEPIH]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    if
        npcUtil.tradeHas(trade, invaderXim.item.FLICKERING_LANTERN) and
        npcUtil.popFromQM(player, npc, ID.mob.SOZU_ROGBERRY)
    then
        player:confirmTrade()
    end
end

entity.onTrigger = function(player, npc)
    player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
end

return entity
