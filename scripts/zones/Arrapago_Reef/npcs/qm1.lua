-----------------------------------
-- Area: Arrapago Reef
--  NPC: ??? (Spawn Lil'Apkallu(ZNM T1))
-- !pos 488 -1 166 54
-----------------------------------
local ID = zones[invaderXim.zone.ARRAPAGO_REEF]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    if
        npcUtil.tradeHasExactly(trade, invaderXim.item.GREENLING) and
        npcUtil.popFromQM(player, npc, ID.mob.LIL_APKALLU, { message = ID.text.DRAWS_NEAR })
    then
        player:confirmTrade()
    end
end

return entity
