-----------------------------------
-- Abyssea Sturdy Pyxis - Temporary item
-----------------------------------
xi = xi or {}
invaderXim.pyxis = invaderXim.pyxis or {}

invaderXim.pyxis.tempItem = {}

-----------------------------------
-- drop id's for temp items
-- use zone id as the key
-----------------------------------
-- TODO: Add Temp Items to items.lua
local drops =
{
    [1] =
    {
        invaderXim.item.BOTTLE_OF_CATHOLICON,
        invaderXim.item.MEGALIXIR,
        invaderXim.item.BOTTLE_OF_GNOSTICS_DRINK,
        invaderXim.item.BOTTLE_OF_SPRINTERS_DRINK,
        invaderXim.item.DUSTY_ELIXIR,
        invaderXim.item.LUCID_POTION_I,
        invaderXim.item.LUCID_ETHER_I,
    },

    [2] =
    {
        invaderXim.item.BOTTLE_OF_CATHOLICON,
        invaderXim.item.MEGALIXIR,
        invaderXim.item.BOTTLE_OF_GNOSTICS_DRINK,
        invaderXim.item.BOTTLE_OF_SPRINTERS_DRINK,
        invaderXim.item.DUSTY_ELIXIR,
        invaderXim.item.LUCID_POTION_I,
        invaderXim.item.LUCID_ETHER_I,
        invaderXim.item.DUSTY_WING,
        invaderXim.item.TUBE_OF_HEALING_SALVE_I,
        invaderXim.item.TUBE_OF_CLEAR_SALVE_I,
        invaderXim.item.BOTTLE_OF_STALWARTS_TONIC,
        invaderXim.item.BOTTLE_OF_ASCETICS_TONIC,
        invaderXim.item.BOTTLE_OF_CHAMPIONS_TONIC,
        invaderXim.item.BOTTLE_OF_SWIFTSHOT_DRINK,
        invaderXim.item.BOTTLE_OF_BERSERKERS_DRINK,
    },

    [3] =
    {
        invaderXim.item.BOTTLE_OF_CLERICS_DRINK,
        invaderXim.item.BOTTLE_OF_FOOLS_DRINK,
        invaderXim.item.BOTTLE_OF_VICARS_DRINK,
        invaderXim.item.LUCID_POTION_II,
        invaderXim.item.LUCID_ETHER_II,
        invaderXim.item.LUCID_ELIXIR_I,
        invaderXim.item.FLASK_OF_HEALING_MIST,
        invaderXim.item.FLASK_OF_MANA_MIST,
        invaderXim.item.PAIR_OF_LUCID_WINGS_I,
        invaderXim.item.TUBE_OF_CLEAR_SALVE_II,
        invaderXim.item.BOTTLE_OF_CHAMPIONS_GAMBIR,
        invaderXim.item.BOTTLE_OF_FOOLS_TONIC,
        invaderXim.item.BOTTLE_OF_SWIFTSHOT_TONIC,
    },

    [4] =
    {
        invaderXim.item.BOTTLE_OF_CLERICS_DRINK,
        invaderXim.item.BOTTLE_OF_FOOLS_DRINK,
        invaderXim.item.BOTTLE_OF_VICARS_DRINK,
        invaderXim.item.LUCID_POTION_II,
        invaderXim.item.LUCID_ETHER_II,
        invaderXim.item.LUCID_ELIXIR_I,
        invaderXim.item.FLASK_OF_HEALING_MIST,
        invaderXim.item.FLASK_OF_MANA_MIST,
        invaderXim.item.PAIR_OF_LUCID_WINGS_I,
        invaderXim.item.TUBE_OF_CLEAR_SALVE_II,
        invaderXim.item.BOTTLE_OF_CHAMPIONS_GAMBIR,
        invaderXim.item.BOTTLE_OF_FOOLS_TONIC,
        invaderXim.item.BOTTLE_OF_SWIFTSHOT_TONIC,
        invaderXim.item.PINCH_OF_MANA_POWDER,
        invaderXim.item.FLASK_OF_HEALING_POWDER,
        invaderXim.item.BOTTLE_OF_MONARCHS_DRINK,
        invaderXim.item.BOTTLE_OF_FANATICS_DRINK,
        invaderXim.item.LUCID_POTION_III,
        invaderXim.item.LUCID_ETHER_III,
        invaderXim.item.LUCID_ELIXIR_II,
        invaderXim.item.TUBE_OF_HEALING_SALVE_II,
        invaderXim.item.BOTTLE_OF_STALWARTS_GAMBIR,
        invaderXim.item.BOTTLE_OF_ASCETICS_GAMBIR,
        invaderXim.item.PINCH_OF_FANATICS_POWDER,
        invaderXim.item.PINCH_OF_FOOLS_POWDER,
        invaderXim.item.BOTTLE_OF_BERSERKERS_TONIC,
    },

    [5] =
    {
        invaderXim.item.BOTTLE_OF_CLERICS_DRINK,
        invaderXim.item.BOTTLE_OF_FOOLS_DRINK,
        invaderXim.item.BOTTLE_OF_VICARS_DRINK,
        invaderXim.item.LUCID_POTION_II,
        invaderXim.item.LUCID_ETHER_II,
        invaderXim.item.LUCID_ELIXIR_I,
        invaderXim.item.FLASK_OF_HEALING_MIST,
        invaderXim.item.FLASK_OF_MANA_MIST,
        invaderXim.item.PAIR_OF_LUCID_WINGS_I,
        invaderXim.item.TUBE_OF_CLEAR_SALVE_II,
        invaderXim.item.BOTTLE_OF_CHAMPIONS_GAMBIR,
        invaderXim.item.BOTTLE_OF_FOOLS_TONIC,
        invaderXim.item.BOTTLE_OF_SWIFTSHOT_TONIC,
        invaderXim.item.PINCH_OF_MANA_POWDER,
        invaderXim.item.FLASK_OF_HEALING_POWDER,
        invaderXim.item.BOTTLE_OF_MONARCHS_DRINK,
        invaderXim.item.BOTTLE_OF_FANATICS_DRINK,
        invaderXim.item.LUCID_POTION_III,
        invaderXim.item.LUCID_ETHER_III,
        invaderXim.item.LUCID_ELIXIR_II,
        invaderXim.item.TUBE_OF_HEALING_SALVE_II,
        invaderXim.item.BOTTLE_OF_STALWARTS_GAMBIR,
        invaderXim.item.BOTTLE_OF_ASCETICS_GAMBIR,
        invaderXim.item.PINCH_OF_FANATICS_POWDER,
        invaderXim.item.PINCH_OF_FOOLS_POWDER,
        invaderXim.item.BOTTLE_OF_BERSERKERS_TONIC,
        invaderXim.item.REVITALIZER,
        invaderXim.item.DAEDALUS_WING,
        invaderXim.item.BOTTLE_OF_FANATICS_TONIC,
    },
}

local function GetTempDropTable(npc)
    local maxItem = npc:getLocalVar('NB_ITEM')
    local tempTable = {}

    for i = 1, maxItem do
        tempTable[i] = npc:getLocalVar('TEMP' .. i)
    end

    return tempTable
end

local function GiveTempItem(player, npc, tempNum)
    local tempItems = GetTempDropTable(npc)
    local ID = zones[player:getZoneID()]

    if tempItems[tempNum] == 0 then
        player:messageSpecial(ID.text.TEMP_ITEM_DISAPPEARED)
        return
    else
        if player:hasItem(tempItems[tempNum], 3) then
            player:messageSpecial(ID.text.ALLREADY_POSSESS_TEMP_ITEM)
            return
        else
            player:addTempItem(tempItems[tempNum])
            invaderXim.pyxis.messageChest(player, ID.text.OBTAINS_TEMP_ITEM, tempItems[tempNum], 0, 0, 0, npc)
            npc:setLocalVar('TEMP' .. tempNum, 0)
            tempItems[tempNum] = 0
        end
    end

    if invaderXim.pyxis.isChestEmpty(tempItems) then
        invaderXim.pyxis.removeChest(player, npc, 0, 3)
    end
end

invaderXim.pyxis.tempItem.setTempItems = function(npc, tier)
    local maxItem = npc:getLocalVar('NB_ITEM')

    for i = 1, maxItem do
        local temp = drops[tier][math.random(1, #drops[tier])]
        npc:setLocalVar('TEMP' .. i, temp)
    end
end

invaderXim.pyxis.tempItem.giveTemporaryItems = function(npc, player)
    local tier = npc:getLocalVar('TIER')
    local ID = zones[npc:getZoneID()]
    local alliance = player:getAlliance()

    for i = 1, #drops[tier] do
        local item = drops[tier][math.random(1, #drops[tier])]
        for p, member in ipairs(alliance) do
            if
                member:isPC() and
                not member:hasItem(item, 3) and
                member:getZoneID() == player:getZoneID()
            then
                member:addTempItem(item, 1, 0, 0, 0, 0, 0, 0, 0, 0)
            end
        end
    end

    for p, member in ipairs(alliance) do
        if member:isPC() then
            member:messageSpecial(ID.text.OBTAINS_SEVERAL_TEMPS, 0, 0, 0, 0)
        end
    end
end

invaderXim.pyxis.tempItem.updateEvent = function(player, npc)
    player:updateEvent(unpack(GetTempDropTable(npc)))
end

invaderXim.pyxis.tempItem.giveTemporaryItem = function(player, npc, option)
    local itemSelected = bit.rshift(option, 16)

    if itemSelected > 0 and itemSelected <= 8 then
        GiveTempItem(player, npc, itemSelected)
    end
end
