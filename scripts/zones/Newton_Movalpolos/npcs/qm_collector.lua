-----------------------------------
-- Area: Newton_Movalpolos
--  NPC: ??? for Goblin Collector
-----------------------------------
local ID = zones[invaderXim.zone.NEWTON_MOVALPOLOS]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    if
        npcUtil.tradeHasExactly(trade, invaderXim.item.PREMIUM_BAG) and
        npcUtil.popFromQM(player, npc, ID.mob.GOBLIN_COLLECTOR)
    then
        player:confirmTrade()
    end
end

return entity
