-----------------------------------
-- Area: Beaucedine Glacier
--  NPC: <this space intentionally left blank>
-- !pos -89 0 -374 111
-----------------------------------
local ID = zones[invaderXim.zone.BEAUCEDINE_GLACIER]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    if
        player:getCharVar('RELIC_IN_PROGRESS') == invaderXim.item.VALHALLA and
        npcUtil.tradeHas(trade, { invaderXim.item.RANPERRE_GOLDPIECE, invaderXim.item.INTRICATE_FRAGMENT, invaderXim.item.SHARD_OF_NECROPSYCHE, invaderXim.item.VALHALLA })
    then
        -- currency, shard, necropsyche, stage 4
        player:startEvent(139, invaderXim.item.RAGNAROK_75)
    end
end

entity.onTrigger = function(player, npc)
    player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
end

entity.onEventFinish = function(player, csid, option, npc)
    if
        csid == 139 and
        npcUtil.giveItem(player, { invaderXim.item.RAGNAROK_75, { invaderXim.item.MONTIONT_SILVERPIECE, 30 } })
    then
        player:confirmTrade()
        player:setCharVar('RELIC_IN_PROGRESS', 0)
    end
end

return entity
