-----------------------------------
-- Chocobo Digging
-- http://ffxiclopedia.wikia.com/wiki/Chocobo_Digging
-- https://www.bg-wiki.com/bg/Category:Chocobo_Digging
-----------------------------------
require('scripts/globals/combat/element_tables')
require('scripts/globals/roe')
require('scripts/globals/utils')
require('scripts/missions/amk/helpers')
-----------------------------------
xi = xi or {}
invaderXim.chocoboDig = invaderXim.chocoboDig or {}

-- This contais all digging zones with the ones without loot tables defined commented out.
local diggingZoneList =
set{
    invaderXim.zone.CARPENTERS_LANDING,
    invaderXim.zone.BIBIKI_BAY,
    -- invaderXim.zone.ULEGUERAND_RANGE,
    -- invaderXim.zone.ATTOHWA_CHASM,
    -- invaderXim.zone.LUFAISE_MEADOWS,
    -- invaderXim.zone.MISAREAUX_COAST,
    invaderXim.zone.WAJAOM_WOODLANDS,
    invaderXim.zone.BHAFLAU_THICKETS,
    -- invaderXim.zone.CAEDARVA_MIRE,
    -- invaderXim.zone.EAST_RONFAURE_S,
    -- invaderXim.zone.JUGNER_FOREST_S,
    -- invaderXim.zone.VUNKERL_INLET_S,
    -- invaderXim.zone.BATALLIA_DOWNS_S,
    -- invaderXim.zone.NORTH_GUSTABERG_S,
    -- invaderXim.zone.GRAUBERG_S,
    -- invaderXim.zone.PASHHOW_MARSHLANDS_S,
    -- invaderXim.zone.ROLANBERRY_FIELDS_S,
    -- invaderXim.zone.WEST_SARUTABARUTA_S,
    -- invaderXim.zone.FORT_KARUGO_NARUGO_S,
    -- invaderXim.zone.MERIPHATAUD_MOUNTAINS_S,
    -- invaderXim.zone.SAUROMUGUE_CHAMPAIGN_S,
    invaderXim.zone.WEST_RONFAURE,
    invaderXim.zone.EAST_RONFAURE,
    invaderXim.zone.LA_THEINE_PLATEAU,
    invaderXim.zone.VALKURM_DUNES,
    invaderXim.zone.JUGNER_FOREST,
    invaderXim.zone.BATALLIA_DOWNS,
    invaderXim.zone.NORTH_GUSTABERG,
    invaderXim.zone.SOUTH_GUSTABERG,
    invaderXim.zone.KONSCHTAT_HIGHLANDS,
    invaderXim.zone.PASHHOW_MARSHLANDS,
    invaderXim.zone.ROLANBERRY_FIELDS,
    -- invaderXim.zone.BEAUCEDINE_GLACIER,
    -- invaderXim.zone.XARCABARD,
    -- invaderXim.zone.CAPE_TERIGGAN,
    invaderXim.zone.EASTERN_ALTEPA_DESERT,
    invaderXim.zone.WEST_SARUTABARUTA,
    invaderXim.zone.EAST_SARUTABARUTA,
    invaderXim.zone.TAHRONGI_CANYON,
    invaderXim.zone.BUBURIMU_PENINSULA,
    invaderXim.zone.MERIPHATAUD_MOUNTAINS,
    invaderXim.zone.SAUROMUGUE_CHAMPAIGN,
    invaderXim.zone.THE_SANCTUARY_OF_ZITAH,
    invaderXim.zone.YUHTUNGA_JUNGLE,
    invaderXim.zone.YHOATOR_JUNGLE,
    invaderXim.zone.WESTERN_ALTEPA_DESERT,
    -- invaderXim.zone.QUFIM_ISLAND,
    -- invaderXim.zone.BEHEMOTHS_DOMINION,
    -- invaderXim.zone.VALLEY_OF_SORROWS,
    -- invaderXim.zone.BEAUCEDINE_GLACIER_S,
    -- invaderXim.zone.XARCABARD_S,
    -- invaderXim.zone.YAHSE_HUNTING_GROUNDS,
    -- invaderXim.zone.CEIZAK_BATTLEGROUNDS,
    -- invaderXim.zone.FORET_DE_HENNETIEL,
    -- invaderXim.zone.YORCIA_WEALD,
    -- invaderXim.zone.MORIMAR_BASALT_FIELDS,
    -- invaderXim.zone.MARJAMI_RAVINE,
    -- invaderXim.zone.KAMIHR_DRIFTS,
}

local elementalOreZoneTable =
set{
    invaderXim.zone.LA_THEINE_PLATEAU,
    invaderXim.zone.JUGNER_FOREST,
    invaderXim.zone.BATALLIA_DOWNS,
    invaderXim.zone.KONSCHTAT_HIGHLANDS,
    invaderXim.zone.PASHHOW_MARSHLANDS,
    invaderXim.zone.ROLANBERRY_FIELDS,
    invaderXim.zone.TAHRONGI_CANYON,
    invaderXim.zone.MERIPHATAUD_MOUNTAINS,
    invaderXim.zone.SAUROMUGUE_CHAMPAIGN,
}

local diggingWeatherTable =
{
    -- Single weather by elemental order.
    [invaderXim.weather.HOT_SPELL    ] = { invaderXim.item.FIRE_CRYSTAL      },
    [invaderXim.weather.SNOW         ] = { invaderXim.item.ICE_CRYSTAL       },
    [invaderXim.weather.WIND         ] = { invaderXim.item.WIND_CRYSTAL      },
    [invaderXim.weather.DUST_STORM   ] = { invaderXim.item.EARTH_CRYSTAL     },
    [invaderXim.weather.THUNDER      ] = { invaderXim.item.LIGHTNING_CRYSTAL },
    [invaderXim.weather.RAIN         ] = { invaderXim.item.WATER_CRYSTAL     },
    [invaderXim.weather.AURORAS      ] = { invaderXim.item.LIGHT_CRYSTAL     },
    [invaderXim.weather.GLOOM        ] = { invaderXim.item.DARK_CRYSTAL      },

    -- Double weather by elemental order.
    [invaderXim.weather.HEAT_WAVE    ] = { invaderXim.item.FIRE_CLUSTER      },
    [invaderXim.weather.BLIZZARDS    ] = { invaderXim.item.ICE_CLUSTER       },
    [invaderXim.weather.GALES        ] = { invaderXim.item.WIND_CLUSTER      },
    [invaderXim.weather.SAND_STORM   ] = { invaderXim.item.EARTH_CLUSTER     },
    [invaderXim.weather.THUNDERSTORMS] = { invaderXim.item.LIGHTNING_CLUSTER },
    [invaderXim.weather.SQUALL       ] = { invaderXim.item.WATER_CLUSTER     },
    [invaderXim.weather.STELLAR_GLARE] = { invaderXim.item.LIGHT_CLUSTER     },
    [invaderXim.weather.DARKNESS     ] = { invaderXim.item.DARK_CLUSTER      },
}

local diggingDayTable =
{
    [invaderXim.day.FIRESDAY    ] = { invaderXim.item.RED_ROCK,         invaderXim.item.CHUNK_OF_FIRE_ORE      },
    [invaderXim.day.ICEDAY      ] = { invaderXim.item.TRANSLUCENT_ROCK, invaderXim.item.CHUNK_OF_ICE_ORE       },
    [invaderXim.day.WINDSDAY    ] = { invaderXim.item.GREEN_ROCK,       invaderXim.item.CHUNK_OF_WIND_ORE      },
    [invaderXim.day.EARTHSDAY   ] = { invaderXim.item.YELLOW_ROCK,      invaderXim.item.CHUNK_OF_EARTH_ORE     },
    [invaderXim.day.LIGHTNINGDAY] = { invaderXim.item.PURPLE_ROCK,      invaderXim.item.CHUNK_OF_LIGHTNING_ORE },
    [invaderXim.day.WATERSDAY   ] = { invaderXim.item.BLUE_ROCK,        invaderXim.item.CHUNK_OF_WATER_ORE     },
    [invaderXim.day.LIGHTSDAY   ] = { invaderXim.item.WHITE_ROCK,       invaderXim.item.CHUNK_OF_LIGHT_ORE     },
    [invaderXim.day.DARKSDAY    ] = { invaderXim.item.BLACK_ROCK,       invaderXim.item.CHUNK_OF_DARK_ORE      },
}

-----------------------------------
-- Table for common items without special conditions. [Zone ID] = { itemId, weight, dig requirement }
-- Data from BG wiki: https://www.bg-wiki.com/ffxi/Category:Chocobo_Digging
-----------------------------------
local diggingLayer =
{
    TREASURE = 1, -- This layer takes precedence over all others AND no other layer will trigger if we manage to dig something from it.
    REGULAR  = 2, -- Regular layers. Crystals from weather and ores are applied here.
    BURROW   = 3, -- Special "Raised chocobo only" layer. Requires the mounted chocobo to have a concrete skill. It's an independent AND additional item dig.
    BORE     = 4, -- Special "Raised chocobo only" layer. Requires the mounted chocobo to have a concrete skill. It's an independent AND additional item dig.
}

invaderXim.chocoboDig.digInfo =
{
    [invaderXim.zone.CARPENTERS_LANDING] = -- 2
    {
        [diggingLayer.TREASURE] =
        {
            [1] = { invaderXim.item.KING_TRUFFLE, 5, invaderXim.craftRank.ADEPT },
        },
        [diggingLayer.REGULAR] =
        {
            [1] = { invaderXim.item.LITTLE_WORM,        100, invaderXim.craftRank.AMATEUR    },
            [2] = { invaderXim.item.ARROWWOOD_LOG,      100, invaderXim.craftRank.AMATEUR    },
            [3] = { invaderXim.item.ACORN,               50, invaderXim.craftRank.RECRUIT    },
            [4] = { invaderXim.item.WILLOW_LOG,          50, invaderXim.craftRank.RECRUIT    },
            [5] = { invaderXim.item.MAPLE_LOG,           50, invaderXim.craftRank.INITIATE   },
            [6] = { invaderXim.item.HOLLY_LOG,           50, invaderXim.craftRank.INITIATE   },
            [7] = { invaderXim.item.SPRIG_OF_MISTLETOE,  10, invaderXim.craftRank.JOURNEYMAN },
            [8] = { invaderXim.item.SCREAM_FUNGUS,       10, invaderXim.craftRank.CRAFTSMAN  },
        },
        [diggingLayer.BURROW] = -- Set: Crystals
        {
            [1] = { invaderXim.item.FIRE_CRYSTAL,      50, invaderXim.craftRank.AMATEUR },
            [2] = { invaderXim.item.ICE_CRYSTAL,       50, invaderXim.craftRank.AMATEUR },
            [3] = { invaderXim.item.WIND_CRYSTAL,      50, invaderXim.craftRank.AMATEUR },
            [4] = { invaderXim.item.EARTH_CRYSTAL,     50, invaderXim.craftRank.AMATEUR },
            [5] = { invaderXim.item.LIGHTNING_CRYSTAL, 50, invaderXim.craftRank.AMATEUR },
            [6] = { invaderXim.item.WATER_CRYSTAL,     50, invaderXim.craftRank.AMATEUR },
            [7] = { invaderXim.item.LIGHT_CRYSTAL,     50, invaderXim.craftRank.AMATEUR },
            [8] = { invaderXim.item.DARK_CRYSTAL,      50, invaderXim.craftRank.AMATEUR },
        },
        [diggingLayer.BORE] = -- Set: Logs 1
        {
            [1] = { invaderXim.item.ARROWWOOD_LOG,           240, invaderXim.craftRank.AMATEUR    },
            [2] = { invaderXim.item.YEW_LOG,                 150, invaderXim.craftRank.AMATEUR    },
            [3] = { invaderXim.item.ELM_LOG,                 100, invaderXim.craftRank.RECRUIT    },
            [4] = { invaderXim.item.OAK_LOG,                  50, invaderXim.craftRank.INITIATE   },
            [5] = { invaderXim.item.ROSEWOOD_LOG,             10, invaderXim.craftRank.NOVICE     },
            [6] = { invaderXim.item.MAHOGANY_LOG,              5, invaderXim.craftRank.APPRENTICE },
            [7] = { invaderXim.item.EBONY_LOG,                 5, invaderXim.craftRank.JOURNEYMAN },
            [8] = { invaderXim.item.PIECE_OF_ANCIENT_LUMBER,   1, invaderXim.craftRank.CRAFTSMAN  },
            [9] = { invaderXim.item.LACQUER_TREE_LOG,          1, invaderXim.craftRank.ARTISAN    },
        },
    },

    [invaderXim.zone.BIBIKI_BAY] = -- 4
    {
        [diggingLayer.TREASURE] =
        {
            [1] = { invaderXim.item.PLATE_OF_HEAVY_METAL, 5, invaderXim.craftRank.ADEPT },
            [2] = { invaderXim.item.COIN_OF_BIRTH,        5, invaderXim.craftRank.ADEPT },
        },
        [diggingLayer.REGULAR] =
        {
            [1] = { invaderXim.item.CHUNK_OF_TIN_ORE,       50, invaderXim.craftRank.AMATEUR  },
            [2] = { invaderXim.item.LUGWORM,                50, invaderXim.craftRank.AMATEUR  },
            [3] = { invaderXim.item.SHELL_BUG,              10, invaderXim.craftRank.RECRUIT  },
            [4] = { invaderXim.item.SEASHELL,              100, invaderXim.craftRank.RECRUIT  },
            [5] = { invaderXim.item.SHALL_SHELL,            50, invaderXim.craftRank.INITIATE },
            [6] = { invaderXim.item.BIRD_FEATHER,           50, invaderXim.craftRank.INITIATE },
            [7] = { invaderXim.item.GIANT_FEMUR,            50, invaderXim.craftRank.INITIATE },
            [8] = { invaderXim.item.CHUNK_OF_PLATINUM_ORE,   5, invaderXim.craftRank.ARTISAN  },
            [9] = { invaderXim.item.CORAL_FRAGMENT,          5, invaderXim.craftRank.ARTISAN  },
        },
        [diggingLayer.BURROW] = -- Set: Feathers
        {
            [1] = { invaderXim.item.CLUMP_OF_RED_MOKO_GRASS, 100, invaderXim.craftRank.AMATEUR   },
            [2] = { invaderXim.item.BLACK_CHOCOBO_FEATHER,    50, invaderXim.craftRank.RECRUIT   },
            [4] = { invaderXim.item.GIANT_BIRD_PLUME,         10, invaderXim.craftRank.INITIATE  },
            [3] = { invaderXim.item.SPIDER_WEB,                5, invaderXim.craftRank.NOVICE    },
            [5] = { invaderXim.item.PHOENIX_FEATHER,           1, invaderXim.craftRank.CRAFTSMAN },
        },
        [diggingLayer.BORE] = -- Set: Bones
        {
            [ 1] = { invaderXim.item.BONE_CHIP,                 150, invaderXim.craftRank.AMATEUR    },
            [ 2] = { invaderXim.item.HANDFUL_OF_FISH_SCALES,    150, invaderXim.craftRank.AMATEUR    },
            [ 3] = { invaderXim.item.SEASHELL,                  150, invaderXim.craftRank.RECRUIT    },
            [ 4] = { invaderXim.item.HIGH_QUALITY_PUGIL_SCALES,  50, invaderXim.craftRank.INITIATE   },
            [ 5] = { invaderXim.item.TITANICTUS_SHELL,           50, invaderXim.craftRank.APPRENTICE },
            [ 6] = { invaderXim.item.DEMON_HORN,                 10, invaderXim.craftRank.JOURNEYMAN },
            [ 7] = { invaderXim.item.HANDFUL_OF_WYVERN_SCALES,    5, invaderXim.craftRank.CRAFTSMAN  },
            [ 8] = { invaderXim.item.TURTLE_SHELL,                5, invaderXim.craftRank.CRAFTSMAN  },
            [ 9] = { invaderXim.item.DEMON_SKULL,                 1, invaderXim.craftRank.ARTISAN    },
            [10] = { invaderXim.item.HANDFUL_OF_DRAGON_SCALES,    1, invaderXim.craftRank.ARTISAN    },
        },
    },

    [invaderXim.zone.ULEGUERAND_RANGE] = -- 5
    {
        [diggingLayer.TREASURE] =
        {
            -- No entries.
        },
        [diggingLayer.REGULAR] =
        {
            -- No entries.
        },
        [diggingLayer.BURROW] = -- Set: Ores 4
        {
            [1] = { invaderXim.item.CHUNK_OF_SILVER_ORE,       100, invaderXim.craftRank.AMATEUR },
            [2] = { invaderXim.item.CHUNK_OF_IRON_ORE,         100, invaderXim.craftRank.RECRUIT },
            [3] = { invaderXim.item.CHUNK_OF_KOPPARNICKEL_ORE, 100, invaderXim.craftRank.RECRUIT },
            [4] = { invaderXim.item.CHUNK_OF_MYTHRIL_ORE,      100, invaderXim.craftRank.RECRUIT },
            [5] = { invaderXim.item.CHUNK_OF_DARKSTEEL_ORE,     10, invaderXim.craftRank.NOVICE  },
        },
        [diggingLayer.BORE] = -- Set: Beastcoins
        {
            [1] = { invaderXim.item.BEASTCOIN,          100, invaderXim.craftRank.AMATEUR    },
            [2] = { invaderXim.item.SILVER_BEASTCOIN,    50, invaderXim.craftRank.RECRUIT    },
            [3] = { invaderXim.item.GOLD_BEASTCOIN,      10, invaderXim.craftRank.INITIATE   },
            [4] = { invaderXim.item.MYTHRIL_BEASTCOIN,    5, invaderXim.craftRank.NOVICE     },
            [5] = { invaderXim.item.PLATINUM_BEASTCOIN,   1, invaderXim.craftRank.APPRENTICE },
        },
    },

    [invaderXim.zone.ATTOHWA_CHASM] = -- 7
    {
        [diggingLayer.TREASURE] =
        {
            -- No entries.
        },
        [diggingLayer.REGULAR] =
        {
            -- No entries.
        },
        [diggingLayer.BURROW] = -- Set: Yellow Ginseng seeds
        {
            [1] = { invaderXim.item.PIECE_OF_YELLOW_GINSENG, 150, invaderXim.craftRank.AMATEUR  },
            [2] = { invaderXim.item.BAG_OF_WILDGRASS_SEEDS,   50, invaderXim.craftRank.RECRUIT  },
            [3] = { invaderXim.item.BAG_OF_TREE_CUTTINGS,     10, invaderXim.craftRank.INITIATE },
            [4] = { invaderXim.item.BAG_OF_CACTUS_STEMS,       5, invaderXim.craftRank.NOVICE   },
        },
        [diggingLayer.BORE] = -- Set: Ores 4
        {
            [1] = { invaderXim.item.CHUNK_OF_SILVER_ORE,       100, invaderXim.craftRank.AMATEUR },
            [2] = { invaderXim.item.CHUNK_OF_IRON_ORE,         100, invaderXim.craftRank.RECRUIT },
            [3] = { invaderXim.item.CHUNK_OF_KOPPARNICKEL_ORE, 100, invaderXim.craftRank.RECRUIT },
            [4] = { invaderXim.item.CHUNK_OF_MYTHRIL_ORE,      100, invaderXim.craftRank.RECRUIT },
            [5] = { invaderXim.item.CHUNK_OF_DARKSTEEL_ORE,     10, invaderXim.craftRank.NOVICE  },
        },
    },

    [invaderXim.zone.LUFAISE_MEADOWS] = -- 24
    {
        [diggingLayer.TREASURE] =
        {
            -- No entries.
        },
        [diggingLayer.REGULAR] =
        {
            -- No entries.
        },
        [diggingLayer.BURROW] =
        {
            -- No entries.
        },
        [diggingLayer.BORE] = -- Set: Crystals
        {
            [1] = { invaderXim.item.FIRE_CRYSTAL,      50, invaderXim.craftRank.AMATEUR },
            [2] = { invaderXim.item.ICE_CRYSTAL,       50, invaderXim.craftRank.AMATEUR },
            [3] = { invaderXim.item.WIND_CRYSTAL,      50, invaderXim.craftRank.AMATEUR },
            [4] = { invaderXim.item.EARTH_CRYSTAL,     50, invaderXim.craftRank.AMATEUR },
            [5] = { invaderXim.item.LIGHTNING_CRYSTAL, 50, invaderXim.craftRank.AMATEUR },
            [6] = { invaderXim.item.WATER_CRYSTAL,     50, invaderXim.craftRank.AMATEUR },
            [7] = { invaderXim.item.LIGHT_CRYSTAL,     50, invaderXim.craftRank.AMATEUR },
            [8] = { invaderXim.item.DARK_CRYSTAL,      50, invaderXim.craftRank.AMATEUR },
        },
    },

    [invaderXim.zone.MISAREAUX_COAST] = -- 25
    {
        [diggingLayer.TREASURE] =
        {
            -- No entries.
        },
        [diggingLayer.REGULAR] =
        {
            -- No entries.
        },
        [diggingLayer.BURROW] = -- Set: Logs 1
        {
            [1] = { invaderXim.item.ARROWWOOD_LOG,           240, invaderXim.craftRank.AMATEUR    },
            [2] = { invaderXim.item.YEW_LOG,                 150, invaderXim.craftRank.AMATEUR    },
            [3] = { invaderXim.item.ELM_LOG,                 100, invaderXim.craftRank.RECRUIT    },
            [4] = { invaderXim.item.OAK_LOG,                  50, invaderXim.craftRank.INITIATE   },
            [5] = { invaderXim.item.ROSEWOOD_LOG,             10, invaderXim.craftRank.NOVICE     },
            [6] = { invaderXim.item.MAHOGANY_LOG,              5, invaderXim.craftRank.APPRENTICE },
            [7] = { invaderXim.item.EBONY_LOG,                 5, invaderXim.craftRank.JOURNEYMAN },
            [8] = { invaderXim.item.PIECE_OF_ANCIENT_LUMBER,   1, invaderXim.craftRank.CRAFTSMAN  },
            [9] = { invaderXim.item.LACQUER_TREE_LOG,          1, invaderXim.craftRank.ARTISAN    },
        },
        [diggingLayer.BORE] =
        {
            -- No entries.
        },
    },

    [invaderXim.zone.WAJAOM_WOODLANDS] = -- 51
    {
        [diggingLayer.TREASURE] =
        {
            [1] = { invaderXim.item.ALEXANDRITE, 5, invaderXim.craftRank.ADEPT },
        },
        [diggingLayer.REGULAR] =
        {
            [1] = { invaderXim.item.PEBBLE,                100, invaderXim.craftRank.AMATEUR    },
            [2] = { invaderXim.item.CLUMP_OF_MOKO_GRASS,   100, invaderXim.craftRank.AMATEUR    },
            [3] = { invaderXim.item.HANDFUL_OF_PINE_NUTS,   50, invaderXim.craftRank.RECRUIT    },
            [4] = { invaderXim.item.BLACK_CHOCOBO_FEATHER,  50, invaderXim.craftRank.RECRUIT    },
            [5] = { invaderXim.item.EBONY_LOG,              50, invaderXim.craftRank.INITIATE   },
            [6] = { invaderXim.item.SPIDER_WEB,             10, invaderXim.craftRank.NOVICE     },
            [7] = { invaderXim.item.PEPHREDO_HIVE_CHIP,     10, invaderXim.craftRank.APPRENTICE },
            [8] = { invaderXim.item.CHUNK_OF_ADAMAN_ORE,    10, invaderXim.craftRank.CRAFTSMAN  },
        },
        [diggingLayer.BURROW] = -- Set: Logs 2
        {
            [ 1] = { invaderXim.item.CLUMP_OF_MOKO_GRASS,     240, invaderXim.craftRank.AMATEUR    },
            [ 2] = { invaderXim.item.ARROWWOOD_LOG,           240, invaderXim.craftRank.AMATEUR    },
            [ 3] = { invaderXim.item.PEPHREDO_HIVE_CHIP,      150, invaderXim.craftRank.AMATEUR    },
            [ 4] = { invaderXim.item.YEW_LOG,                 150, invaderXim.craftRank.AMATEUR    },
            [ 5] = { invaderXim.item.BLACK_CHOCOBO_FEATHER,   100, invaderXim.craftRank.RECRUIT    },
            [ 6] = { invaderXim.item.ELM_LOG,                 100, invaderXim.craftRank.RECRUIT    },
            [ 7] = { invaderXim.item.OAK_LOG,                  50, invaderXim.craftRank.INITIATE   },
            [ 8] = { invaderXim.item.ROSEWOOD_LOG,             10, invaderXim.craftRank.NOVICE     },
            [ 9] = { invaderXim.item.MAHOGANY_LOG,              5, invaderXim.craftRank.APPRENTICE },
            [10] = { invaderXim.item.EBONY_LOG,                 5, invaderXim.craftRank.JOURNEYMAN },
            [11] = { invaderXim.item.PIECE_OF_ANCIENT_LUMBER,   1, invaderXim.craftRank.CRAFTSMAN  },
            [12] = { invaderXim.item.LACQUER_TREE_LOG,          1, invaderXim.craftRank.ARTISAN    },
        },
        [diggingLayer.BORE] = -- Set: Ores 2
        {
            [1] = { invaderXim.item.FLINT_STONE,             240, invaderXim.craftRank.AMATEUR    },
            [2] = { invaderXim.item.CHUNK_OF_ALUMINUM_ORE,   100, invaderXim.craftRank.RECRUIT    },
            [3] = { invaderXim.item.CHUNK_OF_GOLD_ORE,        50, invaderXim.craftRank.INITIATE   },
            [4] = { invaderXim.item.CHUNK_OF_DARKSTEEL_ORE,   10, invaderXim.craftRank.NOVICE     },
            [5] = { invaderXim.item.CHUNK_OF_KAOLIN,          10, invaderXim.craftRank.NOVICE     },
            [6] = { invaderXim.item.CHUNK_OF_PLATINUM_ORE,     5, invaderXim.craftRank.JOURNEYMAN },
            [7] = { invaderXim.item.CHUNK_OF_ORICHALCUM_ORE,   1, invaderXim.craftRank.CRAFTSMAN  },
        },
    },

    [invaderXim.zone.BHAFLAU_THICKETS] = -- 52
    {
        [diggingLayer.TREASURE] =
        {
            [1] = { invaderXim.item.ALEXANDRITE, 5, invaderXim.craftRank.ADEPT },
        },
        [diggingLayer.REGULAR] =
        {
            [1] = { invaderXim.item.PEBBLE,                  100, invaderXim.craftRank.AMATEUR    },
            [2] = { invaderXim.item.FLINT_STONE,             100, invaderXim.craftRank.AMATEUR    },
            [3] = { invaderXim.item.HANDFUL_OF_PINE_NUTS,     50, invaderXim.craftRank.AMATEUR    },
            [4] = { invaderXim.item.PINCH_OF_DRIED_MARJORAM,  50, invaderXim.craftRank.AMATEUR    },
            [6] = { invaderXim.item.COLIBRI_FEATHER,          50, invaderXim.craftRank.RECRUIT    },
            [5] = { invaderXim.item.LESSER_CHIGOE,            10, invaderXim.craftRank.INITIATE   },
            [8] = { invaderXim.item.PETRIFIED_LOG,            50, invaderXim.craftRank.NOVICE     },
            [7] = { invaderXim.item.SPIDER_WEB,               10, invaderXim.craftRank.APPRENTICE },
            [9] = { invaderXim.item.CHUNK_OF_ORICHALCUM_ORE,   5, invaderXim.craftRank.ARTISAN    },
        },
        [diggingLayer.BURROW] = -- Set: Logs 2
        {
            [ 1] = { invaderXim.item.CLUMP_OF_MOKO_GRASS,     240, invaderXim.craftRank.AMATEUR    },
            [ 2] = { invaderXim.item.ARROWWOOD_LOG,           240, invaderXim.craftRank.AMATEUR    },
            [ 3] = { invaderXim.item.PEPHREDO_HIVE_CHIP,      150, invaderXim.craftRank.AMATEUR    },
            [ 4] = { invaderXim.item.YEW_LOG,                 150, invaderXim.craftRank.AMATEUR    },
            [ 5] = { invaderXim.item.BLACK_CHOCOBO_FEATHER,   100, invaderXim.craftRank.RECRUIT    },
            [ 6] = { invaderXim.item.ELM_LOG,                 100, invaderXim.craftRank.RECRUIT    },
            [ 7] = { invaderXim.item.OAK_LOG,                  50, invaderXim.craftRank.INITIATE   },
            [ 8] = { invaderXim.item.ROSEWOOD_LOG,             10, invaderXim.craftRank.NOVICE     },
            [ 9] = { invaderXim.item.MAHOGANY_LOG,              5, invaderXim.craftRank.APPRENTICE },
            [10] = { invaderXim.item.EBONY_LOG,                 5, invaderXim.craftRank.JOURNEYMAN },
            [11] = { invaderXim.item.PIECE_OF_ANCIENT_LUMBER,   1, invaderXim.craftRank.CRAFTSMAN  },
            [12] = { invaderXim.item.LACQUER_TREE_LOG,          1, invaderXim.craftRank.ARTISAN    },
        },
        [diggingLayer.BORE] = -- Set: Ores 2
        {
            [1] = { invaderXim.item.FLINT_STONE,             240, invaderXim.craftRank.AMATEUR    },
            [2] = { invaderXim.item.CHUNK_OF_ALUMINUM_ORE,   100, invaderXim.craftRank.RECRUIT    },
            [3] = { invaderXim.item.CHUNK_OF_GOLD_ORE,        50, invaderXim.craftRank.INITIATE   },
            [4] = { invaderXim.item.CHUNK_OF_DARKSTEEL_ORE,   10, invaderXim.craftRank.NOVICE     },
            [5] = { invaderXim.item.CHUNK_OF_KAOLIN,          10, invaderXim.craftRank.NOVICE     },
            [6] = { invaderXim.item.CHUNK_OF_PLATINUM_ORE,     5, invaderXim.craftRank.JOURNEYMAN },
            [7] = { invaderXim.item.CHUNK_OF_ORICHALCUM_ORE,   1, invaderXim.craftRank.CRAFTSMAN  },
        },
    },

    [invaderXim.zone.CAEDARVA_MIRE] = -- 79
    {
        [diggingLayer.TREASURE] =
        {
            -- No entries.
        },
        [diggingLayer.REGULAR] =
        {
            -- No entries.
        },
        [diggingLayer.BURROW] = -- Set: Logs 3
        {
            [1] = { invaderXim.item.ARROWWOOD_LOG,           240, invaderXim.craftRank.AMATEUR    },
            [2] = { invaderXim.item.DOGWOOD_LOG,             240, invaderXim.craftRank.AMATEUR    },
            [3] = { invaderXim.item.YEW_LOG,                 150, invaderXim.craftRank.AMATEUR    },
            [4] = { invaderXim.item.LANCEWOOD_LOG,           100, invaderXim.craftRank.RECRUIT    },
            [5] = { invaderXim.item.SPRIG_OF_MISTLETOE,       50, invaderXim.craftRank.INITIATE   },
            [6] = { invaderXim.item.ROSEWOOD_LOG,             10, invaderXim.craftRank.NOVICE     },
            [7] = { invaderXim.item.EBONY_LOG,                 5, invaderXim.craftRank.JOURNEYMAN },
            [8] = { invaderXim.item.PIECE_OF_ANCIENT_LUMBER,   1, invaderXim.craftRank.CRAFTSMAN  },
        },
        [diggingLayer.BORE] = -- Set: Ores 2
        {
            [1] = { invaderXim.item.FLINT_STONE,             240, invaderXim.craftRank.AMATEUR    },
            [2] = { invaderXim.item.CHUNK_OF_ALUMINUM_ORE,   100, invaderXim.craftRank.RECRUIT    },
            [3] = { invaderXim.item.CHUNK_OF_GOLD_ORE,        50, invaderXim.craftRank.INITIATE   },
            [4] = { invaderXim.item.CHUNK_OF_DARKSTEEL_ORE,   10, invaderXim.craftRank.NOVICE     },
            [5] = { invaderXim.item.CHUNK_OF_KAOLIN,          10, invaderXim.craftRank.NOVICE     },
            [6] = { invaderXim.item.CHUNK_OF_PLATINUM_ORE,     5, invaderXim.craftRank.JOURNEYMAN },
            [7] = { invaderXim.item.CHUNK_OF_ORICHALCUM_ORE,   1, invaderXim.craftRank.CRAFTSMAN  },
        },
    },

    [invaderXim.zone.EAST_RONFAURE_S] = -- 81
    {
        [diggingLayer.TREASURE] =
        {
            -- No entries.
        },
        [diggingLayer.REGULAR] =
        {
            -- No entries.
        },
        [diggingLayer.BURROW] = -- Set: Gysahl Greens
        {
            [1] = { invaderXim.item.BUNCH_OF_GYSAHL_GREENS, 150, invaderXim.craftRank.AMATEUR  },
            [2] = { invaderXim.item.CHAMOMILE,               50, invaderXim.craftRank.AMATEUR  },
            [3] = { invaderXim.item.GINGER_ROOT,             50, invaderXim.craftRank.RECRUIT  },
            [4] = { invaderXim.item.HEAD_OF_NAPA,            50, invaderXim.craftRank.INITIATE },
        },
        [diggingLayer.BORE] = -- Set: Logs 4
        {
            [1] = { invaderXim.item.ARROWWOOD_LOG,           240, invaderXim.craftRank.AMATEUR   },
            [2] = { invaderXim.item.YEW_LOG,                 150, invaderXim.craftRank.AMATEUR   },
            [3] = { invaderXim.item.ELM_LOG,                 100, invaderXim.craftRank.RECRUIT   },
            [4] = { invaderXim.item.FEYWEALD_LOG,             50, invaderXim.craftRank.INITIATE  },
            [5] = { invaderXim.item.OAK_LOG,                  50, invaderXim.craftRank.INITIATE  },
            [6] = { invaderXim.item.TEAK_LOG,                  1, invaderXim.craftRank.CRAFTSMAN },
            [7] = { invaderXim.item.PIECE_OF_ANCIENT_LUMBER,   1, invaderXim.craftRank.CRAFTSMAN },
            [8] = { invaderXim.item.JACARANDA_LOG,             1, invaderXim.craftRank.ARTISAN   },
            [9] = { invaderXim.item.LACQUER_TREE_LOG,          1, invaderXim.craftRank.ARTISAN   },
        },
    },

    [invaderXim.zone.JUGNER_FOREST_S] = -- 82
    {
        [diggingLayer.TREASURE] =
        {
            -- No entries.
        },
        [diggingLayer.REGULAR] =
        {
            -- No entries.
        },
        [diggingLayer.BURROW] = -- Set: Shrooms
        {
            [1] = { invaderXim.item.DEATHBALL,       100, invaderXim.craftRank.AMATEUR    },
            [2] = { invaderXim.item.SLEEPSHROOM,     100, invaderXim.craftRank.AMATEUR    },
            [3] = { invaderXim.item.CORAL_FUNGUS,     50, invaderXim.craftRank.RECRUIT    },
            [4] = { invaderXim.item.WOOZYSHROOM,      10, invaderXim.craftRank.INITIATE   },
            [5] = { invaderXim.item.PUFFBALL,         10, invaderXim.craftRank.NOVICE     },
            [6] = { invaderXim.item.DANCESHROOM,       5, invaderXim.craftRank.APPRENTICE },
            [7] = { invaderXim.item.REISHI_MUSHROOM,   1, invaderXim.craftRank.JOURNEYMAN },
            [8] = { invaderXim.item.KING_TRUFFLE,      1, invaderXim.craftRank.CRAFTSMAN  },
        },
        [diggingLayer.BORE] = -- Set: Logs 4
        {
            [1] = { invaderXim.item.ARROWWOOD_LOG,           240, invaderXim.craftRank.AMATEUR   },
            [2] = { invaderXim.item.YEW_LOG,                 150, invaderXim.craftRank.AMATEUR   },
            [3] = { invaderXim.item.ELM_LOG,                 100, invaderXim.craftRank.RECRUIT   },
            [4] = { invaderXim.item.FEYWEALD_LOG,             50, invaderXim.craftRank.INITIATE  },
            [5] = { invaderXim.item.OAK_LOG,                  50, invaderXim.craftRank.INITIATE  },
            [6] = { invaderXim.item.TEAK_LOG,                  1, invaderXim.craftRank.CRAFTSMAN },
            [7] = { invaderXim.item.PIECE_OF_ANCIENT_LUMBER,   1, invaderXim.craftRank.CRAFTSMAN },
            [8] = { invaderXim.item.JACARANDA_LOG,             1, invaderXim.craftRank.ARTISAN   },
            [9] = { invaderXim.item.LACQUER_TREE_LOG,          1, invaderXim.craftRank.ARTISAN   },
        },
    },

    [invaderXim.zone.VUNKERL_INLET_S] = -- 83
    {
        [diggingLayer.TREASURE] =
        {
            -- No entries.
        },
        [diggingLayer.REGULAR] =
        {
            -- No entries.
        },
        [diggingLayer.BURROW] = -- Set: Feathers
        {
            [1] = { invaderXim.item.CLUMP_OF_RED_MOKO_GRASS, 100, invaderXim.craftRank.AMATEUR   },
            [2] = { invaderXim.item.BLACK_CHOCOBO_FEATHER,    50, invaderXim.craftRank.RECRUIT   },
            [4] = { invaderXim.item.GIANT_BIRD_PLUME,         10, invaderXim.craftRank.INITIATE  },
            [3] = { invaderXim.item.SPIDER_WEB,                5, invaderXim.craftRank.NOVICE    },
            [5] = { invaderXim.item.PHOENIX_FEATHER,           1, invaderXim.craftRank.CRAFTSMAN },
        },
        [diggingLayer.BORE] = -- Set: Yellow Ginseng seeds
        {
            [1] = { invaderXim.item.PIECE_OF_YELLOW_GINSENG, 150, invaderXim.craftRank.AMATEUR  },
            [2] = { invaderXim.item.BAG_OF_WILDGRASS_SEEDS,   50, invaderXim.craftRank.RECRUIT  },
            [3] = { invaderXim.item.BAG_OF_TREE_CUTTINGS,     10, invaderXim.craftRank.INITIATE },
            [4] = { invaderXim.item.BAG_OF_CACTUS_STEMS,       5, invaderXim.craftRank.NOVICE   },
        },
    },

    [invaderXim.zone.BATALLIA_DOWNS_S] = -- 84
    {
        [diggingLayer.TREASURE] =
        {
            -- No entries.
        },
        [diggingLayer.REGULAR] =
        {
            -- No entries.
        },
        [diggingLayer.BURROW] = -- Set: Ores 3
        {
            [1] = { invaderXim.item.FLINT_STONE,               240, invaderXim.craftRank.AMATEUR },
            [2] = { invaderXim.item.CHUNK_OF_SILVER_ORE,       100, invaderXim.craftRank.AMATEUR },
            [3] = { invaderXim.item.CHUNK_OF_IRON_ORE,         100, invaderXim.craftRank.RECRUIT },
            [4] = { invaderXim.item.SHARD_OF_OBSIDIAN,         100, invaderXim.craftRank.RECRUIT },
            [5] = { invaderXim.item.CHUNK_OF_KOPPARNICKEL_ORE, 100, invaderXim.craftRank.RECRUIT },
            [6] = { invaderXim.item.CHUNK_OF_MYTHRIL_ORE,      100, invaderXim.craftRank.RECRUIT },
            [7] = { invaderXim.item.CHUNK_OF_DARKSTEEL_ORE,     10, invaderXim.craftRank.NOVICE  },
            [8] = { invaderXim.item.CHUNK_OF_SWAMP_ORE,         10, invaderXim.craftRank.NOVICE  },
        },
        [diggingLayer.BORE] = -- Set: Feathers
        {
            [1] = { invaderXim.item.CLUMP_OF_RED_MOKO_GRASS, 100, invaderXim.craftRank.AMATEUR   },
            [2] = { invaderXim.item.BLACK_CHOCOBO_FEATHER,    50, invaderXim.craftRank.RECRUIT   },
            [4] = { invaderXim.item.GIANT_BIRD_PLUME,         10, invaderXim.craftRank.INITIATE  },
            [3] = { invaderXim.item.SPIDER_WEB,                5, invaderXim.craftRank.NOVICE    },
            [5] = { invaderXim.item.PHOENIX_FEATHER,           1, invaderXim.craftRank.CRAFTSMAN },
        },
    },

    [invaderXim.zone.NORTH_GUSTABERG_S] = -- 88
    {
        [diggingLayer.TREASURE] =
        {
            -- No entries.
        },
        [diggingLayer.REGULAR] =
        {
            -- No entries.
        },
        [diggingLayer.BURROW] = -- Set: Ores 3
        {
            [1] = { invaderXim.item.FLINT_STONE,               240, invaderXim.craftRank.AMATEUR },
            [2] = { invaderXim.item.CHUNK_OF_SILVER_ORE,       100, invaderXim.craftRank.AMATEUR },
            [3] = { invaderXim.item.CHUNK_OF_IRON_ORE,         100, invaderXim.craftRank.RECRUIT },
            [4] = { invaderXim.item.SHARD_OF_OBSIDIAN,         100, invaderXim.craftRank.RECRUIT },
            [5] = { invaderXim.item.CHUNK_OF_KOPPARNICKEL_ORE, 100, invaderXim.craftRank.RECRUIT },
            [6] = { invaderXim.item.CHUNK_OF_MYTHRIL_ORE,      100, invaderXim.craftRank.RECRUIT },
            [7] = { invaderXim.item.CHUNK_OF_DARKSTEEL_ORE,     10, invaderXim.craftRank.NOVICE  },
            [8] = { invaderXim.item.CHUNK_OF_SWAMP_ORE,         10, invaderXim.craftRank.NOVICE  },
        },
        [diggingLayer.BORE] = -- Set: Feathers
        {
            [1] = { invaderXim.item.CLUMP_OF_RED_MOKO_GRASS, 100, invaderXim.craftRank.AMATEUR   },
            [2] = { invaderXim.item.BLACK_CHOCOBO_FEATHER,    50, invaderXim.craftRank.RECRUIT   },
            [4] = { invaderXim.item.GIANT_BIRD_PLUME,         10, invaderXim.craftRank.INITIATE  },
            [3] = { invaderXim.item.SPIDER_WEB,                5, invaderXim.craftRank.NOVICE    },
            [5] = { invaderXim.item.PHOENIX_FEATHER,           1, invaderXim.craftRank.CRAFTSMAN },
        },
    },

    [invaderXim.zone.GRAUBERG_S] = -- 89
    {
        [diggingLayer.TREASURE] =
        {
            -- No entries.
        },
        [diggingLayer.REGULAR] =
        {
            -- No entries.
        },
        [diggingLayer.BURROW] = -- Set: Yellow Ginseng seeds
        {
            [1] = { invaderXim.item.PIECE_OF_YELLOW_GINSENG, 150, invaderXim.craftRank.AMATEUR  },
            [2] = { invaderXim.item.BAG_OF_WILDGRASS_SEEDS,   50, invaderXim.craftRank.RECRUIT  },
            [3] = { invaderXim.item.BAG_OF_TREE_CUTTINGS,     10, invaderXim.craftRank.INITIATE },
            [4] = { invaderXim.item.BAG_OF_CACTUS_STEMS,       5, invaderXim.craftRank.NOVICE   },
        },
        [diggingLayer.BORE] = -- Set: Logs 4
        {
            [1] = { invaderXim.item.ARROWWOOD_LOG,           240, invaderXim.craftRank.AMATEUR   },
            [2] = { invaderXim.item.YEW_LOG,                 150, invaderXim.craftRank.AMATEUR   },
            [3] = { invaderXim.item.ELM_LOG,                 100, invaderXim.craftRank.RECRUIT   },
            [4] = { invaderXim.item.FEYWEALD_LOG,             50, invaderXim.craftRank.INITIATE  },
            [5] = { invaderXim.item.OAK_LOG,                  50, invaderXim.craftRank.INITIATE  },
            [6] = { invaderXim.item.TEAK_LOG,                  1, invaderXim.craftRank.CRAFTSMAN },
            [7] = { invaderXim.item.PIECE_OF_ANCIENT_LUMBER,   1, invaderXim.craftRank.CRAFTSMAN },
            [8] = { invaderXim.item.JACARANDA_LOG,             1, invaderXim.craftRank.ARTISAN   },
            [9] = { invaderXim.item.LACQUER_TREE_LOG,          1, invaderXim.craftRank.ARTISAN   },
        },
    },

    [invaderXim.zone.PASHHOW_MARSHLANDS_S] = -- 90
    {
        [diggingLayer.TREASURE] =
        {
            -- No entries.
        },
        [diggingLayer.REGULAR] =
        {
            -- No entries.
        },
        [diggingLayer.BURROW] = -- Set: Yellow Ginseng seeds
        {
            [1] = { invaderXim.item.PIECE_OF_YELLOW_GINSENG, 150, invaderXim.craftRank.AMATEUR  },
            [2] = { invaderXim.item.BAG_OF_WILDGRASS_SEEDS,   50, invaderXim.craftRank.RECRUIT  },
            [3] = { invaderXim.item.BAG_OF_TREE_CUTTINGS,     10, invaderXim.craftRank.INITIATE },
            [4] = { invaderXim.item.BAG_OF_CACTUS_STEMS,       5, invaderXim.craftRank.NOVICE   },
        },
        [diggingLayer.BORE] = -- Set: Crystals
        {
            [1] = { invaderXim.item.FIRE_CRYSTAL,      50, invaderXim.craftRank.AMATEUR },
            [2] = { invaderXim.item.ICE_CRYSTAL,       50, invaderXim.craftRank.AMATEUR },
            [3] = { invaderXim.item.WIND_CRYSTAL,      50, invaderXim.craftRank.AMATEUR },
            [4] = { invaderXim.item.EARTH_CRYSTAL,     50, invaderXim.craftRank.AMATEUR },
            [5] = { invaderXim.item.LIGHTNING_CRYSTAL, 50, invaderXim.craftRank.AMATEUR },
            [6] = { invaderXim.item.WATER_CRYSTAL,     50, invaderXim.craftRank.AMATEUR },
            [7] = { invaderXim.item.LIGHT_CRYSTAL,     50, invaderXim.craftRank.AMATEUR },
            [8] = { invaderXim.item.DARK_CRYSTAL,      50, invaderXim.craftRank.AMATEUR },
        },
    },

    [invaderXim.zone.ROLANBERRY_FIELDS_S] = -- 91
    {
        [diggingLayer.TREASURE] =
        {
            -- No entries.
        },
        [diggingLayer.REGULAR] =
        {
            -- No entries.
        },
        [diggingLayer.BURROW] = -- Set:Beastcoins
        {
            [1] = { invaderXim.item.BEASTCOIN,          100, invaderXim.craftRank.AMATEUR    },
            [2] = { invaderXim.item.SILVER_BEASTCOIN,    50, invaderXim.craftRank.RECRUIT    },
            [3] = { invaderXim.item.GOLD_BEASTCOIN,      10, invaderXim.craftRank.INITIATE   },
            [4] = { invaderXim.item.MYTHRIL_BEASTCOIN,    5, invaderXim.craftRank.NOVICE     },
            [5] = { invaderXim.item.PLATINUM_BEASTCOIN,   1, invaderXim.craftRank.APPRENTICE },
        },
        [diggingLayer.BORE] = -- Set: Shrooms
        {
            [1] = { invaderXim.item.DEATHBALL,       100, invaderXim.craftRank.AMATEUR    },
            [2] = { invaderXim.item.SLEEPSHROOM,     100, invaderXim.craftRank.AMATEUR    },
            [3] = { invaderXim.item.CORAL_FUNGUS,     50, invaderXim.craftRank.RECRUIT    },
            [4] = { invaderXim.item.WOOZYSHROOM,      10, invaderXim.craftRank.INITIATE   },
            [5] = { invaderXim.item.PUFFBALL,         10, invaderXim.craftRank.NOVICE     },
            [6] = { invaderXim.item.DANCESHROOM,       5, invaderXim.craftRank.APPRENTICE },
            [7] = { invaderXim.item.REISHI_MUSHROOM,   1, invaderXim.craftRank.JOURNEYMAN },
            [8] = { invaderXim.item.KING_TRUFFLE,      1, invaderXim.craftRank.CRAFTSMAN  },
        },
    },

    [invaderXim.zone.WEST_SARUTABARUTA_S] = -- 95
    {
        [diggingLayer.TREASURE] =
        {
            -- No entries.
        },
        [diggingLayer.REGULAR] =
        {
            -- No entries.
        },
        [diggingLayer.BURROW] = -- Set: Gysahl Greens
        {
            [1] = { invaderXim.item.BUNCH_OF_GYSAHL_GREENS, 150, invaderXim.craftRank.AMATEUR  },
            [2] = { invaderXim.item.CHAMOMILE,               50, invaderXim.craftRank.AMATEUR  },
            [3] = { invaderXim.item.GINGER_ROOT,             50, invaderXim.craftRank.RECRUIT  },
            [4] = { invaderXim.item.HEAD_OF_NAPA,            50, invaderXim.craftRank.INITIATE },
        },
        [diggingLayer.BORE] = -- Set: Crystals
        {
            [1] = { invaderXim.item.FIRE_CRYSTAL,      50, invaderXim.craftRank.AMATEUR },
            [2] = { invaderXim.item.ICE_CRYSTAL,       50, invaderXim.craftRank.AMATEUR },
            [3] = { invaderXim.item.WIND_CRYSTAL,      50, invaderXim.craftRank.AMATEUR },
            [4] = { invaderXim.item.EARTH_CRYSTAL,     50, invaderXim.craftRank.AMATEUR },
            [5] = { invaderXim.item.LIGHTNING_CRYSTAL, 50, invaderXim.craftRank.AMATEUR },
            [6] = { invaderXim.item.WATER_CRYSTAL,     50, invaderXim.craftRank.AMATEUR },
            [7] = { invaderXim.item.LIGHT_CRYSTAL,     50, invaderXim.craftRank.AMATEUR },
            [8] = { invaderXim.item.DARK_CRYSTAL,      50, invaderXim.craftRank.AMATEUR },
        },
    },

    [invaderXim.zone.FORT_KARUGO_NARUGO_S] = -- 96
    {
        [diggingLayer.TREASURE] =
        {
            -- No entries.
        },
        [diggingLayer.REGULAR] =
        {
            -- No entries.
        },
        [diggingLayer.BURROW] =
        {
            -- No entries.
        },
        [diggingLayer.BORE] = -- Set: Ores 1
        {
            [1] = { invaderXim.item.FLINT_STONE,            240, invaderXim.craftRank.AMATEUR    },
            [2] = { invaderXim.item.CHUNK_OF_ALUMINUM_ORE,  100, invaderXim.craftRank.RECRUIT    },
            [3] = { invaderXim.item.CHUNK_OF_GOLD_ORE,       50, invaderXim.craftRank.INITIATE   },
            [4] = { invaderXim.item.CHUNK_OF_DARKSTEEL_ORE,  10, invaderXim.craftRank.NOVICE     },
            [5] = { invaderXim.item.CHUNK_OF_ADAMAN_ORE,      5, invaderXim.craftRank.JOURNEYMAN },
            [6] = { invaderXim.item.CHUNK_OF_PLATINUM_ORE,    5, invaderXim.craftRank.JOURNEYMAN },
            [7] = { invaderXim.item.CHUNK_OF_ORICHALCUM_ORE,  1, invaderXim.craftRank.CRAFTSMAN  },
        },
    },

    [invaderXim.zone.MERIPHATAUD_MOUNTAINS_S] = -- 97
    {
        [diggingLayer.TREASURE] =
        {
            -- No entries.
        },
        [diggingLayer.REGULAR] =
        {
            -- No entries.
        },
        [diggingLayer.BURROW] =
        {
            -- No entries.
        },
        [diggingLayer.BORE] = -- Set: Bones
        {
            [ 1] = { invaderXim.item.BONE_CHIP,                 150, invaderXim.craftRank.AMATEUR    },
            [ 2] = { invaderXim.item.HANDFUL_OF_FISH_SCALES,    150, invaderXim.craftRank.AMATEUR    },
            [ 3] = { invaderXim.item.SEASHELL,                  150, invaderXim.craftRank.RECRUIT    },
            [ 4] = { invaderXim.item.HIGH_QUALITY_PUGIL_SCALES,  50, invaderXim.craftRank.INITIATE   },
            [ 5] = { invaderXim.item.TITANICTUS_SHELL,           50, invaderXim.craftRank.APPRENTICE },
            [ 6] = { invaderXim.item.DEMON_HORN,                 10, invaderXim.craftRank.JOURNEYMAN },
            [ 7] = { invaderXim.item.HANDFUL_OF_WYVERN_SCALES,    5, invaderXim.craftRank.CRAFTSMAN  },
            [ 8] = { invaderXim.item.TURTLE_SHELL,                5, invaderXim.craftRank.CRAFTSMAN  },
            [ 9] = { invaderXim.item.DEMON_SKULL,                 1, invaderXim.craftRank.ARTISAN    },
            [10] = { invaderXim.item.HANDFUL_OF_DRAGON_SCALES,    1, invaderXim.craftRank.ARTISAN    },
        },
    },

    [invaderXim.zone.SAUROMUGUE_CHAMPAIGN_S] = -- 98
    {
        [diggingLayer.TREASURE] =
        {
            -- No entries.
        },
        [diggingLayer.REGULAR] =
        {
            -- No entries.
        },
        [diggingLayer.BURROW] = -- Set: Beastcoins
        {
            [1] = { invaderXim.item.BEASTCOIN,          100, invaderXim.craftRank.AMATEUR    },
            [2] = { invaderXim.item.SILVER_BEASTCOIN,    50, invaderXim.craftRank.RECRUIT    },
            [3] = { invaderXim.item.GOLD_BEASTCOIN,      10, invaderXim.craftRank.INITIATE   },
            [4] = { invaderXim.item.MYTHRIL_BEASTCOIN,    5, invaderXim.craftRank.NOVICE     },
            [5] = { invaderXim.item.PLATINUM_BEASTCOIN,   1, invaderXim.craftRank.APPRENTICE },
        },
        [diggingLayer.BORE] = -- Set: Logs 4
        {
            [1] = { invaderXim.item.ARROWWOOD_LOG,           240, invaderXim.craftRank.AMATEUR   },
            [2] = { invaderXim.item.YEW_LOG,                 150, invaderXim.craftRank.AMATEUR   },
            [3] = { invaderXim.item.ELM_LOG,                 100, invaderXim.craftRank.RECRUIT   },
            [4] = { invaderXim.item.FEYWEALD_LOG,             50, invaderXim.craftRank.INITIATE  },
            [5] = { invaderXim.item.OAK_LOG,                  50, invaderXim.craftRank.INITIATE  },
            [6] = { invaderXim.item.TEAK_LOG,                  1, invaderXim.craftRank.CRAFTSMAN },
            [7] = { invaderXim.item.PIECE_OF_ANCIENT_LUMBER,   1, invaderXim.craftRank.CRAFTSMAN },
            [8] = { invaderXim.item.JACARANDA_LOG,             1, invaderXim.craftRank.ARTISAN   },
            [9] = { invaderXim.item.LACQUER_TREE_LOG,          1, invaderXim.craftRank.ARTISAN   },
        },
    },

    [invaderXim.zone.WEST_RONFAURE] = -- 100
    {
        [diggingLayer.TREASURE] =
        {
            [1] = { invaderXim.item.PLATE_OF_HEAVY_METAL, 5, invaderXim.craftRank.ADEPT },
        },
        [diggingLayer.REGULAR] =
        {
            [ 1] = { invaderXim.item.LITTLE_WORM,            50, invaderXim.craftRank.AMATEUR  },
            [ 2] = { invaderXim.item.ACORN,                  50, invaderXim.craftRank.AMATEUR  },
            [ 3] = { invaderXim.item.CLUMP_OF_MOKO_GRASS,    50, invaderXim.craftRank.RECRUIT  },
            [ 4] = { invaderXim.item.ARROWWOOD_LOG,          50, invaderXim.craftRank.AMATEUR  },
            [ 5] = { invaderXim.item.MAPLE_LOG,              50, invaderXim.craftRank.RECRUIT  },
            [ 6] = { invaderXim.item.ASH_LOG,                50, invaderXim.craftRank.RECRUIT  },
            [ 7] = { invaderXim.item.CHESTNUT_LOG,           10, invaderXim.craftRank.INITIATE },
            [ 8] = { invaderXim.item.CHOCOBO_FEATHER,        50, invaderXim.craftRank.INITIATE },
            [ 9] = { invaderXim.item.BAG_OF_VEGETABLE_SEEDS, 10, invaderXim.craftRank.NOVICE   },
            [10] = { invaderXim.item.RONFAURE_CHESTNUT,      10, invaderXim.craftRank.NOVICE   },
            [11] = { invaderXim.item.SPRIG_OF_MISTLETOE,     10, invaderXim.craftRank.NOVICE   },
        },
        [diggingLayer.BURROW] = -- Set: Gysahl Greens
        {
            [1] = { invaderXim.item.BUNCH_OF_GYSAHL_GREENS, 150, invaderXim.craftRank.AMATEUR  },
            [2] = { invaderXim.item.CHAMOMILE,               50, invaderXim.craftRank.AMATEUR  },
            [3] = { invaderXim.item.GINGER_ROOT,             50, invaderXim.craftRank.RECRUIT  },
            [4] = { invaderXim.item.HEAD_OF_NAPA,            50, invaderXim.craftRank.INITIATE },
        },
        [diggingLayer.BORE] = -- Set: Crystals
        {
            [1] = { invaderXim.item.FIRE_CRYSTAL,      50, invaderXim.craftRank.AMATEUR },
            [2] = { invaderXim.item.ICE_CRYSTAL,       50, invaderXim.craftRank.AMATEUR },
            [3] = { invaderXim.item.WIND_CRYSTAL,      50, invaderXim.craftRank.AMATEUR },
            [4] = { invaderXim.item.EARTH_CRYSTAL,     50, invaderXim.craftRank.AMATEUR },
            [5] = { invaderXim.item.LIGHTNING_CRYSTAL, 50, invaderXim.craftRank.AMATEUR },
            [6] = { invaderXim.item.WATER_CRYSTAL,     50, invaderXim.craftRank.AMATEUR },
            [7] = { invaderXim.item.LIGHT_CRYSTAL,     50, invaderXim.craftRank.AMATEUR },
            [8] = { invaderXim.item.DARK_CRYSTAL,      50, invaderXim.craftRank.AMATEUR },
        },
    },

    [invaderXim.zone.EAST_RONFAURE] = -- 101
    {
        [diggingLayer.TREASURE] =
        {
            [1] = { invaderXim.item.PLATE_OF_HEAVY_METAL, 5, invaderXim.craftRank.ADEPT },
        },
        [diggingLayer.REGULAR] =
        {
            [ 1] = { invaderXim.item.LITTLE_WORM,        50, invaderXim.craftRank.AMATEUR    },
            [ 2] = { invaderXim.item.ACORN,              50, invaderXim.craftRank.AMATEUR    },
            [ 3] = { invaderXim.item.ARROWWOOD_LOG,      50, invaderXim.craftRank.AMATEUR    },
            [ 4] = { invaderXim.item.MAPLE_LOG,          50, invaderXim.craftRank.RECRUIT    },
            [ 5] = { invaderXim.item.ASH_LOG,            50, invaderXim.craftRank.RECRUIT    },
            [ 6] = { invaderXim.item.CHESTNUT_LOG,       10, invaderXim.craftRank.INITIATE   },
            [ 7] = { invaderXim.item.BAG_OF_FRUIT_SEEDS, 10, invaderXim.craftRank.INITIATE   },
            [ 8] = { invaderXim.item.RONFAURE_CHESTNUT,  10, invaderXim.craftRank.NOVICE     },
            [ 9] = { invaderXim.item.CHOCOBO_FEATHER,    50, invaderXim.craftRank.NOVICE     },
            [10] = { invaderXim.item.SPRIG_OF_MISTLETOE, 10, invaderXim.craftRank.APPRENTICE },
            [11] = { invaderXim.item.KING_TRUFFLE,       10, invaderXim.craftRank.ARTISAN    },
        },
        [diggingLayer.BURROW] = -- Set: Gysahl Greens
        {
            [1] = { invaderXim.item.BUNCH_OF_GYSAHL_GREENS, 150, invaderXim.craftRank.AMATEUR  },
            [2] = { invaderXim.item.CHAMOMILE,               50, invaderXim.craftRank.AMATEUR  },
            [3] = { invaderXim.item.GINGER_ROOT,             50, invaderXim.craftRank.RECRUIT  },
            [4] = { invaderXim.item.HEAD_OF_NAPA,            50, invaderXim.craftRank.INITIATE },
        },
        [diggingLayer.BORE] = -- Set: Crystals
        {
            [1] = { invaderXim.item.FIRE_CRYSTAL,      50, invaderXim.craftRank.AMATEUR },
            [2] = { invaderXim.item.ICE_CRYSTAL,       50, invaderXim.craftRank.AMATEUR },
            [3] = { invaderXim.item.WIND_CRYSTAL,      50, invaderXim.craftRank.AMATEUR },
            [4] = { invaderXim.item.EARTH_CRYSTAL,     50, invaderXim.craftRank.AMATEUR },
            [5] = { invaderXim.item.LIGHTNING_CRYSTAL, 50, invaderXim.craftRank.AMATEUR },
            [6] = { invaderXim.item.WATER_CRYSTAL,     50, invaderXim.craftRank.AMATEUR },
            [7] = { invaderXim.item.LIGHT_CRYSTAL,     50, invaderXim.craftRank.AMATEUR },
            [8] = { invaderXim.item.DARK_CRYSTAL,      50, invaderXim.craftRank.AMATEUR },
        },
    },

    [invaderXim.zone.LA_THEINE_PLATEAU] = -- 102
    {
        [diggingLayer.TREASURE] =
        {
            [1] = { invaderXim.item.PLATE_OF_HEAVY_METAL, 5, invaderXim.craftRank.ADEPT },
            [2] = { invaderXim.item.COIN_OF_GLORY,        5, invaderXim.craftRank.ADEPT },
        },
        [diggingLayer.REGULAR] =
        {
            [ 1] = { invaderXim.item.PEBBLE,                  50, invaderXim.craftRank.AMATEUR    },
            [ 2] = { invaderXim.item.LITTLE_WORM,             50, invaderXim.craftRank.AMATEUR    },
            [ 3] = { invaderXim.item.CHOCOBO_FEATHER,         50, invaderXim.craftRank.RECRUIT    },
            [ 4] = { invaderXim.item.CHUNK_OF_TIN_ORE,        50, invaderXim.craftRank.AMATEUR    },
            [ 5] = { invaderXim.item.CHUNK_OF_ZINC_ORE,       50, invaderXim.craftRank.RECRUIT    },
            [ 6] = { invaderXim.item.ARROWWOOD_LOG,           50, invaderXim.craftRank.AMATEUR    },
            [ 7] = { invaderXim.item.YEW_LOG,                 50, invaderXim.craftRank.RECRUIT    },
            [ 8] = { invaderXim.item.CHESTNUT_LOG,            10, invaderXim.craftRank.INITIATE   },
            [ 9] = { invaderXim.item.MAHOGANY_LOG,            10, invaderXim.craftRank.NOVICE     },
            [10] = { invaderXim.item.PINCH_OF_DRIED_MARJORAM, 10, invaderXim.craftRank.APPRENTICE },
        },
        [diggingLayer.BURROW] = -- Set: Gysahl Greens
        {
            [1] = { invaderXim.item.BUNCH_OF_GYSAHL_GREENS, 150, invaderXim.craftRank.AMATEUR  },
            [2] = { invaderXim.item.CHAMOMILE,               50, invaderXim.craftRank.AMATEUR  },
            [3] = { invaderXim.item.GINGER_ROOT,             50, invaderXim.craftRank.RECRUIT  },
            [4] = { invaderXim.item.HEAD_OF_NAPA,            50, invaderXim.craftRank.INITIATE },
        },
        [diggingLayer.BORE] = -- Set: Yellow Ginseng seeds
        {
            [1] = { invaderXim.item.PIECE_OF_YELLOW_GINSENG, 150, invaderXim.craftRank.AMATEUR  },
            [2] = { invaderXim.item.BAG_OF_WILDGRASS_SEEDS,   50, invaderXim.craftRank.RECRUIT  },
            [3] = { invaderXim.item.BAG_OF_TREE_CUTTINGS,     10, invaderXim.craftRank.INITIATE },
            [4] = { invaderXim.item.BAG_OF_CACTUS_STEMS,       5, invaderXim.craftRank.NOVICE   },
        },
    },

    [invaderXim.zone.VALKURM_DUNES] = -- 103
    {
        [diggingLayer.TREASURE] =
        {
            [1] = { invaderXim.item.COIN_OF_DECAY,       5, invaderXim.craftRank.ADEPT },
            [2] = { invaderXim.item.ORDELLE_BRONZEPIECE, 5, invaderXim.craftRank.ADEPT },
            [3] = { invaderXim.item.ONE_BYNE_BILL,       5, invaderXim.craftRank.ADEPT },
            [4] = { invaderXim.item.TUKUKU_WHITESHELL,   5, invaderXim.craftRank.ADEPT },
        },
        [diggingLayer.REGULAR] =
        {
            [1] = { invaderXim.item.LUGWORM,                 50, invaderXim.craftRank.AMATEUR   },
            [2] = { invaderXim.item.BONE_CHIP,              100, invaderXim.craftRank.AMATEUR   },
            [3] = { invaderXim.item.HANDFUL_OF_FISH_SCALES,  50, invaderXim.craftRank.RECRUIT   },
            [4] = { invaderXim.item.SEASHELL,               150, invaderXim.craftRank.RECRUIT   },
            [5] = { invaderXim.item.GIANT_FEMUR,             50, invaderXim.craftRank.NOVICE    },
            [6] = { invaderXim.item.SHELL_BUG,               50, invaderXim.craftRank.INITIATE  },
            [7] = { invaderXim.item.LIZARD_MOLT,             50, invaderXim.craftRank.NOVICE    },
            [8] = { invaderXim.item.SHALL_SHELL,             50, invaderXim.craftRank.CRAFTSMAN },
            [9] = { invaderXim.item.TURTLE_SHELL,            50, invaderXim.craftRank.ARTISAN   },
        },
        [diggingLayer.BURROW] = -- Set: Feathers
        {
            [1] = { invaderXim.item.CLUMP_OF_RED_MOKO_GRASS, 100, invaderXim.craftRank.AMATEUR   },
            [2] = { invaderXim.item.BLACK_CHOCOBO_FEATHER,    50, invaderXim.craftRank.RECRUIT   },
            [4] = { invaderXim.item.GIANT_BIRD_PLUME,         10, invaderXim.craftRank.INITIATE  },
            [3] = { invaderXim.item.SPIDER_WEB,                5, invaderXim.craftRank.NOVICE    },
            [5] = { invaderXim.item.PHOENIX_FEATHER,           1, invaderXim.craftRank.CRAFTSMAN },
        },
        [diggingLayer.BORE] = -- Set: Bones
        {
            [ 1] = { invaderXim.item.BONE_CHIP,                 150, invaderXim.craftRank.AMATEUR    },
            [ 2] = { invaderXim.item.HANDFUL_OF_FISH_SCALES,    150, invaderXim.craftRank.AMATEUR    },
            [ 3] = { invaderXim.item.SEASHELL,                  150, invaderXim.craftRank.RECRUIT    },
            [ 4] = { invaderXim.item.HIGH_QUALITY_PUGIL_SCALES,  50, invaderXim.craftRank.INITIATE   },
            [ 5] = { invaderXim.item.TITANICTUS_SHELL,           50, invaderXim.craftRank.APPRENTICE },
            [ 6] = { invaderXim.item.DEMON_HORN,                 10, invaderXim.craftRank.JOURNEYMAN },
            [ 7] = { invaderXim.item.HANDFUL_OF_WYVERN_SCALES,    5, invaderXim.craftRank.CRAFTSMAN  },
            [ 8] = { invaderXim.item.TURTLE_SHELL,                5, invaderXim.craftRank.CRAFTSMAN  },
            [ 9] = { invaderXim.item.DEMON_SKULL,                 1, invaderXim.craftRank.ARTISAN    },
            [10] = { invaderXim.item.HANDFUL_OF_DRAGON_SCALES,    1, invaderXim.craftRank.ARTISAN    },
        },
    },

    [invaderXim.zone.JUGNER_FOREST] = -- 104
    {
        [diggingLayer.TREASURE] =
        {
            [1] = { invaderXim.item.PLATE_OF_HEAVY_METAL, 5, invaderXim.craftRank.ADEPT },
            [2] = { invaderXim.item.COIN_OF_BIRTH,        5, invaderXim.craftRank.ADEPT },
            [3] = { invaderXim.item.KING_TRUFFLE,         5, invaderXim.craftRank.ADEPT },
        },
        [diggingLayer.REGULAR] =
        {
            [1] = { invaderXim.item.LITTLE_WORM,        50, invaderXim.craftRank.AMATEUR   },
            [2] = { invaderXim.item.ACORN,              50, invaderXim.craftRank.AMATEUR   },
            [3] = { invaderXim.item.MAPLE_LOG,          50, invaderXim.craftRank.RECRUIT   },
            [4] = { invaderXim.item.WILLOW_LOG,         50, invaderXim.craftRank.RECRUIT   },
            [5] = { invaderXim.item.HOLLY_LOG,          50, invaderXim.craftRank.NOVICE    },
            [6] = { invaderXim.item.OAK_LOG,            50, invaderXim.craftRank.INITIATE  },
            [7] = { invaderXim.item.SPRIG_OF_MISTLETOE, 10, invaderXim.craftRank.NOVICE    },
            [8] = { invaderXim.item.SCREAM_FUNGUS,       5, invaderXim.craftRank.CRAFTSMAN },
        },
        [diggingLayer.BURROW] = -- Set: Crystals
        {
            [1] = { invaderXim.item.FIRE_CRYSTAL,      50, invaderXim.craftRank.AMATEUR },
            [2] = { invaderXim.item.ICE_CRYSTAL,       50, invaderXim.craftRank.AMATEUR },
            [3] = { invaderXim.item.WIND_CRYSTAL,      50, invaderXim.craftRank.AMATEUR },
            [4] = { invaderXim.item.EARTH_CRYSTAL,     50, invaderXim.craftRank.AMATEUR },
            [5] = { invaderXim.item.LIGHTNING_CRYSTAL, 50, invaderXim.craftRank.AMATEUR },
            [6] = { invaderXim.item.WATER_CRYSTAL,     50, invaderXim.craftRank.AMATEUR },
            [7] = { invaderXim.item.LIGHT_CRYSTAL,     50, invaderXim.craftRank.AMATEUR },
            [8] = { invaderXim.item.DARK_CRYSTAL,      50, invaderXim.craftRank.AMATEUR },
        },
        [diggingLayer.BORE] = -- Set: Logs 1
        {
            [1] = { invaderXim.item.ARROWWOOD_LOG,           240, invaderXim.craftRank.AMATEUR    },
            [2] = { invaderXim.item.YEW_LOG,                 150, invaderXim.craftRank.AMATEUR    },
            [3] = { invaderXim.item.ELM_LOG,                 100, invaderXim.craftRank.RECRUIT    },
            [4] = { invaderXim.item.OAK_LOG,                  50, invaderXim.craftRank.INITIATE   },
            [5] = { invaderXim.item.ROSEWOOD_LOG,             10, invaderXim.craftRank.NOVICE     },
            [6] = { invaderXim.item.MAHOGANY_LOG,              5, invaderXim.craftRank.APPRENTICE },
            [7] = { invaderXim.item.EBONY_LOG,                 5, invaderXim.craftRank.JOURNEYMAN },
            [8] = { invaderXim.item.PIECE_OF_ANCIENT_LUMBER,   1, invaderXim.craftRank.CRAFTSMAN  },
            [9] = { invaderXim.item.LACQUER_TREE_LOG,          1, invaderXim.craftRank.ARTISAN    },
        },
    },

    [invaderXim.zone.BATALLIA_DOWNS] = -- 105
    {
        [diggingLayer.TREASURE] =
        {
            [1] = { invaderXim.item.PLATE_OF_HEAVY_METAL, 5, invaderXim.craftRank.ADEPT },
            [2] = { invaderXim.item.COIN_OF_ADVANCEMENT,  5, invaderXim.craftRank.ADEPT },
        },
        [diggingLayer.REGULAR] =
        {
            [1] = { invaderXim.item.PEBBLE,                50, invaderXim.craftRank.AMATEUR    },
            [2] = { invaderXim.item.FLINT_STONE,           50, invaderXim.craftRank.AMATEUR    },
            [3] = { invaderXim.item.BONE_CHIP,             50, invaderXim.craftRank.AMATEUR    },
            [4] = { invaderXim.item.CHUNK_OF_COPPER_ORE,   50, invaderXim.craftRank.RECRUIT    },
            [5] = { invaderXim.item.BIRD_FEATHER,          50, invaderXim.craftRank.RECRUIT    },
            [6] = { invaderXim.item.CHUNK_OF_IRON_ORE,     50, invaderXim.craftRank.INITIATE   },
            [7] = { invaderXim.item.RED_JAR,               50, invaderXim.craftRank.NOVICE     },
            [8] = { invaderXim.item.BLACK_CHOCOBO_FEATHER,  5, invaderXim.craftRank.APPRENTICE },
            [9] = { invaderXim.item.REISHI_MUSHROOM,        5, invaderXim.craftRank.JOURNEYMAN },
        },
        [diggingLayer.BURROW] = -- Set: Beastcoins
        {
            [1] = { invaderXim.item.BEASTCOIN,          100, invaderXim.craftRank.AMATEUR    },
            [2] = { invaderXim.item.SILVER_BEASTCOIN,    50, invaderXim.craftRank.RECRUIT    },
            [3] = { invaderXim.item.GOLD_BEASTCOIN,      10, invaderXim.craftRank.INITIATE   },
            [4] = { invaderXim.item.MYTHRIL_BEASTCOIN,    5, invaderXim.craftRank.NOVICE     },
            [5] = { invaderXim.item.PLATINUM_BEASTCOIN,   1, invaderXim.craftRank.APPRENTICE },
        },
        [diggingLayer.BORE] = -- Set: Yellow Ginseng seeds
        {
            [1] = { invaderXim.item.PIECE_OF_YELLOW_GINSENG, 150, invaderXim.craftRank.AMATEUR  },
            [2] = { invaderXim.item.BAG_OF_WILDGRASS_SEEDS,   50, invaderXim.craftRank.RECRUIT  },
            [3] = { invaderXim.item.BAG_OF_TREE_CUTTINGS,     10, invaderXim.craftRank.INITIATE },
            [4] = { invaderXim.item.BAG_OF_CACTUS_STEMS,       5, invaderXim.craftRank.NOVICE   },
        },
    },

    [invaderXim.zone.NORTH_GUSTABERG] = -- 106
    {
        [diggingLayer.TREASURE] =
        {
            [1] = { invaderXim.item.PLATE_OF_HEAVY_METAL, 5, invaderXim.craftRank.ADEPT },
            [2] = { invaderXim.item.COIN_OF_GLORY,        5, invaderXim.craftRank.ADEPT },
        },
        [diggingLayer.REGULAR] =
        {
            [ 1] = { invaderXim.item.PEBBLE,                 50, invaderXim.craftRank.AMATEUR    },
            [ 2] = { invaderXim.item.LITTLE_WORM,            50, invaderXim.craftRank.AMATEUR    },
            [ 3] = { invaderXim.item.BONE_CHIP,              50, invaderXim.craftRank.AMATEUR    },
            [ 4] = { invaderXim.item.BIRD_FEATHER,           50, invaderXim.craftRank.AMATEUR    },
            [ 5] = { invaderXim.item.HANDFUL_OF_FISH_SCALES, 50, invaderXim.craftRank.AMATEUR    },
            [ 6] = { invaderXim.item.INSECT_WING,            50, invaderXim.craftRank.AMATEUR    },
            [ 7] = { invaderXim.item.BAG_OF_CACTUS_STEMS,    10, invaderXim.craftRank.RECRUIT    },
            [ 8] = { invaderXim.item.LIZARD_MOLT,            50, invaderXim.craftRank.RECRUIT    },
            [ 9] = { invaderXim.item.MYTHRIL_BEASTCOIN,      10, invaderXim.craftRank.APPRENTICE },
            [10] = { invaderXim.item.CHUNK_OF_MYTHRIL_ORE,   10, invaderXim.craftRank.APPRENTICE },
            [11] = { invaderXim.item.CHUNK_OF_DARKSTEEL_ORE, 10, invaderXim.craftRank.ARTISAN    },
        },
        [diggingLayer.BURROW] = -- Set: Gysahl Greens
        {
            [1] = { invaderXim.item.BUNCH_OF_GYSAHL_GREENS, 150, invaderXim.craftRank.AMATEUR  },
            [2] = { invaderXim.item.CHAMOMILE,               50, invaderXim.craftRank.AMATEUR  },
            [3] = { invaderXim.item.GINGER_ROOT,             50, invaderXim.craftRank.RECRUIT  },
            [4] = { invaderXim.item.HEAD_OF_NAPA,            50, invaderXim.craftRank.INITIATE },
        },
        [diggingLayer.BORE] = -- Set: Crystals
        {
            [1] = { invaderXim.item.FIRE_CRYSTAL,      50, invaderXim.craftRank.AMATEUR },
            [2] = { invaderXim.item.ICE_CRYSTAL,       50, invaderXim.craftRank.AMATEUR },
            [3] = { invaderXim.item.WIND_CRYSTAL,      50, invaderXim.craftRank.AMATEUR },
            [4] = { invaderXim.item.EARTH_CRYSTAL,     50, invaderXim.craftRank.AMATEUR },
            [5] = { invaderXim.item.LIGHTNING_CRYSTAL, 50, invaderXim.craftRank.AMATEUR },
            [6] = { invaderXim.item.WATER_CRYSTAL,     50, invaderXim.craftRank.AMATEUR },
            [7] = { invaderXim.item.LIGHT_CRYSTAL,     50, invaderXim.craftRank.AMATEUR },
            [8] = { invaderXim.item.DARK_CRYSTAL,      50, invaderXim.craftRank.AMATEUR },
        },
    },

    [invaderXim.zone.SOUTH_GUSTABERG] = -- 107
    {
        [diggingLayer.TREASURE] =
        {
            [1] = { invaderXim.item.PLATE_OF_HEAVY_METAL, 5, invaderXim.craftRank.ADEPT },
            [2] = { invaderXim.item.COIN_OF_DECAY,        5, invaderXim.craftRank.ADEPT },
        },
        [diggingLayer.REGULAR] =
        {
            [ 1] = { invaderXim.item.PEBBLE,               50, invaderXim.craftRank.AMATEUR    },
            [ 2] = { invaderXim.item.LITTLE_WORM,          50, invaderXim.craftRank.AMATEUR    },
            [ 3] = { invaderXim.item.BONE_CHIP,            50, invaderXim.craftRank.AMATEUR    },
            [ 4] = { invaderXim.item.BIRD_FEATHER,         50, invaderXim.craftRank.AMATEUR    },
            [ 5] = { invaderXim.item.CHUNK_OF_ROCK_SALT,   50, invaderXim.craftRank.AMATEUR    },
            [ 6] = { invaderXim.item.INSECT_WING,          50, invaderXim.craftRank.AMATEUR    },
            [ 7] = { invaderXim.item.BAG_OF_GRAIN_SEEDS,   50, invaderXim.craftRank.RECRUIT    },
            [ 8] = { invaderXim.item.LIZARD_MOLT,          50, invaderXim.craftRank.RECRUIT    },
            [ 9] = { invaderXim.item.MYTHRIL_BEASTCOIN,    50, invaderXim.craftRank.APPRENTICE },
            [10] = { invaderXim.item.CHUNK_OF_MYTHRIL_ORE, 10, invaderXim.craftRank.APPRENTICE },
        },
        [diggingLayer.BURROW] = -- Set: Gysahl Greens
        {
            [1] = { invaderXim.item.BUNCH_OF_GYSAHL_GREENS, 150, invaderXim.craftRank.AMATEUR  },
            [2] = { invaderXim.item.CHAMOMILE,               50, invaderXim.craftRank.AMATEUR  },
            [3] = { invaderXim.item.GINGER_ROOT,             50, invaderXim.craftRank.RECRUIT  },
            [4] = { invaderXim.item.HEAD_OF_NAPA,            50, invaderXim.craftRank.INITIATE },
        },
        [diggingLayer.BORE] = -- Set: Crystals
        {
            [1] = { invaderXim.item.FIRE_CRYSTAL,      50, invaderXim.craftRank.AMATEUR },
            [2] = { invaderXim.item.ICE_CRYSTAL,       50, invaderXim.craftRank.AMATEUR },
            [3] = { invaderXim.item.WIND_CRYSTAL,      50, invaderXim.craftRank.AMATEUR },
            [4] = { invaderXim.item.EARTH_CRYSTAL,     50, invaderXim.craftRank.AMATEUR },
            [5] = { invaderXim.item.LIGHTNING_CRYSTAL, 50, invaderXim.craftRank.AMATEUR },
            [6] = { invaderXim.item.WATER_CRYSTAL,     50, invaderXim.craftRank.AMATEUR },
            [7] = { invaderXim.item.LIGHT_CRYSTAL,     50, invaderXim.craftRank.AMATEUR },
            [8] = { invaderXim.item.DARK_CRYSTAL,      50, invaderXim.craftRank.AMATEUR },
        },
    },

    [invaderXim.zone.KONSCHTAT_HIGHLANDS] = -- 108
    {
        [diggingLayer.TREASURE] =
        {
            [1] = { invaderXim.item.PLATE_OF_HEAVY_METAL, 5, invaderXim.craftRank.ADEPT },
            [2] = { invaderXim.item.COIN_OF_BIRTH,        5, invaderXim.craftRank.ADEPT },
        },
        [diggingLayer.REGULAR] =
        {
            [1] = { invaderXim.item.PEBBLE,                 50, invaderXim.craftRank.AMATEUR    },
            [2] = { invaderXim.item.FLINT_STONE,            50, invaderXim.craftRank.AMATEUR    },
            [3] = { invaderXim.item.BONE_CHIP,              50, invaderXim.craftRank.AMATEUR    },
            [4] = { invaderXim.item.HANDFUL_OF_FISH_SCALES, 50, invaderXim.craftRank.AMATEUR    },
            [5] = { invaderXim.item.CHUNK_OF_ZINC_ORE,      50, invaderXim.craftRank.AMATEUR    },
            [6] = { invaderXim.item.BIRD_FEATHER,           10, invaderXim.craftRank.RECRUIT    },
            [7] = { invaderXim.item.LIZARD_MOLT,            50, invaderXim.craftRank.RECRUIT    },
            [8] = { invaderXim.item.MYTHRIL_BEASTCOIN,       5, invaderXim.craftRank.APPRENTICE },
            [9] = { invaderXim.item.ELM_LOG,                 5, invaderXim.craftRank.APPRENTICE },
        },
        [diggingLayer.BURROW] = -- Set: Crystals
        {
            [1] = { invaderXim.item.FIRE_CRYSTAL,      50, invaderXim.craftRank.AMATEUR },
            [2] = { invaderXim.item.ICE_CRYSTAL,       50, invaderXim.craftRank.AMATEUR },
            [3] = { invaderXim.item.WIND_CRYSTAL,      50, invaderXim.craftRank.AMATEUR },
            [4] = { invaderXim.item.EARTH_CRYSTAL,     50, invaderXim.craftRank.AMATEUR },
            [5] = { invaderXim.item.LIGHTNING_CRYSTAL, 50, invaderXim.craftRank.AMATEUR },
            [6] = { invaderXim.item.WATER_CRYSTAL,     50, invaderXim.craftRank.AMATEUR },
            [7] = { invaderXim.item.LIGHT_CRYSTAL,     50, invaderXim.craftRank.AMATEUR },
            [8] = { invaderXim.item.DARK_CRYSTAL,      50, invaderXim.craftRank.AMATEUR },
        },
        [diggingLayer.BORE] = -- Set: Feathers
        {
            [1] = { invaderXim.item.CLUMP_OF_RED_MOKO_GRASS, 100, invaderXim.craftRank.AMATEUR   },
            [2] = { invaderXim.item.BLACK_CHOCOBO_FEATHER,    50, invaderXim.craftRank.RECRUIT   },
            [4] = { invaderXim.item.GIANT_BIRD_PLUME,         10, invaderXim.craftRank.INITIATE  },
            [3] = { invaderXim.item.SPIDER_WEB,                5, invaderXim.craftRank.NOVICE    },
            [5] = { invaderXim.item.PHOENIX_FEATHER,           1, invaderXim.craftRank.CRAFTSMAN },
        },
    },

    [invaderXim.zone.PASHHOW_MARSHLANDS] = -- 109
    {
        [diggingLayer.TREASURE] =
        {
            [1] = { invaderXim.item.PLATE_OF_HEAVY_METAL, 5, invaderXim.craftRank.ADEPT },
            [2] = { invaderXim.item.COIN_OF_ADVANCEMENT,  5, invaderXim.craftRank.ADEPT },
        },
        [diggingLayer.REGULAR] =
        {
            [1] = { invaderXim.item.PEBBLE,              50, invaderXim.craftRank.AMATEUR    },
            [2] = { invaderXim.item.INSECT_WING,         50, invaderXim.craftRank.AMATEUR    },
            [3] = { invaderXim.item.LIZARD_MOLT,         50, invaderXim.craftRank.RECRUIT    },
            [4] = { invaderXim.item.CHUNK_OF_SILVER_ORE, 50, invaderXim.craftRank.RECRUIT    },
            [5] = { invaderXim.item.MYTHRIL_BEASTCOIN,   10, invaderXim.craftRank.INITIATE   },
            [6] = { invaderXim.item.TURTLE_SHELL,        10, invaderXim.craftRank.INITIATE   },
            [7] = { invaderXim.item.WILLOW_LOG,          10, invaderXim.craftRank.INITIATE   },
            [8] = { invaderXim.item.PETRIFIED_LOG,        5, invaderXim.craftRank.NOVICE     },
            [9] = { invaderXim.item.PUFFBALL,             5, invaderXim.craftRank.APPRENTICE },
        },
        [diggingLayer.BURROW] = -- Set: Yellow Ginseng seeds
        {
            [1] = { invaderXim.item.PIECE_OF_YELLOW_GINSENG, 150, invaderXim.craftRank.AMATEUR  },
            [2] = { invaderXim.item.BAG_OF_WILDGRASS_SEEDS,   50, invaderXim.craftRank.RECRUIT  },
            [3] = { invaderXim.item.BAG_OF_TREE_CUTTINGS,     10, invaderXim.craftRank.INITIATE },
            [4] = { invaderXim.item.BAG_OF_CACTUS_STEMS,       5, invaderXim.craftRank.NOVICE   },
        },
        [diggingLayer.BORE] = -- Set: Crystals
        {
            [1] = { invaderXim.item.FIRE_CRYSTAL,      50, invaderXim.craftRank.AMATEUR },
            [2] = { invaderXim.item.ICE_CRYSTAL,       50, invaderXim.craftRank.AMATEUR },
            [3] = { invaderXim.item.WIND_CRYSTAL,      50, invaderXim.craftRank.AMATEUR },
            [4] = { invaderXim.item.EARTH_CRYSTAL,     50, invaderXim.craftRank.AMATEUR },
            [5] = { invaderXim.item.LIGHTNING_CRYSTAL, 50, invaderXim.craftRank.AMATEUR },
            [6] = { invaderXim.item.WATER_CRYSTAL,     50, invaderXim.craftRank.AMATEUR },
            [7] = { invaderXim.item.LIGHT_CRYSTAL,     50, invaderXim.craftRank.AMATEUR },
            [8] = { invaderXim.item.DARK_CRYSTAL,      50, invaderXim.craftRank.AMATEUR },
        },
    },

    [invaderXim.zone.ROLANBERRY_FIELDS] = -- 110
    {
        [diggingLayer.TREASURE] =
        {
            [1] = { invaderXim.item.PLATE_OF_HEAVY_METAL, 5, invaderXim.craftRank.ADEPT },
            [2] = { invaderXim.item.COIN_OF_GLORY,        5, invaderXim.craftRank.ADEPT },
        },
        [diggingLayer.REGULAR] =
        {
            [1] = { invaderXim.item.PEBBLE,                  100, invaderXim.craftRank.AMATEUR   },
            [2] = { invaderXim.item.LITTLE_WORM,             100, invaderXim.craftRank.AMATEUR   },
            [3] = { invaderXim.item.FLINT_STONE,             100, invaderXim.craftRank.AMATEUR   },
            [4] = { invaderXim.item.INSECT_WING,              50, invaderXim.craftRank.RECRUIT   },
            [5] = { invaderXim.item.MYTHRIL_BEASTCOIN,        10, invaderXim.craftRank.INITIATE  },
            [6] = { invaderXim.item.SPRIG_OF_SAGE,            10, invaderXim.craftRank.INITIATE  },
            [7] = { invaderXim.item.RED_JAR,                  10, invaderXim.craftRank.NOVICE    },
            [8] = { invaderXim.item.GOLD_BEASTCOIN,            5, invaderXim.craftRank.CRAFTSMAN },
            [9] = { invaderXim.item.CHUNK_OF_ORICHALCUM_ORE,   5, invaderXim.craftRank.CRAFTSMAN },
        },
        [diggingLayer.BURROW] = -- Set: Feathers
        {
            [1] = { invaderXim.item.CLUMP_OF_RED_MOKO_GRASS, 100, invaderXim.craftRank.AMATEUR   },
            [2] = { invaderXim.item.BLACK_CHOCOBO_FEATHER,    50, invaderXim.craftRank.RECRUIT   },
            [4] = { invaderXim.item.GIANT_BIRD_PLUME,         10, invaderXim.craftRank.INITIATE  },
            [3] = { invaderXim.item.SPIDER_WEB,                5, invaderXim.craftRank.NOVICE    },
            [5] = { invaderXim.item.PHOENIX_FEATHER,           1, invaderXim.craftRank.CRAFTSMAN },
        },
        [diggingLayer.BORE] = -- Set: Shrooms
        {
            [1] = { invaderXim.item.DEATHBALL,       100, invaderXim.craftRank.AMATEUR    },
            [2] = { invaderXim.item.SLEEPSHROOM,     100, invaderXim.craftRank.AMATEUR    },
            [3] = { invaderXim.item.CORAL_FUNGUS,     50, invaderXim.craftRank.RECRUIT    },
            [4] = { invaderXim.item.WOOZYSHROOM,      10, invaderXim.craftRank.INITIATE   },
            [5] = { invaderXim.item.PUFFBALL,         10, invaderXim.craftRank.NOVICE     },
            [6] = { invaderXim.item.DANCESHROOM,       5, invaderXim.craftRank.APPRENTICE },
            [7] = { invaderXim.item.REISHI_MUSHROOM,   1, invaderXim.craftRank.JOURNEYMAN },
            [8] = { invaderXim.item.KING_TRUFFLE,      1, invaderXim.craftRank.CRAFTSMAN  },
        },
    },

    [invaderXim.zone.BEAUCEDINE_GLACIER] = -- 111
    {
        [diggingLayer.TREASURE] =
        {
            -- No entries.
        },
        [diggingLayer.REGULAR] =
        {
            -- No entries.
        },
        [diggingLayer.BURROW] =
        {
            -- No entries.
        },
        [diggingLayer.BORE] =
        {
            -- No entries.
        },
    },

    [invaderXim.zone.XARCABARD] = -- 112
    {
        [diggingLayer.TREASURE] =
        {
            -- No entries.
        },
        [diggingLayer.REGULAR] =
        {
            -- No entries.
        },
        [diggingLayer.BURROW] =
        {
            -- No entries.
        },
        [diggingLayer.BORE] =
        {
            -- No entries.
        },
    },

    [invaderXim.zone.CAPE_TERIGGAN] = -- 113
    {
        [diggingLayer.TREASURE] =
        {
            -- No entries.
        },
        [diggingLayer.REGULAR] =
        {
            -- No entries.
        },
        [diggingLayer.BURROW] = -- Set: Feathers
        {
            [1] = { invaderXim.item.CLUMP_OF_RED_MOKO_GRASS, 100, invaderXim.craftRank.AMATEUR   },
            [2] = { invaderXim.item.BLACK_CHOCOBO_FEATHER,    50, invaderXim.craftRank.RECRUIT   },
            [4] = { invaderXim.item.GIANT_BIRD_PLUME,         10, invaderXim.craftRank.INITIATE  },
            [3] = { invaderXim.item.SPIDER_WEB,                5, invaderXim.craftRank.NOVICE    },
            [5] = { invaderXim.item.PHOENIX_FEATHER,           1, invaderXim.craftRank.CRAFTSMAN },
        },
        [diggingLayer.BORE] = -- Set: Logs 1
        {
            [1] = { invaderXim.item.ARROWWOOD_LOG,           240, invaderXim.craftRank.AMATEUR    },
            [2] = { invaderXim.item.YEW_LOG,                 150, invaderXim.craftRank.AMATEUR    },
            [3] = { invaderXim.item.ELM_LOG,                 100, invaderXim.craftRank.RECRUIT    },
            [4] = { invaderXim.item.OAK_LOG,                  50, invaderXim.craftRank.INITIATE   },
            [5] = { invaderXim.item.ROSEWOOD_LOG,             10, invaderXim.craftRank.NOVICE     },
            [6] = { invaderXim.item.MAHOGANY_LOG,              5, invaderXim.craftRank.APPRENTICE },
            [7] = { invaderXim.item.EBONY_LOG,                 5, invaderXim.craftRank.JOURNEYMAN },
            [8] = { invaderXim.item.PIECE_OF_ANCIENT_LUMBER,   1, invaderXim.craftRank.CRAFTSMAN  },
            [9] = { invaderXim.item.LACQUER_TREE_LOG,          1, invaderXim.craftRank.ARTISAN    },
        },
    },

    [invaderXim.zone.EASTERN_ALTEPA_DESERT] = -- 114
    {
        [diggingLayer.TREASURE] =
        {
            [1] = { invaderXim.item.PLATE_OF_HEAVY_METAL, 5, invaderXim.craftRank.ADEPT },
        },
        [diggingLayer.REGULAR] =
        {
            [ 1] = { invaderXim.item.FLINT_STONE,              240, invaderXim.craftRank.AMATEUR    },
            [ 2] = { invaderXim.item.BONE_CHIP,                100, invaderXim.craftRank.AMATEUR    },
            [ 3] = { invaderXim.item.PEBBLE,                    50, invaderXim.craftRank.RECRUIT    },
            [ 4] = { invaderXim.item.CHUNK_OF_ZINC_ORE,         50, invaderXim.craftRank.RECRUIT    },
            [ 5] = { invaderXim.item.CHUNK_OF_SILVER_ORE,       50, invaderXim.craftRank.INITIATE   },
            [ 6] = { invaderXim.item.GIANT_FEMUR,               50, invaderXim.craftRank.NOVICE     },
            [ 7] = { invaderXim.item.HANDFUL_OF_WYVERN_SCALES,  50, invaderXim.craftRank.APPRENTICE },
            [ 8] = { invaderXim.item.CHUNK_OF_MYTHRIL_ORE,      10, invaderXim.craftRank.JOURNEYMAN },
            [ 9] = { invaderXim.item.CHUNK_OF_PLATINUM_ORE,     10, invaderXim.craftRank.JOURNEYMAN },
            [10] = { invaderXim.item.PHILOSOPHERS_STONE,         5, invaderXim.craftRank.CRAFTSMAN  },
        },
        [diggingLayer.BURROW] =
        {
            [1] = { invaderXim.item.BAG_OF_GRAIN_SEEDS,     50, invaderXim.craftRank.AMATEUR    },
            [2] = { invaderXim.item.BAG_OF_VEGETABLE_SEEDS, 50, invaderXim.craftRank.RECRUIT    },
            [3] = { invaderXim.item.BAG_OF_HERB_SEEDS,      50, invaderXim.craftRank.INITIATE   },
            [4] = { invaderXim.item.BAG_OF_WILDGRASS_SEEDS, 50, invaderXim.craftRank.NOVICE     },
            [5] = { invaderXim.item.BAG_OF_FRUIT_SEEDS,     50, invaderXim.craftRank.APPRENTICE },
            [6] = { invaderXim.item.BAG_OF_TREE_CUTTINGS,   10, invaderXim.craftRank.JOURNEYMAN },
            [7] = { invaderXim.item.BAG_OF_CACTUS_STEMS,    10, invaderXim.craftRank.CRAFTSMAN  },
        },
        [diggingLayer.BORE] = -- Set: Ores 1
        {
            [1] = { invaderXim.item.FLINT_STONE,             240, invaderXim.craftRank.AMATEUR    },
            [2] = { invaderXim.item.CHUNK_OF_ALUMINUM_ORE,   100, invaderXim.craftRank.RECRUIT    },
            [3] = { invaderXim.item.CHUNK_OF_GOLD_ORE,        50, invaderXim.craftRank.INITIATE   },
            [4] = { invaderXim.item.CHUNK_OF_DARKSTEEL_ORE,   10, invaderXim.craftRank.NOVICE     },
            [5] = { invaderXim.item.CHUNK_OF_ADAMAN_ORE,       5, invaderXim.craftRank.JOURNEYMAN },
            [6] = { invaderXim.item.CHUNK_OF_PLATINUM_ORE,     5, invaderXim.craftRank.JOURNEYMAN },
            [7] = { invaderXim.item.CHUNK_OF_ORICHALCUM_ORE,   1, invaderXim.craftRank.CRAFTSMAN  },
        },
    },

    [invaderXim.zone.WEST_SARUTABARUTA] = -- 115
    {
        [diggingLayer.TREASURE] =
        {
            [1] = { invaderXim.item.PLATE_OF_HEAVY_METAL, 5, invaderXim.craftRank.ADEPT },
            [2] = { invaderXim.item.COIN_OF_DECAY,        5, invaderXim.craftRank.ADEPT },
        },
        [diggingLayer.REGULAR] =
        {
            [1] = { invaderXim.item.PEBBLE,                50, invaderXim.craftRank.AMATEUR  },
            [2] = { invaderXim.item.LITTLE_WORM,           50, invaderXim.craftRank.AMATEUR  },
            [3] = { invaderXim.item.CLUMP_OF_MOKO_GRASS,   50, invaderXim.craftRank.RECRUIT  },
            [4] = { invaderXim.item.LAUAN_LOG,             50, invaderXim.craftRank.RECRUIT  },
            [5] = { invaderXim.item.INSECT_WING,           50, invaderXim.craftRank.RECRUIT  },
            [6] = { invaderXim.item.YAGUDO_FEATHER,        50, invaderXim.craftRank.INITIATE },
            [7] = { invaderXim.item.BIRD_FEATHER,          10, invaderXim.craftRank.INITIATE },
            [8] = { invaderXim.item.BALL_OF_SARUTA_COTTON, 10, invaderXim.craftRank.INITIATE },
            [9] = { invaderXim.item.ROSEWOOD_LOG,           5, invaderXim.craftRank.NOVICE   },
        },
        [diggingLayer.BURROW] = -- Set: Gysahl Greens
        {
            [1] = { invaderXim.item.BUNCH_OF_GYSAHL_GREENS, 150, invaderXim.craftRank.AMATEUR  },
            [2] = { invaderXim.item.CHAMOMILE,               50, invaderXim.craftRank.AMATEUR  },
            [3] = { invaderXim.item.GINGER_ROOT,             50, invaderXim.craftRank.RECRUIT  },
            [4] = { invaderXim.item.HEAD_OF_NAPA,            50, invaderXim.craftRank.INITIATE },
        },
        [diggingLayer.BORE] = -- Set: Crystals
        {
            [1] = { invaderXim.item.FIRE_CRYSTAL,      50, invaderXim.craftRank.AMATEUR },
            [2] = { invaderXim.item.ICE_CRYSTAL,       50, invaderXim.craftRank.AMATEUR },
            [3] = { invaderXim.item.WIND_CRYSTAL,      50, invaderXim.craftRank.AMATEUR },
            [4] = { invaderXim.item.EARTH_CRYSTAL,     50, invaderXim.craftRank.AMATEUR },
            [5] = { invaderXim.item.LIGHTNING_CRYSTAL, 50, invaderXim.craftRank.AMATEUR },
            [6] = { invaderXim.item.WATER_CRYSTAL,     50, invaderXim.craftRank.AMATEUR },
            [7] = { invaderXim.item.LIGHT_CRYSTAL,     50, invaderXim.craftRank.AMATEUR },
            [8] = { invaderXim.item.DARK_CRYSTAL,      50, invaderXim.craftRank.AMATEUR },
        },
    },

    [invaderXim.zone.EAST_SARUTABARUTA] = -- 116
    {
        [diggingLayer.TREASURE] =
        {
            [1] = { invaderXim.item.PLATE_OF_HEAVY_METAL, 5, invaderXim.craftRank.ADEPT },
        },
        [diggingLayer.REGULAR] =
        {
            [ 1] = { invaderXim.item.PEBBLE,                50, invaderXim.craftRank.AMATEUR  },
            [ 2] = { invaderXim.item.PAPAKA_GRASS,          50, invaderXim.craftRank.AMATEUR  },
            [ 3] = { invaderXim.item.LAUAN_LOG,             50, invaderXim.craftRank.AMATEUR  },
            [ 4] = { invaderXim.item.INSECT_WING,           50, invaderXim.craftRank.RECRUIT  },
            [ 5] = { invaderXim.item.YAGUDO_FEATHER,        50, invaderXim.craftRank.RECRUIT  },
            [ 6] = { invaderXim.item.BALL_OF_SARUTA_COTTON, 50, invaderXim.craftRank.RECRUIT  },
            [ 7] = { invaderXim.item.BAG_OF_HERB_SEEDS,     50, invaderXim.craftRank.INITIATE },
            [ 8] = { invaderXim.item.BIRD_FEATHER,          10, invaderXim.craftRank.INITIATE },
            [ 9] = { invaderXim.item.EBONY_LOG,             10, invaderXim.craftRank.INITIATE },
            [10] = { invaderXim.item.ROSEWOOD_LOG,           5, invaderXim.craftRank.NOVICE   },
        },
        [diggingLayer.BURROW] = -- Set: Gysahl Greens
        {
            [1] = { invaderXim.item.BUNCH_OF_GYSAHL_GREENS, 150, invaderXim.craftRank.AMATEUR  },
            [2] = { invaderXim.item.CHAMOMILE,               50, invaderXim.craftRank.AMATEUR  },
            [3] = { invaderXim.item.GINGER_ROOT,             50, invaderXim.craftRank.RECRUIT  },
            [4] = { invaderXim.item.HEAD_OF_NAPA,            50, invaderXim.craftRank.INITIATE },
        },
        [diggingLayer.BORE] = -- Set: Crystals
        {
            [1] = { invaderXim.item.FIRE_CRYSTAL,      50, invaderXim.craftRank.AMATEUR },
            [2] = { invaderXim.item.ICE_CRYSTAL,       50, invaderXim.craftRank.AMATEUR },
            [3] = { invaderXim.item.WIND_CRYSTAL,      50, invaderXim.craftRank.AMATEUR },
            [4] = { invaderXim.item.EARTH_CRYSTAL,     50, invaderXim.craftRank.AMATEUR },
            [5] = { invaderXim.item.LIGHTNING_CRYSTAL, 50, invaderXim.craftRank.AMATEUR },
            [6] = { invaderXim.item.WATER_CRYSTAL,     50, invaderXim.craftRank.AMATEUR },
            [7] = { invaderXim.item.LIGHT_CRYSTAL,     50, invaderXim.craftRank.AMATEUR },
            [8] = { invaderXim.item.DARK_CRYSTAL,      50, invaderXim.craftRank.AMATEUR },
        },
    },

    [invaderXim.zone.TAHRONGI_CANYON] = -- 117
    {
        [diggingLayer.TREASURE] =
        {
            [1] = { invaderXim.item.PLATE_OF_HEAVY_METAL, 5, invaderXim.craftRank.ADEPT },
            [2] = { invaderXim.item.COIN_OF_ADVANCEMENT,  5, invaderXim.craftRank.ADEPT },
        },
        [diggingLayer.REGULAR] =
        {
            [1] = { invaderXim.item.PEBBLE,            50, invaderXim.craftRank.AMATEUR    },
            [2] = { invaderXim.item.BONE_CHIP,         50, invaderXim.craftRank.AMATEUR    },
            [3] = { invaderXim.item.SEASHELL,          50, invaderXim.craftRank.RECRUIT    },
            [4] = { invaderXim.item.CHUNK_OF_TIN_ORE,  50, invaderXim.craftRank.RECRUIT    },
            [5] = { invaderXim.item.GIANT_FEMUR,       50, invaderXim.craftRank.INITIATE   },
            [6] = { invaderXim.item.INSECT_WING,       50, invaderXim.craftRank.INITIATE   },
            [7] = { invaderXim.item.YAGUDO_FEATHER,    50, invaderXim.craftRank.NOVICE     },
            [8] = { invaderXim.item.GOLD_BEASTCOIN,    10, invaderXim.craftRank.APPRENTICE },
            [9] = { invaderXim.item.CHUNK_OF_GOLD_ORE, 10, invaderXim.craftRank.APPRENTICE },
        },
        [diggingLayer.BURROW] = -- Set: Beastcoins
        {
            [1] = { invaderXim.item.BEASTCOIN,          100, invaderXim.craftRank.AMATEUR    },
            [2] = { invaderXim.item.SILVER_BEASTCOIN,    50, invaderXim.craftRank.RECRUIT    },
            [3] = { invaderXim.item.GOLD_BEASTCOIN,      10, invaderXim.craftRank.INITIATE   },
            [4] = { invaderXim.item.MYTHRIL_BEASTCOIN,    5, invaderXim.craftRank.NOVICE     },
            [5] = { invaderXim.item.PLATINUM_BEASTCOIN,   1, invaderXim.craftRank.APPRENTICE },
        },
        [diggingLayer.BORE] = -- Set: Bones
        {
            [ 1] = { invaderXim.item.BONE_CHIP,                 150, invaderXim.craftRank.AMATEUR    },
            [ 2] = { invaderXim.item.HANDFUL_OF_FISH_SCALES,    150, invaderXim.craftRank.AMATEUR    },
            [ 3] = { invaderXim.item.SEASHELL,                  150, invaderXim.craftRank.RECRUIT    },
            [ 4] = { invaderXim.item.HIGH_QUALITY_PUGIL_SCALES,  50, invaderXim.craftRank.INITIATE   },
            [ 5] = { invaderXim.item.TITANICTUS_SHELL,           50, invaderXim.craftRank.APPRENTICE },
            [ 6] = { invaderXim.item.DEMON_HORN,                 10, invaderXim.craftRank.JOURNEYMAN },
            [ 7] = { invaderXim.item.HANDFUL_OF_WYVERN_SCALES,    5, invaderXim.craftRank.CRAFTSMAN  },
            [ 8] = { invaderXim.item.TURTLE_SHELL,                5, invaderXim.craftRank.CRAFTSMAN  },
            [ 9] = { invaderXim.item.DEMON_SKULL,                 1, invaderXim.craftRank.ARTISAN    },
            [10] = { invaderXim.item.HANDFUL_OF_DRAGON_SCALES,    1, invaderXim.craftRank.ARTISAN    },
        },
    },

    [invaderXim.zone.BUBURIMU_PENINSULA] = -- 118
    {
        [diggingLayer.TREASURE] =
        {
            [1] = { invaderXim.item.PLATE_OF_HEAVY_METAL, 5, invaderXim.craftRank.ADEPT },
            [2] = { invaderXim.item.COIN_OF_BIRTH,        5, invaderXim.craftRank.ADEPT },
            [3] = { invaderXim.item.ORDELLE_BRONZEPIECE,  5, invaderXim.craftRank.ADEPT },
            [4] = { invaderXim.item.ONE_BYNE_BILL,        5, invaderXim.craftRank.ADEPT },
            [5] = { invaderXim.item.TUKUKU_WHITESHELL,    5, invaderXim.craftRank.ADEPT },
        },
        [diggingLayer.REGULAR] =
        {
            [1] = { invaderXim.item.LUGWORM,               100, invaderXim.craftRank.AMATEUR    },
            [2] = { invaderXim.item.SHELL_BUG,             100, invaderXim.craftRank.AMATEUR    },
            [3] = { invaderXim.item.SEASHELL,              100, invaderXim.craftRank.AMATEUR    },
            [4] = { invaderXim.item.SHALL_SHELL,            50, invaderXim.craftRank.RECRUIT    },
            [5] = { invaderXim.item.BIRD_FEATHER,           50, invaderXim.craftRank.RECRUIT    },
            [6] = { invaderXim.item.CHUNK_OF_TIN_ORE,       10, invaderXim.craftRank.INITIATE   },
            [7] = { invaderXim.item.GIANT_FEMUR,            10, invaderXim.craftRank.INITIATE   },
            [8] = { invaderXim.item.CHUNK_OF_PLATINUM_ORE,   5, invaderXim.craftRank.APPRENTICE },
            [9] = { invaderXim.item.CORAL_FRAGMENT,          5, invaderXim.craftRank.CRAFTSMAN  },
        },
        [diggingLayer.BURROW] = -- Set: Feathers
        {
            [1] = { invaderXim.item.CLUMP_OF_RED_MOKO_GRASS, 100, invaderXim.craftRank.AMATEUR   },
            [2] = { invaderXim.item.BLACK_CHOCOBO_FEATHER,    50, invaderXim.craftRank.RECRUIT   },
            [4] = { invaderXim.item.GIANT_BIRD_PLUME,         10, invaderXim.craftRank.INITIATE  },
            [3] = { invaderXim.item.SPIDER_WEB,                5, invaderXim.craftRank.NOVICE    },
            [5] = { invaderXim.item.PHOENIX_FEATHER,           1, invaderXim.craftRank.CRAFTSMAN },
        },
        [diggingLayer.BORE] = -- Set: Bones
        {
            [ 1] = { invaderXim.item.BONE_CHIP,                 150, invaderXim.craftRank.AMATEUR    },
            [ 2] = { invaderXim.item.HANDFUL_OF_FISH_SCALES,    150, invaderXim.craftRank.AMATEUR    },
            [ 3] = { invaderXim.item.SEASHELL,                  150, invaderXim.craftRank.RECRUIT    },
            [ 4] = { invaderXim.item.HIGH_QUALITY_PUGIL_SCALES,  50, invaderXim.craftRank.INITIATE   },
            [ 5] = { invaderXim.item.TITANICTUS_SHELL,           50, invaderXim.craftRank.APPRENTICE },
            [ 6] = { invaderXim.item.DEMON_HORN,                 10, invaderXim.craftRank.JOURNEYMAN },
            [ 7] = { invaderXim.item.HANDFUL_OF_WYVERN_SCALES,    5, invaderXim.craftRank.CRAFTSMAN  },
            [ 8] = { invaderXim.item.TURTLE_SHELL,                5, invaderXim.craftRank.CRAFTSMAN  },
            [ 9] = { invaderXim.item.DEMON_SKULL,                 1, invaderXim.craftRank.ARTISAN    },
            [10] = { invaderXim.item.HANDFUL_OF_DRAGON_SCALES,    1, invaderXim.craftRank.ARTISAN    },
        },
    },

    [invaderXim.zone.MERIPHATAUD_MOUNTAINS] = -- 119
    {
        [diggingLayer.TREASURE] =
        {
            [1] = { invaderXim.item.PLATE_OF_HEAVY_METAL, 5, invaderXim.craftRank.ADEPT },
            [2] = { invaderXim.item.COIN_OF_ADVANCEMENT,  5, invaderXim.craftRank.ADEPT },
        },
        [diggingLayer.REGULAR] =
        {
            [1] = { invaderXim.item.FLINT_STONE,           240, invaderXim.craftRank.AMATEUR    },
            [2] = { invaderXim.item.PEBBLE,                100, invaderXim.craftRank.AMATEUR    },
            [3] = { invaderXim.item.CHUNK_OF_COPPER_ORE,    50, invaderXim.craftRank.RECRUIT    },
            [4] = { invaderXim.item.GIANT_FEMUR,            50, invaderXim.craftRank.RECRUIT    },
            [5] = { invaderXim.item.LIZARD_MOLT,            50, invaderXim.craftRank.INITIATE   },
            [6] = { invaderXim.item.BLACK_CHOCOBO_FEATHER,  10, invaderXim.craftRank.NOVICE     },
            [7] = { invaderXim.item.GOLD_BEASTCOIN,         10, invaderXim.craftRank.APPRENTICE },
            [8] = { invaderXim.item.CHUNK_OF_ADAMAN_ORE,     5, invaderXim.craftRank.JOURNEYMAN },
        },
        [diggingLayer.BURROW] = -- Set: Ores 4
        {
            [1] = { invaderXim.item.CHUNK_OF_SILVER_ORE,       100, invaderXim.craftRank.AMATEUR },
            [2] = { invaderXim.item.CHUNK_OF_IRON_ORE,         100, invaderXim.craftRank.RECRUIT },
            [3] = { invaderXim.item.CHUNK_OF_KOPPARNICKEL_ORE, 100, invaderXim.craftRank.RECRUIT },
            [4] = { invaderXim.item.CHUNK_OF_MYTHRIL_ORE,      100, invaderXim.craftRank.RECRUIT },
            [5] = { invaderXim.item.CHUNK_OF_DARKSTEEL_ORE,     10, invaderXim.craftRank.NOVICE  },
        },
        [diggingLayer.BORE] = -- Set: Ores 1
        {
            [1] = { invaderXim.item.FLINT_STONE,             240, invaderXim.craftRank.AMATEUR    },
            [2] = { invaderXim.item.CHUNK_OF_ALUMINUM_ORE,   100, invaderXim.craftRank.RECRUIT    },
            [3] = { invaderXim.item.CHUNK_OF_GOLD_ORE,        50, invaderXim.craftRank.INITIATE   },
            [4] = { invaderXim.item.CHUNK_OF_DARKSTEEL_ORE,   10, invaderXim.craftRank.NOVICE     },
            [5] = { invaderXim.item.CHUNK_OF_ADAMAN_ORE,       5, invaderXim.craftRank.JOURNEYMAN },
            [6] = { invaderXim.item.CHUNK_OF_PLATINUM_ORE,     5, invaderXim.craftRank.JOURNEYMAN },
            [7] = { invaderXim.item.CHUNK_OF_ORICHALCUM_ORE,   1, invaderXim.craftRank.CRAFTSMAN  },
        },
    },

    [invaderXim.zone.SAUROMUGUE_CHAMPAIGN] = -- 120
    {
        [diggingLayer.TREASURE] =
        {
            [1] = { invaderXim.item.PLATE_OF_HEAVY_METAL, 5, invaderXim.craftRank.ADEPT },
            [2] = { invaderXim.item.COIN_OF_GLORY,        5, invaderXim.craftRank.ADEPT },
        },
        [diggingLayer.REGULAR] =
        {
            [1] = { invaderXim.item.FLINT_STONE,           240, invaderXim.craftRank.AMATEUR    },
            [2] = { invaderXim.item.PEBBLE,                100, invaderXim.craftRank.AMATEUR    },
            [3] = { invaderXim.item.BONE_CHIP,             100, invaderXim.craftRank.AMATEUR    },
            [4] = { invaderXim.item.INSECT_WING,            50, invaderXim.craftRank.RECRUIT    },
            [5] = { invaderXim.item.LIZARD_MOLT,            50, invaderXim.craftRank.RECRUIT    },
            [6] = { invaderXim.item.CHUNK_OF_IRON_ORE,      50, invaderXim.craftRank.INITIATE   },
            [7] = { invaderXim.item.BLACK_CHOCOBO_FEATHER,  10, invaderXim.craftRank.NOVICE     },
            [8] = { invaderXim.item.RED_JAR,                10, invaderXim.craftRank.NOVICE     },
            [9] = { invaderXim.item.GOLD_BEASTCOIN,          5, invaderXim.craftRank.APPRENTICE },
        },
        [diggingLayer.BURROW] = -- Set: Beastcoins
        {
            [1] = { invaderXim.item.BEASTCOIN,          100, invaderXim.craftRank.AMATEUR    },
            [2] = { invaderXim.item.SILVER_BEASTCOIN,    50, invaderXim.craftRank.RECRUIT    },
            [3] = { invaderXim.item.GOLD_BEASTCOIN,      10, invaderXim.craftRank.INITIATE   },
            [4] = { invaderXim.item.MYTHRIL_BEASTCOIN,    5, invaderXim.craftRank.NOVICE     },
            [5] = { invaderXim.item.PLATINUM_BEASTCOIN,   1, invaderXim.craftRank.APPRENTICE },
        },
        [diggingLayer.BORE] = -- Set: Bones
        {
            [ 1] = { invaderXim.item.BONE_CHIP,                 150, invaderXim.craftRank.AMATEUR    },
            [ 2] = { invaderXim.item.HANDFUL_OF_FISH_SCALES,    150, invaderXim.craftRank.AMATEUR    },
            [ 3] = { invaderXim.item.SEASHELL,                  150, invaderXim.craftRank.RECRUIT    },
            [ 4] = { invaderXim.item.HIGH_QUALITY_PUGIL_SCALES,  50, invaderXim.craftRank.INITIATE   },
            [ 5] = { invaderXim.item.TITANICTUS_SHELL,           50, invaderXim.craftRank.APPRENTICE },
            [ 6] = { invaderXim.item.DEMON_HORN,                 10, invaderXim.craftRank.JOURNEYMAN },
            [ 7] = { invaderXim.item.HANDFUL_OF_WYVERN_SCALES,    5, invaderXim.craftRank.CRAFTSMAN  },
            [ 8] = { invaderXim.item.TURTLE_SHELL,                5, invaderXim.craftRank.CRAFTSMAN  },
            [ 9] = { invaderXim.item.DEMON_SKULL,                 1, invaderXim.craftRank.ARTISAN    },
            [10] = { invaderXim.item.HANDFUL_OF_DRAGON_SCALES,    1, invaderXim.craftRank.ARTISAN    },
        },
    },

    [invaderXim.zone.THE_SANCTUARY_OF_ZITAH] = -- 121
    {
        [diggingLayer.TREASURE] =
        {
            [1] = { invaderXim.item.PLATE_OF_HEAVY_METAL, 5, invaderXim.craftRank.ADEPT },
            [2] = { invaderXim.item.COIN_OF_DECAY,        5, invaderXim.craftRank.ADEPT },
        },
        [diggingLayer.REGULAR] =
        {
            [1] = { invaderXim.item.PEBBLE,              100, invaderXim.craftRank.AMATEUR    },
            [2] = { invaderXim.item.CLUMP_OF_MOKO_GRASS, 100, invaderXim.craftRank.AMATEUR    },
            [3] = { invaderXim.item.BONE_CHIP,           100, invaderXim.craftRank.AMATEUR    },
            [4] = { invaderXim.item.ARROWWOOD_LOG,        50, invaderXim.craftRank.RECRUIT    },
            [5] = { invaderXim.item.YEW_LOG,              50, invaderXim.craftRank.RECRUIT    },
            [6] = { invaderXim.item.ELM_LOG,              50, invaderXim.craftRank.INITIATE   },
            [7] = { invaderXim.item.KING_TRUFFLE,          5, invaderXim.craftRank.NOVICE     },
            [8] = { invaderXim.item.PETRIFIED_LOG,         5, invaderXim.craftRank.APPRENTICE },
        },
        [diggingLayer.BURROW] = -- Set: Beastcoins
        {
            [1] = { invaderXim.item.BEASTCOIN,          100, invaderXim.craftRank.AMATEUR    },
            [2] = { invaderXim.item.SILVER_BEASTCOIN,    50, invaderXim.craftRank.RECRUIT    },
            [3] = { invaderXim.item.GOLD_BEASTCOIN,      10, invaderXim.craftRank.INITIATE   },
            [4] = { invaderXim.item.MYTHRIL_BEASTCOIN,    5, invaderXim.craftRank.NOVICE     },
            [5] = { invaderXim.item.PLATINUM_BEASTCOIN,   1, invaderXim.craftRank.APPRENTICE },
        },
        [diggingLayer.BORE] = -- Set: Logs 1
        {
            [1] = { invaderXim.item.ARROWWOOD_LOG,           240, invaderXim.craftRank.AMATEUR    },
            [2] = { invaderXim.item.YEW_LOG,                 150, invaderXim.craftRank.AMATEUR    },
            [3] = { invaderXim.item.ELM_LOG,                 100, invaderXim.craftRank.RECRUIT    },
            [4] = { invaderXim.item.OAK_LOG,                  50, invaderXim.craftRank.INITIATE   },
            [5] = { invaderXim.item.ROSEWOOD_LOG,             10, invaderXim.craftRank.NOVICE     },
            [6] = { invaderXim.item.MAHOGANY_LOG,              5, invaderXim.craftRank.APPRENTICE },
            [7] = { invaderXim.item.EBONY_LOG,                 5, invaderXim.craftRank.JOURNEYMAN },
            [8] = { invaderXim.item.PIECE_OF_ANCIENT_LUMBER,   1, invaderXim.craftRank.CRAFTSMAN  },
            [9] = { invaderXim.item.LACQUER_TREE_LOG,          1, invaderXim.craftRank.ARTISAN    },
        },
    },

    [invaderXim.zone.YUHTUNGA_JUNGLE] = -- 123
    {
        [diggingLayer.TREASURE] =
        {
            [1] = { invaderXim.item.PLATE_OF_HEAVY_METAL, 5, invaderXim.craftRank.ADEPT },
        },
        [diggingLayer.REGULAR] =
        {
            [1] = { invaderXim.item.BONE_CHIP,              100, invaderXim.craftRank.AMATEUR    },
            [2] = { invaderXim.item.DANCESHROOM,            100, invaderXim.craftRank.AMATEUR    },
            [3] = { invaderXim.item.STICK_OF_CINNAMON,       50, invaderXim.craftRank.RECRUIT    },
            [4] = { invaderXim.item.PIECE_OF_RATTAN_LUMBER,  50, invaderXim.craftRank.RECRUIT    },
            [5] = { invaderXim.item.ROSEWOOD_LOG,            50, invaderXim.craftRank.INITIATE   },
            [6] = { invaderXim.item.PUFFBALL,                50, invaderXim.craftRank.INITIATE   },
            [7] = { invaderXim.item.PETRIFIED_LOG,           10, invaderXim.craftRank.NOVICE     },
            [8] = { invaderXim.item.KING_TRUFFLE,            10, invaderXim.craftRank.NOVICE     },
            [9] = { invaderXim.item.EBONY_LOG,                5, invaderXim.craftRank.JOURNEYMAN },
        },
        [diggingLayer.BURROW] = -- Set: Shrooms
        {
            [1] = { invaderXim.item.DEATHBALL,       100, invaderXim.craftRank.AMATEUR    },
            [2] = { invaderXim.item.SLEEPSHROOM,     100, invaderXim.craftRank.AMATEUR    },
            [3] = { invaderXim.item.CORAL_FUNGUS,     50, invaderXim.craftRank.RECRUIT    },
            [4] = { invaderXim.item.WOOZYSHROOM,      10, invaderXim.craftRank.INITIATE   },
            [5] = { invaderXim.item.PUFFBALL,         10, invaderXim.craftRank.NOVICE     },
            [6] = { invaderXim.item.DANCESHROOM,       5, invaderXim.craftRank.APPRENTICE },
            [7] = { invaderXim.item.REISHI_MUSHROOM,   1, invaderXim.craftRank.JOURNEYMAN },
            [8] = { invaderXim.item.KING_TRUFFLE,      1, invaderXim.craftRank.CRAFTSMAN  },
        },
        [diggingLayer.BORE] = -- Set: Logs 1
        {
            [1] = { invaderXim.item.ARROWWOOD_LOG,           240, invaderXim.craftRank.AMATEUR    },
            [2] = { invaderXim.item.YEW_LOG,                 150, invaderXim.craftRank.AMATEUR    },
            [3] = { invaderXim.item.ELM_LOG,                 100, invaderXim.craftRank.RECRUIT    },
            [4] = { invaderXim.item.OAK_LOG,                  50, invaderXim.craftRank.INITIATE   },
            [5] = { invaderXim.item.ROSEWOOD_LOG,             10, invaderXim.craftRank.NOVICE     },
            [6] = { invaderXim.item.MAHOGANY_LOG,              5, invaderXim.craftRank.APPRENTICE },
            [7] = { invaderXim.item.EBONY_LOG,                 5, invaderXim.craftRank.JOURNEYMAN },
            [8] = { invaderXim.item.PIECE_OF_ANCIENT_LUMBER,   1, invaderXim.craftRank.CRAFTSMAN  },
            [9] = { invaderXim.item.LACQUER_TREE_LOG,          1, invaderXim.craftRank.ARTISAN    },
        },
    },

    [invaderXim.zone.YHOATOR_JUNGLE] = -- 124
    {
        [diggingLayer.TREASURE] =
        {
            [1] = { invaderXim.item.PLATE_OF_HEAVY_METAL, 5, invaderXim.craftRank.ADEPT },
        },
        [diggingLayer.REGULAR] =
        {
            [1] = { invaderXim.item.BONE_CHIP,        100, invaderXim.craftRank.AMATEUR    },
            [2] = { invaderXim.item.KAZHAM_PINEAPPLE,  50, invaderXim.craftRank.AMATEUR    },
            [3] = { invaderXim.item.LAUAN_LOG,         50, invaderXim.craftRank.AMATEUR    },
            [4] = { invaderXim.item.MAHOGANY_LOG,      50, invaderXim.craftRank.RECRUIT    },
            [5] = { invaderXim.item.DRYAD_ROOT,        50, invaderXim.craftRank.RECRUIT    },
            [6] = { invaderXim.item.REISHI_MUSHROOM,   10, invaderXim.craftRank.RECRUIT    },
            [7] = { invaderXim.item.CORAL_FUNGUS,      10, invaderXim.craftRank.NOVICE     },
            [8] = { invaderXim.item.EBONY_LOG,          5, invaderXim.craftRank.JOURNEYMAN },
        },
        [diggingLayer.BURROW] = -- Set: Shrooms
        {
            [1] = { invaderXim.item.DEATHBALL,       100, invaderXim.craftRank.AMATEUR    },
            [2] = { invaderXim.item.SLEEPSHROOM,     100, invaderXim.craftRank.AMATEUR    },
            [3] = { invaderXim.item.CORAL_FUNGUS,     50, invaderXim.craftRank.RECRUIT    },
            [4] = { invaderXim.item.WOOZYSHROOM,      10, invaderXim.craftRank.INITIATE   },
            [5] = { invaderXim.item.PUFFBALL,         10, invaderXim.craftRank.NOVICE     },
            [6] = { invaderXim.item.DANCESHROOM,       5, invaderXim.craftRank.APPRENTICE },
            [7] = { invaderXim.item.REISHI_MUSHROOM,   1, invaderXim.craftRank.JOURNEYMAN },
            [8] = { invaderXim.item.KING_TRUFFLE,      1, invaderXim.craftRank.CRAFTSMAN  },
        },
        [diggingLayer.BORE] = -- Set: Logs 1
        {
            [1] = { invaderXim.item.ARROWWOOD_LOG,           240, invaderXim.craftRank.AMATEUR    },
            [2] = { invaderXim.item.YEW_LOG,                 150, invaderXim.craftRank.AMATEUR    },
            [3] = { invaderXim.item.ELM_LOG,                 100, invaderXim.craftRank.RECRUIT    },
            [4] = { invaderXim.item.OAK_LOG,                  50, invaderXim.craftRank.INITIATE   },
            [5] = { invaderXim.item.ROSEWOOD_LOG,             10, invaderXim.craftRank.NOVICE     },
            [6] = { invaderXim.item.MAHOGANY_LOG,              5, invaderXim.craftRank.APPRENTICE },
            [7] = { invaderXim.item.EBONY_LOG,                 5, invaderXim.craftRank.JOURNEYMAN },
            [8] = { invaderXim.item.PIECE_OF_ANCIENT_LUMBER,   1, invaderXim.craftRank.CRAFTSMAN  },
            [9] = { invaderXim.item.LACQUER_TREE_LOG,          1, invaderXim.craftRank.ARTISAN    },
        },
    },

    [invaderXim.zone.WESTERN_ALTEPA_DESERT] = -- 125
    {
        [diggingLayer.TREASURE] =
        {
            [1] = { invaderXim.item.PLATE_OF_HEAVY_METAL, 5, invaderXim.craftRank.ADEPT },
        },
        [diggingLayer.REGULAR] =
        {
            [1] = { invaderXim.item.BONE_CHIP,              240, invaderXim.craftRank.AMATEUR    },
            [2] = { invaderXim.item.PEBBLE,                 150, invaderXim.craftRank.AMATEUR    },
            [3] = { invaderXim.item.CHUNK_OF_ZINC_ORE,      100, invaderXim.craftRank.RECRUIT    },
            [4] = { invaderXim.item.GIANT_FEMUR,            100, invaderXim.craftRank.RECRUIT    },
            [5] = { invaderXim.item.CHUNK_OF_IRON_ORE,       50, invaderXim.craftRank.INITIATE   },
            [6] = { invaderXim.item.CHUNK_OF_DARKSTEEL_ORE,  10, invaderXim.craftRank.NOVICE     },
            [7] = { invaderXim.item.CHUNK_OF_GOLD_ORE,       10, invaderXim.craftRank.NOVICE     },
            [8] = { invaderXim.item.CORAL_FRAGMENT,           5, invaderXim.craftRank.APPRENTICE },
            [9] = { invaderXim.item.PHILOSOPHERS_STONE,       5, invaderXim.craftRank.APPRENTICE },
        },
        [diggingLayer.BURROW] = -- Set: Feathers
        {
            [1] = { invaderXim.item.CLUMP_OF_RED_MOKO_GRASS, 100, invaderXim.craftRank.AMATEUR   },
            [2] = { invaderXim.item.BLACK_CHOCOBO_FEATHER,    50, invaderXim.craftRank.RECRUIT   },
            [4] = { invaderXim.item.GIANT_BIRD_PLUME,         10, invaderXim.craftRank.INITIATE  },
            [3] = { invaderXim.item.SPIDER_WEB,                5, invaderXim.craftRank.NOVICE    },
            [5] = { invaderXim.item.PHOENIX_FEATHER,           1, invaderXim.craftRank.CRAFTSMAN },
        },
        [diggingLayer.BORE] = -- Set: Bones
        {
            [ 1] = { invaderXim.item.BONE_CHIP,                 150, invaderXim.craftRank.AMATEUR    },
            [ 2] = { invaderXim.item.HANDFUL_OF_FISH_SCALES,    150, invaderXim.craftRank.AMATEUR    },
            [ 3] = { invaderXim.item.SEASHELL,                  150, invaderXim.craftRank.RECRUIT    },
            [ 4] = { invaderXim.item.HIGH_QUALITY_PUGIL_SCALES,  50, invaderXim.craftRank.INITIATE   },
            [ 5] = { invaderXim.item.TITANICTUS_SHELL,           50, invaderXim.craftRank.APPRENTICE },
            [ 6] = { invaderXim.item.DEMON_HORN,                 10, invaderXim.craftRank.JOURNEYMAN },
            [ 7] = { invaderXim.item.HANDFUL_OF_WYVERN_SCALES,    5, invaderXim.craftRank.CRAFTSMAN  },
            [ 8] = { invaderXim.item.TURTLE_SHELL,                5, invaderXim.craftRank.CRAFTSMAN  },
            [ 9] = { invaderXim.item.DEMON_SKULL,                 1, invaderXim.craftRank.ARTISAN    },
            [10] = { invaderXim.item.HANDFUL_OF_DRAGON_SCALES,    1, invaderXim.craftRank.ARTISAN    },
        },
    },

    [invaderXim.zone.QUFIM_ISLAND] = -- 126
    {
        [diggingLayer.TREASURE] =
        {
            -- No entries.
        },
        [diggingLayer.REGULAR] =
        {
            -- No entries.
        },
        [diggingLayer.BURROW] = -- Set: Beastcoins
        {
            [1] = { invaderXim.item.BEASTCOIN,          100, invaderXim.craftRank.AMATEUR    },
            [2] = { invaderXim.item.SILVER_BEASTCOIN,    50, invaderXim.craftRank.RECRUIT    },
            [3] = { invaderXim.item.GOLD_BEASTCOIN,      10, invaderXim.craftRank.INITIATE   },
            [4] = { invaderXim.item.MYTHRIL_BEASTCOIN,    5, invaderXim.craftRank.NOVICE     },
            [5] = { invaderXim.item.PLATINUM_BEASTCOIN,   1, invaderXim.craftRank.APPRENTICE },
        },
        [diggingLayer.BORE] = -- Set: Crystals
        {
            [1] = { invaderXim.item.FIRE_CRYSTAL,      50, invaderXim.craftRank.AMATEUR },
            [2] = { invaderXim.item.ICE_CRYSTAL,       50, invaderXim.craftRank.AMATEUR },
            [3] = { invaderXim.item.WIND_CRYSTAL,      50, invaderXim.craftRank.AMATEUR },
            [4] = { invaderXim.item.EARTH_CRYSTAL,     50, invaderXim.craftRank.AMATEUR },
            [5] = { invaderXim.item.LIGHTNING_CRYSTAL, 50, invaderXim.craftRank.AMATEUR },
            [6] = { invaderXim.item.WATER_CRYSTAL,     50, invaderXim.craftRank.AMATEUR },
            [7] = { invaderXim.item.LIGHT_CRYSTAL,     50, invaderXim.craftRank.AMATEUR },
            [8] = { invaderXim.item.DARK_CRYSTAL,      50, invaderXim.craftRank.AMATEUR },
        },
    },

    [invaderXim.zone.BEHEMOTHS_DOMINION] = -- 127
    {
        [diggingLayer.TREASURE] =
        {
            -- No entries.
        },
        [diggingLayer.REGULAR] =
        {
            -- No entries.
        },
        [diggingLayer.BURROW] = -- Set: Yellow Ginseng seeds
        {
            [1] = { invaderXim.item.PIECE_OF_YELLOW_GINSENG, 150, invaderXim.craftRank.AMATEUR  },
            [2] = { invaderXim.item.BAG_OF_WILDGRASS_SEEDS,   50, invaderXim.craftRank.RECRUIT  },
            [3] = { invaderXim.item.BAG_OF_TREE_CUTTINGS,     10, invaderXim.craftRank.INITIATE },
            [4] = { invaderXim.item.BAG_OF_CACTUS_STEMS,       5, invaderXim.craftRank.NOVICE   },
        },
        [diggingLayer.BORE] = -- Set: Ores 1
        {
            [1] = { invaderXim.item.FLINT_STONE,             240, invaderXim.craftRank.AMATEUR    },
            [2] = { invaderXim.item.CHUNK_OF_ALUMINUM_ORE,   100, invaderXim.craftRank.RECRUIT    },
            [3] = { invaderXim.item.CHUNK_OF_GOLD_ORE,        50, invaderXim.craftRank.INITIATE   },
            [4] = { invaderXim.item.CHUNK_OF_DARKSTEEL_ORE,   10, invaderXim.craftRank.NOVICE     },
            [5] = { invaderXim.item.CHUNK_OF_ADAMAN_ORE,       5, invaderXim.craftRank.JOURNEYMAN },
            [6] = { invaderXim.item.CHUNK_OF_PLATINUM_ORE,     5, invaderXim.craftRank.JOURNEYMAN },
            [7] = { invaderXim.item.CHUNK_OF_ORICHALCUM_ORE,   1, invaderXim.craftRank.CRAFTSMAN  },
        },
    },

    [invaderXim.zone.VALLEY_OF_SORROWS] = -- 128
    {
        [diggingLayer.TREASURE] =
        {
            -- No entries.
        },
        [diggingLayer.REGULAR] =
        {
            -- No entries.
        },
        [diggingLayer.BURROW] = -- Set: Feathers
        {
            [1] = { invaderXim.item.CLUMP_OF_RED_MOKO_GRASS, 100, invaderXim.craftRank.AMATEUR   },
            [2] = { invaderXim.item.BLACK_CHOCOBO_FEATHER,    50, invaderXim.craftRank.RECRUIT   },
            [4] = { invaderXim.item.GIANT_BIRD_PLUME,         10, invaderXim.craftRank.INITIATE  },
            [3] = { invaderXim.item.SPIDER_WEB,                5, invaderXim.craftRank.NOVICE    },
            [5] = { invaderXim.item.PHOENIX_FEATHER,           1, invaderXim.craftRank.CRAFTSMAN },
        },
        [diggingLayer.BORE] =
        {
            -- No entries.
        },
    },

    [invaderXim.zone.BEAUCEDINE_GLACIER_S] = -- 136
    {
        [diggingLayer.TREASURE] =
        {
            -- No entries.
        },
        [diggingLayer.REGULAR] =
        {
            -- No entries.
        },
        [diggingLayer.BURROW] = -- Set Ores 3
        {
            [1] = { invaderXim.item.FLINT_STONE,               240, invaderXim.craftRank.AMATEUR },
            [2] = { invaderXim.item.CHUNK_OF_SILVER_ORE,       100, invaderXim.craftRank.AMATEUR },
            [3] = { invaderXim.item.CHUNK_OF_IRON_ORE,         100, invaderXim.craftRank.RECRUIT },
            [4] = { invaderXim.item.SHARD_OF_OBSIDIAN,         100, invaderXim.craftRank.RECRUIT },
            [5] = { invaderXim.item.CHUNK_OF_KOPPARNICKEL_ORE, 100, invaderXim.craftRank.RECRUIT },
            [6] = { invaderXim.item.CHUNK_OF_MYTHRIL_ORE,      100, invaderXim.craftRank.RECRUIT },
            [7] = { invaderXim.item.CHUNK_OF_DARKSTEEL_ORE,     10, invaderXim.craftRank.NOVICE  },
            [8] = { invaderXim.item.CHUNK_OF_SWAMP_ORE,         10, invaderXim.craftRank.NOVICE  },
        },
        [diggingLayer.BORE] = -- Set: Crystals
        {
            [1] = { invaderXim.item.FIRE_CRYSTAL,      50, invaderXim.craftRank.AMATEUR },
            [2] = { invaderXim.item.ICE_CRYSTAL,       50, invaderXim.craftRank.AMATEUR },
            [3] = { invaderXim.item.WIND_CRYSTAL,      50, invaderXim.craftRank.AMATEUR },
            [4] = { invaderXim.item.EARTH_CRYSTAL,     50, invaderXim.craftRank.AMATEUR },
            [5] = { invaderXim.item.LIGHTNING_CRYSTAL, 50, invaderXim.craftRank.AMATEUR },
            [6] = { invaderXim.item.WATER_CRYSTAL,     50, invaderXim.craftRank.AMATEUR },
            [7] = { invaderXim.item.LIGHT_CRYSTAL,     50, invaderXim.craftRank.AMATEUR },
            [8] = { invaderXim.item.DARK_CRYSTAL,      50, invaderXim.craftRank.AMATEUR },
        },
    },

    [invaderXim.zone.XARCABARD_S] = -- 137
    {
        [diggingLayer.TREASURE] =
        {
            -- No entries.
        },
        [diggingLayer.REGULAR] =
        {
            -- No entries.
        },
        [diggingLayer.BURROW] = -- Set: Beastcoins
        {
            [1] = { invaderXim.item.BEASTCOIN,          100, invaderXim.craftRank.AMATEUR    },
            [2] = { invaderXim.item.SILVER_BEASTCOIN,    50, invaderXim.craftRank.RECRUIT    },
            [3] = { invaderXim.item.GOLD_BEASTCOIN,      10, invaderXim.craftRank.INITIATE   },
            [4] = { invaderXim.item.MYTHRIL_BEASTCOIN,    5, invaderXim.craftRank.NOVICE     },
            [5] = { invaderXim.item.PLATINUM_BEASTCOIN,   1, invaderXim.craftRank.APPRENTICE },
        },
        [diggingLayer.BORE] = -- Set: Logs 4
        {
            [1] = { invaderXim.item.ARROWWOOD_LOG,           240, invaderXim.craftRank.AMATEUR   },
            [2] = { invaderXim.item.YEW_LOG,                 150, invaderXim.craftRank.AMATEUR   },
            [3] = { invaderXim.item.ELM_LOG,                 100, invaderXim.craftRank.RECRUIT   },
            [4] = { invaderXim.item.FEYWEALD_LOG,             50, invaderXim.craftRank.INITIATE  },
            [5] = { invaderXim.item.OAK_LOG,                  50, invaderXim.craftRank.INITIATE  },
            [6] = { invaderXim.item.TEAK_LOG,                  1, invaderXim.craftRank.CRAFTSMAN },
            [7] = { invaderXim.item.PIECE_OF_ANCIENT_LUMBER,   1, invaderXim.craftRank.CRAFTSMAN },
            [8] = { invaderXim.item.JACARANDA_LOG,             1, invaderXim.craftRank.ARTISAN   },
            [9] = { invaderXim.item.LACQUER_TREE_LOG,          1, invaderXim.craftRank.ARTISAN   },
        },
    },

    [invaderXim.zone.YAHSE_HUNTING_GROUNDS] = -- 260
    {
        [diggingLayer.TREASURE] =
        {
            -- No entries.
        },
        [diggingLayer.REGULAR] =
        {
            -- No entries.
        },
        [diggingLayer.BURROW] =
        {
            -- No entries.
        },
        [diggingLayer.BORE] =
        {
            -- No entries.
        },
    },

    [invaderXim.zone.CEIZAK_BATTLEGROUNDS] = -- 261
    {
        [diggingLayer.TREASURE] =
        {
            -- No entries.
        },
        [diggingLayer.REGULAR] =
        {
            -- No entries.
        },
        [diggingLayer.BURROW] =
        {
            -- No entries.
        },
        [diggingLayer.BORE] =
        {
            -- No entries.
        },
    },

    [invaderXim.zone.FORET_DE_HENNETIEL] = -- 262
    {
        [diggingLayer.TREASURE] =
        {
            -- No entries.
        },
        [diggingLayer.REGULAR] =
        {
            -- No entries.
        },
        [diggingLayer.BURROW] = -- Set: Shrooms
        {
            [1] = { invaderXim.item.DEATHBALL,       100, invaderXim.craftRank.AMATEUR    },
            [2] = { invaderXim.item.SLEEPSHROOM,     100, invaderXim.craftRank.AMATEUR    },
            [3] = { invaderXim.item.CORAL_FUNGUS,     50, invaderXim.craftRank.RECRUIT    },
            [4] = { invaderXim.item.WOOZYSHROOM,      10, invaderXim.craftRank.INITIATE   },
            [5] = { invaderXim.item.PUFFBALL,         10, invaderXim.craftRank.NOVICE     },
            [6] = { invaderXim.item.DANCESHROOM,       5, invaderXim.craftRank.APPRENTICE },
            [7] = { invaderXim.item.REISHI_MUSHROOM,   1, invaderXim.craftRank.JOURNEYMAN },
            [8] = { invaderXim.item.KING_TRUFFLE,      1, invaderXim.craftRank.CRAFTSMAN  },
        },
        [diggingLayer.BORE] = -- Set: Ores 1
        {
            [1] = { invaderXim.item.FLINT_STONE,            240, invaderXim.craftRank.AMATEUR    },
            [2] = { invaderXim.item.CHUNK_OF_ALUMINUM_ORE,  100, invaderXim.craftRank.RECRUIT    },
            [3] = { invaderXim.item.CHUNK_OF_GOLD_ORE,       50, invaderXim.craftRank.INITIATE   },
            [4] = { invaderXim.item.CHUNK_OF_DARKSTEEL_ORE,  10, invaderXim.craftRank.NOVICE     },
            [5] = { invaderXim.item.CHUNK_OF_ADAMAN_ORE,      5, invaderXim.craftRank.JOURNEYMAN },
            [6] = { invaderXim.item.CHUNK_OF_PLATINUM_ORE,    5, invaderXim.craftRank.JOURNEYMAN },
            [7] = { invaderXim.item.CHUNK_OF_ORICHALCUM_ORE,  1, invaderXim.craftRank.CRAFTSMAN  },
        },
    },

    [invaderXim.zone.YORCIA_WEALD] = -- 263
    {
        [diggingLayer.TREASURE] =
        {
            -- No entries.
        },
        [diggingLayer.REGULAR] =
        {
            -- No entries.
        },
        [diggingLayer.BURROW] =
        {
            -- No entries.
        },
        [diggingLayer.BORE] = -- Set: Yellow Ginseng seeds
        {
            [1] = { invaderXim.item.PIECE_OF_YELLOW_GINSENG, 150, invaderXim.craftRank.AMATEUR  },
            [2] = { invaderXim.item.BAG_OF_WILDGRASS_SEEDS,   50, invaderXim.craftRank.RECRUIT  },
            [3] = { invaderXim.item.BAG_OF_TREE_CUTTINGS,     10, invaderXim.craftRank.INITIATE },
            [4] = { invaderXim.item.BAG_OF_CACTUS_STEMS,       5, invaderXim.craftRank.NOVICE   },
        },
    },

    [invaderXim.zone.MORIMAR_BASALT_FIELDS] = -- 265
    {
        [diggingLayer.TREASURE] =
        {
            -- No entries.
        },
        [diggingLayer.REGULAR] =
        {
            -- No entries.
        },
        [diggingLayer.BURROW] = -- Set: Yellow Ginseng seeds
        {
            [1] = { invaderXim.item.PIECE_OF_YELLOW_GINSENG, 150, invaderXim.craftRank.AMATEUR  },
            [2] = { invaderXim.item.BAG_OF_WILDGRASS_SEEDS,   50, invaderXim.craftRank.RECRUIT  },
            [3] = { invaderXim.item.BAG_OF_TREE_CUTTINGS,     10, invaderXim.craftRank.INITIATE },
            [4] = { invaderXim.item.BAG_OF_CACTUS_STEMS,       5, invaderXim.craftRank.NOVICE   },
        },
        [diggingLayer.BORE] =
        {
            -- No entries.
        },
    },

    [invaderXim.zone.MARJAMI_RAVINE] = -- 266
    {
        [diggingLayer.TREASURE] =
        {
            -- No entries.
        },
        [diggingLayer.REGULAR] =
        {
            -- No entries.
        },
        [diggingLayer.BURROW] =
        {
            -- No entries.
        },
        [diggingLayer.BORE] =
        {
            -- No entries.
        },
    },

    [invaderXim.zone.KAMIHR_DRIFTS] = -- 267
    {
        [diggingLayer.TREASURE] =
        {
            -- No entries.
        },
        [diggingLayer.REGULAR] =
        {
            -- No entries.
        },
        [diggingLayer.BURROW] = -- Set: Logs 1
        {
            [1] = { invaderXim.item.ARROWWOOD_LOG,           240, invaderXim.craftRank.AMATEUR    },
            [2] = { invaderXim.item.YEW_LOG,                 150, invaderXim.craftRank.AMATEUR    },
            [3] = { invaderXim.item.ELM_LOG,                 100, invaderXim.craftRank.RECRUIT    },
            [4] = { invaderXim.item.OAK_LOG,                  50, invaderXim.craftRank.INITIATE   },
            [5] = { invaderXim.item.ROSEWOOD_LOG,             10, invaderXim.craftRank.NOVICE     },
            [6] = { invaderXim.item.MAHOGANY_LOG,              5, invaderXim.craftRank.APPRENTICE },
            [7] = { invaderXim.item.EBONY_LOG,                 5, invaderXim.craftRank.JOURNEYMAN },
            [8] = { invaderXim.item.PIECE_OF_ANCIENT_LUMBER,   1, invaderXim.craftRank.CRAFTSMAN  },
            [9] = { invaderXim.item.LACQUER_TREE_LOG,          1, invaderXim.craftRank.ARTISAN    },
        },
        [diggingLayer.BORE] =
        {
            -- No entries.
        },
    },
}

-- This function handles zone and cooldown checks before digging can be attempted, before any animation is sent.
local function checkDiggingCooldowns(player)
    -- Check if current zone has digging enabled.
    local isAllowedZone = diggingZoneList[player:getZoneID()] or false

    if not isAllowedZone then
        player:messageBasic(invaderXim.msg.basic.WAIT_LONGER, 0, 0)

        return false
    end

    -- Check digging cooldowns.
    local currentTime  = os.time()
    local skillRank    = player:getSkillRank(invaderXim.skill.DIG)
    local zoneCooldown = player:getLocalVar('ZoneInTime') + utils.clamp(60 - skillRank * 5, 10, 60)
    local digCooldown  = player:getLocalVar('[DIG]LastDigTime') + utils.clamp(15 - skillRank * 5, 3, 16)

    if
        currentTime < zoneCooldown or
        currentTime < digCooldown
    then
        player:messageBasic(invaderXim.msg.basic.WAIT_LONGER, 0, 0)

        return false
    end

    return true
end

local function calculateSkillUp(player)
    local skillRank = player:getSkillRank(invaderXim.skill.DIG)
    local maxSkill  = utils.clamp((skillRank + 1) * 100, 0, 1000)
    local realSkill = player:getCharSkillLevel(invaderXim.skill.DIG)
    local increment = 1

    -- this probably needs correcting
    local roll = math.random(1, 100)

    -- make sure our skill isn't capped
    if realSkill < maxSkill then
        -- can we skill up?
        if roll <= 15 then
            if (increment + realSkill) > maxSkill then
                increment = maxSkill - realSkill
            end

            -- skill up!
            player:setSkillLevel(invaderXim.skill.DIG, realSkill + increment)

            -- update the skill rank
            -- Digging does not have test items, so increment rank once player hits 10.0, 20.0, .. 100.0
            if (realSkill + increment) >= (skillRank * 100) + 100 then
                player:setSkillRank(invaderXim.skill.DIG, skillRank + 1)
            end
        end
    end
end

local function  handleDiggingLayer(player, zoneId, currentLayer)
    local digTable = invaderXim.chocoboDig.digInfo[zoneId][currentLayer]

    -- Early return.
    if
        not digTable or
        #digTable <= 0
    then
        return 0
    end

    local dTableItemIds  = {}
    local rewardItem     = 0

    -- Determine moon multiplier.
    local moon           = VanadielMoonPhase()
    local rollMultiplier = 1.5 - math.abs(moon - 50) / 50 -- The lower the multiplier, the better for the player.
    -- Moon phase 0 and 100 -> multiplier = 0.5
    -- Moon phase 50        -> multiplier = 1.5
    -- Moon phase 25 and 75 -> multiplier = 1

    -- Add valid items to dynamic table
    local playerRank = player:getSkillRank(invaderXim.skill.DIG)
    local randomRoll = 1000
    local digRate    = 0

    for i = 1, #digTable do
        randomRoll = utils.clamp(math.floor(math.random(1, 1000) * rollMultiplier), 1, 1000)
        digRate    = digTable[i][2]

        -- Denim Pants +1 and Black Chocobo Suit
        if player:getMod(invaderXim.mod.DIG_RARE_ABILITY) > 0 then
            if digRate >= 100 then
                digRate = math.floor(digRate / 2)
            else
                digRate = digRate * 2
            end
        end

        if
            randomRoll <= digRate and    -- Roll check
            playerRank >= digTable[i][3] -- Rank check
        then
            table.insert(dTableItemIds, #dTableItemIds + 1, digTable[i][1]) -- Insert item ID to table.
        end
    end

    -- Add weather crystals and ores to regular layer only.
    if currentLayer == diggingLayer.REGULAR then
        local weather            = player:getWeather()
        local currentDay         = VanadielDayOfTheWeek()
        local isElementalOreZone = elementalOreZoneTable[player:getZoneID()] or false

        -- Crystals and Clusters.
        randomRoll = utils.clamp(math.floor(math.random(1, 1000) * rollMultiplier), 1, 1000)
        if
            diggingWeatherTable[weather] and
            randomRoll <= 100
        then
            table.insert(dTableItemIds, #dTableItemIds + 1, diggingWeatherTable[weather][1]) -- Insert item ID to table.
        end

        -- Geodes / Colored Rocks.
        randomRoll = utils.clamp(math.floor(math.random(1, 1000) * rollMultiplier), 1, 1000)
        if
            playerRank >= invaderXim.craftRank.NOVICE and
            randomRoll <= 50
        then
            table.insert(dTableItemIds, #dTableItemIds + 1, diggingDayTable[currentDay][1]) -- Insert item ID to table.
        end

        -- Elemenal Ores.
        randomRoll = utils.clamp(math.floor(math.random(1, 1000) * rollMultiplier), 1, 1000)
        if
            isElementalOreZone and                                              -- Zone can drop ore.
            playerRank >= invaderXim.craftRank.CRAFTSMAN and                            -- Digging level must be 60+
            invaderXim.combat.element.getWeatherElement(weather) ~= invaderXim.element.NONE and -- Weather must be elemental.
            moon >= 7 and moon <= 21 and                                        -- Moon must be between those values.
            randomRoll <= 100
        then
            table.insert(dTableItemIds, #dTableItemIds + 1, diggingDayTable[currentDay][2]) -- Insert item ID to table.
        end
    end

    -- Choose a random entry from the valid item table.
    if #dTableItemIds > 0 then
        local chosenItem = math.random(1, #dTableItemIds)

        rewardItem = dTableItemIds[chosenItem]
    end

    return rewardItem
end

local function handleItemObtained(player, text, itemId)
    if itemId > 0 then
        -- Make sure we have enough room for the item.
        if player:addItem(itemId) then
            player:messageSpecial(text.ITEM_OBTAINED, itemId)
        else
            player:messageSpecial(text.DIG_THROW_AWAY, itemId)
        end
    end
end

local function handleFatigue(player, text, todayDigCount)
    if math.random(1, 100) <= player:getMod(invaderXim.mod.DIG_BYPASS_FATIGUE) then
        player:messageSpecial(text.FOUND_ITEM_WITH_EASE)
    else
        player:setVar('[DIG]DigCount', todayDigCount + 1, NextJstDay())
    end
end

invaderXim.chocoboDig.start = function(player)
    local zoneId        = player:getZoneID()
    local text          = zones[zoneId].text
    local todayDigCount = player:getCharVar('[DIG]DigCount')
    local currentX      = player:getXPos()
    local currentZ      = player:getZPos()
    local currentXSign  = 0
    local currentZSign  = 0

    if currentX < 0 then
        currentXSign = 2
    end

    if currentZ < 0 then
        currentZSign = 2
    end

    -----------------------------------
    -- Early returns and exceptions
    -----------------------------------

    -- Handle valid zones and digging cooldowns.
    if not checkDiggingCooldowns(player) then
        return false -- This means we do not send a digging animation.
    end

    -- Handle AMK mission 7 (index 6) exception.
    if
        invaderXim.settings.main.ENABLE_AMK == 1 and
        player:getCurrentMission(invaderXim.mission.log_id.AMK) == invaderXim.mission.id.amk.SHOCK_ARRANT_ABUSE_OF_AUTHORITY and
        invaderXim.amk.helpers.chocoboDig(player, zoneId, text)
    then
        -- Note: The helper function handles the messages.
        player:setLocalVar('[DIG]LastDigTime', os.time())

        return true
    end

    -- Handle auto-fail from fatigue.
    if
        invaderXim.settings.main.DIG_FATIGUE > 0 and
        invaderXim.settings.main.DIG_FATIGUE <= todayDigCount
    then
        player:messageText(player, text.FIND_NOTHING)
        player:setLocalVar('[DIG]LastDigTime', os.time())

        return true
    end

    -- Handle auto-fail from position.
    local lastX = player:getLocalVar('[DIG]LastXPos') * (1 - player:getLocalVar('[DIG]LastXPosSign'))
    local lastZ = player:getLocalVar('[DIG]LastZPos') * (1 - player:getLocalVar('[DIG]LastZPosSign'))

    if
        currentX >= lastX - 5 and currentX <= lastX + 5 and -- Check current X axis to see if you are too close to your last X.
        currentZ >= lastZ - 5 and currentZ <= lastZ + 5     -- Check current Z axis to see if you are too close to your last Z.
    then
        player:messageText(player, text.FIND_NOTHING)
        player:setLocalVar('[DIG]LastDigTime', os.time())

        return true
    end

    -----------------------------------
    -- Perform digging
    -----------------------------------

    -- Set player variables, no matter the result.
    player:setLocalVar('[DIG]LastXPos', currentX)
    player:setLocalVar('[DIG]LastZPos', currentZ)
    player:setLocalVar('[DIG]LastXPosSign', currentXSign)
    player:setLocalVar('[DIG]LastZPosSign', currentZSign)
    player:setLocalVar('[DIG]LastDigTime', os.time())

    -- Handle trasure layer. Incompatible with the other 3 layers. "Early" return.
    local trasureItemId = handleDiggingLayer(player, zoneId, diggingLayer.TREASURE)

    if trasureItemId > 0 then
        handleItemObtained(player, text, trasureItemId)
        handleFatigue(player, text, todayDigCount)
        calculateSkillUp(player)
        player:triggerRoeEvent(invaderXim.roeTrigger.CHOCOBO_DIG_SUCCESS)

        return true
    end

    -- Handle regional currency here. Incompatible with the other 3 layers. "Early" return.
    -- TODO: Implement logic and message to zones.

    -- Handle regular layer. This also contains, elemental ores, weather crystals and day-element geodes.
    local regularItemId = handleDiggingLayer(player, zoneId, diggingLayer.REGULAR)

    handleItemObtained(player, text, regularItemId)

    -- Handle Burrow layer. Requires Burrow skill.
    local burrowItemId = 0

    if invaderXim.settings.main.DIG_GRANT_BURROW > 0 then -- TODO: Implement Chocobo Raising and Burrow chocobo skill. Good luck
        burrowItemId = handleDiggingLayer(player, zoneId, diggingLayer.BURROW)

        handleItemObtained(player, text, burrowItemId)
    end

    -- Handle Bore layer. Requires Bore skill.
    local boreItemId = 0

    if invaderXim.settings.main.DIG_GRANT_BORE > 0 then -- TODO: Implement Chocobo Raising and Bore chocobo skill. Good luck
        boreItemId = handleDiggingLayer(player, zoneId, diggingLayer.BORE)

        handleItemObtained(player, text, boreItemId)
    end

    -- Handle skill-up
    calculateSkillUp(player)

    -- Handle no item OR record of eminence.
    if
        regularItemId == 0 and
        burrowItemId == 0 and
        boreItemId == 0
    then
        player:messageText(player, text.FIND_NOTHING)
    else
        handleFatigue(player, text, todayDigCount)
        player:triggerRoeEvent(invaderXim.roeTrigger.CHOCOBO_DIG_SUCCESS)
    end

    -- Dig ended. Send digging animation to players.
    return true
end
