-----------------------------------
-- Contaminated Colosseum
-- Horlais Peak KSNM, Atropos Orb
-- !additem 1180
-----------------------------------
local horlaisID = zones[invaderXim.zone.HORLAIS_PEAK]
-----------------------------------

local content = Battlefield:new({
    zoneId           = invaderXim.zone.HORLAIS_PEAK,
    battlefieldId    = invaderXim.battlefield.id.CONTAMINATED_COLOSSEUM,
    maxPlayers       = 6,
    timeLimit        = utils.minutes(30),
    index            = 17,
    entryNpc         = 'BC_Entrance',
    exitNpc          = 'Burning_Circle',
    requiredItems    = { invaderXim.item.ATROPOS_ORB, wearMessage = horlaisID.text.A_CRACK_HAS_FORMED, wornMessage = horlaisID.text.ORB_IS_CRACKED },
})

content:addEssentialMobs({ 'Evil_Oscar' })

content.loot =
{
    {
        { item = invaderXim.item.SPOOL_OF_MALBORO_FIBER, weight = 1000 }, -- Spool Of Malboro Fiber
    },

    {
        { item = invaderXim.item.MICHISHIBA_NO_TSUYU, weight = 217 }, -- Michishiba-no-tsuyu
        { item = invaderXim.item.MORGENSTERN,         weight = 174 }, -- Morgenstern
        { item = invaderXim.item.SENJUINRIKIO,        weight = 333 }, -- Senjuinrikio
        { item = invaderXim.item.THYRSUSSTAB,         weight = 174 }, -- Thyrsusstab
    },

    {
        { item = invaderXim.item.CASSIE_EARRING, weight = 101 }, -- Cassie Earring
        { item = invaderXim.item.CLAYMORE_GRIP,  weight =  43 }, -- Claymore Grip
        { item = invaderXim.item.MALBORO_VINE,   weight = 275 }, -- Malboro Vine
        { item = invaderXim.item.MORBOLGER_VINE, weight = 275 }, -- Morbolger Vine
        { item = invaderXim.item.POLE_GRIP,      weight = 203 }, -- Pole Grip
        { item = invaderXim.item.SPEAR_STRAP,    weight = 116 }, -- Spear Strap
    },

    {
        { item = invaderXim.item.ADAMAN_INGOT,     weight = 159 }, -- Adaman Ingot
        { item = invaderXim.item.ORICHALCUM_INGOT, weight = 290 }, -- Orichalcum Ingot
        { item = invaderXim.item.OSCAR_SCARF,      weight = 406 }, -- Oscar Scarf
    },

    {
        { item = invaderXim.item.EVOKERS_BOOTS,  weight = 159 }, -- Evokers Boots
        { item = invaderXim.item.OSTREGER_MITTS, weight = 217 }, -- Ostreger Mitts
        { item = invaderXim.item.PINEAL_HAT,     weight = 145 }, -- Pineal Hat
        { item = invaderXim.item.TRACKERS_KECKS, weight = 159 }, -- Trackers Kecks
    },

    {
        { item = invaderXim.item.CORAL_FRAGMENT,           weight = 101 }, -- Coral Fragment
        { item = invaderXim.item.CHUNK_OF_DARKSTEEL_ORE,   weight =  29 }, -- Chunk Of Darksteel Ore
        { item = invaderXim.item.DEMON_HORN,               weight =  29 }, -- Demon Horn
        { item = invaderXim.item.EBONY_LOG,                weight =  29 }, -- Ebony Log
        { item = invaderXim.item.CHUNK_OF_GOLD_ORE,        weight = 101 }, -- Chunk Of Gold Ore
        { item = invaderXim.item.SPOOL_OF_GOLD_THREAD,     weight =  29 }, -- Spool Of Gold Thread
        { item = invaderXim.item.SLAB_OF_GRANITE,          weight =  29 }, -- Slab Of Granite
        { item = invaderXim.item.MAHOGANY_LOG,             weight =  43 }, -- Mahogany Log
        { item = invaderXim.item.CHUNK_OF_MYTHRIL_ORE,     weight =  29 }, -- Chunk Of Mythril Ore
        { item = invaderXim.item.PETRIFIED_LOG,            weight =  58 }, -- Petrified Log
        { item = invaderXim.item.CHUNK_OF_PLATINUM_ORE,    weight =  14 }, -- Chunk Of Platinum Ore
        { item = invaderXim.item.SQUARE_OF_RAINBOW_CLOTH,  weight =  58 }, -- Square Of Rainbow Cloth
        { item = invaderXim.item.RAM_HORN,                 weight =  14 }, -- Ram Horn
        { item = invaderXim.item.VILE_ELIXIR,              weight =  58 }, -- Vile Elixir
        { item = invaderXim.item.VILE_ELIXIR_P1,           weight =  29 }, -- Vile Elixir +1
        { item = invaderXim.item.HANDFUL_OF_WYVERN_SCALES, weight =  72 }, -- Handful Of Wyvern Scales
    },

    {
        { item = invaderXim.item.VIAL_OF_BLACK_BEETLE_BLOOD, weight =  87 }, -- Vial Of Black Beetle Blood
        { item = invaderXim.item.DAMASCUS_INGOT,             weight =  14 }, -- Damascus Ingot
        { item = invaderXim.item.SQUARE_OF_DAMASCENE_CLOTH,  weight =  29 }, -- Square Of Damascene Cloth
        { item = invaderXim.item.SPOOL_OF_MALBORO_FIBER,     weight =  43 }, -- Spool Of Malboro Fiber
        { item = invaderXim.item.PHILOSOPHERS_STONE,         weight = 174 }, -- Philosophers Stone
        { item = invaderXim.item.PHOENIX_FEATHER,            weight = 246 }, -- Phoenix Feather
        { item = invaderXim.item.SQUARE_OF_RAXA,             weight = 159 }, -- Square Of Raxa
    },
}

return content:register()
