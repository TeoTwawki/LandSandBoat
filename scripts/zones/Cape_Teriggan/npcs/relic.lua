-----------------------------------
-- Area: Cape Teriggan
--  NPC: <this space intentionally left blank>
-- !pos 73 4 -174 113
-----------------------------------
local ID = zones[invaderXim.zone.CAPE_TERIGGAN]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    if
        player:getCharVar('RELIC_IN_PROGRESS') == invaderXim.item.FUTATOKOROTO and
        npcUtil.tradeHas(trade, { invaderXim.item.RANPERRE_GOLDPIECE, invaderXim.item.SNARLED_FRAGMENT, invaderXim.item.SHARD_OF_NECROPSYCHE, invaderXim.item.FUTATOKOROTO })
    then
        -- currency, shard, necropsyche, stage 4
        player:startEvent(18, invaderXim.item.YOICHINOYUMI_75)
    end
end

entity.onTrigger = function(player, npc)
    player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
end

entity.onEventFinish = function(player, csid, option, npc)
    if
        csid == 18 and
        npcUtil.giveItem(player, { invaderXim.item.YOICHINOYUMI_75, { invaderXim.item.MONTIONT_SILVERPIECE, 30 } })
    then
        player:confirmTrade()
        player:setCharVar('RELIC_IN_PROGRESS', 0)
    end
end

return entity
