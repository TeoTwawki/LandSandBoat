-----------------------------------
-- Area: North Gustaberg
--  NPC: <this space intentionally left blank>
-- !pos -217 97 461 106
-----------------------------------
local ID = zones[invaderXim.zone.NORTH_GUSTABERG]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    if
        player:getCharVar('RELIC_IN_PROGRESS') == invaderXim.item.BEC_DE_FAUCON and
        npcUtil.tradeHas(trade, { invaderXim.item.RIMILALA_STRIPESHELL, invaderXim.item.TENEBROUS_FRAGMENT, invaderXim.item.SHARD_OF_NECROPSYCHE, invaderXim.item.BEC_DE_FAUCON })
    then
        -- currency, shard, necropsyche, stage 4
        player:startEvent(254, invaderXim.item.APOCALYPSE_75)
    end
end

entity.onTrigger = function(player, npc)
    player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
end

entity.onEventFinish = function(player, csid, option, npc)
    if
        csid == 254 and
        npcUtil.giveItem(player, { invaderXim.item.APOCALYPSE_75, { invaderXim.item.LUNGO_NANGO_JADESHELL, 30 } })
    then
        player:confirmTrade()
        player:setCharVar('RELIC_IN_PROGRESS', 0)
    end
end

return entity
