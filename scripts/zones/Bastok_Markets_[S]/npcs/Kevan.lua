-----------------------------------
-- Area: Bastok Markets [S]
--  NPC: Kevan
-- !pos -308.590 -012.000 -094.227 189
-- Sealed Container NPC
-----------------------------------
local ID = zones[invaderXim.zone.BASTOK_MARKETS_S]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    local itemID = trade:getItemId()
    local itemKeyItemMapping =
    {
        [invaderXim.item.BRONZE_LETTERBOX] = invaderXim.ki.THE_WORDS_OF_DONHU_I,
        [invaderXim.item.BRASS_LETTERBOX] = invaderXim.ki.THE_WORDS_OF_DONHU_II,
        [invaderXim.item.SHAKUDO_LETTERBOX] = invaderXim.ki.THE_WORDS_OF_DONHU_III,
        [invaderXim.item.PAKTONG_LETTERBOX] = invaderXim.ki.THE_WORDS_OF_DONHU_IV,
        [invaderXim.item.PIG_IRON_LETTERBOX] = invaderXim.ki.THE_WORDS_OF_DONHU_V,
        [invaderXim.item.IRON_LETTERBOX] = invaderXim.ki.THE_WORDS_OF_DONHU_VI,
        [invaderXim.item.CAST_IRON_LETTERBOX] = invaderXim.ki.THE_WORDS_OF_DONHU_VII,
        [invaderXim.item.WROUGHT_IRON_LETTERBOX] = invaderXim.ki.THE_WORDS_OF_DONHU_VIII
    }
    -- Make sure we're only trading 1 Strongbox at a time.
    if
        npcUtil.tradeHasExactly(trade, itemID) and
        itemKeyItemMapping[itemID]
    then
        player:tradeComplete()
        local keyItem = itemKeyItemMapping[itemID]
        npc:showText(npc, ID.text.KEVAN_TURN_IN)
        npcUtil.giveKeyItem(player, keyItem)
    end
end

entity.onTrigger = function(player, npc)
    player:startEvent(334)
end

return entity
