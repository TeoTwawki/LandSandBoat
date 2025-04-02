-----------------------------------
-- Area: Valley of Sorrows
--  NPC: <this space intentionally left blank>
-- !pos -14 -3 56 128
-----------------------------------
local ID = zones[invaderXim.zone.VALLEY_OF_SORROWS]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    if
        player:getCharVar('RELIC_IN_PROGRESS') == invaderXim.item.MILLENNIUM_HORN and
        npcUtil.tradeHas(trade, { invaderXim.item.RIMILALA_STRIPESHELL, invaderXim.item.MYSTERIAL_FRAGMENT, invaderXim.item.SHARD_OF_NECROPSYCHE, invaderXim.item.MILLENNIUM_HORN })
    then
        -- currency, shard, necropsyche, stage 4
        player:startEvent(15, invaderXim.item.GJALLARHORN_75)
    end
end

entity.onTrigger = function(player, npc)
    player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
end

entity.onEventFinish = function(player, csid, option, npc)
    if
        csid == 15 and
        npcUtil.giveItem(player, { invaderXim.item.GJALLARHORN_75, { invaderXim.item.LUNGO_NANGO_JADESHELL, 30 } })
    then
        player:confirmTrade()
        player:setCharVar('RELIC_IN_PROGRESS', 0)
    end
end

return entity
