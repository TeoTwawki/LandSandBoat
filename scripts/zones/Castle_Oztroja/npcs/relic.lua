-----------------------------------
-- Area: Castle Oztroja
--  NPC: <this space intentionally left blank>
-- !pos -104 -73 85 151
-----------------------------------
local ID = zones[invaderXim.zone.CASTLE_OZTROJA]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    if
        player:getCharVar('RELIC_IN_PROGRESS') == invaderXim.item.CAESTUS and
        npcUtil.tradeHas(trade, { invaderXim.item.TEN_THOUSAND_BYNE_BILL, invaderXim.item.MYSTIC_FRAGMENT, invaderXim.item.SHARD_OF_NECROPSYCHE, invaderXim.item.CAESTUS })
    then
        -- currency, shard, necropsyche, stage 4
        player:startEvent(59, invaderXim.item.SPHARAI_75)
    end
end

entity.onTrigger = function(player, npc)
    player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
end

entity.onEventFinish = function(player, csid, option, npc)
    if
        csid == 59 and
        npcUtil.giveItem(player, { invaderXim.item.SPHARAI_75, { invaderXim.item.ONE_HUNDRED_BYNE_BILL, 30 } })
    then
        player:confirmTrade()
        player:setCharVar('RELIC_IN_PROGRESS', 0)
    end
end

return entity
