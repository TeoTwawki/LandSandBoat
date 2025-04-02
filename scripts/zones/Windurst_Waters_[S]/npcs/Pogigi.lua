-----------------------------------
-- Area: Windurst Waters (S)
--  NPC: Pogigi
-- !pos -29.787 -4.499 42.603 94
-- Sealed Container NPC
-----------------------------------
local ID = zones[invaderXim.zone.WINDURST_WATERS_S]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    local itemID = trade:getItemId()
    local itemKeyItemMapping =
    {
        [invaderXim.item.BAMBOO_GRASS_BASKET] = invaderXim.ki.HABALOS_ECLOGUE_VERSE_I,
        [invaderXim.item.BAMBOO_MEDICINE_BASKET] = invaderXim.ki.HABALOS_ECLOGUE_VERSE_II,
        [invaderXim.item.BAMBOO_BUGCAGE] = invaderXim.ki.HABALOS_ECLOGUE_VERSE_III,
        [invaderXim.item.BAMBOO_FLOWER_BASKET] = invaderXim.ki.HABALOS_ECLOGUE_VERSE_IV,
        [invaderXim.item.BAMBOO_BIRDCAGE] = invaderXim.ki.HABALOS_ECLOGUE_VERSE_V,
        [invaderXim.item.BAMBOO_CHARCOAL_BASKET] = invaderXim.ki.HABALOS_ECLOGUE_VERSE_VI,
        [invaderXim.item.BAMBOO_TEA_BASKET] = invaderXim.ki.HABALOS_ECLOGUE_VERSE_VII,
        [invaderXim.item.BAMBOO_SNAKECAGE] = invaderXim.ki.HABALOS_ECLOGUE_VERSE_VIII
    }
    -- Make sure we're only trading 1 Basket at a time.
    if
        npcUtil.tradeHasExactly(trade, itemID) and
        itemKeyItemMapping[itemID]
    then
        player:tradeComplete()
        local keyItem = itemKeyItemMapping[itemID]
        npc:showText(npc, ID.text.POGIGI_TURN_IN)
        npcUtil.giveKeyItem(player, keyItem)
    end
end

return entity
