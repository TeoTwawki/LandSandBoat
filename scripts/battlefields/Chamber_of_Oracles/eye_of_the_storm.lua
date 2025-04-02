-----------------------------------
-- Eye of the Storm
-- Chamber of Oracles KSNM30, Lachesis Orb
-- !additem 1178
-----------------------------------
local chamberOfOraclesID = zones[invaderXim.zone.CHAMBER_OF_ORACLES]
-----------------------------------

local content = Battlefield:new({
    zoneId           = invaderXim.zone.CHAMBER_OF_ORACLES,
    battlefieldId    = invaderXim.battlefield.id.EYE_OF_THE_STORM,
    maxPlayers       = 6,
    timeLimit        = utils.minutes(30),
    index            = 6,
    entryNpc         = 'SC_Entrance',
    exitNpc          = 'Shimmering_Circle',
    requiredItems    = { invaderXim.item.LACHESIS_ORB, wearMessage = chamberOfOraclesID.text.A_CRACK_HAS_FORMED, wornMessage = chamberOfOraclesID.text.ORB_IS_CRACKED },
})

content:addEssentialMobs({ 'Radiant_Wyvern', 'Blizzard_Wyvern', 'Lightning_Wyvern', 'Chaos_Wyvern' })

content.loot =
{
    {
        { item = invaderXim.item.WYVERN_WING, weight = 1000 }, -- Wyvern Wing
    },

    {
        { item = invaderXim.item.WYVERN_SKIN, weight = 1000 }, -- Wyvern Skin
    },

    {
        { item = invaderXim.item.GIL, weight = 1000, amount = 24000 }, -- gil

    },

    {
        { item = invaderXim.item.SQUARE_OF_DAMASCENE_CLOTH,  weight = 216 }, -- Damascene Cloth
        { item = invaderXim.item.DAMASCUS_INGOT,             weight = 295 }, -- Damascus Ingot
        { item = invaderXim.item.WOODVILLES_AXE,             weight = 239 }, -- Woodville's Axe
        { item = invaderXim.item.THANATOS_BASELARD,          weight = 231 }, -- Thanatos Baselard
        { item = invaderXim.item.WYVERN_PERCH,               weight = 231 }, -- Wyvern Perch
        { item = invaderXim.item.BALINS_SWORD,               weight = 231 }, -- Balin's Sword
        { item = invaderXim.item.VIAL_OF_BLACK_BEETLE_BLOOD, weight = 231 }, -- Beetle Blood
    },

    {
        { item = invaderXim.item.BOURDONASSE,    weight = 104 }, -- Bourdonasse
        { item = invaderXim.item.VILE_ELIXIR_P1, weight =  86 }, -- Vile Elixir +1
        { item = invaderXim.item.VILE_ELIXIR,    weight =  22 }, -- Vile Elixir
        { item = invaderXim.item.POLE_GRIP,      weight = 146 }, -- Pole Grip
        { item = invaderXim.item.SWORD_STRAP,    weight = 240 }, -- Sword Strap
    },

    {
        { item = invaderXim.item.ZISKAS_CROSSBOW,       weight = 287 }, -- Ziska's Crossbow
        { item = invaderXim.item.UNJI,                  weight = 216 }, -- Unji
        { item = invaderXim.item.TAILLEFERS_DAGGER,     weight = 198 }, -- Taillifer's Dagger
        { item = invaderXim.item.SCHILTRON_SPEAR,       weight = 287 }, -- Schiltron Spear
        { item = invaderXim.item.SCROLL_OF_THUNDER_III, weight = 287 }, -- Thunder III
    },

    {
        { item = invaderXim.item.CORAL_FRAGMENT,          weight =  52 }, -- Coral Fragment
        { item = invaderXim.item.CHUNK_OF_DARKSTEEL_ORE,  weight =  56 }, -- Chunk Of Darksteel Ore
        { item = invaderXim.item.DEMON_HORN,              weight =  41 }, -- Demon Horn
        { item = invaderXim.item.EBONY_LOG,               weight =  63 }, -- Ebony Log
        { item = invaderXim.item.CHUNK_OF_GOLD_ORE,       weight =  52 }, -- Chunk Of Gold Ore
        { item = invaderXim.item.SPOOL_OF_GOLD_THREAD,    weight =  26 }, -- Spool Of Gold Thread
        { item = invaderXim.item.SLAB_OF_GRANITE,         weight =  11 }, -- Slab Of Granite
        { item = invaderXim.item.HI_RERAISER,             weight =  37 }, -- Hi-reraiser
        { item = invaderXim.item.MAHOGANY_LOG,            weight = 101 }, -- Mahogany Log
        { item = invaderXim.item.MYTHRIL_INGOT,           weight =  30 }, -- Mythril Ingot
        { item = invaderXim.item.CHUNK_OF_MYTHRIL_ORE,    weight =  52 }, -- Chunk Of Mythril Ore
        { item = invaderXim.item.PETRIFIED_LOG,           weight = 116 }, -- Petrified Log
        { item = invaderXim.item.PHOENIX_FEATHER,         weight =  15 }, -- Phoenix Feather
        { item = invaderXim.item.PHILOSOPHERS_STONE,      weight =  56 }, -- Philosophers Stone
        { item = invaderXim.item.CHUNK_OF_PLATINUM_ORE,   weight =  45 }, -- Chunk Of Platinum Ore
        { item = invaderXim.item.SQUARE_OF_RAINBOW_CLOTH, weight =  22 }, -- Square Of Rainbow Cloth
        { item = invaderXim.item.RAM_HORN,                weight =  67 }, -- Ram Horn
        { item = invaderXim.item.SQUARE_OF_RAXA,          weight = 119 }, -- Square Of Raxa
        { item = invaderXim.item.RERAISER,                weight =  45 }, -- Reraiser
        { item = invaderXim.item.NONE,                    weight = 400 }, -- Nothing
    },

    {
        { item = invaderXim.item.SQUARE_OF_DAMASCENE_CLOTH, weight =  56 }, -- Square Of Damascene Cloth
        { item = invaderXim.item.DAMASCUS_INGOT,            weight =  93 }, -- Damascus Ingot
        { item = invaderXim.item.SPOOL_OF_MALBORO_FIBER,    weight =  56 }, -- Spool Of Malboro Fiber
        { item = invaderXim.item.PHILOSOPHERS_STONE,        weight = 157 }, -- Philosophers Stone
        { item = invaderXim.item.PHOENIX_FEATHER,           weight = 176 }, -- Phoenix Feather
        { item = invaderXim.item.SQUARE_OF_RAXA,            weight = 109 }, -- Square Of Raxa
        { item = invaderXim.item.NONE,                      weight = 500 }, -- Nothing
    }
}

return content:register()
