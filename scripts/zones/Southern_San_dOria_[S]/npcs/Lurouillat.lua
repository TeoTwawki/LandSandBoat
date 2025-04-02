-----------------------------------
-- Area: Southern SandOria [S]
--  NPC: Lurouillat
-- !pos 44 2 -35 80
-- Sealed Container NPC
-----------------------------------
local ID = zones[invaderXim.zone.SOUTHERN_SAN_DORIA_S]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    local itemID = trade:getItemId()
    local itemKeyItemMapping =
    {
        [invaderXim.item.MAPLE_STRONGBOX] = invaderXim.ki.IMPERIAL_LINEAGE_CHAPTER_I,
        [invaderXim.item.MAGNOLIA_STRONGBOX] = invaderXim.ki.IMPERIAL_LINEAGE_CHAPTER_II,
        [invaderXim.item.BEECH_STRONGBOX] = invaderXim.ki.IMPERIAL_LINEAGE_CHAPTER_III,
        [invaderXim.item.EVERGREEN_STRONGBOX] = invaderXim.ki.IMPERIAL_LINEAGE_CHAPTER_IV,
        [invaderXim.item.HOLLY_STRONGBOX] = invaderXim.ki.IMPERIAL_LINEAGE_CHAPTER_V,
        [invaderXim.item.OAK_STRONGBOX] = invaderXim.ki.IMPERIAL_LINEAGE_CHAPTER_VI,
        [invaderXim.item.ELM_STRONGBOX] = invaderXim.ki.IMPERIAL_LINEAGE_CHAPTER_VII,
        [invaderXim.item.WILLOW_STRONGBOX] = invaderXim.ki.IMPERIAL_LINEAGE_CHAPTER_VIII
    }
    -- Make sure we're only trading 1 Basket at a time.
    if
        npcUtil.tradeHasExactly(trade, itemID) and
        itemKeyItemMapping[itemID]
    then
        player:tradeComplete()
        local keyItem = itemKeyItemMapping[itemID]
        npc:showText(npc, ID.text.LUROUILLAT_TURN_IN)
        npcUtil.giveKeyItem(player, keyItem)
    end
end

entity.onTrigger = function(player, npc)
    player:startEvent(350)
end

return entity
