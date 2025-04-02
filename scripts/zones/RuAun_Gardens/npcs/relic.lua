-----------------------------------
-- Area: Ru'Aun Gardens
--  NPC: <this space intentionally left blank>
-- !pos -241 -12 332 130
-----------------------------------
local ID = zones[invaderXim.zone.RUAUN_GARDENS]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    if
        player:getCharVar('RELIC_IN_PROGRESS') == invaderXim.item.GAE_ASSAIL and
        npcUtil.tradeHasExactly(trade, { invaderXim.item.RIMILALA_STRIPESHELL, invaderXim.item.STELLAR_FRAGMENT, invaderXim.item.SHARD_OF_NECROPSYCHE, invaderXim.item.GAE_ASSAIL })
    then -- currency, shard, necropsyche, stage 4
        player:startEvent(60, invaderXim.item.GUNGNIR_75)
    end
end

entity.onTrigger = function(player, npc)
    player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
end

entity.onEventFinish = function(player, csid, option, npc)
    if
        csid == 60 and
        npcUtil.giveItem(player, { invaderXim.item.GUNGNIR_75, { invaderXim.item.LUNGO_NANGO_JADESHELL, 30 } })
    then
        player:confirmTrade()
        player:setCharVar('RELIC_IN_PROGRESS', 0)
    end
end

return entity
