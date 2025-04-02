-----------------------------------
-- Operation Desert Storm
-- Waughroon Shrine KSNM30, Lachesis Orb
-- !additem 1178
-----------------------------------
local waughroonID = zones[invaderXim.zone.WAUGHROON_SHRINE]
-----------------------------------

local content = Battlefield:new({
    zoneId           = invaderXim.zone.WAUGHROON_SHRINE,
    battlefieldId    = invaderXim.battlefield.id.OPERATION_DESERT_SWARM,
    maxPlayers       = 6,
    timeLimit        = utils.minutes(30),
    index            = 17,
    entryNpc         = 'BC_Entrance',
    exitNpc          = 'Burning_Circle',
    requiredItems    = { invaderXim.item.LACHESIS_ORB, wearMessage = waughroonID.text.A_CRACK_HAS_FORMED, wornMessage = waughroonID.text.ORB_IS_CRACKED },

    experimental = true,
})

content:addEssentialMobs({ 'Platoon_Scorpion' })

content.loot =
{
    {
        { item = invaderXim.item.HIGH_QUALITY_SCORPION_SHELL, weight = 813 }, -- High-quality Scorpion Shell
        { item = invaderXim.item.SERKET_RING,                 weight =  55 }, -- Serket Ring
        { item = invaderXim.item.VENOMOUS_CLAW,               weight = 123 }, -- Venomous Claw
    },

    {
        { item = invaderXim.item.EXPUNGER,       weight = 216 }, -- Expunger
        { item = invaderXim.item.HEART_SNATCHER, weight = 295 }, -- Heart Snatcher
        { item = invaderXim.item.RAMPAGER,       weight = 239 }, -- Rampager
        { item = invaderXim.item.SENJUINRIKIO,   weight = 231 }, -- Senjuinrikio
    },

    {
        { item = invaderXim.item.ANUBISS_KNIFE,    weight = 504 }, -- Anubiss Knife
        { item = invaderXim.item.ADAMAN_INGOT,     weight =   4 }, -- Adaman Ingot
        { item = invaderXim.item.CLAYMORE_GRIP,    weight =  86 }, -- Claymore Grip
        { item = invaderXim.item.ORICHALCUM_INGOT, weight =  22 }, -- Orichalcum Ingot
        { item = invaderXim.item.POLE_GRIP,        weight = 146 }, -- Pole Grip
        { item = invaderXim.item.SWORD_STRAP,      weight =  22 }, -- Sword Strap
    },

    {
        { item = invaderXim.item.HIERARCH_BELT,    weight = 287 }, -- Hierarch Belt
        { item = invaderXim.item.PALMERINS_SHIELD, weight = 216 }, -- Palmerins Shield
        { item = invaderXim.item.TRAINERS_GLOVES,  weight = 198 }, -- Trainers Gloves
        { item = invaderXim.item.WARWOLF_BELT,     weight = 287 }, -- Warwolf Belt
    },

    {
        { item = invaderXim.item.CORAL_FRAGMENT,           weight =  52 }, -- Coral Fragment
        { item = invaderXim.item.CHUNK_OF_DARKSTEEL_ORE,   weight =  56 }, -- Chunk Of Darksteel Ore
        { item = invaderXim.item.DEMON_HORN,               weight =  41 }, -- Demon Horn
        { item = invaderXim.item.EBONY_LOG,                weight =  63 }, -- Ebony Log
        { item = invaderXim.item.CHUNK_OF_GOLD_ORE,        weight =  52 }, -- Chunk Of Gold Ore
        { item = invaderXim.item.SPOOL_OF_GOLD_THREAD,     weight =  26 }, -- Spool Of Gold Thread
        { item = invaderXim.item.SLAB_OF_GRANITE,          weight =  11 }, -- Slab Of Granite
        { item = invaderXim.item.HI_RERAISER,              weight =  37 }, -- Hi-reraiser
        { item = invaderXim.item.MAHOGANY_LOG,             weight = 101 }, -- Mahogany Log
        { item = invaderXim.item.MYTHRIL_INGOT,            weight =   0 }, -- Mythril Ingot
        { item = invaderXim.item.CHUNK_OF_MYTHRIL_ORE,     weight =  52 }, -- Chunk Of Mythril Ore
        { item = invaderXim.item.PETRIFIED_LOG,            weight = 116 }, -- Petrified Log
        { item = invaderXim.item.PHOENIX_FEATHER,          weight =  15 }, -- Phoenix Feather
        { item = invaderXim.item.PHILOSOPHERS_STONE,       weight =  56 }, -- Philosophers Stone
        { item = invaderXim.item.CHUNK_OF_PLATINUM_ORE,    weight =  45 }, -- Chunk Of Platinum Ore
        { item = invaderXim.item.SQUARE_OF_RAINBOW_CLOTH,  weight =  22 }, -- Square Of Rainbow Cloth
        { item = invaderXim.item.RAM_HORN,                 weight =  67 }, -- Ram Horn
        { item = invaderXim.item.SQUARE_OF_RAXA,           weight = 119 }, -- Square Of Raxa
        { item = invaderXim.item.RERAISER,                 weight =  45 }, -- Reraiser
        { item = invaderXim.item.VILE_ELIXIR,              weight =  19 }, -- Vile Elixir
        { item = invaderXim.item.VILE_ELIXIR_P1,           weight =  41 }, -- Vile Elixir +1
        { item = invaderXim.item.HANDFUL_OF_WYVERN_SCALES, weight =  34 }, -- Handful Of Wyvern Scales
    },

    {
        { item = invaderXim.item.VIAL_OF_BLACK_BEETLE_BLOOD, weight =  78 }, -- Vial Of Black Beetle Blood
        { item = invaderXim.item.SQUARE_OF_DAMASCENE_CLOTH,  weight =  56 }, -- Square Of Damascene Cloth
        { item = invaderXim.item.DAMASCUS_INGOT,             weight =  93 }, -- Damascus Ingot
        { item = invaderXim.item.SPOOL_OF_MALBORO_FIBER,     weight =  56 }, -- Spool Of Malboro Fiber
        { item = invaderXim.item.PHILOSOPHERS_STONE,         weight = 157 }, -- Philosophers Stone
        { item = invaderXim.item.PHOENIX_FEATHER,            weight = 276 }, -- Phoenix Feather
        { item = invaderXim.item.SQUARE_OF_RAXA,             weight = 209 }, -- Square Of Raxa
    },
}

return content:register()
