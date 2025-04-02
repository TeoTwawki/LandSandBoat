-----------------------------------
-- Area: Dragon's Aery
--  NPC: <this space intentionally left blank>
-- !pos -20 -2 61 154
-----------------------------------
local ID = zones[invaderXim.zone.DRAGONS_AERY]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    if
        player:getCharVar('RELIC_IN_PROGRESS') == invaderXim.item.CALIBURN and
        npcUtil.tradeHas(trade, { invaderXim.item.RANPERRE_GOLDPIECE, invaderXim.item.HOLY_FRAGMENT, invaderXim.item.SHARD_OF_NECROPSYCHE, invaderXim.item.CALIBURN })
    then
        -- currency, shard, necropsyche, stage 4
        player:startEvent(3, invaderXim.item.EXCALIBUR_75)
    end
end

entity.onTrigger = function(player, npc)
    player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
end

entity.onEventFinish = function(player, csid, option, npc)
    if
        csid == 3 and
        npcUtil.giveItem(player, { invaderXim.item.EXCALIBUR_75, { invaderXim.item.MONTIONT_SILVERPIECE, 30 } })
    then
        player:confirmTrade()
        player:setCharVar('RELIC_IN_PROGRESS', 0)
    end
end

return entity
