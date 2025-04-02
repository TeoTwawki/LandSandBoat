-----------------------------------
-- Area: Sea Serpent Grotto
--  NPC: <this space intentionally left blank>
-- !pos -356 14 -102 176
-----------------------------------
local ID = zones[invaderXim.zone.SEA_SERPENT_GROTTO]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    if
        player:getCharVar('RELIC_IN_PROGRESS') == invaderXim.item.YOSHIMITSU and
        npcUtil.tradeHas(trade, { invaderXim.item.TEN_THOUSAND_BYNE_BILL, invaderXim.item.DEMONIAC_FRAGMENT, invaderXim.item.SHARD_OF_NECROPSYCHE, invaderXim.item.YOSHIMITSU })
    then
        -- currency, shard, necropsyche, stage 4
        player:startEvent(11, invaderXim.item.KIKOKU_75)
    end
end

entity.onTrigger = function(player, npc)
    player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
end

entity.onEventFinish = function(player, csid, option, npc)
    if
        csid == 11 and
        npcUtil.giveItem(player, { invaderXim.item.KIKOKU_75, { invaderXim.item.ONE_HUNDRED_BYNE_BILL, 30 } })
    then
        player:confirmTrade()
        player:setCharVar('RELIC_IN_PROGRESS', 0)
    end
end

return entity
