-----------------------------------
-- Appraisal Utilities
-- desc: Common functionality for Appraisals
-----------------------------------
require('scripts/globals/assault')
require('scripts/globals/npc_util')
-----------------------------------
xi = xi or {}
invaderXim.appraisal = invaderXim.appraisal or {}
-----------------------------------

invaderXim.appraisal.origin =
{
    NYZUL_BASIC                 = 100,
    NYZUL_BAT_EYE               = 101,
    NYZUL_SHADOW_EYE            = 102,
    NYZUL_BOMB_KING             = 103,
    NYZUL_JUGGLER_HECATOMB      = 104,
    NYZUL_SMOTHERING_SCHMIDT    = 105,
    NYZUL_HELLION               = 106,
    NYZUL_LEAPING_LIZZY         = 107,
    NYZUL_TOM_TIT_TAT           = 108,
    NYZUL_JAGGEDY_EARED_JACK    = 109,
    NYZUL_CACTUAR_CANTAUTOR     = 110,
    NYZUL_GARGANTUA             = 111,
    NYZUL_GYRE_CARLIN           = 112,
    NYZUL_ASPHYXIATED_AMSEL     = 113,
    NYZUL_FROSTMANE             = 114,
    NYZUL_PEALLAIDH             = 115,
    NYZUL_CARNERO               = 116,
    NYZUL_FALCATUS_ARANEI       = 117,
    NYZUL_EMERGENT_ELM          = 118,
    NYZUL_OLD_TWO_WINGS         = 119,
    NYZUL_AIATAR                = 120,
    NYZUL_INTULO                = 121,
    NYZUL_ORCTRAP               = 122,
    NYZUL_VALKURM_EMPEROR       = 123,
    NYZUL_CRUSHED_KRAUSE        = 124,
    NYZUL_STINGING_SOPHIE       = 125,
    NYZUL_SERPOPARD_ISHTAR      = 126,
    NYZUL_WESTERN_SHADOW        = 127,
    NYZUL_BLOODTEAR_BALDURF     = 128,
    NYZUL_ZIZZY_ZILLAH          = 129,
    NYZUL_ELLYLLON              = 130,
    NYZUL_MISCHIEVOUS_MICHOLAS  = 131,
    NYZUL_LEECH_KING            = 132,
    NYZUL_EASTERN_SHADOW        = 133,
    NYZUL_NUNYENUNC             = 134,
    NYZUL_HELLDIVER             = 135,
    NYZUL_TAISAIJIN             = 136,
    NYZUL_FUNGUS_BEETLE         = 137,
    NYZUL_FRIAR_RUSH            = 138,
    NYZUL_PULVERIZED_PFEFFER    = 139,
    NYZUL_ARGUS                 = 140,
    NYZUL_BLOODPOOL_VORAX       = 141,
    NYZUL_NIGHTMARE_VASE        = 142,
    NYZUL_DAGGERCLAW_DRACOS     = 143,
    NYZUL_NORTHERN_SHADOW       = 144,
    NYZUL_FRAELISSA             = 145,
    NYZUL_ROC                   = 146,
    NYZUL_SABOTENDER_BAILARIN   = 147,
    NYZUL_AQUARIUS              = 148,
    NYZUL_ENERGETIC_ERUCA       = 149,
    NYZUL_SPINY_SPIPI           = 150,
    NYZUL_TRICKSTER_KINETIX     = 151,
    NYZUL_DROOLING_DAISY        = 152,
    NYZUL_BONNACON              = 153,

    NYZUL_GOLDEN_BAT            = 155,
    NYZUL_STEELFLEECE_BALDARICH = 156,
    NYZUL_SABOTENDER_MARIACHI   = 157,
    NYZUL_UNGUR                 = 158,
    NYZUL_SWAMFISK              = 159,
    NYZUL_BUBURIMBOO            = 160,
    NYZUL_KEEPER_OF_HALIDOM     = 161,
    NYZUL_SERKET                = 162,
    NYZUL_DUNE_WIDOW            = 163,
    NYZUL_ODQAN                 = 164,
    NYZUL_BURNED_BERGMANN       = 165,

    NYZUL_TYRANNIC_TUNNOK       = 167,
    NYZUL_BLOODSUCKER           = 168,
    NYZUL_TOTTERING_TOBY        = 169,
    NYZUL_SOUTHERN_SHADOW       = 170,
    NYZUL_SHARP_EARED_ROPIPI    = 171,

    NYZUL_PANZER_PERCIVAL       = 173,
    NYZUL_VOUIVRE               = 174,
    NYZUL_JOLLY_GREEN           = 175,
    NYZUL_TUMBLING_TRUFFLE      = 176,
    NYZUL_CAPRICIOUS_CASSIE     = 177,
    NYZUL_AMIKIRI               = 178,
    NYZUL_STRAY_MARY            = 179,
    NYZUL_SEWER_SYRUP           = 180,
    NYZUL_UNUT                  = 181,
    NYZUL_SIMURGH               = 182,
    NYZUL_PELICAN               = 183,
    NYZUL_CARGO_CRAB_COLIN      = 184,
    NYZUL_WOUNDED_WURFEL        = 185,
    NYZUL_PEG_POWLER            = 186,

    NYZUL_JADED_JODY            = 188,
    NYZUL_MAIGHDEAN_UAINE       = 189,

}

invaderXim.appraisal.unappraisedItems =
{
    invaderXim.item.UNAPPRAISED_SWORD,
    invaderXim.item.UNAPPRAISED_DAGGER,
    invaderXim.item.UNAPPRAISED_POLEARM,
    invaderXim.item.UNAPPRAISED_AXE,
    invaderXim.item.UNAPPRAISED_BOW,
    invaderXim.item.UNAPPRAISED_GLOVES,
    invaderXim.item.UNAPPRAISED_FOOTWEAR,
    invaderXim.item.UNAPPRAISED_HEADPIECE,
    invaderXim.item.UNAPPRAISED_EARRING,
    invaderXim.item.UNAPPRAISED_RING,
    invaderXim.item.UNAPPRAISED_CAPE,
    invaderXim.item.UNAPPRAISED_SASH,
    invaderXim.item.UNAPPRAISED_SHIELD,
    invaderXim.item.UNAPPRAISED_NECKLACE,
    invaderXim.item.UNAPPRAISED_INGOT,
    invaderXim.item.UNAPPRAISED_POTION,
    invaderXim.item.UNAPPRAISED_CLOTH,
    invaderXim.item.UNAPPRAISED_BOX,
}

invaderXim.appraisal.appraisalItems =
{
    [invaderXim.item.UNAPPRAISED_SWORD] =
    {
        [invaderXim.assault.mission.SEAGULL_GROUNDED] =
        {
            items =
            {
                { 65, invaderXim.item.GUST_CLAYMORE  },
                { 30, invaderXim.item.UCHIGATANA_P1  },
                {  5, invaderXim.item.KOSETSUSAMONJI },
            },
        },

        [invaderXim.assault.mission.SAGELORD_ELIMINATION] =
        {
            items =
            {
                { 55, invaderXim.item.GUST_CLAYMORE },
                { 40, invaderXim.item.UCHIGATANA_P1 },
                {  5, invaderXim.item.DJINNBRINGER  },
            },
        },

        [invaderXim.assault.mission.BREAKING_MORALE] =
        {
            items =
            {
                { 45, invaderXim.item.GUST_CLAYMORE   },
                { 30, invaderXim.item.UCHIGATANA_P1   },
                { 20, invaderXim.item.PEALING_ANELACE },
                { 10, invaderXim.item.KAGIROI         },
                {  5, invaderXim.item.STORM_SCIMITAR  },
            },
        },

        [invaderXim.assault.mission.THE_DOUBLE_AGENT] =
        {
            items =
            {
                { 45, invaderXim.item.GUST_CLAYMORE   },
                { 10, invaderXim.item.DJINNBRINGER    },
                { 38, invaderXim.item.UCHIGATANA_P1   },
                {  4, invaderXim.item.PEALING_ANELACE },
                {  3, invaderXim.item.KAGIROI         },
            },
        },
        [invaderXim.assault.mission.AZURE_EXPERIMENTS] =
        {
            items =
            {
                { 100, invaderXim.item.MACUAHUITL_M1 },
            },
        },

        [invaderXim.assault.mission.BLITZKRIEG] =
        {
            items =
            {
                { 45, invaderXim.item.GUST_CLAYMORE  },
                { 30, invaderXim.item.UCHIGATANA_P1  },
                { 20, invaderXim.item.DURANDAL       },
                {  5, invaderXim.item.SANGUINE_SWORD },
            },
        },

        [invaderXim.assault.mission.WAMOURA_FARM_RAID] =
        {
            items =
            {
                { 45, invaderXim.item.GUST_CLAYMORE },
                { 30, invaderXim.item.UCHIGATANA_P1 },
                { 20, invaderXim.item.HOTARUMARU    },
                {  5, invaderXim.item.KUMOKIRIMARU  },
            },
        },

        [invaderXim.assault.mission.RED_VERSUS_BLUE] =
        {
            items =
            {
                { 100, invaderXim.item.KILIJ },
            },
        },

        [invaderXim.appraisal.origin.NYZUL_FROSTMANE] =
        {
            items =
            {
                { 60, invaderXim.item.CLAYMORE      },
                { 35, invaderXim.item.GUST_CLAYMORE },
                {  5, invaderXim.item.LOCKHEART     },
            },
        },

        [invaderXim.appraisal.origin.NYZUL_CARNERO] =
        {
            items =
            {
                { 75, invaderXim.item.BRONZE_SWORD       },
                { 25, invaderXim.item.KATAYAMA_ICHIMONJI },
            },
        },

        [invaderXim.appraisal.origin.NYZUL_EMERGENT_ELM] =
        {
            items =
            {
                { 60, invaderXim.item.BRONZE_SWORD   },
                { 35, invaderXim.item.XIPHOS         },
                {  5, invaderXim.item.GLOOM_CLAYMORE },
            },
        },

        [invaderXim.appraisal.origin.NYZUL_ZIZZY_ZILLAH] =
        {
            items =
            {
                { 60, invaderXim.item.BRONZE_SWORD  },
                { 35, invaderXim.item.UCHIGATANA_P1 },
                {  5, invaderXim.item.NAMIKIRIMARU  },
            },
        },

        [invaderXim.appraisal.origin.NYZUL_KEEPER_OF_HALIDOM] =
        {
            items =
            {
                { 65, invaderXim.item.BRONZE_SWORD  },
                { 32, invaderXim.item.UCHIGATANA_P1 },
                {  3, invaderXim.item.DAIHANNYA     },
            },
        },

        [invaderXim.appraisal.origin.NYZUL_AMIKIRI] =
        {
            items =
            {
                { 75, invaderXim.item.BRONZE_SWORD },
                { 25, invaderXim.item.KAMEWARI     },
            },
        },

        [invaderXim.appraisal.origin.NYZUL_CARGO_CRAB_COLIN] =
        {
            items =
            {
                { 85, invaderXim.item.BRONZE_SWORD },
                { 15, invaderXim.item.NADRS        },
            },
        },
    },

    [invaderXim.item.UNAPPRAISED_DAGGER] =
    {
        [invaderXim.appraisal.origin.NYZUL_TOM_TIT_TAT] =
        {
            items =
            {
                { 70, invaderXim.item.BRONZE_KNIFE  },
                { 25, invaderXim.item.KUNAI         },
                {  5, invaderXim.item.FRUIT_PUNCHES },
            },
        },

        [invaderXim.appraisal.origin.NYZUL_ORCTRAP] =
        {
            items =
            {
                { 95, invaderXim.item.BRONZE_KNIFE },
                {  5, invaderXim.item.NIKKARIAOE   },
            },
        },

        [invaderXim.appraisal.origin.NYZUL_STINGING_SOPHIE] =
        {
            items =
            {
                { 95, invaderXim.item.BRONZE_KNIFE },
                {  5, invaderXim.item.BEESTINGER   },
            },
        },

        [invaderXim.appraisal.origin.NYZUL_WESTERN_SHADOW] =
        {
            items =
            {
                { 95, invaderXim.item.KUNAI       },
                {  5, invaderXim.item.RETALIATORS },
            },
        },

        [invaderXim.appraisal.origin.NYZUL_MISCHIEVOUS_MICHOLAS] =
        {
            items =
            {
                { 95, invaderXim.item.BRONZE_KNIFE  },
                {  5, invaderXim.item.KIDNEY_DAGGER },
            },
        },

        [invaderXim.appraisal.origin.NYZUL_NIGHTMARE_VASE] =
        {
            items =
            {
                { 90, invaderXim.item.KUNAI   },
                { 10, invaderXim.item.SHINOGI },
            },
        },

        [invaderXim.appraisal.origin.NYZUL_DAGGERCLAW_DRACOS] =
        {
            items =
            {
                { 90, invaderXim.item.BRONZE_KNUCKLES },
                { 10, invaderXim.item.SONIC_KNUCKLES  },
            },
        },

        [invaderXim.appraisal.origin.NYZUL_SABOTENDER_MARIACHI] =
        {
            items =
            {
                { 90, invaderXim.item.BRONZE_KNIFE },
                { 10, invaderXim.item.BANO_DEL_SOL },
            },
        },
    },

    [invaderXim.item.UNAPPRAISED_POLEARM] =
    {
        [invaderXim.assault.mission.SEAGULL_GROUNDED] =
        {
            items =
            {
                { 100, invaderXim.item.SPARK_SPEAR },
            },
        },

        [invaderXim.assault.mission.REQUIEM] =
        {
            items =
            {
                { 20, invaderXim.item.HOLLY_STAFF_P1 },
                { 40, invaderXim.item.BRASS_ZAGHNAL  },
                { 20, invaderXim.item.WILLOW_WAND_P1 },
                {  5, invaderXim.item.PUK_LANCE      },
                { 15, invaderXim.item.SPARK_SPEAR    },
            },
        },

        [invaderXim.assault.mission.EXTERMINATION] =
        {
            items =
            {
                { 20, invaderXim.item.SPARK_SPEAR       },
                { 20, invaderXim.item.WILLOW_WAND_P1    },
                { 15, invaderXim.item.HOLLY_STAFF_P1    },
                { 35, invaderXim.item.BRASS_ZAGHNAL     },
                { 10, invaderXim.item.VOLUNTEERS_SCYTHE },
            },
        },

        [invaderXim.assault.mission.TROLL_FUGITIVES] =
        {
            items =
            {
                { 100, invaderXim.item.SICKLE }
            },
        },

        [invaderXim.appraisal.origin.NYZUL_JUGGLER_HECATOMB] =
        {
            items =
            {
                { 90, invaderXim.item.ASH_CLUB      },
                { 10, invaderXim.item.HEAVY_HALBERD },
            },
        },

        [invaderXim.appraisal.origin.NYZUL_HELLION] =
        {
            items =
            {
                { 70, invaderXim.item.MAPLE_WAND  },
                { 30, invaderXim.item.A_LOUTRANCE },
            },
        },

        [invaderXim.appraisal.origin.NYZUL_FALCATUS_ARANEI] =
        {
            items =
            {
                { 70, invaderXim.item.MAPLE_WAND     },
                { 20, invaderXim.item.BRONZE_ZAGHNAL },
                { 10, invaderXim.item.WEBCUTTER      },
            },
        },

        [invaderXim.appraisal.origin.NYZUL_NUNYENUNC] =
        {
            items =
            {
                { 90, invaderXim.item.ASH_CLUB      },
                { 10, invaderXim.item.PILGRIMS_WAND },
            },
        },

        [invaderXim.appraisal.origin.NYZUL_ROC] =
        {
            items =
            {
                { 90, invaderXim.item.MAPLE_WAND  },
                { 10, invaderXim.item.DRYAD_STAFF },
            },
        },

        [invaderXim.appraisal.origin.NYZUL_SWAMFISK] =
        {
            items =
            {
                { 90, invaderXim.item.MAPLE_WAND   },
                { 10, invaderXim.item.GELONG_STAFF },
            },
        },

        [invaderXim.appraisal.origin.NYZUL_VOUIVRE] =
        {
            items =
            {
                { 90, invaderXim.item.ASH_CLUB },
                { 10, invaderXim.item.GAE_BOLG },
            },
        },
    },

    [invaderXim.item.UNAPPRAISED_AXE] =
    {
        [invaderXim.assault.mission.REQUIEM] =
        {
            items =
            {
                { 100, invaderXim.item.PICKAXE },
            },
        },

        [invaderXim.assault.mission.EXTERMINATION] =
        {
            items =
            {
                { 100, invaderXim.item.PICKAXE },
            },
        },

        [invaderXim.assault.mission.TROLL_FUGITIVES] =
        {
            items =
            {
                { 60, invaderXim.item.HATCHET        },
                { 10, invaderXim.item.TOMAHAWK_P1    },
                { 15, invaderXim.item.WAMOURA_AXE    },
                { 15, invaderXim.item.PROMINENCE_AXE },
            },
        },

        [invaderXim.appraisal.origin.NYZUL_BAT_EYE] =
        {
            items =
            {
                { 95, invaderXim.item.BONE_AXE  },
                {  5, invaderXim.item.STORM_AXE },
            },
        },

        [invaderXim.appraisal.origin.NYZUL_NORTHERN_SHADOW] =
        {
            items =
            {
                { 90, invaderXim.item.BUTTERFLY_AXE },
                { 10, invaderXim.item.EXECUTIONER   },
            },
        },

        [invaderXim.appraisal.origin.NYZUL_AQUARIUS] =
        {
            items =
            {
                { 90, invaderXim.item.BONE_AXE  },
                { 10, invaderXim.item.FRANSISCA },
            },
        },

        [invaderXim.appraisal.origin.NYZUL_TRICKSTER_KINETIX] =
        {
            items =
            {
                { 90, invaderXim.item.BONE_AXE },
                { 10, invaderXim.item.TABAR    },
            },
        },

        [invaderXim.appraisal.origin.NYZUL_TYRANNIC_TUNNOK] =
        {
            items =
            {
                { 90, invaderXim.item.BONE_AXE },
                { 10, invaderXim.item.LOHAR    },
            },
        },

        [invaderXim.appraisal.origin.NYZUL_PANZER_PERCIVAL] =
        {
            items =
            {
                { 90, invaderXim.item.BUTTERFLY_AXE },
                { 10, invaderXim.item.NECKCHOPPER   },
            },
        },

        [invaderXim.appraisal.origin.NYZUL_PEG_POWLER] =
        {
            items =
            {
                { 90, invaderXim.item.BUTTERFLY_AXE },
                { 10, invaderXim.item.SCHWARZ_AXT   },
            },
        },
    },

    [invaderXim.item.UNAPPRAISED_BOW] =
    {
        [invaderXim.assault.mission.LAMIA_NO_13] =
        {
            items =
            {
                { 43, invaderXim.item.LONGBOW_P1   },
                { 43, invaderXim.item.CROSSBOW_P1  },
                { 14, invaderXim.item.IMPERIAL_BOW },
            },
        },

        [invaderXim.assault.mission.SHOOTING_DOWN_THE_BARON] =
        {
            items =
            {
                { 330, invaderXim.item.CROSSBOW_P1    },
                { 550, invaderXim.item.LONGBOW_P1     },
                { 100, invaderXim.item.CULVERIN       },
                {  10, invaderXim.item.CULVERIN_P1    },
                {  10, invaderXim.item.STORM_ZAMBURAK },
            },
        },

        [invaderXim.appraisal.origin.NYZUL_GYRE_CARLIN] =
        {
            items =
            {
                { 90, invaderXim.item.SHORTBOW },
                { 10, invaderXim.item.RIKONODO },
            },
        },

        [invaderXim.appraisal.origin.NYZUL_EASTERN_SHADOW] =
        {
            items =
            {
                { 90, invaderXim.item.LONGBOW   },
                { 10, invaderXim.item.VALIS_BOW },
            },
        },

        [invaderXim.appraisal.origin.NYZUL_HELLDIVER] =
        {
            items =
            {
                { 90, invaderXim.item.SELF_BOW },
                { 10, invaderXim.item.WINGEDGE },
            },
        },

        [invaderXim.appraisal.origin.NYZUL_UNGUR] =
        {
            items =
            {
                { 90, invaderXim.item.CROSSBOW        },
                { 10, invaderXim.item.UNGUR_BOOMERANG },
            },
        },

        [invaderXim.appraisal.origin.NYZUL_FRAELISSA] =
        {
            items =
            {
                { 90, invaderXim.item.CROSSBOW      },
                { 10, invaderXim.item.ALMOGAVAR_BOW },
            },
        },
    },

    [invaderXim.item.UNAPPRAISED_GLOVES] =
    {
        [invaderXim.assault.mission.ORICHALCUM_SURVEY] =
        {
            items =
            {
                { 100, invaderXim.item.STORM_GAGES },
            },
        },

        [invaderXim.assault.mission.SEAGULL_GROUNDED] =
        {
            items =
            {
                { 28, invaderXim.item.BRONZE_MITTENS_P1 },
                { 30, invaderXim.item.LEATHER_GLOVES    },
                { 20, invaderXim.item.COTTON_GLOVES     },
                { 18, invaderXim.item.CUFFS             },
                {  5, invaderXim.item.STORM_MANOPOLAS   },
            },
        },

        [invaderXim.assault.mission.REQUIEM] =
        {
            items =
            {
                { 30, invaderXim.item.LEATHER_GLOVES    },
                { 28, invaderXim.item.BRONZE_MITTENS_P1 },
                { 20, invaderXim.item.COTTON_GLOVES     },
                { 18, invaderXim.item.CUFFS             },
                {  5, invaderXim.item.STORM_GAGES       },
            },
        },

        [invaderXim.appraisal.origin.NYZUL_PEALLAIDH] =
        {
            items =
            {
                { 90, invaderXim.item.LEATHER_GLOVES   },
                { 10, invaderXim.item.NIGHTMARE_GLOVES },
            },
        },

        [invaderXim.appraisal.origin.NYZUL_ENERGETIC_ERUCA] =
        {
            items =
            {
                { 90, invaderXim.item.COTTON_GLOVES },
                { 10, invaderXim.item.HANZO_TEKKO   },
            },
        },
    },

    [invaderXim.item.UNAPPRAISED_FOOTWEAR] =
    {
        [invaderXim.assault.mission.LAMIA_NO_13] =
        {
            items =
            {
                { 20, invaderXim.item.ASH_CLOGS          },
                { 38, invaderXim.item.BRONZE_LEGGINGS_P1 },
                { 18, invaderXim.item.LEATHER_HIGHBOOTS  },
                {  6, invaderXim.item.SOLEA              },
                { 18, invaderXim.item.STORM_GAMBIERAS    },
            },
        },

        [invaderXim.assault.mission.EXTERMINATION] =
        {
            items =
            {
                {  5, invaderXim.item.STORM_CRACKOWS     },
                { 35, invaderXim.item.ASH_CLOGS          },
                { 25, invaderXim.item.BRONZE_LEGGINGS_P1 },
                { 35, invaderXim.item.LEATHER_HIGHBOOTS  },
            },
        },

        [invaderXim.appraisal.origin.NYZUL_LEAPING_LIZZY] =
        {
            items =
            {
                { 95, invaderXim.item.LEATHER_HIGHBOOTS },
                {  5, invaderXim.item.BOUNDING_BOOTS    },
            },
        },

        [invaderXim.appraisal.origin.NYZUL_CACTUAR_CANTAUTOR] =
        {
            items =
            {
                { 90, invaderXim.item.LEATHER_HIGHBOOTS },
                { 10, invaderXim.item.KUNG_FU_SHOES     },
            },
        },

        [invaderXim.appraisal.origin.NYZUL_BONNACON] =
        {
            items =
            {
                { 90, invaderXim.item.ASH_CLOGS       },
                { 10, invaderXim.item.TREDECIM_SCYTHE }, -- Tredecim Scythe or Cure Clogs
            },
        },

        [invaderXim.appraisal.origin.NYZUL_TOTTERING_TOBY] =
        {
            items =
            {
                { 90, invaderXim.item.ASH_CLOGS         },
                { 10, invaderXim.item.STUMBLING_SANDALS },
            },
        },

        [invaderXim.appraisal.origin.NYZUL_SIMURGH] =
        {
            items =
            {
                { 90, invaderXim.item.LEATHER_HIGHBOOTS },
                { 10, invaderXim.item.TROTTER_BOOTS     },
            },
        },
    },

    [invaderXim.item.UNAPPRAISED_HEADPIECE] =
    {
        [invaderXim.assault.mission.TROLL_FUGITIVES] =
        {
            items =
            {
                {  5, invaderXim.item.STORM_TURBAN    },
                { 20, invaderXim.item.COTTON_HEADGEAR },
                { 15, invaderXim.item.BRONZE_CAP_P1   },
                { 30, invaderXim.item.LEATHER_BANDANA },
                { 30, invaderXim.item.CIRCLET         },
            },
        },

        [invaderXim.appraisal.origin.NYZUL_VALKURM_EMPEROR] =
        {
            items =
            {
                { 90, invaderXim.item.COPPER_HAIRPIN  },
                { 10, invaderXim.item.EMPRESS_HAIRPIN },
            },
        },

        [invaderXim.appraisal.origin.NYZUL_ELLYLLON] =
        {
            items =
            {
                { 90, invaderXim.item.LEATHER_BANDANA },
                { 10, invaderXim.item.MUSHROOM_HELM   },
            },
        },

        [invaderXim.appraisal.origin.NYZUL_TAISAIJIN] =
        {
            items =
            {
                { 90, invaderXim.item.LEATHER_BANDANA },
                { 10, invaderXim.item.SPELUNKERS_HAT  },
            },
        },

        [invaderXim.appraisal.origin.NYZUL_DROOLING_DAISY] =
        {
            items =
            {
                { 90, invaderXim.item.BONE_HAIRPIN   },
                { 10, invaderXim.item.DODGE_HEADBAND },
            },
        },

        [invaderXim.appraisal.origin.NYZUL_SHARP_EARED_ROPIPI] =
        {
            items =
            {
                { 90, invaderXim.item.COPPER_HAIRPIN    },
                { 10, invaderXim.item.ENTRANCING_RIBBON },
            },
        },

        [invaderXim.appraisal.origin.NYZUL_TUMBLING_TRUFFLE] =
        {
            items =
            {
                { 90, invaderXim.item.LEATHER_BANDANA },
                { 10, invaderXim.item.FUNGUS_HAT      },
            },
        },
    },

    [invaderXim.item.UNAPPRAISED_EARRING] =
    {
        [invaderXim.assault.mission.EXCAVATION_DUTY] =
        {
            items =
            {
                { 25, invaderXim.item.SHELL_EARRING   },
                { 21, invaderXim.item.BONE_EARRING    },
                { 25, invaderXim.item.BEETLE_EARRING  },
                { 20, invaderXim.item.SILVER_EARRING  },
                {  6, invaderXim.item.RERAISE_EARRING },
                {  3, invaderXim.item.STORM_LOOP      },
            },
        },

        [invaderXim.assault.mission.GOLDEN_SALVAGE] =
        {
            items =
            {
                { 22, invaderXim.item.SHELL_EARRING  },
                { 20, invaderXim.item.BONE_EARRING   },
                { 21, invaderXim.item.BEETLE_EARRING },
                { 27, invaderXim.item.SILVER_EARRING },
                {  6, invaderXim.item.HEIMS_EARRING  },
                {  4, invaderXim.item.STORM_EARRING  },
            },
        },

        [invaderXim.appraisal.origin.NYZUL_LEECH_KING] =
        {
            items =
            {
                { 90, invaderXim.item.SHELL_EARRING     },
                { 10, invaderXim.item.BLOODBEAD_EARRING },
            },
        },

        [invaderXim.appraisal.origin.NYZUL_CAPRICIOUS_CASSIE] =
        {
            items =
            {
                { 90, invaderXim.item.BONE_EARRING   },
                { 10, invaderXim.item.CASSIE_EARRING },
            },
        },

        [invaderXim.appraisal.origin.NYZUL_MAIGHDEAN_UAINE] =
        {
            items =
            {
                { 90, invaderXim.item.BEETLE_EARRING  },
                { 10, invaderXim.item.OPTICAL_EARRING },
            },
        },
    },

    [invaderXim.item.UNAPPRAISED_RING] =
    {
        [invaderXim.assault.mission.LEUJAOAM_CLEANSING] =
        {
            items =
            {
                { 50, invaderXim.item.COPPER_RING   },
                { 30, invaderXim.item.BRASS_RING    },
                { 15, invaderXim.item.ARCHERS_RING  },
                {  5, invaderXim.item.IMPERIAL_RING },
            },
        },

        [invaderXim.assault.mission.IMPERIAL_AGENT_RESCUE] =
        {
            items =
            {
                { 50, invaderXim.item.COPPER_RING },
                { 30, invaderXim.item.BRASS_RING  },
                { 15, invaderXim.item.ETHER_RING  },
                {  5, invaderXim.item.STORM_RING  },
            },
        },

        [invaderXim.appraisal.origin.NYZUL_BOMB_KING] =
        {
            items =
            {
                { 60, invaderXim.item.COPPER_RING },
                { 30, invaderXim.item.BRASS_RING  },
                { 10, invaderXim.item.BOMB_RING   },
            },
        },

        [invaderXim.appraisal.origin.NYZUL_SMOTHERING_SCHMIDT] =
        {
            items =
            {
                { 60, invaderXim.item.COPPER_RING   },
                { 30, invaderXim.item.BRASS_RING    },
                { 10, invaderXim.item.MALFLOOD_RING },
            },
        },

        [invaderXim.appraisal.origin.NYZUL_ASPHYXIATED_AMSEL] =
        {
            items =
            {
                { 90, invaderXim.item.BRASS_RING   },
                { 10, invaderXim.item.MALGUST_RING },
            },
        },

        [invaderXim.appraisal.origin.NYZUL_CRUSHED_KRAUSE] =
        {
            items =
            {
                { 90, invaderXim.item.COPPER_RING  },
                { 10, invaderXim.item.MALDUST_RING },
            },
        },

        [invaderXim.appraisal.origin.NYZUL_PULVERIZED_PFEFFER] =
        {
            items =
            {
                { 90, invaderXim.item.COPPER_RING   },
                { 10, invaderXim.item.MALFROST_RING },
            },
        },

        [invaderXim.appraisal.origin.NYZUL_SERKET] =
        {
            items =
            {
                { 90, invaderXim.item.BRASS_RING  },
                { 10, invaderXim.item.SERKET_RING },
            },
        },

        [invaderXim.appraisal.origin.NYZUL_BURNED_BERGMANN] =
        {
            items =
            {
                { 90, invaderXim.item.COPPER_RING   },
                { 10, invaderXim.item.MALFLAME_RING },
            },
        },

        [invaderXim.appraisal.origin.NYZUL_BLOODSUCKER] =
        {
            items =
            {
                { 90, invaderXim.item.COPPER_RING    },
                { 10, invaderXim.item.BLOODBEAD_RING },
            },
        },

        [invaderXim.appraisal.origin.NYZUL_SEWER_SYRUP] =
        {
            items =
            {
                { 90, invaderXim.item.BRASS_RING },
                { 10, invaderXim.item.JELLY_RING },
            },
        },

        [invaderXim.appraisal.origin.NYZUL_WOUNDED_WURFEL] =
        {
            items =
            {
                { 90, invaderXim.item.COPPER_RING   },
                { 10, invaderXim.item.MALFLASH_RING },
            },
        },
    },

    [invaderXim.item.UNAPPRAISED_CAPE] =
    {
        [invaderXim.assault.mission.LEBROS_SUPPLIES] =
        {
            items =
            {
                { 30, invaderXim.item.DHALMEL_MANTLE_P1 },
                { 25, invaderXim.item.COTTON_CAPE_P1    },
                { 25, invaderXim.item.LIZARD_MANTLE_P1  },
                {  5, invaderXim.item.STORM_CAPE        },
                { 15, invaderXim.item.ENHANCING_MANTLE  },
            },
        },

        [invaderXim.appraisal.origin.NYZUL_OLD_TWO_WINGS] =
        {
            items =
            {
                { 90, invaderXim.item.LIZARD_MANTLE_P1 },
                { 10, invaderXim.item.BAT_CAPE         },
            },
        },

        [invaderXim.appraisal.origin.NYZUL_FRAELISSA] =
        {
            items =
            {
                { 90, invaderXim.item.COTTON_CAPE_P1   },
                { 10, invaderXim.item.BELLICOSE_MANTLE },
            },
        },

        [invaderXim.appraisal.origin.NYZUL_SPINY_SPIPI] =
        {
            items =
            {
                { 90, invaderXim.item.RABBIT_MANTLE  },
                { 10, invaderXim.item.MIST_SILK_CAPE },
            },
        },

        [invaderXim.appraisal.origin.NYZUL_GOLDEN_BAT] =
        {
            items =
            {
                { 90, invaderXim.item.COTTON_CAPE_P1 },
                { 10, invaderXim.item.NIGHT_CAPE     },
            },
        },
    },

    [invaderXim.item.UNAPPRAISED_SASH] =
    {

    },

    [invaderXim.item.UNAPPRAISED_SHIELD] =
    {
        [invaderXim.appraisal.origin.NYZUL_BLOODTEAR_BALDURF] =
        {
            items =
            {
                { 90, invaderXim.item.OAK_SHIELD    },
                { 10, invaderXim.item.VIKING_SHIELD },
            },
        },

        [invaderXim.appraisal.origin.NYZUL_FUNGUS_BEETLE] =
        {
            items =
            {
                { 90, invaderXim.item.LAUAN_SHIELD },
                { 10, invaderXim.item.CLIPEUS      },
            },
        },

        [invaderXim.appraisal.origin.NYZUL_STEELFLEECE_BALDARICH] =
        {
            items =
            {
                { 90, invaderXim.item.OAK_SHIELD    },
                { 10, invaderXim.item.VIKING_SHIELD },
            },
        },

        [invaderXim.appraisal.origin.NYZUL_SOUTHERN_SHADOW] =
        {
            items =
            {
                { 90, invaderXim.item.ELM_SHIELD    },
                { 10, invaderXim.item.MASTER_SHIELD },
            },
        },

        [invaderXim.appraisal.origin.NYZUL_PELICAN] =
        {
            items =
            {
                { 90, invaderXim.item.ASPIS        },
                { 10, invaderXim.item.ASTRAL_ASPIS },
            },
        },
    },

    [invaderXim.item.UNAPPRAISED_NECKLACE] =
    {
        [invaderXim.assault.mission.ORICHALCUM_SURVEY] =
        {
            items =
            {
                { 55, invaderXim.item.FEATHER_COLLAR },
                { 30, invaderXim.item.GORGET_P1      },
                { 10, invaderXim.item.JAGD_GORGET    },
                {  5, invaderXim.item.STORM_MUFFLER  },
            },
        },

        [invaderXim.assault.mission.PREEMPTIVE_STRIKE] =
        {
            items =
            {
                { 55, invaderXim.item.FEATHER_COLLAR },
                { 30, invaderXim.item.GORGET_P1      },
                { 10, invaderXim.item.SPECTACLES     },
                {  5, invaderXim.item.STORM_TORQUE   },
            },
        },

        [invaderXim.appraisal.origin.NYZUL_SHADOW_EYE] =
        {
            items =
            {
                { 95, invaderXim.item.REGEN_COLLAR },
                {  5, invaderXim.item.MOON_AMULET  },
            },
        },

        [invaderXim.appraisal.origin.NYZUL_JAGGEDY_EARED_JACK] =
        {
            items =
            {
                { 90, invaderXim.item.LEATHER_GORGET },
                { 10, invaderXim.item.RABBIT_CHARM   },
            },
        },

        [invaderXim.appraisal.origin.NYZUL_GARGANTUA] =
        {
            items =
            {
                { 90, invaderXim.item.FEATHER_COLLAR  },
                { 10, invaderXim.item.ELEMENTAL_CHARM },
            },
        },

        [invaderXim.appraisal.origin.NYZUL_SERPOPARD_ISHTAR] =
        {
            items =
            {
                { 90, invaderXim.item.FEATHER_COLLAR   },
                { 10, invaderXim.item.CERULEAN_PENDANT },
            },
        },

        [invaderXim.appraisal.origin.NYZUL_ARGUS] =
        {
            items =
            {
                { 90, invaderXim.item.REGEN_COLLAR  },
                { 10, invaderXim.item.PEACOCK_CHARM },
            },
        },

        [invaderXim.appraisal.origin.NYZUL_BLOODPOOL_VORAX] =
        {
            items =
            {
                { 90, invaderXim.item.GORGET_P1        },
                { 10, invaderXim.item.BLOODBEAD_AMULET },
            },
        },

        [invaderXim.appraisal.origin.NYZUL_BUBURIMBOO] =
        {
            items =
            {
                { 90, invaderXim.item.GORGET_P1       },
                { 10, invaderXim.item.BUBURIMU_GORGET },
            },
        },

        [invaderXim.appraisal.origin.NYZUL_DUNE_WIDOW] =
        {
            items =
            {
                { 90, invaderXim.item.REGEN_COLLAR  },
                { 10, invaderXim.item.SPIDER_TORQUE },
            },
        },
    },

    [invaderXim.item.UNAPPRAISED_INGOT] =
    {

    },

    [invaderXim.item.UNAPPRAISED_POTION] =
    {

    },

    [invaderXim.item.UNAPPRAISED_CLOTH] =
    {

    },

    [invaderXim.item.UNAPPRAISED_BOX] =
    {
        [invaderXim.assault.mission.LEUJAOAM_CLEANSING] =
        {
            items =
            {
                { 10, invaderXim.item.WHITE_ROCK        },
                { 20, invaderXim.item.TSURARA           },
                {  2, invaderXim.item.PHALAENOPSIS      },
                {  5, invaderXim.item.GARDENIA_SEED     },
                {  8, invaderXim.item.GLASS_SHEET       },
                { 20, invaderXim.item.MERROW_SCALE      },
                { 15, invaderXim.item.SOULFLAYER_STAFF  },
                { 10, invaderXim.item.ICE_CRYSTAL       },
                {  1, invaderXim.item.TOOLBAG_JUSATSU   },
                {  3, invaderXim.item.IRON_BULLET_POUCH },
                {  6, invaderXim.item.LAKERDA           },
            },
        },

        [invaderXim.assault.mission.ORICHALCUM_SURVEY] =
        {
            items =
            {
                { 10, invaderXim.item.EGGPLANT              },
                {  9, invaderXim.item.GARDENIA_SEED         },
                { 10, invaderXim.item.ICE_CRYSTAL           },
                {  7, invaderXim.item.KABURA_QUIVER         },
                { 13, invaderXim.item.SQUARE_OF_LINEN_CLOTH },
                {  8, invaderXim.item.MERROW_SCALE          },
                {  5, invaderXim.item.PHALAENOPSIS          },
                { 10, invaderXim.item.POROGGO_HAT           },
                {  6, invaderXim.item.SOULFLAYER_STAFF      },
                { 15, invaderXim.item.TSURARA               },
                {  7, invaderXim.item.WHITE_ROCK            },
            },
        },

        [invaderXim.assault.mission.IMPERIAL_AGENT_RESCUE] =
        {
            items =
            {
                {  7, invaderXim.item.DATE                         },
                {  5, invaderXim.item.EGGPLANT                     },
                { 10, invaderXim.item.CLUMP_OF_IMPERIAL_TEA_LEAVES },
                {  4, invaderXim.item.CHUNK_OF_KAOLIN              },
                { 20, invaderXim.item.MAMOOL_JA_COLLAR             },
                { 15, invaderXim.item.POROGGO_HAT                  },
                {  6, invaderXim.item.SPRIG_OF_SAGE                },
                {  5, invaderXim.item.SQUARE_OF_SILK_CLOTH         },
                {  1, invaderXim.item.TOOLBAG_KAWAHORI_OGI         },
                {  1, invaderXim.item.TOOLBAG_SHIHEI               },
                {  1, invaderXim.item.TOOLBAG_TSURARA              },
                { 10, invaderXim.item.WILD_ONION                   },
                {  1, invaderXim.item.TOOLBAG_UCHITAKE             },
                { 14, invaderXim.item.ISTAKOZ                      },
            },
        },

        [invaderXim.assault.mission.LEBROS_SUPPLIES] =
        {
            items =
            {
                { 20, invaderXim.item.PINCH_OF_SULFUR     },
                { 20, invaderXim.item.CHUNK_OF_FLAN_MEAT  },
                {  5, invaderXim.item.BULLET_POUCH        },
                { 20, invaderXim.item.TROLL_PAULDRON      },
                { 10, invaderXim.item.SPARTAN_BULLET      },
                { 25, invaderXim.item.SPRIG_OF_HOLY_BASIL },
            },
        },

        [invaderXim.assault.mission.PREEMPTIVE_STRIKE] =
        {
            items =
            {
                { 17, invaderXim.item.EGGPLANT                     },
                { 15, invaderXim.item.SPRIG_OF_SAGE                },
                { 15, invaderXim.item.CLUMP_OF_IMPERIAL_TEA_LEAVES },
                {  7, invaderXim.item.WILD_ONION                   },
                { 10, invaderXim.item.SPOOL_OF_RED_GRASS_THREAD    },
                {  7, invaderXim.item.MAMOOL_JA_COLLAR             },
                {  4, invaderXim.item.TOOLBAG_SAIRUI_RAN           },
                {  3, invaderXim.item.TOOLBAG_SHIHEI               },
                {  4, invaderXim.item.TOOLBAG_JUSATSU              },
                { 10, invaderXim.item.CHUNK_OF_KAOLIN              },
                {  8, invaderXim.item.POROGGO_HAT                  },
            },
        },

        [invaderXim.assault.mission.REQUIEM] =
        {
            items =
            {
                {  4, invaderXim.item.IGNEOUS_ROCK             },
                {  5, invaderXim.item.ROTTEN_QUIVER            },
                {  5, invaderXim.item.HOLY_BOLT_QUIVER         },
                { 20, invaderXim.item.BONE_CHIP                },
                {  5, invaderXim.item.CLEANING_TOOL_SET        },
                {  2, invaderXim.item.HANDFUL_OF_DRAGON_SCALES },
                {  9, invaderXim.item.QIQIRN_SANDBAG           },
                { 15, invaderXim.item.IMP_WING                 },
                { 20, invaderXim.item.BRONZE_BOLT              },
                { 15, invaderXim.item.SPRIG_OF_APPLE_MINT      },
            },
        },

        [invaderXim.assault.mission.EXCAVATION_DUTY] =
        {
            items =
            {
                { 15, invaderXim.item.CHUNK_OF_COPPER_ORE    },
                { 10, invaderXim.item.RED_ROCK               },
                {  5, invaderXim.item.SQUARE_OF_VELVET_CLOTH },
                {  8, invaderXim.item.PINCH_OF_BOMB_ASH      },
                {  8, invaderXim.item.PINCH_OF_SULFUR        },
                {  5, invaderXim.item.SPRIG_OF_HOLY_BASIL    },
                { 20, invaderXim.item.TROLL_PAULDRON         },
                { 15, invaderXim.item.CHUNK_OF_FLAN_MEAT     },
                {  1, invaderXim.item.TROLL_BRONZE_INGOT     },
                {  2, invaderXim.item.SILVER_BULLET_POUCH    },
                {  1, invaderXim.item.SPARTAN_BULLET_POUCH   },
                {  2, invaderXim.item.IRON_BULLET_POUCH      },
                {  4, invaderXim.item.BRONZE_BULLET_POUCH    },
                {  3, invaderXim.item.BULLET_POUCH           },
            },
        },

        [invaderXim.assault.mission.SEAGULL_GROUNDED] =
        {
            items =
            {
                {  1, invaderXim.item.CLEANING_TOOL_SET       },
                {  2, invaderXim.item.SPOOL_OF_RAINBOW_THREAD },
                { 25, invaderXim.item.BONE_CHIP               },
                {  5, invaderXim.item.SPRIG_OF_APPLE_MINT     },
                {  3, invaderXim.item.IGNEOUS_ROCK            },
                { 20, invaderXim.item.QIQIRN_SANDBAG          },
                {  5, invaderXim.item.IMP_WING                },
                { 10, invaderXim.item.ROTTEN_QUIVER           },
                {  6, invaderXim.item.BRONZE_BOLT_QUIVER      },
                { 10, invaderXim.item.WILD_ONION              },
                {  5, invaderXim.item.HOLY_BOLT_QUIVER        },
                {  3, invaderXim.item.SLEEP_BOLT_QUIVER       },
            },
        },

        -- Low sample rate. Borrowing similar Periqia tables for now
        [invaderXim.assault.mission.SHOOTING_DOWN_THE_BARON] =
        {
            items =
            {
                {  30, invaderXim.item.CHUNK_OF_GOLD_ORE     },
                { 340, invaderXim.item.QIQIRN_SANDBAG        },
                { 200, invaderXim.item.SPRIG_OF_APPLE_MINT   },
                {  30, invaderXim.item.BLOODY_BOLT_QUIVER    },
                {  30, invaderXim.item.HOLY_BOLT_QUIVER      },
                {  30, invaderXim.item.MYTHRIL_BOLT_QUIVER   },
                {  30, invaderXim.item.SLEEP_BOLT_QUIVER     },
                {  30, invaderXim.item.DARKSTEEL_BOLT_QUIVER },
                { 250, invaderXim.item.IMP_WING              },
                {  30, invaderXim.item.QIQIRN_SANDBAG        },
            },
        },

        [invaderXim.assault.mission.GOLDEN_SALVAGE] =
        {
            items =
            {
                {  1, invaderXim.item.RUSTY_BUCKET               },
                { 24, invaderXim.item.QUTRUB_GORGET              },
                { 20, invaderXim.item.LAMIAN_ARMLET              },
                {  6, invaderXim.item.AHT_URHGAN_BRASS_INGOT     },
                {  2, invaderXim.item.STONE_QUIVER               },
                {  6, invaderXim.item.BONE_QUIVER                },
                {  2, invaderXim.item.BEETLE_QUIVER              },
                {  1, invaderXim.item.HORN_QUIVER                },
                {  5, invaderXim.item.SCORPION_QUIVER            },
                {  5, invaderXim.item.DEMON_QUIVER               },
                {  3, invaderXim.item.IRON_QUIVER                },
                {  4, invaderXim.item.SILVER_QUIVER              },
                {  1, invaderXim.item.FLASK_OF_DISTILLED_WATER   },
                {  5, invaderXim.item.SCROLL_OF_PUPPETS_OPERETTA },
                {  5, invaderXim.item.KABURA_QUIVER              },
                {  1, invaderXim.item.SLEEP_QUIVER               },
                { 14, invaderXim.item.ISTAKOZ                    },
                {  1, invaderXim.item.WILLOW_FISHING_ROD         },
                {  1, invaderXim.item.LITTLE_WORM                },
            },
        },

        [invaderXim.assault.mission.LAMIA_NO_13] =
        {
            items =
            {
                {  2, invaderXim.item.SPRIG_OF_APPLE_MINT    },
                { 25, invaderXim.item.QUTRUB_GORGET          },
                { 25, invaderXim.item.LAMIAN_ARMLET          },
                {  2, invaderXim.item.AHT_URHGAN_BRASS_INGOT },
                {  2, invaderXim.item.STONE_QUIVER           },
                {  6, invaderXim.item.BONE_QUIVER            },
                {  2, invaderXim.item.BEETLE_QUIVER          },
                {  2, invaderXim.item.DEMON_QUIVER           },
                {  4, invaderXim.item.SILVER_QUIVER          },
                {  6, invaderXim.item.LIGHT_SPIRIT_PACT      },
                {  2, invaderXim.item.KABURA_QUIVER          },
                {  2, invaderXim.item.SLEEP_QUIVER           },
                { 19, invaderXim.item.ISTAKOZ                },
                {  1, invaderXim.item.RUSTY_BUCKET           },
            },
        },

        [invaderXim.assault.mission.EXTERMINATION] =
        {
            items =
            {
                { 15, invaderXim.item.RUSTY_BUCKET             },
                { 25, invaderXim.item.LITTLE_WORM              },
                { 25, invaderXim.item.FLASK_OF_DISTILLED_WATER },
                { 10, invaderXim.item.LAMIAN_ARMLET            },
                {  5, invaderXim.item.KING_TRUFFLE             },
                {  5, invaderXim.item.QUTRUB_GORGET            },
                {  2, invaderXim.item.SILVER_QUIVER            },
                {  2, invaderXim.item.SLEEP_QUIVER             },
                {  4, invaderXim.item.STONE_QUIVER             },
                {  3, invaderXim.item.BONE_QUIVER              },
                {  4, invaderXim.item.BEETLE_QUIVER            },
            },
        },

        [invaderXim.assault.mission.TROLL_FUGITIVES] =
        {
            items =
            {
                { 10, invaderXim.item.PINCH_OF_BOMB_ASH   },
                { 15, invaderXim.item.CHUNK_OF_COPPER_ORE },
                {  8, invaderXim.item.CHUNK_OF_FLAN_MEAT  },
                {  6, invaderXim.item.SPRIG_OF_HOLY_BASIL },
                {  2, invaderXim.item.IRON_BULLET_POUCH   },
                {  1, invaderXim.item.SILVER_BULLET_POUCH },
                {  5, invaderXim.item.PETRIFIED_LOG       },
                { 10, invaderXim.item.RED_ROCK            },
                { 25, invaderXim.item.PINCH_OF_SULFUR     },
                {  8, invaderXim.item.TROLL_BRONZE_INGOT  },
                { 10, invaderXim.item.TROLL_PAULDRON      },
            },
        },

        [invaderXim.appraisal.origin.NYZUL_AIATAR] =
        {
            items =
            {
                { 80, invaderXim.item.LEATHER_TROUSERS },
                { 10, invaderXim.item.FALCONERS_HOSE   },
                { 10, invaderXim.item.SABLE_CUISSES    },
            },
        },

        [invaderXim.appraisal.origin.NYZUL_INTULO] =
        {
            items =
            {
                { 90, invaderXim.item.SLACKS       },
                { 10, invaderXim.item.MAGIC_SLACKS },
            },
        },

        [invaderXim.appraisal.origin.NYZUL_FRIAR_RUSH] =
        {
            items =
            {
                { 90, invaderXim.item.BOMB_ARM  },
                { 10, invaderXim.item.BOMB_CORE },
            },
        },

        [invaderXim.appraisal.origin.NYZUL_SABOTENDER_BAILARIN] =
        {
            items =
            {
                { 90, invaderXim.item.DART       },
                { 10, invaderXim.item.BAILATHORN },
            },
        },

        [invaderXim.appraisal.origin.NYZUL_ODQAN] =
        {
            items =
            {
                { 90, invaderXim.item.LEATHER_TROUSERS },
                { 10, invaderXim.item.BRAVOS_SUBLIGAR  },
            },
        },

        [invaderXim.appraisal.origin.NYZUL_STRAY_MARY] =
        {
            items =
            {
                { 90, invaderXim.item.CORNETTE   },
                { 10, invaderXim.item.MARYS_HORN },
            },
        },

        [invaderXim.appraisal.origin.NYZUL_UNUT] =
        {
            items =
            {
                { 90, invaderXim.item.LINEN_SLOPS   },
                { 10, invaderXim.item.LUNA_SUBLIGAR },
            },
        },

        [invaderXim.appraisal.origin.NYZUL_JADED_JODY] =
        {
            items =
            {
                { 90, invaderXim.item.SLACKS        },
                { 10, invaderXim.item.JET_SERAWEELS },
            },
        },
    },
}

invaderXim.appraisal.appraiseItem = function(player, npc, trade, gil, appraisalCsid)
    if player:getGil() >= gil then
        for _, tradedItem in pairs(invaderXim.appraisal.unappraisedItems) do
            if npcUtil.tradeHasExactly(trade, tradedItem) then
                local tradeID        = trade:getItemId()
                local info           = invaderXim.appraisal.appraisalItems[tradeID]
                local appraisalID    = trade:getItem():getAppraisalID()
                local appraisedItem  = invaderXim.appraisal.itemPick(player, info, appraisalID)

                if appraisedItem ~= 0 then
                    player:startEvent(appraisalCsid, 1, appraisedItem)
                    player:setLocalVar('Appraisal', appraisedItem) -- anticheat
                    player:confirmTrade()
                end

                break
            end
        end
    end
end

invaderXim.appraisal.itemPick = function(player, info, appraisalID)
    -- possible drops
    local items = info[appraisalID].items

    -- sum weights
    local sum = 0
    for i = 1, #items do
        sum = sum + items[i][1]
    end

    -- pick weighted result
    local item = 0
    local pick = math.random(1, sum)
    sum = 0

    for i = 1, #items do
        sum = sum + items[i][1]
        if sum >= pick then
            item = items[i][2]
            break
        end
    end

    return item
end

invaderXim.appraisal.appraisalOnEventFinish = function(player, csid, option, gil, appraisalCsid, npc)
    if csid == appraisalCsid then
        local appraisedItem = player:getLocalVar('Appraisal')
        player:addTreasure(appraisedItem, npc)
        player:delGil(gil)
        player:setLocalVar('Appraisal', 0)
    end
end

invaderXim.appraisal.canGetUnappraisedItem = function(player, area)
    local instance = player:getInstance()
    local result   = false
    local cap      = instance:getLevelCap()

    if cap == 0 or cap >= invaderXim.assault.missionInfo[area].suggestedLevel then
        result = true
    end

    return result
end

invaderXim.appraisal.pickUnappraisedItem = function(player, npc, qItemTable)
    if npc:getLocalVar('UnappraisedItem') == 0 then
        for i = 1, #qItemTable, 1 do
            local lootGroup = qItemTable[i]
            if lootGroup then
                local max = 0
                for _, entry in pairs(lootGroup) do
                    max = max + entry.droprate
                end

                local roll = math.random(1, max)

                for _, entry in pairs(lootGroup) do
                    max = max - entry.droprate
                    if roll > max then
                        if entry.itemid > 0 then
                            npc:setLocalVar('UnappraisedItem', entry.itemid)
                        end

                        break
                    end
                end
            end
        end
    end
end

invaderXim.appraisal.assaultChestTrigger = function(player, npc, qItemTable, regItemTable)
    local instance = player:getInstance()
    local chars    = instance:getChars()
    local area     = player:getCurrentAssault()

    if instance:completed() and npc:getLocalVar('open') == 0 then
        if invaderXim.appraisal.canGetUnappraisedItem(player, area) then
            invaderXim.appraisal.pickUnappraisedItem(player, npc, qItemTable)
            local unappraisedItem = npc:getLocalVar('UnappraisedItem')
            if player:getFreeSlotsCount() == 0 then
                player:messageSpecial(zones[player:getZoneID()].text.ITEM_CANNOT_BE_OBTAINED, unappraisedItem)
                return
            else
                player:addItem({ id = unappraisedItem, appraisal = area })
                for _, players in pairs(chars) do
                    players:messageName(zones[player:getZoneID()].text.PLAYER_OBTAINS_ITEM, player, unappraisedItem)
                end
            end
        end

        npc:entityAnimationPacket(invaderXim.animationString.OPEN_CRATE_GLOW)
        npc:setLocalVar('open', 1)
        npc:setUntargetable(true)
        npc:timer(15000, function(npcArg)
            npcArg:entityAnimationPacket(invaderXim.animationString.STATUS_DISAPPEAR)
        end)

        npc:timer(16000, function(npcArg)
            npcArg:setStatus(invaderXim.status.DISAPPEAR)
        end)

        for i = 1, #regItemTable, 1 do
            local lootGroup = regItemTable[i]
            if lootGroup then
                local max = 0
                for _, entry in pairs(lootGroup) do
                    max = max + entry.droprate
                end

                local roll = math.random(1, max)
                for _, entry in pairs(lootGroup) do
                    max = max - entry.droprate
                    if roll > max then
                        if entry.itemid ~= 0 then
                            player:addTreasure(entry.itemid, npc)
                        end

                        break
                    end
                end
            end
        end
    end
end
