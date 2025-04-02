-----------------------------------
-- Double Dragonian
-- Horlais Peak KSNM, Clotho Orb
-- !additem 1175
-----------------------------------
local horlaisID = zones[invaderXim.zone.HORLAIS_PEAK]
-----------------------------------

local content = Battlefield:new({
    zoneId           = invaderXim.zone.HORLAIS_PEAK,
    battlefieldId    = invaderXim.battlefield.id.DOUBLE_DRAGONIAN,
    maxPlayers       = 6,
    timeLimit        = utils.minutes(30),
    index            = 15,
    entryNpc         = 'BC_Entrance',
    exitNpc          = 'Burning_Circle',
    requiredItems    = { invaderXim.item.CLOTHO_ORB, wearMessage = horlaisID.text.A_CRACK_HAS_FORMED, wornMessage = horlaisID.text.ORB_IS_CRACKED },
})

content:addEssentialMobs({ 'Dragonian_Berzerker', 'Dragonian_Minstrel' })

content.loot =
{
    {
        { item = invaderXim.item.SUBDUER,        weight = 222 }, -- Subduer
        { item = invaderXim.item.DISSECTOR,      weight = 302 }, -- Dissector
        { item = invaderXim.item.DESTROYERS,     weight = 245 }, -- Destroyers
        { item = invaderXim.item.HEART_SNATCHER, weight = 208 }, -- Heart Snatcher
    },

    {
        quantity = 2,
        { item = invaderXim.item.NONE,                 weight = 638 }, -- Nothing
        { item = invaderXim.item.VIAL_OF_DRAGON_BLOOD, weight =  10 }, -- Vial Of Dragon Blood
        { item = invaderXim.item.DRAGON_HEART,         weight = 176 }, -- Dragon Heart
        { item = invaderXim.item.SLICE_OF_DRAGON_MEAT, weight = 176 }, -- Slice Of Dragon Meat
    },

    {
        { item = invaderXim.item.NONE,        weight = 392 }, -- Nothing
        { item = invaderXim.item.SPEAR_STRAP, weight = 354 }, -- Spear Strap
        { item = invaderXim.item.SWORD_STRAP, weight = 165 }, -- Sword Strap
        { item = invaderXim.item.POLE_GRIP,   weight =  89 }, -- Pole Grip
    },

    {
        { item = invaderXim.item.MINUET_EARRING,   weight = 586 }, -- Minuet Earring
        { item = invaderXim.item.ADAMAN_INGOT,     weight = 184 }, -- Adaman Ingot
        { item = invaderXim.item.ORICHALCUM_INGOT, weight = 207 }, -- Orichalcum Ingot
    },

    {
        { item = invaderXim.item.SORROWFUL_HARP,  weight = 238 }, -- Sorrowful Harp
        { item = invaderXim.item.ATTILAS_EARRING, weight = 250 }, -- Attilas Earring
        { item = invaderXim.item.DURANDAL,        weight = 225 }, -- Durandal
        { item = invaderXim.item.HOPLITES_HARPE,  weight = 275 }, -- Hoplites Harpe
    },

    {
        { item = invaderXim.item.CHUNK_OF_GOLD_ORE,        weight = 122 }, -- Chunk Of Gold Ore
        { item = invaderXim.item.RERAISER,                 weight =  54 }, -- Reraiser
        { item = invaderXim.item.CHUNK_OF_MYTHRIL_ORE,     weight =  41 }, -- Chunk Of Mythril Ore
        { item = invaderXim.item.DEMON_HORN,               weight =  81 }, -- Demon Horn
        { item = invaderXim.item.EBONY_LOG,                weight = 149 }, -- Ebony Log
        { item = invaderXim.item.HANDFUL_OF_WYVERN_SCALES, weight =  54 }, -- Handful Of Wyvern Scales
        { item = invaderXim.item.VILE_ELIXIR_P1,           weight =  27 }, -- Vile Elixir +1
        { item = invaderXim.item.MAHOGANY_LOG,             weight =  41 }, -- Mahogany Log
        { item = invaderXim.item.CORAL_FRAGMENT,           weight =  95 }, -- Coral Fragment
        { item = invaderXim.item.PETRIFIED_LOG,            weight = 108 }, -- Petrified Log
        { item = invaderXim.item.PHOENIX_FEATHER,          weight = 135 }, -- Phoenix Feather
        { item = invaderXim.item.CHUNK_OF_PLATINUM_ORE,    weight =  54 }, -- Chunk Of Platinum Ore
        { item = invaderXim.item.RAM_HORN,                 weight =  14 }, -- Ram Horn
        { item = invaderXim.item.SQUARE_OF_RAINBOW_CLOTH,  weight =  14 }, -- Square Of Rainbow Cloth
        { item = invaderXim.item.CHUNK_OF_DARKSTEEL_ORE,   weight =  68 }, -- Chunk Of Darksteel Ore
        { item = invaderXim.item.HI_RERAISER,              weight =  14 }, -- Hi-reraiser
        { item = invaderXim.item.SQUARE_OF_RAXA,           weight = 135 }, -- Square Of Raxa
    },

    {
        { item = invaderXim.item.SQUARE_OF_DAMASCENE_CLOTH,  weight =  96 }, -- Square Of Damascene Cloth
        { item = invaderXim.item.DAMASCUS_INGOT,             weight =  27 }, -- Damascus Ingot
        { item = invaderXim.item.PHILOSOPHERS_STONE,         weight = 164 }, -- Philosophers Stone
        { item = invaderXim.item.PHOENIX_FEATHER,            weight = 260 }, -- Phoenix Feather
        { item = invaderXim.item.SPOOL_OF_MALBORO_FIBER,     weight =  96 }, -- Spool Of Malboro Fiber
        { item = invaderXim.item.SQUARE_OF_RAXA,             weight = 288 }, -- Square Of Raxa
        { item = invaderXim.item.VIAL_OF_BLACK_BEETLE_BLOOD, weight =  41 }, -- Vial Of Black Beetle Blood
    },
}

return content:register()
