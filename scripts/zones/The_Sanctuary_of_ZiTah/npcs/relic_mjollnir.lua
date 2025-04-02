-----------------------------------
-- Area: The Sanctuary of Zi'Tah
--  NPC: <this space intentionally left blank>
-- !pos -18 0 55 121
-----------------------------------
local ID = zones[invaderXim.zone.THE_SANCTUARY_OF_ZITAH]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    local currentRelic = player:getCharVar('RELIC_IN_PROGRESS')

    if
        currentRelic == invaderXim.item.GULLINTANI and
        npcUtil.tradeHas(trade, { invaderXim.item.RANPERRE_GOLDPIECE, invaderXim.item.HEAVENLY_FRAGMENT, invaderXim.item.SHARD_OF_NECROPSYCHE, invaderXim.item.GULLINTANI })
    then
        -- currency, shard, necropsyche, stage 4
        player:startEvent(216, invaderXim.item.MJOLLNIR_75)
    end
end

entity.onTrigger = function(player, npc)
    player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
end

entity.onEventFinish = function(player, csid, option, npc)
    if
        csid == 216 and
        npcUtil.giveItem(player, { invaderXim.item.MJOLLNIR_75, { invaderXim.item.MONTIONT_SILVERPIECE, 30 } })
    then
        player:confirmTrade()
        player:setCharVar('RELIC_IN_PROGRESS', 0)
    end
end

return entity
