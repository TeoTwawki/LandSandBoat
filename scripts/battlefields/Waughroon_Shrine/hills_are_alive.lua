-----------------------------------
-- The Hills are Alive
-- Waughroon Shrine KSNM99, Themis Orb
-- !additem 1553
-----------------------------------
local waughroonID = zones[invaderXim.zone.WAUGHROON_SHRINE]
-----------------------------------

local content = Battlefield:new({
    zoneId           = invaderXim.zone.WAUGHROON_SHRINE,
    battlefieldId    = invaderXim.battlefield.id.HILLS_ARE_ALIVE,
    maxPlayers       = 18,
    timeLimit        = utils.minutes(30),
    index            = 12,
    entryNpc         = 'BC_Entrance',
    exitNpc          = 'Burning_Circle',
    requiredItems    = { invaderXim.item.THEMIS_ORB, wearMessage = waughroonID.text.A_CRACK_HAS_FORMED, wornMessage = waughroonID.text.ORB_IS_CRACKED },

    experimental = true,
})

content:addEssentialMobs({ 'Tartaruga_Gigante' })

content.loot =
{
    {
        { item = invaderXim.item.CLUMP_OF_BLUE_PONDWEED, weight = 1000 }, -- Blue Pondweed
    },

    {
        { item = invaderXim.item.HAVOC_SCYTHE,        weight = 188 }, -- Havoc Scythe
        { item = invaderXim.item.KRIEGSBEIL,          weight =  27 }, -- Kriegsbeil
        { item = invaderXim.item.LEOPARD_AXE,         weight = 170 }, -- Leopard Axe
        { item = invaderXim.item.LIBATION_ABJURATION, weight = 295 }, -- Libation Abjuration
        { item = invaderXim.item.METEOR_CESTI,        weight =  27 }, -- Meteor Cesti
        { item = invaderXim.item.PURGATORY_MACE,      weight =  71 }, -- Purgatory Mace
        { item = invaderXim.item.SOMNUS_SIGNA,        weight = 196 }, -- Somnus Signa
    },

    {
        { item = invaderXim.item.GAWAINS_AXE,         weight =  45 }, -- Gawains Axe
        { item = invaderXim.item.GRIM_STAFF,          weight = 259 }, -- Grim Staff
        { item = invaderXim.item.GROSVENEURS_BOW,     weight = 241 }, -- Grosveneurs Bow
        { item = invaderXim.item.HARLEQUINS_HORN,     weight = 143 }, -- Harlequins Horn
        { item = invaderXim.item.OBLATION_ABJURATION, weight = 161 }, -- Oblation Abjuration
        { item = invaderXim.item.STYLET,              weight = 143 }, -- Stylet
        { item = invaderXim.item.ZEN_POLE,            weight =  36 }, -- Zen Pole
    },

    {
        { item = invaderXim.item.ADAMAN_CHAIN,        weight = 446 }, -- Adaman Chain
        { item = invaderXim.item.ADAMANTOISE_SHELL,   weight = 420 }, -- Adamantoise Shell
        { item = invaderXim.item.PIECE_OF_ANGEL_SKIN, weight =  71 }, -- Piece Of Angel Skin
        { item = invaderXim.item.STRIDER_BOOTS,       weight =  26 }, -- Strider Boots
    },

    {
        { item = invaderXim.item.CORAL_FRAGMENT,           weight = 116 }, -- Coral Fragment
        { item = invaderXim.item.CHUNK_OF_DARKSTEEL_ORE,   weight =  89 }, -- Chunk Of Darksteel Ore
        { item = invaderXim.item.DEMON_HORN,               weight =  71 }, -- Demon Horn
        { item = invaderXim.item.EBONY_LOG,                weight = 152 }, -- Ebony Log
        { item = invaderXim.item.CHUNK_OF_GOLD_ORE,        weight = 107 }, -- Chunk Of Gold Ore
        { item = invaderXim.item.SPOOL_OF_GOLD_THREAD,     weight =  89 }, -- Spool Of Gold Thread
        { item = invaderXim.item.SLAB_OF_GRANITE,          weight =  45 }, -- Slab Of Granite
        { item = invaderXim.item.HI_RERAISER,              weight =  71 }, -- Hi-reraiser
        { item = invaderXim.item.MAHOGANY_LOG,             weight = 107 }, -- Mahogany Log
        { item = invaderXim.item.PETRIFIED_LOG,            weight = 223 }, -- Petrified Log
        { item = invaderXim.item.CHUNK_OF_PLATINUM_ORE,    weight = 116 }, -- Chunk Of Platinum Ore
        { item = invaderXim.item.SQUARE_OF_RAINBOW_CLOTH,  weight =  54 }, -- Square Of Rainbow Cloth
        { item = invaderXim.item.RAM_HORN,                 weight =  54 }, -- Ram Horn
        { item = invaderXim.item.SQUARE_OF_RAXA,           weight =  71 }, -- Square Of Raxa
        { item = invaderXim.item.RERAISER,                 weight =  45 }, -- Reraiser
        { item = invaderXim.item.HANDFUL_OF_WYVERN_SCALES, weight =  54 }, -- Handful Of Wyvern Scales
        { item = invaderXim.item.VILE_ELIXIR,              weight =  63 }, -- Vile Elixir
        { item = invaderXim.item.VILE_ELIXIR_P1,           weight =  45 }, -- Vile Elixir +1
    },

    {
        { item = invaderXim.item.ADAMAN_CHAIN,     weight = 268 }, -- Adaman Chain
        { item = invaderXim.item.ADAMANTOISE_EGG,  weight = 121 }, -- Adamantoise Egg
        { item = invaderXim.item.AGILITY_POTION,   weight =  80 }, -- Agility Potion
        { item = invaderXim.item.DEXTERITY_POTION, weight = 143 }, -- Dexterity Potion
        { item = invaderXim.item.STRENGTH_POTION,  weight = 214 }, -- Strength Potion
        { item = invaderXim.item.VITALITY_POTION,  weight = 196 }, -- Vitality Potion
    },

    {
        { item = invaderXim.item.CHUNK_OF_ADAMAN_ORE,     weight = 107 }, -- Chunk Of Adaman Ore
        { item = invaderXim.item.CHARISMA_POTION,         weight =  89 }, -- Charisma Potion
        { item = invaderXim.item.CHUNK_OF_DARKSTEEL_ORE,  weight = 179 }, -- Chunk Of Darksteel Ore
        { item = invaderXim.item.ICARUS_WING,             weight = 134 }, -- Icarus Wing
        { item = invaderXim.item.INTELLIGENCE_POTION,     weight = 152 }, -- Intelligence Potion
        { item = invaderXim.item.MIND_POTION,             weight =  80 }, -- Mind Potion
        { item = invaderXim.item.CHUNK_OF_ORICHALCUM_ORE, weight =  80 }, -- Chunk Of Orichalcum Ore
        { item = invaderXim.item.CHUNK_OF_PLATINUM_ORE,   weight = 107 }, -- Chunk Of Platinum Ore
        { item = invaderXim.item.PRINCELY_SWORD,          weight = 152 }, -- Princely Sword
    },

    {
        { item = invaderXim.item.HI_ETHER_P3,    weight = 295 },  -- Hi-ether +3
        { item = invaderXim.item.HI_POTION_P3,   weight = 250 },  -- Hi-potion +3
        { item = invaderXim.item.HI_RERAISER,    weight = 196 },  -- Hi-reraiser
        { item = invaderXim.item.VILE_ELIXIR_P1, weight = 214 },  -- Vile Elixir +1
    },

    {
        { item = invaderXim.item.CORAL_FRAGMENT,           weight = 139 }, -- Coral Fragment
        { item = invaderXim.item.CHUNK_OF_DARKSTEEL_ORE,   weight =  59 }, -- Chunk Of Darksteel Ore
        { item = invaderXim.item.DEMON_HORN,               weight =  50 }, -- Demon Horn
        { item = invaderXim.item.EBONY_LOG,                weight = 109 }, -- Ebony Log
        { item = invaderXim.item.CHUNK_OF_GOLD_ORE,        weight =  69 }, -- Chunk Of Gold Ore
        { item = invaderXim.item.SLAB_OF_GRANITE,          weight =  99 }, -- Slab Of Granite
        { item = invaderXim.item.HI_RERAISER,              weight =  79 }, -- Hi-reraiser
        { item = invaderXim.item.MAHOGANY_LOG,             weight = 129 }, -- Mahogany Log
        { item = invaderXim.item.CHUNK_OF_MYTHRIL_ORE,     weight = 119 }, -- Chunk Of Mythril Ore
        { item = invaderXim.item.PHOENIX_FEATHER,          weight =  69 }, -- Phoenix Feather
        { item = invaderXim.item.PETRIFIED_LOG,            weight = 168 }, -- Petrified Log
        { item = invaderXim.item.CHUNK_OF_PLATINUM_ORE,    weight = 129 }, -- Chunk Of Platinum Ore
        { item = invaderXim.item.RAM_HORN,                 weight = 109 }, -- Ram Horn
        { item = invaderXim.item.SQUARE_OF_RAXA,           weight =  79 }, -- Square Of Raxa
        { item = invaderXim.item.VILE_ELIXIR,              weight =  69 }, -- Vile Elixir
        { item = invaderXim.item.HANDFUL_OF_WYVERN_SCALES, weight =  79 }, -- Handful Of Wyvern Scales
        { item = invaderXim.item.RERAISER,                 weight =  50 }, -- Reraiser
        { item = invaderXim.item.SPOOL_OF_GOLD_THREAD,     weight =  89 }, -- Spool Of Gold Thread
    },

    {
        { item = invaderXim.item.VIAL_OF_BLACK_BEETLE_BLOOD, weight = 109 }, -- Vial Of Black Beetle Blood
        { item = invaderXim.item.SQUARE_OF_DAMASCENE_CLOTH,  weight =  89 }, -- Square Of Damascene Cloth
        { item = invaderXim.item.DAMASCUS_INGOT,             weight =  79 }, -- Damascus Ingot
        { item = invaderXim.item.SPOOL_OF_MALBORO_FIBER,     weight =  99 }, -- Spool Of Malboro Fiber
        { item = invaderXim.item.PHILOSOPHERS_STONE,         weight = 188 }, -- Philosophers Stone
        { item = invaderXim.item.PHOENIX_FEATHER,            weight = 238 }, -- Phoenix Feather
        { item = invaderXim.item.SQUARE_OF_RAXA,             weight = 109 }, -- Square Of Raxa
    },

    {
        { item = invaderXim.item.DIVINE_LOG,              weight =  79 }, -- Divine Log
        { item = invaderXim.item.LACQUER_TREE_LOG,        weight = 257 }, -- Lacquer Tree Log
        { item = invaderXim.item.PETRIFIED_LOG,           weight = 337 }, -- Petrified Log
        { item = invaderXim.item.SQUARE_OF_SHINING_CLOTH, weight = 149 }, -- Square Of Shining Cloth
    },
}

return content:register()
