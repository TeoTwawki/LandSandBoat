-----------------------------------
-- Abyssea Sturdy Pyxis - Item
-----------------------------------
xi = xi or {}
invaderXim.pyxis = invaderXim.pyxis or {}

invaderXim.pyxis.item = {}

-----------------------------------
-- drop id's for items
-- use zone id as the key
-----------------------------------
-- Containing Ore actually
local commonDrops =
{
    invaderXim.item.CHUNK_OF_FIRE_ORE,
    invaderXim.item.CHUNK_OF_ICE_ORE,
    invaderXim.item.CHUNK_OF_WIND_ORE,
    invaderXim.item.CHUNK_OF_EARTH_ORE,
    invaderXim.item.CHUNK_OF_LIGHTNING_ORE,
    invaderXim.item.CHUNK_OF_WATER_ORE,
    invaderXim.item.CHUNK_OF_LIGHT_ORE,
    invaderXim.item.CHUNK_OF_DARK_ORE,
}

local itemDrops =
{
    [invaderXim.zone.ABYSSEA_KONSCHTAT ] =
    {
        invaderXim.item.HANDFUL_OF_CLOT_PLASMA,
        invaderXim.item.SCROLL_OF_WATER_V,
        invaderXim.item.SLICE_OF_DRAGON_MEAT,
        invaderXim.item.SLICE_OF_BUFFALO_MEAT,
        invaderXim.item.SQUARE_OF_SHAGREEN,
        invaderXim.item.FIENDISH_SKIN,
        invaderXim.item.LARIMAR,
        invaderXim.item.CHUNK_OF_DARK_ORE,
        invaderXim.item.HELIODOR,
        invaderXim.item.IOLITE,
        invaderXim.item.CHUNK_OF_KHROMA_ORE,
        invaderXim.item.CHUNK_OF_LIGHTNING_ORE,
        invaderXim.item.CHUNK_OF_PHRYGIAN_ORE,
        invaderXim.item.CHUNK_OF_WOOTZ_ORE,
        invaderXim.item.SQUARE_OF_DAMASCENE_CLOTH,
        invaderXim.item.SLICE_OF_COEURL_MEAT,
        invaderXim.item.SCROLL_OF_KNIGHTS_MINNE_V,
    },

    [invaderXim.zone.ABYSSEA_TAHRONGI] =
    {
        invaderXim.item.FLOCON_DE_MER,
        invaderXim.item.WATER_SPIDERS_WEB,
        invaderXim.item.CORAL_FRAGMENT,
        invaderXim.item.SCROLL_OF_BARAMNESRA,
        invaderXim.item.SCROLL_OF_STONE_V,
        invaderXim.item.SCROLL_OF_WATER_V,
        invaderXim.item.SCROLL_OF_SHELL_V,
        invaderXim.item.SCROLL_OF_CURE_VI,
        invaderXim.item.SCROLL_OF_FOE_REQUIEM_VII,
        invaderXim.item.SCROLL_OF_KNIGHTS_MINNE_V,
        invaderXim.item.SCROLL_OF_AISHA_ICHI,
        invaderXim.item.CHUNK_OF_DARKSTEEL_ORE,
        invaderXim.item.HANDFUL_OF_CLOT_PLASMA,
        invaderXim.item.DEATHSTONE,
        invaderXim.item.SPINEL,
        invaderXim.item.CHUNK_OF_DURIUM_ORE,
        invaderXim.item.SAPPHIRE,
        invaderXim.item.CHUNK_OF_LIGHTNING_ORE,
        invaderXim.item.EMERALD,
        invaderXim.item.SLICE_OF_DRAGON_MEAT,
        invaderXim.item.TARNISHED_PINCER,
        invaderXim.item.CHUNK_OF_PHRYGIAN_ORE,
        invaderXim.item.RUBY,
        invaderXim.item.PIECE_OF_ANGEL_SKIN,
        invaderXim.item.PHILOSOPHERS_STONE,
        invaderXim.item.CLUMP_OF_ALKALINE_HUMUS,
        invaderXim.item.CLUMP_OF_ACIDIC_HUMUS,
        invaderXim.item.EFT_EGG,
        invaderXim.item.QUIVERING_EFT_EGG,
        invaderXim.item.SHOCKING_WHISKER,
        invaderXim.item.SMOOTH_WHISKER,
        invaderXim.item.RESILIENT_MANE,
        invaderXim.item.CHUNK_OF_COCKATRICE_TAILMEAT,
        invaderXim.item.EXORCISED_SKULL,
    },

    [invaderXim.zone.ABYSSEA_LA_THEINE] =
    {
        invaderXim.item.CHUNK_OF_WATER_ORE,
        invaderXim.item.POT_OF_URUSHI,
        invaderXim.item.WINTER_PUK_EGG,
        invaderXim.item.GIANT_AGARICUS_MUSHROOM,
        invaderXim.item.FILTHY_GNOLE_CLAW,
        invaderXim.item.OVERSIZED_SOCK,
        invaderXim.item.STAR_SAPPHIRE,
        invaderXim.item.CHUNK_OF_PHRYGIAN_ORE,
        invaderXim.item.CHUNK_OF_ORICHALCUM_ORE,
        invaderXim.item.LACQUER_TREE_LOG,
        invaderXim.item.CHUNK_OF_KHROMA_ORE,
        invaderXim.item.SQUARE_OF_GALATEIA,
        invaderXim.item.EBONY_LOG,
        invaderXim.item.CHUNK_OF_EARTH_ORE,
        invaderXim.item.CHUNK_OF_DURIUM_ORE,
        invaderXim.item.SLICE_OF_DRAGON_MEAT,
        invaderXim.item.CLARITE,
        invaderXim.item.SLICE_OF_COEURL_MEAT,
        invaderXim.item.SLICE_OF_BUFFALO_MEAT,
        invaderXim.item.SCROLL_OF_WATER_V,
        invaderXim.item.SCROLL_OF_STONE_V,
        invaderXim.item.SCROLL_OF_PROTECT_V,
        invaderXim.item.SCROLL_OF_KNIGHTS_MINNE_V,
        invaderXim.item.SCROLL_OF_FOE_REQUIEM_VII,
        invaderXim.item.SCROLL_OF_ASPIR_II,
        invaderXim.item.SCROLL_OF_ARMYS_PAEON_VI,
        invaderXim.item.DRAGON_HEART,
        invaderXim.item.SCROLL_OF_AISHA_ICHI,
        invaderXim.item.GARGANTUAN_BLACK_TIGER_FANG,
        invaderXim.item.BUG_EATEN_HAT,
    },

    [invaderXim.zone.ABYSSEA_ATTOHWA] =
    {
        invaderXim.item.AHTAPOT,
        invaderXim.item.CHICKEN_BONE,
        invaderXim.item.CORAL_FRAGMENT,
        invaderXim.item.DARKSTEEL_INGOT,
        invaderXim.item.SLICE_OF_DRAGON_MEAT,
        invaderXim.item.FULMENITE,
        invaderXim.item.GOLD_INGOT,
        invaderXim.item.CHUNK_OF_HYDRA_MEAT,
        invaderXim.item.CHUNK_OF_WOOTZ_ORE,
        invaderXim.item.EARTH_BEAD,
        invaderXim.item.LIGHTNING_BEAD,
        invaderXim.item.DARK_BEAD,
        invaderXim.item.SQUARE_OF_KHROMATED_LEATHER,
        invaderXim.item.BLOODWOOD_LOG,
        invaderXim.item.CLARITE,
        invaderXim.item.BEECH_LOG,
        invaderXim.item.CHUNK_OF_PHRYGIAN_ORE,
        invaderXim.item.IOLITE,
        invaderXim.item.SCROLL_OF_ADDLE,
        invaderXim.item.SCROLL_OF_BOOST_MND,
        invaderXim.item.SCROLL_OF_BOOST_VIT,
        invaderXim.item.SCROLL_OF_EARTH_CAROL_II,
        invaderXim.item.SCROLL_OF_GAIN_MND,
        invaderXim.item.SCROLL_OF_GAIN_VIT,
        invaderXim.item.SCROLL_OF_MYOSHU_ICHI,
        invaderXim.item.SCROLL_OF_STONEJA,
        invaderXim.item.SCROLL_OF_WATER_CAROL_II,
        invaderXim.item.ANIMUS_AUGEO_SCHEMA,
        invaderXim.item.SCROLL_OF_MAGES_BALLAD_III,
        invaderXim.item.SCROLL_OF_REFRESH_II,
        invaderXim.item.SCROLL_OF_WATERJA,
        invaderXim.item.HANDFUL_OF_BONE_CHIPS,
        invaderXim.item.ERUCA_EGG,
        invaderXim.item.EXTENDED_EYESTALK,
        invaderXim.item.MANGLED_COCKATRICE_SKIN,
        invaderXim.item.VIAL_OF_UNDYING_OOZE,
        invaderXim.item.WITHERED_COCOON,
        invaderXim.item.RAVAGERS_CALLIGAE,
        invaderXim.item.TANTRA_GAITERS,
        invaderXim.item.ORISON_DUCKBILLS,
        invaderXim.item.GOETIA_SABOTS,
        invaderXim.item.ESTOQUEURS_HOUSEAUX,
        invaderXim.item.RAIDERS_POULAINES,
    },

    [invaderXim.zone.ABYSSEA_MISAREAUX] =
    {
        invaderXim.item.BEECH_LOG,
        invaderXim.item.WILD_ONION,
        invaderXim.item.OXBLOOD_ORB,
        invaderXim.item.ORICHALCUM_INGOT,
        invaderXim.item.MOLYBDENUM_INGOT,
        invaderXim.item.SQUARE_OF_MARID_LEATHER,
        invaderXim.item.PIECE_OF_LACQUER_TREE_LUMBER,
        invaderXim.item.CHUNK_OF_KHROMA_ORE,
        invaderXim.item.ICE_BEAD,
        invaderXim.item.FLOCON_DE_MER,
        invaderXim.item.FIRE_BEAD,
        invaderXim.item.PIECE_OF_EBONY_LUMBER,
        invaderXim.item.DIVINE_LOG,
        invaderXim.item.DEMON_HORN,
        invaderXim.item.SQUARE_OF_DAMASCENE_CLOTH,
        invaderXim.item.CORAL_FRAGMENT,
        invaderXim.item.SLICE_OF_COEURL_MEAT,
        invaderXim.item.BLACK_PEARL,
        invaderXim.item.SCROLL_OF_ADDLE,
        invaderXim.item.SCROLL_OF_AERO_V,
        invaderXim.item.PLATE_OF_INDI_SLOW,
        invaderXim.item.SCROLL_OF_BREAK,
        invaderXim.item.SCROLL_OF_EARTH_CAROL_II,
        invaderXim.item.SCROLL_OF_ENDARK,
        invaderXim.item.SCROLL_OF_ENLIGHT,
        invaderXim.item.SCROLL_OF_GAIN_MND,
        invaderXim.item.SCROLL_OF_GAIN_VIT,
        invaderXim.item.SCROLL_OF_MAGES_BALLAD_III,
        invaderXim.item.SCROLL_OF_SENTINELS_SCHERZO,
        invaderXim.item.SCROLL_OF_STONEJA,
        invaderXim.item.SCROLL_OF_WATER_CAROL_II,
        invaderXim.item.SCROLL_OF_WATERJA,
        invaderXim.item.AVIAN_REMEX,
        invaderXim.item.BLACK_RABBIT_TAIL,
        invaderXim.item.HARDENED_RAPTOR_SKIN,
        invaderXim.item.MOCKING_BEAK,
        invaderXim.item.SPOTTED_FLYFROND,
        invaderXim.item.CREED_SABATONS,
        invaderXim.item.BALE_SOLLERETS,
        invaderXim.item.FERINE_OCREAE,
        invaderXim.item.AOIDOS_COTHURNES,
        invaderXim.item.SYLVAN_BOTTILLONS,
    },

    [invaderXim.zone.ABYSSEA_VUNKERL] =
    {
        invaderXim.item.ORICHALCUM_INGOT,
        invaderXim.item.SPOOL_OF_PLATINUM_SILK_THREAD,
        invaderXim.item.MOLYBDENUM_INGOT,
        invaderXim.item.SQUARE_OF_KHROMATED_LEATHER,
        invaderXim.item.CHUNK_OF_KHROMA_ORE,
        invaderXim.item.CHUNK_OF_HYDRA_MEAT,
        invaderXim.item.SQUARE_OF_GALATEIA,
        invaderXim.item.WATER_BEAD,
        invaderXim.item.LIGHT_BEAD,
        invaderXim.item.WIND_BEAD,
        invaderXim.item.DARK_BEAD,
        invaderXim.item.FIRE_BEAD,
        invaderXim.item.EARTH_BEAD,
        invaderXim.item.SQUARE_OF_DAMASCENE_CLOTH,
        invaderXim.item.PIECE_OF_ANGEL_SKIN,
        invaderXim.item.SCROLL_OF_ADDLE,
        invaderXim.item.SCROLL_OF_AERO_V,
        invaderXim.item.SCROLL_OF_BOOST_MND,
        invaderXim.item.SCROLL_OF_EARTH_CAROL_II,
        invaderXim.item.SCROLL_OF_ENDARK,
        invaderXim.item.SCROLL_OF_ENLIGHT,
        invaderXim.item.SCROLL_OF_GAIN_MND,
        invaderXim.item.SCROLL_OF_REFRESH_II,
        invaderXim.item.SCROLL_OF_STONEJA,
        invaderXim.item.SCROLL_OF_WATER_CAROL_II,
        invaderXim.item.SCROLL_OF_EARTH_CAROL_II,
        invaderXim.item.SCROLL_OF_WATERJA,
        invaderXim.item.SCROLL_OF_YURIN_ICHI,
        invaderXim.item.SCROLL_OF_MYOSHU_ICHI,
        invaderXim.item.DENTED_SKULL,
        invaderXim.item.CALLERS_PIGACHES,
        invaderXim.item.CHARIS_TOE_SHOES,
        invaderXim.item.CIRQUE_SCARPE,
        invaderXim.item.IGA_KYAHAN,
        invaderXim.item.LANCERS_SCHYNBALDS,
        invaderXim.item.MAVI_BASMAK,
        invaderXim.item.NAVARCHS_BOTTES,
        invaderXim.item.SAVANTS_LOAFERS,
        invaderXim.item.UNKAI_SUNE_ATE,
    },

    [invaderXim.zone.ABYSSEA_ALTEPA    ] = { 0, 0, 0 },
    [invaderXim.zone.ABYSSEA_ULEGUERAND] = { 0, 0, 0 },
    [invaderXim.zone.ABYSSEA_GRAUBERG  ] = { 0, 0, 0 },
}

local itemTierDeductions =
{
    [invaderXim.zone.ABYSSEA_KONSCHTAT ] = {  7,  7,  7, 0, 0 },
    [invaderXim.zone.ABYSSEA_TAHRONGI  ] = { 14, 14, 14, 9, 0 },
    [invaderXim.zone.ABYSSEA_LA_THEINE ] = { 13, 13, 13, 9, 0 },
    [invaderXim.zone.ABYSSEA_ATTOHWA   ] = { 14, 14, 14, 9, 0 },
    [invaderXim.zone.ABYSSEA_MISAREAUX ] = { 14, 14, 14, 5, 0 },
    [invaderXim.zone.ABYSSEA_VUNKERL   ] = { 14, 14, 14, 6, 0 },
    [invaderXim.zone.ABYSSEA_ALTEPA    ] = {  0,  0,  0, 0, 0 },
    [invaderXim.zone.ABYSSEA_ULEGUERAND] = {  0,  0,  0, 0, 0 },
    [invaderXim.zone.ABYSSEA_GRAUBERG  ] = {  0,  0,  0, 0, 0 },
}

local function GetChestItemTable(npc)
    local maxItem = npc:getLocalVar('NB_ITEM')
    local itemTable = {}

    for i = 1, maxItem do
        itemTable[i] = npc:getLocalVar('ITEM' .. i)
    end

    return itemTable
end

local function GetRandItem(zoneId, tier)
    local drops = { unpack(commonDrops), unpack(itemDrops[zoneId]) }
    local rand = math.random(1, #drops - itemTierDeductions[zoneId][tier])

    return drops[rand]
end

local function GetLootTable(player, npc)
    local maxItem = npc:getLocalVar('NB_ITEM')
    local loot = {}

    for i = 1, maxItem do
        table.insert(loot, npc:getLocalVar('ITEM' ..i))
    end

    return loot
end

local function GiveItem(player, npc, itemnum)
    local zoneId  = player:getZoneID()
    local ID      = zones[zoneId]
    local chestid = npc:getLocalVar('CHESTID')
    local chest   = GetNPCByID(chestid)
    local itemList = GetChestItemTable(npc)

    if itemList[itemnum] == 0 then
        player:messageSpecial(ID.text.ITEM_DISAPPEARED)
        return
    else
        if player:getFreeSlotsCount() == 0 then -- NOTE: check a var or somthing for the item
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, itemList[itemnum])
            return
        else
            player:addItem(itemList[itemnum], 1, 0, 0, 0, 0)
            invaderXim.pyxis.messageChest(player, ID.text.OBTAINS_ITEM, itemList[itemnum], 0, 0, 0, npc)

            if chest then
                chest:setLocalVar('ITEM' .. itemnum, 0)
            end

            itemList[itemnum] = 0
        end
    end

    if invaderXim.pyxis.isChestEmpty(itemList) then
        invaderXim.pyxis.removeChest(player, npc, 0, 3)
    end
end

invaderXim.pyxis.item.setItems = function(npc, tier)
    local itemcount = npc:getLocalVar('NB_ITEM')

    for i = 1, itemcount do
        local item = GetRandItem(npc:getZoneID(), tier)
        npc:setLocalVar('ITEM' .. i, item)
    end
end

invaderXim.pyxis.item.updateEvent = function(player, npc)
    player:updateEvent(unpack(GetChestItemTable(npc)))
end

invaderXim.pyxis.item.giveItem = function(player, npc, option)
    local ID = zones[npc:getZoneID()]
    local loottable = GetLootTable(player, npc)
    local itemSelected = bit.rshift(option, 16)
    if itemSelected > 0 and itemSelected <= 8 then
        GiveItem(player, npc, itemSelected)

    -- Add spoils to treasure
    elseif itemSelected == 9 then
        for _, v in ipairs(loottable) do
            player:addTreasure(v)
        end

        invaderXim.pyxis.messageChest(player, ID.text.ADD_SPOILS_TO_TREASURE, 0, 0, 0, 0, npc)
        invaderXim.pyxis.removeChest(player, npc, 0, 1)
        ---- NOTE: NEED A CHECK HERE TO MAKE SURE ITS UPDATED AND CANT REMOVE THE SAME ITEM AGAIN
    end
end
