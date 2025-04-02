-----------------------------------
-- Horns of War
-- Horlais Peak KSNM, Themis Orb
-- !additem 1553
-----------------------------------
local horlaisID = zones[invaderXim.zone.HORLAIS_PEAK]
-----------------------------------

local content = Battlefield:new({
    zoneId           = invaderXim.zone.HORLAIS_PEAK,
    battlefieldId    = invaderXim.battlefield.id.HORNS_OF_WAR,
    maxPlayers       = 18,
    timeLimit        = utils.minutes(30),
    index            = 11,
    entryNpc         = 'BC_Entrance',
    exitNpc          = 'Burning_Circle',
    requiredItems    = { invaderXim.item.THEMIS_ORB, wearMessage = horlaisID.text.A_CRACK_HAS_FORMED, wornMessage = horlaisID.text.ORB_IS_CRACKED },

    experimental = true,
})

content:addEssentialMobs({ 'Chlevnik' })

content.loot =
{
    {
        { item = invaderXim.item.LIBATION_ABJURATION, weight = 169 }, -- Libation Abjuration
        { item = invaderXim.item.KRIEGSBEIL,          weight = 268 }, -- Kriegsbeil
        { item = invaderXim.item.SHINSOKU,            weight =  99 }, -- Shinsoku
        { item = invaderXim.item.NOKIZARU_SHURIKEN,   weight =  85 }, -- Nokizaru Shuriken
        { item = invaderXim.item.GUESPIERE,           weight =  70 }, -- Guespiere
        { item = invaderXim.item.PURGATORY_MACE,      weight =  85 }, -- Purgatory Mace
        { item = invaderXim.item.METEOR_CESTI,        weight = 225 }, -- Meteor Cesti
    },

    {
        { item = invaderXim.item.OBLATION_ABJURATION, weight = 169 }, -- Oblation Abjuration
        { item = invaderXim.item.UNSHO,               weight =  14 }, -- Unsho
        { item = invaderXim.item.HARLEQUINS_HORN,     weight = 239 }, -- Harlequins Horn
        { item = invaderXim.item.DREIZACK,            weight =  85 }, -- Dreizack
        { item = invaderXim.item.GAWAINS_AXE,         weight = 254 }, -- Gawains Axe
        { item = invaderXim.item.ZEN_POLE,            weight = 183 }, -- Zen Pole
        { item = invaderXim.item.BAYARDS_SWORD,       weight  = 70 }, -- Bayards Sword
    },

    {
        { item = invaderXim.item.PETRIFIED_LOG,           weight = 563 }, -- Petrified Log
        { item = invaderXim.item.LACQUER_TREE_LOG,        weight = 296 }, -- Lacquer Tree Log
        { item = invaderXim.item.SQUARE_OF_SHINING_CLOTH, weight =  14 }, -- Square Of Shining Cloth
        { item = invaderXim.item.DIVINE_LOG,              weight = 141 }, -- Divine Log
    },

    {
        { item = invaderXim.item.BEHEMOTH_HIDE, weight = 535 }, -- Behemoth Hide
        { item = invaderXim.item.BEHEMOTH_HORN, weight = 366 }, -- Behemoth Horn
        { item = invaderXim.item.HEALING_STAFF, weight =  48 }, -- Healing Staff
    },

    {
        { item = invaderXim.item.DEMON_HORN,               weight =  99 }, -- Demon Horn
        { item = invaderXim.item.PETRIFIED_LOG,            weight =  70 }, -- Petrified Log
        { item = invaderXim.item.SQUARE_OF_RAXA,           weight =  70 }, -- Square Of Raxa
        { item = invaderXim.item.SQUARE_OF_RAINBOW_CLOTH,  weight =  28 }, -- Square Of Rainbow Cloth
        { item = invaderXim.item.HI_RERAISER,              weight = 113 }, -- Hi-reraiser
        { item = invaderXim.item.PETRIFIED_LOG,            weight = 211 }, -- Petrified Log
        { item = invaderXim.item.PHILOSOPHERS_STONE,       weight = 141 }, -- Philosophers Stone
        { item = invaderXim.item.CHUNK_OF_GOLD_ORE,        weight =  56 }, -- Chunk Of Gold Ore
        { item = invaderXim.item.CHUNK_OF_MYTHRIL_ORE,     weight =  85 }, -- Chunk Of Mythril Ore
        { item = invaderXim.item.CORAL_FRAGMENT,           weight =  70 }, -- Coral Fragment
        { item = invaderXim.item.MAHOGANY_LOG,             weight =  85 }, -- Mahogany Log
        { item = invaderXim.item.HANDFUL_OF_WYVERN_SCALES, weight =  42 }, -- Handful Of Wyvern Scales
        { item = invaderXim.item.CHUNK_OF_DARKSTEEL_ORE,   weight =  42 }, -- Chunk Of Darksteel Ore
        { item = invaderXim.item.RAM_HORN,                 weight =  70 }, -- Ram Horn
        { item = invaderXim.item.EBONY_LOG,                weight =  85 }, -- Ebony Log
        { item = invaderXim.item.RERAISER,                 weight =  28 }, -- Reraiser
        { item = invaderXim.item.CHUNK_OF_PLATINUM_ORE,    weight =  42 }, -- Chunk Of Platinum Ore
        { item = invaderXim.item.VILE_ELIXIR,              weight =  42 }, -- Vile Elixir
        { item = invaderXim.item.VILE_ELIXIR_P1,           weight =   7 }, -- Vile Elixir +1
    },

    {
        { item = invaderXim.item.BEHEMOTH_TONGUE,  weight = 208 }, -- Behemoth Tongue
        { item = invaderXim.item.BEHEMOTH_HORN,    weight = 296 }, -- Behemoth Horn
        { item = invaderXim.item.STRENGTH_POTION,  weight = 155 }, -- Strength Potion
        { item = invaderXim.item.DEXTERITY_POTION, weight =  70 }, -- Dexterity Potion
        { item = invaderXim.item.AGILITY_POTION,   weight = 141 }, -- Agility Potion
        { item = invaderXim.item.VITALITY_POTION,  weight = 113 }, -- Vitality Potion
    },

    {
        { item = invaderXim.item.BEASTLY_SHANK, weight = 1000 }, -- Beastly Shank
    },

    {
        { item = invaderXim.item.MIND_POTION,         weight = 169 }, -- Mind Potion
        { item = invaderXim.item.INTELLIGENCE_POTION, weight =  70 }, -- Intelligence Potion
        { item = invaderXim.item.CHARISMA_POTION,     weight = 113 }, -- Charisma Potion
        { item = invaderXim.item.ICARUS_WING,         weight = 155 }, -- Icarus Wing
        { item = invaderXim.item.ANGEL_LYRE,          weight = 254 }, -- Angel Lyre
        { item = invaderXim.item.EMERALD,             weight =  99 }, -- Emerald
        { item = invaderXim.item.SPINEL,              weight =  42 }, -- Spinel
        { item = invaderXim.item.RUBY,                weight =  56 }, -- Ruby
        { item = invaderXim.item.DIAMOND,             weight =  28 }, -- Diamond
    },

    {
        { item = invaderXim.item.HI_ETHER_P3,    weight = 296 }, -- Hi-ether +3
        { item = invaderXim.item.HI_POTION_P3,   weight = 225 }, -- Hi-potion +3
        { item = invaderXim.item.HI_RERAISER,    weight = 197 }, -- Hi-reraiser
        { item = invaderXim.item.VILE_ELIXIR_P1, weight = 282 }, -- Vile Elixir +1
    },

    {
        { item = invaderXim.item.CORAL_FRAGMENT,           weight = 141 }, -- Coral Fragment
        { item = invaderXim.item.SQUARE_OF_RAXA,           weight =  14 }, -- Square Of Raxa
        { item = invaderXim.item.DEMON_HORN,               weight = 113 }, -- Demon Horn
        { item = invaderXim.item.CHUNK_OF_GOLD_ORE,        weight =  28 }, -- Chunk Of Gold Ore
        { item = invaderXim.item.CHUNK_OF_MYTHRIL_ORE,     weight =  85 }, -- Chunk Of Mythril Ore
        { item = invaderXim.item.VILE_ELIXIR,              weight =  56 }, -- Vile Elixir
        { item = invaderXim.item.RAM_HORN,                 weight =  28 }, -- Ram Horn
        { item = invaderXim.item.PETRIFIED_LOG,            weight = 296 }, -- Petrified Log
        { item = invaderXim.item.CHUNK_OF_PLATINUM_ORE,    weight =  14 }, -- Chunk Of Platinum Ore
        { item = invaderXim.item.MAHOGANY_LOG,             weight =  56 }, -- Mahogany Log
        { item = invaderXim.item.HANDFUL_OF_WYVERN_SCALES, weight =  70 }, -- Handful Of Wyvern Scales
        { item = invaderXim.item.SLAB_OF_GRANITE,          weight =  42 }, -- Slab Of Granite
        { item = invaderXim.item.CHUNK_OF_DARKSTEEL_ORE,   weight =  42 }, -- Chunk Of Darksteel Ore
        { item = invaderXim.item.EBONY_LOG,                weight =  42 }, -- Ebony Log
        { item = invaderXim.item.HI_RERAISER,              weight =  42 }, -- Hi-reraiser
        { item = invaderXim.item.SPOOL_OF_GOLD_THREAD,     weight = 113 }, -- Spool Of Gold Thread
        { item = invaderXim.item.SQUARE_OF_RAINBOW_CLOTH,  weight =  28 }, -- Square Of Rainbow Cloth
    },

    {
        { item = invaderXim.item.SQUARE_OF_RAXA,             weight = 127 }, -- Square Of Raxa
        { item = invaderXim.item.SPOOL_OF_MALBORO_FIBER,     weight =  56 }, -- Spool Of Malboro Fiber
        { item = invaderXim.item.PHILOSOPHERS_STONE,         weight = 225 }, -- Philosophers Stone
        { item = invaderXim.item.PHOENIX_FEATHER,            weight = 423 }, -- Phoenix Feather
        { item = invaderXim.item.SQUARE_OF_DAMASCENE_CLOTH,  weight =  70 }, -- Square Of Damascene Cloth
        { item = invaderXim.item.DAMASCUS_INGOT,             weight =  42 }, -- Damascus Ingot
        { item = invaderXim.item.VIAL_OF_BLACK_BEETLE_BLOOD, weight =  85 }, -- Vial Of Black Beetle Blood
    },
}

return content:register()
