-----------------------------------
-- Area: Arrapago Reef
--  NPC: ??? (Spawn Zareehkl the Jubilant(ZNM T2))
-- !pos 176 -4 182 54
-----------------------------------
local ID = zones[invaderXim.zone.ARRAPAGO_REEF]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    if
        npcUtil.tradeHasExactly(trade, invaderXim.item.MERROW_NO_11_MOLTING) and
        npcUtil.popFromQM(player, npc, ID.mob.ZAREEHKL_THE_JUBILANT, { message = ID.text.DRAWS_NEAR })
    then
        player:confirmTrade()
    end
end

return entity
