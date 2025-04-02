-----------------------------------
-- Area: Abyssea - Misareaux
--  NPC: Cruor Prospector
-- Type: Cruor NPC
-----------------------------------
---@type TNpcEntity
local entity = {}

---@type TProspectorItems
local prospectorItems =
{
    [invaderXim.abyssea.itemType.ITEM] =
    {
    --  Sel      Item                        Cost
        [1] = { invaderXim.item.CREED_ARMET,        5000 },
        [2] = { invaderXim.item.BALE_BURGEONET,     5000 },
        [3] = { invaderXim.item.FERINE_CABASSET,    5000 },
        [4] = { invaderXim.item.AOIDOS_CALOT,       5000 },
        [5] = { invaderXim.item.SYLVAN_GAPETTE,     5000 },
        [6] = { invaderXim.item.FORBIDDEN_KEY,       500 },
        [7] = { invaderXim.item.SHADOW_THRONE,   2000000 },
    },

    [invaderXim.abyssea.itemType.TEMP] =
    {
    --  Sel      Item                               Cost
        [ 1] = { invaderXim.item.LUCID_POTION_I,             80 },
        [ 2] = { invaderXim.item.LUCID_ETHER_I,              80 },
        [ 3] = { invaderXim.item.BOTTLE_OF_CATHOLICON,       80 },
        [ 4] = { invaderXim.item.DUSTY_ELIXIR,              120 },
        [ 5] = { invaderXim.item.TUBE_OF_CLEAR_SALVE_I,     120 },
        [ 6] = { invaderXim.item.BOTTLE_OF_STALWARTS_TONIC, 150 },
        [ 7] = { invaderXim.item.BOTTLE_OF_ASCETICS_TONIC,  150 },
        [ 8] = { invaderXim.item.BOTTLE_OF_CHAMPIONS_TONIC, 150 },
        [ 9] = { invaderXim.item.LUCID_POTION_II,           200 },
        [10] = { invaderXim.item.LUCID_ETHER_II,            200 },
        [11] = { invaderXim.item.LUCID_ELIXIR_I,            300 },
        [12] = { invaderXim.item.FLASK_OF_HEALING_POWDER,   300 },
        [13] = { invaderXim.item.PINCH_OF_MANA_POWDER,      300 },
        [14] = { invaderXim.item.TUBE_OF_HEALING_SALVE_I,   300 },
        [15] = { invaderXim.item.BOTTLE_OF_VICARS_DRINK,    300 },
        [16] = { invaderXim.item.TUBE_OF_CLEAR_SALVE_II,    300 },
        [17] = { invaderXim.item.PRIMEVAL_BREW,         2000000 },
    },

    [invaderXim.abyssea.itemType.KEYITEM] =
    {
    --  Sel     Item                                 Cost
        [1] = { invaderXim.ki.MAP_OF_ABYSSEA_MISAREAUX,      4500 },
        [2] = { invaderXim.ki.IVORY_ABYSSITE_OF_AVARICE,     8000 },
        [3] = { invaderXim.ki.IVORY_ABYSSITE_OF_KISMET,      5000 },
        [4] = { invaderXim.ki.LUNAR_ABYSSITE1,             100000 },
        [5] = { invaderXim.ki.CLEAR_DEMILUNE_ABYSSITE,        300 },
    },
}

-- Each selection can contain multiple effects in the format of { abysseaEffect, actualEffect, Amt, keyItemRequired, bonusMultiplier }
-- and after that table, the cruor cost is defined.
local prospectorEnhancement =
{
    [6] =
    {
        {
            { invaderXim.effect.ABYSSEA_HP, invaderXim.effect.MAX_HP_BOOST, 20, invaderXim.abyssea.abyssiteType.MERIT, 10 },
        },

        50,
    },

    [7] =
    {
        {
            { invaderXim.effect.ABYSSEA_MP, invaderXim.effect.MAX_MP_BOOST, 10, invaderXim.abyssea.abyssiteType.MERIT, 5 },
        },

        120,
    },

    [8] =
    {
        {
            { invaderXim.effect.ABYSSEA_STR, invaderXim.effect.STR_BOOST, 10, invaderXim.abyssea.abyssiteType.FURTHERANCE, 10 },
            { invaderXim.effect.ABYSSEA_DEX, invaderXim.effect.DEX_BOOST, 10, invaderXim.abyssea.abyssiteType.FURTHERANCE, 10 },
        },

        120,
    },

    [9] =
    {
        {
            { invaderXim.effect.ABYSSEA_VIT, invaderXim.effect.VIT_BOOST, 10, invaderXim.abyssea.abyssiteType.FURTHERANCE, 10 },
            { invaderXim.effect.ABYSSEA_AGI, invaderXim.effect.AGI_BOOST, 10, invaderXim.abyssea.abyssiteType.FURTHERANCE, 10 },
        },

        100,
    },

    [10] =
    {
        {
            { invaderXim.effect.ABYSSEA_INT, invaderXim.effect.INT_BOOST, 10, invaderXim.abyssea.abyssiteType.FURTHERANCE, 10 },
            { invaderXim.effect.ABYSSEA_CHR, invaderXim.effect.CHR_BOOST, 10, invaderXim.abyssea.abyssiteType.FURTHERANCE, 10 },
            { invaderXim.effect.ABYSSEA_MND, invaderXim.effect.MND_BOOST, 10, invaderXim.abyssea.abyssiteType.FURTHERANCE, 10 },
        },

        100,
    },

    [11] =
    {
        {
            { invaderXim.effect.ABYSSEA_HP,  invaderXim.effect.MAX_HP_BOOST, 20, invaderXim.abyssea.abyssiteType.MERIT,       10 },
            { invaderXim.effect.ABYSSEA_MP,  invaderXim.effect.MAX_MP_BOOST, 10, invaderXim.abyssea.abyssiteType.MERIT,        5 },
            { invaderXim.effect.ABYSSEA_STR, invaderXim.effect.STR_BOOST,    10, invaderXim.abyssea.abyssiteType.FURTHERANCE, 10 },
            { invaderXim.effect.ABYSSEA_DEX, invaderXim.effect.DEX_BOOST,    10, invaderXim.abyssea.abyssiteType.FURTHERANCE, 10 },
            { invaderXim.effect.ABYSSEA_VIT, invaderXim.effect.VIT_BOOST,    10, invaderXim.abyssea.abyssiteType.FURTHERANCE, 10 },
            { invaderXim.effect.ABYSSEA_AGI, invaderXim.effect.AGI_BOOST,    10, invaderXim.abyssea.abyssiteType.FURTHERANCE, 10 },
            { invaderXim.effect.ABYSSEA_INT, invaderXim.effect.INT_BOOST,    10, invaderXim.abyssea.abyssiteType.FURTHERANCE, 10 },
            { invaderXim.effect.ABYSSEA_CHR, invaderXim.effect.CHR_BOOST,    10, invaderXim.abyssea.abyssiteType.FURTHERANCE, 10 },
            { invaderXim.effect.ABYSSEA_MND, invaderXim.effect.MND_BOOST,    10, invaderXim.abyssea.abyssiteType.FURTHERANCE, 10 },
        },

        470,
    },
}

entity.onTrigger = function(player, npc)
    local cruor = player:getCurrency('cruor')
    local demilune = invaderXim.abyssea.getDemiluneAbyssite(player)

    player:startEvent(2002, cruor, demilune)
end

entity.onEventFinish = function(player, csid, option, npc)
    local itemCategory = bit.band(option, 0x07)
    local itemSelected = bit.band(bit.rshift(option, 16), 0x1F)
    local cruorTotal = player:getCurrency('cruor')

    if itemCategory == invaderXim.abyssea.itemType.ITEM then
        local itemData = prospectorItems[itemCategory][itemSelected]
        local itemQty = itemData[1] ~= invaderXim.item.FORBIDDEN_KEY and 1 or bit.rshift(option, 24)
        local itemCost = itemData[2] * itemQty

        if
            itemCost <= cruorTotal and
            npcUtil.giveItem(player, { { itemData[1], itemQty } })
        then
            player:delCurrency('cruor', itemCost)
        end
    elseif itemCategory == invaderXim.abyssea.itemType.TEMP then
        local itemData = prospectorItems[itemCategory][itemSelected]
        local itemCost = itemData[2]

        if
            itemCost <= cruorTotal and
            npcUtil.giveTempItem(player, { { itemData[1], 1 } })
        then
            player:delCurrency('cruor', itemCost)
        end
    elseif itemCategory == invaderXim.abyssea.itemType.KEYITEM then
        local itemData = prospectorItems[itemCategory][itemSelected]

        if
            itemData[2] <= cruorTotal and
            npcUtil.giveKeyItem(player, itemData[1])
        then
            player:delCurrency('cruor', itemData[2])
        end
    elseif itemCategory == invaderXim.abyssea.itemType.ENHANCEMENT then
        local enhanceData = prospectorEnhancement[itemSelected]

        if enhanceData[2] <= cruorTotal then
            for _, v in ipairs(enhanceData[1]) do
                player:addStatusEffectEx(v[1], v[2], v[3] + invaderXim.abyssea.getAbyssiteTotal(player, v[4]) * v[5], 0, 0)

                if v[1] == invaderXim.effect.ABYSSEA_HP then
                    player:addHP(v[3] + invaderXim.abyssea.getAbyssiteTotal(player, v[4]) * v[5])
                elseif v[1] == invaderXim.effect.ABYSSEA_MP then
                    player:addMP(v[3] + invaderXim.abyssea.getAbyssiteTotal(player, v[4]) * v[5])
                end
            end

            player:delCurrency('cruor', enhanceData[2])
        end
    end
end

return entity
