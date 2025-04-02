-----------------------------------
-- Area: The Sanctuary of Zi'Tah
--  NPC: <this space intentionally left blank>
-- !pos 646 -2 -165 121
-----------------------------------
local ID = zones[invaderXim.zone.THE_SANCTUARY_OF_ZITAH]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    local currentRelic = player:getCharVar('RELIC_IN_PROGRESS')

    -- Mandau
    if
        currentRelic == invaderXim.item.BATARDEAU and
        npcUtil.tradeHas(trade, { invaderXim.item.TEN_THOUSAND_BYNE_BILL, invaderXim.item.ORNATE_FRAGMENT, invaderXim.item.SHARD_OF_NECROPSYCHE, invaderXim.item.BATARDEAU })
    then
        -- currency, shard, necropsyche, stage 4
        player:startEvent(207, invaderXim.item.MANDAU_75)
    end
end

entity.onTrigger = function(player, npc)
    player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
end

entity.onEventFinish = function(player, csid, option, npc)
    if
        csid == 207 and
        npcUtil.giveItem(player, { invaderXim.item.MANDAU_75, { invaderXim.item.ONE_HUNDRED_BYNE_BILL, 30 } })
    then
        player:confirmTrade()
        player:setCharVar('RELIC_IN_PROGRESS', 0)
    end
end

return entity
