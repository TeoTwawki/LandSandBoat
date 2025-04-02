-----------------------------------
-- Abyssea Global
-----------------------------------
require('scripts/globals/npc_util')
require('scripts/globals/quests')
require('scripts/globals/utils')
require('scripts/globals/extravaganza')
-----------------------------------
xi = xi or {}
invaderXim.abyssea = invaderXim.abyssea or {}

invaderXim.abyssea.exitPositions =
{
    [invaderXim.zone.ABYSSEA_KONSCHTAT ] = {   88.4, -68.09, -579.97, 128, 108 },
    [invaderXim.zone.ABYSSEA_TAHRONGI  ] = {  -28.6,  46.17,  -680.3, 192, 117 },
    [invaderXim.zone.ABYSSEA_LA_THEINE ] = {   -562,      0,     640, 158, 102 },
    [invaderXim.zone.ABYSSEA_ATTOHWA   ] = {   -340, -23.36,   48.49,  31, 118 },
    [invaderXim.zone.ABYSSEA_MISAREAUX ] = { 363.47,      0, -119.72, 129, 103 },
    [invaderXim.zone.ABYSSEA_VUNKERL   ] = { 242.98,   0.24,    8.72, 157, 104 },
    [invaderXim.zone.ABYSSEA_ALTEPA    ] = {    340,  -0.52,    -668, 192, 107 },
    [invaderXim.zone.ABYSSEA_ULEGUERAND] = {    270,   -7.8,     -82,  64, 112 },
    [invaderXim.zone.ABYSSEA_GRAUBERG  ] = {    -64,      0,     600,   0, 106 },
}

invaderXim.abyssea.lightType =
{
    PEARL   = 1,
    GOLDEN  = 2,
    SILVERY = 3,
    EBON    = 4,
    AZURE   = 5,
    RUBY    = 6,
    AMBER   = 7,
}

local lightData =
{
--  Light Type                         Cap  Maximum Tier
    [invaderXim.abyssea.lightType.PEARL  ] = { 230, 2 },
    [invaderXim.abyssea.lightType.GOLDEN ] = { 200, 2 },
    [invaderXim.abyssea.lightType.SILVERY] = { 200, 2 },
    [invaderXim.abyssea.lightType.EBON   ] = { 200, 2 },
    [invaderXim.abyssea.lightType.AZURE  ] = { 255, 4 },
    [invaderXim.abyssea.lightType.RUBY   ] = { 255, 4 },
    [invaderXim.abyssea.lightType.AMBER  ] = { 255, 4 },
}

invaderXim.abyssea.abyssiteType =
{
    SOJOURN      =  1,
    CELERITY     =  2,
    AVARICE      =  3,
    CONFLUENCE   =  4,
    EXPERTISE    =  5,
    FORTUNE      =  6,
    KISMET       =  7,
    PROSPERITY   =  8,
    DESTINY      =  9,
    ACUMEN       = 10,
    LENITY       = 11,
    PERSPICACITY = 12,
    THE_REAPER   = 13,
    GUERDON      = 14,
    FURTHERANCE  = 15,
    MERIT        = 16,
    LUNAR        = 17,
    DISCERNMENT  = 18,
    COSMOS       = 19,
    DEMILUNE     = 20,
}

---@enum invaderXim.abyssea.itemType
invaderXim.abyssea.itemType =
{
    ITEM        = 1,
    TEMP        = 2,
    KEYITEM     = 3,
    ENHANCEMENT = 4,
}

local itemType = invaderXim.abyssea.itemType

invaderXim.abyssea.visionsCruorProspectorItems =
{
--  Sel      Item                                       Cost,  Qty
    [ 1] = { invaderXim.item.PERLE_SALADE,                     4000 },
    [ 2] = { invaderXim.item.PERLE_HAUBERK,                    5000 },
    [ 3] = { invaderXim.item.PERLE_MOUFLES,                    3000 },
    [ 4] = { invaderXim.item.PERLE_BRAYETTES,                  3000 },
    [ 5] = { invaderXim.item.PERLE_SOLLERETS,                  3000 },
    [ 6] = { invaderXim.item.AURORE_BERET,                     4000 },
    [ 7] = { invaderXim.item.AURORE_DOUBLET,                   5000 },
    [ 8] = { invaderXim.item.AURORE_GLOVES,                    3000 },
    [ 9] = { invaderXim.item.AURORE_BRAIS,                     3000 },
    [10] = { invaderXim.item.AURORE_GAITERS,                   3000 },
    [11] = { invaderXim.item.TEAL_CHAPEAU,                     4000 },
    [12] = { invaderXim.item.TEAL_SAIO,                        5000 },
    [13] = { invaderXim.item.TEAL_CUFFS,                       3000 },
    [14] = { invaderXim.item.TEAL_SLOPS,                       3000 },
    [15] = { invaderXim.item.TEAL_PIGACHES,                    3000 },
    [16] = { invaderXim.item.FORBIDDEN_KEY,                     500 },
    [17] = { invaderXim.item.CIPHER_OF_JOACHIMS_ALTER_EGO,     5000 },
    [18] = { invaderXim.item.SHADOW_THRONE,                 2000000 },
}

invaderXim.abyssea.visionsCruorProspectorTemps =
{
--  Sel      Item                          Cost, Qty
    [ 1] = { invaderXim.item.LUCID_POTION_I,             80 },
    [ 2] = { invaderXim.item.LUCID_ETHER_I,              80 },
    [ 3] = { invaderXim.item.BOTTLE_OF_CATHOLICON,       80 },
    [ 4] = { invaderXim.item.DUSTY_ELIXIR,              120 },
    [ 5] = { invaderXim.item.TUBE_OF_CLEAR_SALVE_I,     120 },
    [ 6] = { invaderXim.item.BOTTLE_OF_STALWARTS_TONIC, 150 },
    [ 7] = { invaderXim.item.BOTTLE_OF_ASCETICS_TONIC,  150 },
    [ 8] = { invaderXim.item.BOTTLE_OF_CHAMPIONS_TONIC, 150 },
    [ 9] = { invaderXim.item.LUCID_POTION_II,           200 },
    [10] = { invaderXim.item.LUCID_ETHER_II,            200 },
    [11] = { invaderXim.item.LUCID_ELIXIR_I,            300 },
    [12] = { invaderXim.item.FLASK_OF_HEALING_POWDER,   300 },
    [13] = { invaderXim.item.PINCH_OF_MANA_POWDER,      300 },
    [14] = { invaderXim.item.TUBE_OF_HEALING_SALVE_I,   300 },
    [15] = { invaderXim.item.BOTTLE_OF_VICARS_DRINK,    300 },
    [16] = { invaderXim.item.TUBE_OF_CLEAR_SALVE_II,    300 },
    [17] = { invaderXim.item.PRIMEVAL_BREW,         2000000 },
}

-- Each selection can contain multiple effects in the format of { abysseaEffect, actualEffect, Amt, keyItemRequired, bonusMultiplier }
-- and after that table, the cruor cost is defined.
invaderXim.abyssea.visionsCruorProspectorBuffs =
{
    [6] =
    {
        {
            { invaderXim.effect.ABYSSEA_HP, invaderXim.effect.MAX_HP_BOOST, 20, invaderXim.abyssea.abyssiteType.MERIT, 10 },
        },

        50,
    },

    [7] =
    {
        {
            { invaderXim.effect.ABYSSEA_MP, invaderXim.effect.MAX_MP_BOOST, 10, invaderXim.abyssea.abyssiteType.MERIT, 5 },
        },

        120,
    },

    [8] =
    {
        {
            { invaderXim.effect.ABYSSEA_STR, invaderXim.effect.STR_BOOST, 10, invaderXim.abyssea.abyssiteType.FURTHERANCE, 10 },
            { invaderXim.effect.ABYSSEA_DEX, invaderXim.effect.DEX_BOOST, 10, invaderXim.abyssea.abyssiteType.FURTHERANCE, 10 },
        },

        120,
    },

    [9] =
    {
        {
            { invaderXim.effect.ABYSSEA_VIT, invaderXim.effect.VIT_BOOST, 10, invaderXim.abyssea.abyssiteType.FURTHERANCE, 10 },
            { invaderXim.effect.ABYSSEA_AGI, invaderXim.effect.AGI_BOOST, 10, invaderXim.abyssea.abyssiteType.FURTHERANCE, 10 },
        },

        100,
    },

    [10] =
    {
        {
            { invaderXim.effect.ABYSSEA_INT, invaderXim.effect.INT_BOOST, 10, invaderXim.abyssea.abyssiteType.FURTHERANCE, 10 },
            { invaderXim.effect.ABYSSEA_CHR, invaderXim.effect.CHR_BOOST, 10, invaderXim.abyssea.abyssiteType.FURTHERANCE, 10 },
            { invaderXim.effect.ABYSSEA_MND, invaderXim.effect.MND_BOOST, 10, invaderXim.abyssea.abyssiteType.FURTHERANCE, 10 },
        },

        100,
    },

    [11] =
    {
        {
            { invaderXim.effect.ABYSSEA_HP,  invaderXim.effect.MAX_HP_BOOST, 20, invaderXim.abyssea.abyssiteType.MERIT,       10 },
            { invaderXim.effect.ABYSSEA_MP,  invaderXim.effect.MAX_MP_BOOST, 10, invaderXim.abyssea.abyssiteType.MERIT,        5 },
            { invaderXim.effect.ABYSSEA_STR, invaderXim.effect.STR_BOOST,    10, invaderXim.abyssea.abyssiteType.FURTHERANCE, 10 },
            { invaderXim.effect.ABYSSEA_DEX, invaderXim.effect.DEX_BOOST,    10, invaderXim.abyssea.abyssiteType.FURTHERANCE, 10 },
            { invaderXim.effect.ABYSSEA_VIT, invaderXim.effect.VIT_BOOST,    10, invaderXim.abyssea.abyssiteType.FURTHERANCE, 10 },
            { invaderXim.effect.ABYSSEA_AGI, invaderXim.effect.AGI_BOOST,    10, invaderXim.abyssea.abyssiteType.FURTHERANCE, 10 },
            { invaderXim.effect.ABYSSEA_INT, invaderXim.effect.INT_BOOST,    10, invaderXim.abyssea.abyssiteType.FURTHERANCE, 10 },
            { invaderXim.effect.ABYSSEA_CHR, invaderXim.effect.CHR_BOOST,    10, invaderXim.abyssea.abyssiteType.FURTHERANCE, 10 },
            { invaderXim.effect.ABYSSEA_MND, invaderXim.effect.MND_BOOST,    10, invaderXim.abyssea.abyssiteType.FURTHERANCE, 10 },
        },

        470,
    },
}

-- Sequential Abyssite Key Items.
-- NOTE: Demilune is not sequential, and handled in a separate table
local abyssiteKeyItems =
{
--   Type                                      Beginning KI                            Ending KI
    [invaderXim.abyssea.abyssiteType.SOJOURN     ] = { invaderXim.ki.IVORY_ABYSSITE_OF_SOJOURN,        invaderXim.ki.EMERALD_ABYSSITE_OF_SOJOURN    },
    [invaderXim.abyssea.abyssiteType.CELERITY    ] = { invaderXim.ki.AZURE_ABYSSITE_OF_CELERITY,       invaderXim.ki.IVORY_ABYSSITE_OF_CELERITY     },
    [invaderXim.abyssea.abyssiteType.AVARICE     ] = { invaderXim.ki.VIRIDIAN_ABYSSITE_OF_AVARICE,     invaderXim.ki.VERMILLION_ABYSSITE_OF_AVARICE },
    [invaderXim.abyssea.abyssiteType.CONFLUENCE  ] = { invaderXim.ki.IVORY_ABYSSITE_OF_CONFLUENCE,     invaderXim.ki.INDIGO_ABYSSITE_OF_CONFLUENCE  },
    [invaderXim.abyssea.abyssiteType.EXPERTISE   ] = { invaderXim.ki.IVORY_ABYSSITE_OF_EXPERTISE,      invaderXim.ki.EMERALD_ABYSSITE_OF_EXPERTISE  },
    [invaderXim.abyssea.abyssiteType.FORTUNE     ] = { invaderXim.ki.IVORY_ABYSSITE_OF_FORTUNE,        invaderXim.ki.EMERALD_ABYSSITE_OF_FORTUNE    },
    [invaderXim.abyssea.abyssiteType.KISMET      ] = { invaderXim.ki.SCARLET_ABYSSITE_OF_KISMET,       invaderXim.ki.VERMILLION_ABYSSITE_OF_KISMET  },
    [invaderXim.abyssea.abyssiteType.PROSPERITY  ] = { invaderXim.ki.AZURE_ABYSSITE_OF_PROSPERITY,     invaderXim.ki.IVORY_ABYSSITE_OF_PROSPERITY   },
    [invaderXim.abyssea.abyssiteType.DESTINY     ] = { invaderXim.ki.VIRIDIAN_ABYSSITE_OF_DESTINY,     invaderXim.ki.IVORY_ABYSSITE_OF_DESTINY      },
    [invaderXim.abyssea.abyssiteType.ACUMEN      ] = { invaderXim.ki.IVORY_ABYSSITE_OF_ACUMEN,         invaderXim.ki.EMERALD_ABYSSITE_OF_ACUMEN     },
    [invaderXim.abyssea.abyssiteType.LENITY      ] = { invaderXim.ki.SCARLET_ABYSSITE_OF_LENITY,       invaderXim.ki.EMERALD_ABYSSITE_OF_LENITY     },
    [invaderXim.abyssea.abyssiteType.PERSPICACITY] = { invaderXim.ki.SCARLET_ABYSSITE_OF_PERSPICACITY, invaderXim.ki.VERM_ABYSSITE_OF_PERSPICACITY  },
    [invaderXim.abyssea.abyssiteType.THE_REAPER  ] = { invaderXim.ki.AZURE_ABYSSITE_OF_THE_REAPER,     invaderXim.ki.INDIGO_ABYSSITE_OF_THE_REAPER  },
    [invaderXim.abyssea.abyssiteType.GUERDON     ] = { invaderXim.ki.VIRIDIAN_ABYSSITE_OF_GUERDON,     invaderXim.ki.VERMILLION_ABYSSITE_OF_GUERDON },
    [invaderXim.abyssea.abyssiteType.FURTHERANCE ] = { invaderXim.ki.SCARLET_ABYSSITE_OF_FURTHERANCE,  invaderXim.ki.IVORY_ABYSSITE_OF_FURTHERANCE  },
    [invaderXim.abyssea.abyssiteType.MERIT       ] = { invaderXim.ki.AZURE_ABYSSITE_OF_MERIT,          invaderXim.ki.INDIGO_ABYSSITE_OF_MERIT       },
    [invaderXim.abyssea.abyssiteType.LUNAR       ] = { invaderXim.ki.LUNAR_ABYSSITE1,                  invaderXim.ki.LUNAR_ABYSSITE3                },
    [invaderXim.abyssea.abyssiteType.DISCERNMENT ] = { invaderXim.ki.ABYSSITE_OF_DISCERNMENT,          invaderXim.ki.ABYSSITE_OF_DISCERNMENT        },
    [invaderXim.abyssea.abyssiteType.COSMOS      ] = { invaderXim.ki.ABYSSITE_OF_THE_COSMOS,           invaderXim.ki.ABYSSITE_OF_THE_COSMOS         },
}

local demiluneKeyItems =
{
    invaderXim.ki.CLEAR_DEMILUNE_ABYSSITE,
    invaderXim.ki.COLORFUL_DEMILUNE_ABYSSITE,
    invaderXim.ki.SCARLET_DEMILUNE_ABYSSITE,
    invaderXim.ki.AZURE_DEMILUNE_ABYSSITE,
    invaderXim.ki.VIRIDIAN_DEMILUNE_ABYSSITE,
    invaderXim.ki.JADE_DEMILUNE_ABYSSITE,
    invaderXim.ki.SAPPHIRE_DEMILUNE_ABYSSITE,
    invaderXim.ki.CRIMSON_DEMILUNE_ABYSSITE,
    invaderXim.ki.EMERALD_DEMILUNE_ABYSSITE,
    invaderXim.ki.VERMILLION_DEMILUNE_ABYSSITE,
    invaderXim.ki.INDIGO_DEMILUNE_ABYSSITE,
}

invaderXim.abyssea.mob =
{
    -- Abyssea - Konschtat (zone 15)
    ['Alkonost']           = { ['Atma'] = { invaderXim.ki.ATMA_OF_GALES                }, ['Normal'] = { invaderXim.ki.TATTERED_HIPPOGRYPH_WING     } },
    ['Arimaspi']           = { ['Atma'] = {                                    }, ['Normal'] = { invaderXim.ki.MUCID_AHRIMAN_EYEBALL        } },
    ['Balaur']             = { ['Atma'] = { invaderXim.ki.ATMA_OF_STORMBREATH          }, ['Normal'] = {                                    } },
    ['Bloodeye_Vileberry'] = { ['Atma'] = { invaderXim.ki.ATMA_OF_CLOAK_AND_DAGGER     }, ['Normal'] = {                                    } },
    ['Clingy_Clare']       = { ['Atma'] = {                                    }, ['Normal'] = { invaderXim.ki.DECAYING_MORBOL_TOOTH        } },
    ['Eccentric_Eve']      = { ['Atma'] = { invaderXim.ki.ATMA_OF_THE_VORACIOUS_VIOLET }, ['Normal'] = {                                    } },
    ['Fear_Gorta']         = { ['Atma'] = {                                    }, ['Normal'] = { invaderXim.ki.AZURE_ABYSSITE_OF_THE_REAPER } },
    ['Fistule']            = { ['Atma'] = { invaderXim.ki.ATMA_OF_VICISSITUDE          }, ['Normal'] = { invaderXim.ki.TURBID_SLIME_OIL             } },
    ['Gangly_Gean']        = { ['Atma'] = {                                    }, ['Normal'] = { invaderXim.ki.FRAGRANT_TREANT_PETAL        } },
    ['Keratyrannos']       = { ['Atma'] = {                                    }, ['Normal'] = { invaderXim.ki.CRACKED_WIVRE_HORN           } },
    ['Khalamari']          = { ['Atma'] = { invaderXim.ki.ATMA_OF_THE_DRIFTER          }, ['Normal'] = {                                    } },
    ['Kukulkan']           = { ['Atma'] = { invaderXim.ki.ATMA_OF_THE_NOXIOUS_FANG     }, ['Normal'] = { invaderXim.ki.VENOMOUS_PEISTE_CLAW         } },
    ['Pavan']              = { ['Atma'] = {                                    }, ['Normal'] = { invaderXim.ki.AZURE_ABYSSITE_OF_LENITY     } },
    ['Raskovnik']          = { ['Atma'] = { invaderXim.ki.ATMA_OF_THRASHING_TENDRILS   }, ['Normal'] = { invaderXim.ki.FETID_RAFFLESIA_STALK        } },
    ['Tonberry_Lieje']     = { ['Atma'] = {                                    }, ['Normal'] = { invaderXim.ki.TWISTED_TONBERRY_CROWN       } },
    ['Turul']              = { ['Atma'] = { invaderXim.ki.ATMA_OF_THE_STORMBIRD        }, ['Normal'] = {                                    } },
    ['Hadal_Satiator']     = { ['Atma'] = { invaderXim.ki.ATMA_OF_THE_BEYOND           }, ['Normal'] = {                                    } },

    -- Abyssea - Tahrongi (zone 45)
    ['Adze']            = { ['Atma'] = { invaderXim.ki.ATMA_OF_CALAMITY         }, ['Normal'] = { invaderXim.ki.STICKY_GNAT_WING             } },
    ['Alectryon']       = { ['Atma'] = {                                }, ['Normal'] = { invaderXim.ki.FAT_LINED_COCKATRICE_SKIN    } },
    ['Bhumi']           = { ['Atma'] = {                                }, ['Normal'] = { invaderXim.ki.VIRIDIAN_ABYSSITE_OF_MERIT   } },
    ['Chloris']         = { ['Atma'] = { invaderXim.ki.ATMA_OF_THE_HARVESTER    }, ['Normal'] = { invaderXim.ki.OVERGROWN_MANDRAGORA_FLOWER  } },
    ['Chukwa']          = { ['Atma'] = { invaderXim.ki.ATMA_OF_THE_ADAMANTINE   }, ['Normal'] = { invaderXim.ki.MOSSY_ADAMANTOISE_SHELL      } },
    ['Cuelebre']        = { ['Atma'] = { invaderXim.ki.ATMA_OF_THE_CLAW         }, ['Normal'] = { invaderXim.ki.VIRIDIAN_ABYSSITE_OF_DESTINY } },
    ['Glavoid']         = { ['Atma'] = { invaderXim.ki.ATMA_OF_DUNES            }, ['Normal'] = { invaderXim.ki.CHIPPED_SANDWORM_TOOTH       } },
    ['Hedetet']         = { ['Atma'] = {                                }, ['Normal'] = { invaderXim.ki.GORY_SCORPION_CLAW           } },
    ['Iratham']         = { ['Atma'] = { invaderXim.ki.ATMA_OF_THE_COSMOS       }, ['Normal'] = {                                    } },
    ['Lacovie']         = { ['Atma'] = { invaderXim.ki.ATMA_OF_THE_STRONGHOLD   }, ['Normal'] = {                                    } },
    ['Manananggal']     = { ['Atma'] = {                                }, ['Normal'] = { invaderXim.ki.VIRIDIAN_ABYSSITE_OF_DESTINY } },
    ['Mictlantecuhtli'] = { ['Atma'] = { invaderXim.ki.ATMA_OF_BALEFUL_BONES    }, ['Normal'] = { invaderXim.ki.VIRIDIAN_ABYSSITE_OF_MERIT   } },
    ['Minhocao']        = { ['Atma'] = {                                }, ['Normal'] = { invaderXim.ki.SODDEN_SANDWORM_HUSK         } },
    ['Muscaliet']       = { ['Atma'] = {                                }, ['Normal'] = { invaderXim.ki.LUXURIANT_MANTICORE_MANE     } },
    ['Myrmecoleon']     = { ['Atma'] = { invaderXim.ki.ATMA_OF_THE_IMPALER      }, ['Normal'] = {                                    } },
    ['Ophanim']         = { ['Atma'] = {                                }, ['Normal'] = { invaderXim.ki.VEINOUS_HECTEYES_EYELID      } },
    ['Quetzalli']       = { ['Atma'] = {                                }, ['Normal'] = { invaderXim.ki.VIRIDIAN_ABYSSITE_OF_AVARICE } },
    ['Treble_Noctules'] = { ['Atma'] = {                                }, ['Normal'] = { invaderXim.ki.TORN_BAT_WING                } },
    ['Usurper']         = { ['Atma'] = { invaderXim.ki.ATMA_OF_THE_SIREN_SHADOW }, ['Normal'] = {                                    } },

    -- Abyssea - La Theine (zone 132)
    ['Adamastor']           = { ['Atma'] = {                                }, ['Normal'] = { invaderXim.ki.DENTED_GIGAS_SHIELD              } },
    ['Baba_Yaga']           = { ['Atma'] = {                                }, ['Normal'] = { invaderXim.ki.SHIMMERING_PIXIE_PINION          } },
    ['Briareus']            = { ['Atma'] = { invaderXim.ki.ATMA_OF_THE_STOUT_ARM    }, ['Normal'] = { invaderXim.ki.BLOOD_SMEARED_GIGAS_HELM         } },
    ['Carabosse']           = { ['Atma'] = { invaderXim.ki.ATMA_OF_ALLURE           }, ['Normal'] = { invaderXim.ki.GLITTERING_PIXIE_CHOKER          } },
    ['Chasmic_Hornet']      = { ['Atma'] = {                                }, ['Normal'] = { invaderXim.ki.SCARLET_ABYSSITE_OF_PERSPICACITY } },
    ['Dozing_Dorian']       = { ['Atma'] = { invaderXim.ki.ATMA_OF_THE_EBON_HOOF    }, ['Normal'] = {                                        } },
    ['Grandgousier']        = { ['Atma'] = {                                }, ['Normal'] = { invaderXim.ki.SEVERED_GIGAS_COLLAR             } },
    ['Hadhayosh']           = { ['Atma'] = { invaderXim.ki.ATMA_OF_THE_LION         }, ['Normal'] = {                                        } },
    ['Karkinos']            = { ['Atma'] = { invaderXim.ki.ATMA_OF_THE_TWIN_CLAW    }, ['Normal'] = {                                        } },
    ['La_Theine_Liege']     = { ['Atma'] = {                                }, ['Normal'] = { invaderXim.ki.PELLUCID_FLY_EYE                 } },
    ['Lugarhoo']            = { ['Atma'] = { invaderXim.ki.ATMA_OF_THE_BAYING_MOON  }, ['Normal'] = {                                        } },
    ['Mangy-tailed_Marvin'] = { ['Atma'] = {                                }, ['Normal'] = { invaderXim.ki.SCARLET_ABYSSITE_OF_LENITY       } },
    ['Megamaw_Mikey']       = { ['Atma'] = { invaderXim.ki.ATMA_OF_TREMORS          }, ['Normal'] = {                                        } },
    ['Megantereon']         = { ['Atma'] = { invaderXim.ki.ATMA_OF_THE_SAVAGE_TIGER }, ['Normal'] = { invaderXim.ki.BLOODIED_SABER_TOOTH             } },
    ['Nahn']                = { ['Atma'] = {                                }, ['Normal'] = { invaderXim.ki.SMOLDERING_CRAB_SHELL            } },
    ['Ovni']                = { ['Atma'] = { invaderXim.ki.ATMA_OF_THE_HEAVENS      }, ['Normal'] = { invaderXim.ki.SCARLET_ABYSSITE_OF_SOJOURN      } },
    ['Pantagruel']          = { ['Atma'] = {                                }, ['Normal'] = { invaderXim.ki.WARPED_GIGAS_ARMBAND             } },
    ['Trudging_Thomas']     = { ['Atma'] = {                                }, ['Normal'] = { invaderXim.ki.MARBLED_MUTTON_CHOP              } },
    ['Ruminator']           = { ['Atma'] = { invaderXim.ki.ATMA_OF_ETERNITY         }, ['Normal'] = {                                        } },

    -- Abyssea - Attohwa (zone 215)
    ['Amun']          = { ['Atma'] = {                                     }, ['Normal'] = { invaderXim.ki.SHRIVELED_HECTEYES_STALK   } },
    ['Berstuk']       = { ['Atma'] = { invaderXim.ki.ATMA_OF_THE_GLUTINOUS_OOZE    }, ['Normal'] = {                                  } },
    ['Blazing_Eruca'] = { ['Atma'] = {                                     }, ['Normal'] = { invaderXim.ki.BULBOUS_CRAWLER_COCOON     } },
    ['Drekavac']      = { ['Atma'] = {                                     }, ['Normal'] = { invaderXim.ki.WRITHING_GHOST_FINGER      } },
    ['Gaizkin']       = { ['Atma'] = {                                     }, ['Normal'] = { invaderXim.ki.BLOTCHED_DOOMED_TONGUE     } },
    ['Gieremund']     = { ['Atma'] = {                                     }, ['Normal'] = { invaderXim.ki.RUSTED_HOUND_COLLAR        } },
    ['Granite_Borer'] = { ['Atma'] = {                                     }, ['Normal'] = { invaderXim.ki.VENOMOUS_WAMOURA_FEELER    } },
    ['Itzpapalotl']   = { ['Atma'] = { invaderXim.ki.ATMA_OF_THE_CLAWED_BUTTERFLY  }, ['Normal'] = {                                  } },
    ['Kampe']         = { ['Atma'] = { invaderXim.ki.ATMA_OF_THE_GOLDEN_CLAW       }, ['Normal'] = {                                  } },
    ['Kharon']        = { ['Atma'] = {                                     }, ['Normal'] = { invaderXim.ki.CRACKED_SKELETON_CLAVICLE  } },
    ['Maahes']        = { ['Atma'] = { invaderXim.ki.ATMA_OF_THE_LIGHTNING_BEAST   }, ['Normal'] = {                                  } },
    ['Mielikki']      = { ['Atma'] = {                                     }, ['Normal'] = { invaderXim.ki.JADE_ABYSSITE_OF_SOJOURN   } },
    ['Nightshade']    = { ['Atma'] = { invaderXim.ki.ATMA_OF_THE_NOXIOUS_BLOOM     }, ['Normal'] = {                                  } },
    ['Pallid_Percy']  = { ['Atma'] = {                                     }, ['Normal'] = { invaderXim.ki.MUCID_WORM_SEGMENT         } },
    ['Smok']          = { ['Atma'] = { invaderXim.ki.ATMA_OF_THE_SMOLDERING_SKY    }, ['Normal'] = {                                  } },
    ['Svarbhanu']     = { ['Atma'] = {                                     }, ['Normal'] = { invaderXim.ki.HOLLOW_DRAGON_EYE          } },
    ['Titlacauan']    = { ['Atma'] = { invaderXim.ki.ATMA_OF_THE_UNDYING           }, ['Normal'] = {                                  } },
    ['Tunga']         = { ['Atma'] = {                                     }, ['Normal'] = { invaderXim.ki.DISTENDED_CHIGOE_ABDOMEN   } },
    ['Ulhuadshi']     = { ['Atma'] = { invaderXim.ki.ATMA_OF_THE_DESERT_WORM       }, ['Normal'] = {                                  } },
    ['Warbler']       = { ['Atma'] = {                                     }, ['Normal'] = { invaderXim.ki.JADE_ABYSSITE_OF_MERIT     } },
    ['Wherwetrice']   = { ['Atma'] = {                                     }, ['Normal'] = { invaderXim.ki.JADE_ABYSSITE_OF_EXPERTISE } },
    ['Yaanei']        = { ['Atma'] = { invaderXim.ki.ATMA_OF_THE_IMPREGNABLE_TOWER }, ['Normal'] = {                                  } },
    ['Lusca']         = { ['Atma'] = { invaderXim.ki.ATMA_OF_THE_DEMONIC_SKEWER    }, ['Normal'] = {                                  } },

    -- Abyssea - Misareaux (zone 216)
    ['Abyssic_Cluster']     = { ['Atma'] = {                                     }, ['Normal'] = { invaderXim.ki.BLAZING_CLUSTER_SOUL             } },
    ['Amhuluk']             = { ['Atma'] = { invaderXim.ki.ATMA_OF_THE_STRANGLING_WIND   }, ['Normal'] = {                                        } },
    ['Asanbosam']           = { ['Atma'] = {                                     }, ['Normal'] = { invaderXim.ki.BLOODIED_BAT_FUR                 } },
    ['Avalerion']           = { ['Atma'] = { invaderXim.ki.ATMA_OF_THE_WINGED_ENIGMA     }, ['Normal'] = {                                        } },
    ['Cep-Kamuy']           = { ['Atma'] = {                                     }, ['Normal'] = { invaderXim.ki.GLISTENING_OROBON_LIVER          } },
    ['Cirein-croin']        = { ['Atma'] = { invaderXim.ki.ATMA_OF_THE_DEEP_DEVOURER     }, ['Normal'] = {                                        } },
    ['Flame_Skimmer']       = { ['Atma'] = {                                     }, ['Normal'] = { invaderXim.ki.SAPPHIRE_ABYSSITE_OF_FURTHERANCE } },
    ['Funereal_Apkallu']    = { ['Atma'] = {                                     }, ['Normal'] = { invaderXim.ki.JAGGED_APKALLU_BEAK              } },
    ['Gukumatz']            = { ['Atma'] = {                                     }, ['Normal'] = { invaderXim.ki.MOLTED_PEISTE_SKIN               } },
    ['Heqet']               = { ['Atma'] = {                                     }, ['Normal'] = { invaderXim.ki.DOFFED_POROGGO_HAT               } },
    ['Ironclad_Observer']   = { ['Atma'] = {                                     }, ['Normal'] = { invaderXim.ki.SCALDING_IRONCLAD_SPIKE          } },
    ['Ironclad_Pulverizer'] = { ['Atma'] = { invaderXim.ki.ATMA_OF_THE_RAZED_RUINS       }, ['Normal'] = {                                        } },
    ['Karkatakam']          = { ['Atma'] = { invaderXim.ki.ATMA_OF_THE_CRADLE            }, ['Normal'] = {                                        } },
    ['Kutharei']            = { ['Atma'] = { invaderXim.ki.ATMA_OF_THE_MOUNTED_CHAMPION  }, ['Normal'] = {                                        } },
    ['Manohra']             = { ['Atma'] = {                                     }, ['Normal'] = { invaderXim.ki.CLIPPED_BIRD_WING                } },
    ['Minax_Bugard']        = { ['Atma'] = {                                     }, ['Normal'] = { invaderXim.ki.BLOODSTAINED_BUGARD_FANG         } },
    ['Nehebkau']            = { ['Atma'] = { invaderXim.ki.ATMA_OF_THE_RAPID_REPTILIAN   }, ['Normal'] = {                                        } },
    ['Nonno']               = { ['Atma'] = { invaderXim.ki.ATMA_OF_THE_UNTOUCHED         }, ['Normal'] = {                                        } },
    ['Npfundlwa']           = { ['Atma'] = {                                     }, ['Normal'] = { invaderXim.ki.SAPPHIRE_ABYSSITE_OF_FORTUNE     } },
    ['Sirrush']             = { ['Atma'] = {                                     }, ['Normal'] = { invaderXim.ki.GNARLED_LIZARD_NAIL              } },
    ['Sobek']               = { ['Atma'] = { invaderXim.ki.ATMA_OF_THE_GNARLED_HORN      }, ['Normal'] = {                                        } },
    ['Tuskertrap']          = { ['Atma'] = {                                     }, ['Normal'] = { invaderXim.ki.SAPPHIRE_ABYSSITE_OF_LENITY      } },
    ['Tristitia']           = { ['Atma'] = { invaderXim.ki.ATMA_OF_THE_BLUDGEONING_BRUTE }, ['Normal'] = {                                        } },

    -- Abyssea - Vunkerl (zone 217)
    ['Armillaria']             = { ['Atma'] = {                                       }, ['Normal'] = { invaderXim.ki.CRIMSON_ABYSSITE_OF_ACUMEN     } },
    ['Ayravata']               = { ['Atma'] = {                                       }, ['Normal'] = { invaderXim.ki.MALODOROUS_MARID_FUR           } },
    ['Bukhis']                 = { ['Atma'] = { invaderXim.ki.ATMA_OF_THE_SANGUINE_SCYTHE     }, ['Normal'] = {                                      } },
    ['Chhir_Batti']            = { ['Atma'] = { invaderXim.ki.ATMA_OF_THE_MURKY_MIASMA        }, ['Normal'] = {                                      } },
    ['Div-e_Sepid']            = { ['Atma'] = {                                       }, ['Normal'] = { invaderXim.ki.CHIPPED_IMPS_OLIFANT           } },
    ['Durinn']                 = { ['Atma'] = { invaderXim.ki.ATMA_OF_THE_MINIKIN_MONSTROSITY }, ['Normal'] = {                                      } },
    ['Dvalinn']                = { ['Atma'] = {                                       }, ['Normal'] = { invaderXim.ki.DECAYED_DVERGR_TOOTH           } },
    ['Hanuman']                = { ['Atma'] = { invaderXim.ki.ATMA_OF_THE_AVARICIOUS_APE      }, ['Normal'] = {                                      } },
    ['Hrosshvalur']            = { ['Atma'] = {                                       }, ['Normal'] = { invaderXim.ki.SHIMMERING_PUGIL_SCALE         } },
    ['Iktomi']                 = { ['Atma'] = {                                       }, ['Normal'] = { invaderXim.ki.CRIMSON_ABYSSITE_OF_DESTINY    } },
    ['Iku-Turso']              = { ['Atma'] = {                                       }, ['Normal'] = { invaderXim.ki.GLOSSY_SEA_MONK_SUCKER         } },
    ['Kadraeth_the_Hatespawn'] = { ['Atma'] = {                                       }, ['Normal'] = { invaderXim.ki.PULSATING_SOULFLAYER_BEARD     } },
    ['Karkadann']              = { ['Atma'] = { invaderXim.ki.ATMA_OF_THE_BLINDING_HORN       }, ['Normal'] = {                                      } },
    ['Khalkotaur']             = { ['Atma'] = {                                       }, ['Normal'] = { invaderXim.ki.INGROWN_TAURUS_NAIL            } },
    ['Lord_Varney']            = { ['Atma'] = {                                       }, ['Normal'] = { invaderXim.ki.IMBRUED_VAMPYR_FANG            } },
    ['Pascerpot']              = { ['Atma'] = {                                       }, ['Normal'] = { invaderXim.ki.CRIMSON_ABYSSITE_OF_CONFLUENCE } },
    ['Quasimodo']              = { ['Atma'] = {                                       }, ['Normal'] = { invaderXim.ki.OSSIFIED_GARGOUILLE_HAND       } },
    ['Rakshas']                = { ['Atma'] = {                                       }, ['Normal'] = { invaderXim.ki.WARPED_SMILODON_CHOKER         } },
    ['Seps']                   = { ['Atma'] = { invaderXim.ki.ATMA_OF_APPARITIONS             }, ['Normal'] = {                                      } },
    ['Sedna']                  = { ['Atma'] = { invaderXim.ki.ATMA_OF_THE_TUSKED_TERROR       }, ['Normal'] = {                                      } },
    ['Sippoy']                 = { ['Atma'] = { invaderXim.ki.ATMA_OF_THE_WOULD_BE_KING       }, ['Normal'] = {                                      } },
    ['Xan']                    = { ['Atma'] = { invaderXim.ki.ATMA_OF_THE_SHIMMERING_SHELL    }, ['Normal'] = {                                      } },
    ['Ketea']                  = { ['Atma'] = { invaderXim.ki.ATMA_OF_THE_DEMONIC_LASH        }, ['Normal'] = {                                      } },

    -- Abyssea - Altepa (zone 218)
    ['Amarok']                = { ['Atma'] = { invaderXim.ki.ATMA_OF_THE_LONE_WOLF           }, ['Normal'] = { invaderXim.ki.STEAMING_CERBERUS_TONGUE                               } },
    ['Bennu']                 = { ['Atma'] = { invaderXim.ki.ATMA_OF_THE_ASCENDING_ONE       }, ['Normal'] = {                                                              } },
    ['Cuijatender']           = { ['Atma'] = { invaderXim.ki.ATMA_OF_A_THOUSAND_NEEDLES      }, ['Normal'] = {                                                              } },
    ['Dragua']                = { ['Atma'] = { invaderXim.ki.ATMA_OF_THE_EARTH_WYRM          }, ['Normal'] = {                                                              } },
    ['Emperador_de_Altepa']   = { ['Atma'] = { invaderXim.ki.ATMA_OF_THE_SAND_EMPEROR        }, ['Normal'] = {                                                              } },
    ['Hazhdiha']              = { ['Atma'] = { invaderXim.ki.ATMA_OF_THE_CRIMSON_SCALE       }, ['Normal'] = { invaderXim.ki.BLOODIED_DRAGON_EAR                                    } },
    ['Hedjedjet']             = { ['Atma'] = { invaderXim.ki.ATMA_OF_THE_SCORPION_QUEEN      }, ['Normal'] = {                                                              } },
    ['Ironclad_Smiter']       = { ['Atma'] = { invaderXim.ki.ATMA_OF_THE_SMITING_BLOW        }, ['Normal'] = { invaderXim.ki.BROKEN_IRON_GIANT_SPIKE                                } },
    ['Long-Barreled_Chariot'] = { ['Atma'] = {                                       }, ['Normal'] = { invaderXim.ki.RUSTED_CHARIOT_GEAR, invaderXim.ki.EMERALD_ABYSSITE_OF_FORTUNE } },
    ['Orthrus']               = { ['Atma'] = { invaderXim.ki.ATMA_OF_THE_BROTHER_WOLF        }, ['Normal'] = {                                                              } },
    ['Ouzelum']               = { ['Atma'] = { invaderXim.ki.ATMA_OF_THE_SCARLET_WING        }, ['Normal'] = { invaderXim.ki.RESPLENDENT_ROC_QUILL                                  } },
    ['Rani']                  = { ['Atma'] = { invaderXim.ki.ATMA_OF_THE_MERCILESS_MATRIARCH }, ['Normal'] = {                                                              } },
    ['Shaula']                = { ['Atma'] = { invaderXim.ki.ATMA_OF_THE_RAISED_TAIL         }, ['Normal'] = {                                                              } },
    ['Waugyl']                = { ['Atma'] = {                                       }, ['Normal'] = { invaderXim.ki.EMERALD_ABYSSITE_OF_SOJOURN                            } },
    ['Koios']                 = { ['Atma'] = {                                       }, ['Normal'] = { invaderXim.ki.EMERALD_ABYSSITE_OF_ACUMEN                             } },
    ['Brulo']                 = { ['Atma'] = { invaderXim.ki.ATMA_OF_THE_BURNING_EFFIGY      }, ['Normal'] = {                                                              } },

    -- Abyssea - Uleguerand (zone 253)
    ['Apademak']              = { ['Atma'] = { invaderXim.ki.ATMA_OF_THE_WAR_LION            }, ['Normal'] = {                                                                  } },
    ['Awahondo']              = { ['Atma'] = { invaderXim.ki.ATMA_OF_THE_PERSISTENT_PREDATOR }, ['Normal'] = { invaderXim.ki.DECAYING_DIREMITE_FANG                                     } },
    ['Blanga']                = { ['Atma'] = { invaderXim.ki.ATMA_OF_THE_STONE_GOD           }, ['Normal'] = {                                                                  } },
    ['Dhorme_Khimaira']       = { ['Atma'] = { invaderXim.ki.ATMA_OF_PURGATORY               }, ['Normal'] = { invaderXim.ki.TORN_KHIMAIRA_WING                                         } },
    ['Empousa']               = { ['Atma'] = { invaderXim.ki.ATMA_OF_THE_SHRIEKING_ONE       }, ['Normal'] = {                                                                  } },
    ['Impervious_Chariot']    = { ['Atma'] = {                                       }, ['Normal'] = { invaderXim.ki.DENTED_CHARIOT_SHIELD, invaderXim.ki.VERMILLION_ABYSSITE_OF_KISMET } },
    ['Indrik']                = { ['Atma'] = { invaderXim.ki.ATMA_OF_THE_HOLY_MOUNTAIN       }, ['Normal'] = {                                                                  } },
    ['Ironclad_Triturator']   = { ['Atma'] = { invaderXim.ki.ATMA_OF_THE_CRUSHING_CUDGEL     }, ['Normal'] = { invaderXim.ki.WARPED_IRON_GIANT_NAIL                                     } },
    ['Isgebind']              = { ['Atma'] = { invaderXim.ki.ATMA_OF_THE_FROZEN_FETTERS      }, ['Normal'] = {                                                                  } },
    ['Kur']                   = { ['Atma'] = { invaderXim.ki.ATMA_OF_BLIGHTED_BREATH         }, ['Normal'] = { invaderXim.ki.BEGRIMED_DRAGON_HIDE                                       } },
    ['Pantokrator']           = { ['Atma'] = { invaderXim.ki.ATMA_OF_THE_OMNIPOTENT          }, ['Normal'] = {                                                                  } },
    ['Resheph']               = { ['Atma'] = { invaderXim.ki.ATMA_OF_THE_PLAGUEBRINGER       }, ['Normal'] = {                                                                  } },
    ['Veri_Selen']            = { ['Atma'] = {                                       }, ['Normal'] = { invaderXim.ki.VERMILLION_ABYSSITE_OF_GUERDON                             } },
    ['Yaguarogui']            = { ['Atma'] = { invaderXim.ki.ATMA_OF_THE_SUN_EATER           }, ['Normal'] = {                                                                  } },
    ['Chione']                = { ['Atma'] = {                                       }, ['Normal'] = { invaderXim.ki.VERM_ABYSSITE_OF_PERSPICACITY                              } },
    ['Ogopogo']               = { ['Atma'] = { invaderXim.ki.ATMA_OF_THE_LAKE_LURKER         }, ['Normal'] = {                                                                  } },

    -- Abyssea - Grauberg (zone 254)
    ['Alfard']                  = { ['Atma'] = { invaderXim.ki.ATMA_OF_THE_SOLITARY_ONE      }, ['Normal'] = {                                                             } },
    ['Amphitrite']              = { ['Atma'] = { invaderXim.ki.ATMA_OF_THE_SEA_DAUGHTER      }, ['Normal'] = {                                                             } },
    ['Assailer_Chariot']        = { ['Atma'] = {                                     }, ['Normal'] = { invaderXim.ki.WARPED_CHARIOT_PLATE, invaderXim.ki.IVORY_ABYSSITE_OF_SOJOURN } },
    ['Azdaja']                  = { ['Atma'] = { invaderXim.ki.ATMA_OF_THE_WINGED_GLOOM      }, ['Normal'] = {                                                             } },
    ['Bomblix_Flamefinger']     = { ['Atma'] = { invaderXim.ki.ATMA_OF_FIRES_AND_FLARES      }, ['Normal'] = {                                                             } },
    ['Deelgeed']                = { ['Atma'] = { invaderXim.ki.ATMA_OF_THE_HORNED_BEAST      }, ['Normal'] = { invaderXim.ki.VACANT_BUGARD_EYE                                     } },
    ['Fleshflayer_Killakriq']   = { ['Atma'] = { invaderXim.ki.ATMA_OF_THE_FOE_FLAYER        }, ['Normal'] = {                                                             } },
    ['Fuath']                   = { ['Atma'] = { invaderXim.ki.ATMA_OF_THE_HATEFUL_STREAM    }, ['Normal'] = {                                                             } },
    ['Ironclad_Sunderer']       = { ['Atma'] = { invaderXim.ki.ATMA_OF_THE_SUNDERING_SLASH   }, ['Normal'] = { invaderXim.ki.SHATTERED_IRON_GIANT_CHAIN                            } },
    ['Melo_Melo']               = { ['Atma'] = { invaderXim.ki.ATMA_OF_AQUATIC_ARDOR         }, ['Normal'] = { invaderXim.ki.VARIEGATED_URAGNITE_SHELL                             } },
    ['Ningishzida']             = { ['Atma'] = { invaderXim.ki.ATMA_OF_ENTWINED_SERPENTS     }, ['Normal'] = { invaderXim.ki.VENOMOUS_HYDRA_FANG                                   } },
    ['Raja']                    = { ['Atma'] = { invaderXim.ki.ATMA_OF_THE_DESPOT            }, ['Normal'] = {                                                             } },
    ['Teugghia']                = { ['Atma'] = { invaderXim.ki.ATMA_OF_THE_FALLEN_ONE        }, ['Normal'] = {                                                             } },
    ['Xibalba']                 = { ['Atma'] = {                                     }, ['Normal'] = { invaderXim.ki.INDIGO_ABYSSITE_OF_MERIT                              } },
    ['Gamayun']                 = { ['Atma'] = {                                     }, ['Normal'] = { invaderXim.ki.INDIGO_ABYSSITE_OF_THE_REAPER                         } },
    ['Maere']                   = { ['Atma'] = { invaderXim.ki.ATMA_OF_THE_ENDLESS_NIGHTMARE }, ['Normal'] = {                                                             } },
}

invaderXim.abyssea.triggerType =
{
    RED    = 0,
    YELLOW = 1,
    BLUE   = 2,
}

invaderXim.abyssea.deathType =
{
    NONE        = 0,
    PHYSICAL    = 1,
    MAGICAL     = 2,
    WS_PHYSICAL = 3,
    WS_MAGICAL  = 4,
}

local redWeakness =
{
    invaderXim.weaponskill.SERAPH_BLADE,
    invaderXim.weaponskill.SERAPH_STRIKE,
    invaderXim.weaponskill.TACHI_KOKI,
    invaderXim.weaponskill.SUNBURST,
    invaderXim.weaponskill.ENERGY_DRAIN,
    invaderXim.weaponskill.BLADE_EI,
    invaderXim.weaponskill.SHADOW_OF_DEATH,
    invaderXim.weaponskill.RED_LOTUS_BLADE,
    invaderXim.weaponskill.EARTH_CRUSHER,
    invaderXim.weaponskill.CYCLONE,
    invaderXim.weaponskill.TACHI_JINPU,
    invaderXim.weaponskill.FREEZEBITE,
    invaderXim.weaponskill.RAIDEN_THRUST,
}

local yellowWeakness =
{
    [invaderXim.element.FIRE] =
    {
        invaderXim.magic.spell.FIRE_III,
        invaderXim.magic.spell.FIRE_IV,
        invaderXim.magic.spell.FIRAGA_III,
        invaderXim.magic.spell.FLARE,
        invaderXim.magic.spell.HEAT_BREATH,
        invaderXim.magic.spell.KATON_NI,
        invaderXim.magic.spell.ICE_THRENODY,
    },

    [invaderXim.element.ICE] =
    {
        invaderXim.magic.spell.BLIZZARD_III,
        invaderXim.magic.spell.BLIZZARD_IV,
        invaderXim.magic.spell.BLIZZAGA_III,
        invaderXim.magic.spell.FREEZE,
        invaderXim.magic.spell.ICE_BREAK,
        invaderXim.magic.spell.HYOTON_NI,
        invaderXim.magic.spell.WIND_THRENODY,
    },

    [invaderXim.element.WIND] =
    {
        invaderXim.magic.spell.AERO_III,
        invaderXim.magic.spell.AERO_IV,
        invaderXim.magic.spell.AEROGA_III,
        invaderXim.magic.spell.TORNADO,
        invaderXim.magic.spell.MYSTERIOUS_LIGHT,
        invaderXim.magic.spell.HUTON_NI,
        invaderXim.magic.spell.EARTH_THRENODY,
    },

    [invaderXim.element.EARTH] =
    {
        invaderXim.magic.spell.STONE_III,
        invaderXim.magic.spell.STONE_IV,
        invaderXim.magic.spell.STONEGA_III,
        invaderXim.magic.spell.QUAKE,
        invaderXim.magic.spell.MAGNETITE_CLOUD,
        invaderXim.magic.spell.DOTON_NI,
        invaderXim.magic.spell.LIGHTNING_THRENODY,
    },

    [invaderXim.element.THUNDER] =
    {
        invaderXim.magic.spell.THUNDER_III,
        invaderXim.magic.spell.THUNDER_IV,
        invaderXim.magic.spell.THUNDAGA_III,
        invaderXim.magic.spell.BURST,
        invaderXim.magic.spell.MIND_BLAST,
        invaderXim.magic.spell.RAITON_NI,
        invaderXim.magic.spell.WATER_THRENODY,
    },

    [invaderXim.element.WATER] =
    {
        invaderXim.magic.spell.WATER_III,
        invaderXim.magic.spell.WATER_IV,
        invaderXim.magic.spell.WATERGA_III,
        invaderXim.magic.spell.FLOOD,
        invaderXim.magic.spell.MAELSTROM,
        invaderXim.magic.spell.SUITON_NI,
        invaderXim.magic.spell.FIRE_THRENODY,
    },

    [invaderXim.element.LIGHT] =
    {
        invaderXim.magic.spell.BANISH_II,
        invaderXim.magic.spell.BANISH_III,
        invaderXim.magic.spell.BANISHGA,
        invaderXim.magic.spell.BANISHGA_II,
        invaderXim.magic.spell.HOLY,
        invaderXim.magic.spell.FLASH,
        invaderXim.magic.spell.RADIANT_BREATH,
        invaderXim.magic.spell.DARK_THRENODY,
    },

    [invaderXim.element.DARK] =
    {
        invaderXim.magic.spell.ASPIR,
        invaderXim.magic.spell.DRAIN,
        invaderXim.magic.spell.BIO_II,
        invaderXim.magic.spell.DISPEL,
        invaderXim.magic.spell.EYES_ON_ME,
        invaderXim.magic.spell.KURAYAMI_NI,
        invaderXim.magic.spell.LIGHT_THRENODY,
    },
}

local blueWeakness =
{
    -- Piercing: 0600 - 1400
    {
        invaderXim.weaponskill.SIDEWINDER,
        invaderXim.weaponskill.BLAST_ARROW,
        invaderXim.weaponskill.ARCHING_ARROW,
        invaderXim.weaponskill.EMPYREAL_ARROW,
        invaderXim.weaponskill.SLUG_SHOT,
        invaderXim.weaponskill.BLAST_SHOT,
        invaderXim.weaponskill.HEAVY_SHOT,
        invaderXim.weaponskill.DETONATOR,
        invaderXim.weaponskill.SHADOWSTITCH,
        invaderXim.weaponskill.DANCING_EDGE,
        invaderXim.weaponskill.SHARK_BITE,
        invaderXim.weaponskill.EVISCERATION,
        invaderXim.weaponskill.SKEWER,
        invaderXim.weaponskill.WHEELING_THRUST,
        invaderXim.weaponskill.IMPULSE_DRIVE,
    },

    -- Slashing: 1400 - 2200
    {
        invaderXim.weaponskill.VORPAL_BLADE,
        invaderXim.weaponskill.SWIFT_BLADE,
        invaderXim.weaponskill.SAVAGE_BLADE,
        invaderXim.weaponskill.BLADE_TEN,
        invaderXim.weaponskill.BLADE_KU,
        invaderXim.weaponskill.MISTRAL_AXE,
        invaderXim.weaponskill.DECIMATION,
        invaderXim.weaponskill.CROSS_REAPER,
        invaderXim.weaponskill.SPIRAL_HELL,
        invaderXim.weaponskill.FULL_BREAK,
        invaderXim.weaponskill.STEEL_CYCLONE,
        invaderXim.weaponskill.TACHI_GEKKO,
        invaderXim.weaponskill.TACHI_KASHA,
        invaderXim.weaponskill.SPINNING_SLASH,
        invaderXim.weaponskill.GROUND_STRIKE,
    },

    -- Blunt: 2200 - 0600
    {
        invaderXim.weaponskill.SKULLBREAKER,
        invaderXim.weaponskill.TRUE_STRIKE,
        invaderXim.weaponskill.JUDGMENT,
        invaderXim.weaponskill.HEXA_STRIKE,
        invaderXim.weaponskill.BLACK_HALO,
        invaderXim.weaponskill.RAGING_FISTS,
        invaderXim.weaponskill.SPINNING_ATTACK,
        invaderXim.weaponskill.HOWLING_FIST,
        invaderXim.weaponskill.DRAGON_KICK,
        invaderXim.weaponskill.ASURAN_FISTS,
        invaderXim.weaponskill.HEAVY_SWING,
        invaderXim.weaponskill.SHELL_CRUSHER,
        invaderXim.weaponskill.FULL_SWING,
        invaderXim.weaponskill.SPIRIT_TAKER,
        invaderXim.weaponskill.RETRIBUTION,
    },
}

-- [ZoneID] = { Required Trades Event, Has Key Items Event, Missing Key Item Event }
local popEvents =
{
    [invaderXim.zone.ABYSSEA_KONSCHTAT]        = { 1010, 1020, 1021 },
    [invaderXim.zone.ABYSSEA_TAHRONGI]         = { 1010, 1020, 1021 },
    [invaderXim.zone.ABYSSEA_LA_THEINE]        = { 1010, 1020, 1021 },
    [invaderXim.zone.ABYSSEA_ATTOHWA]          = { 1010, 1022, 1023 },
    [invaderXim.zone.ABYSSEA_MISAREAUX]        = { 1010, 1022, 1021 },
    [invaderXim.zone.ABYSSEA_VUNKERL]          = { 1010, 1015, 1120 },
    [invaderXim.zone.ABYSSEA_ALTEPA]           = { 1010, 1020, 1021 },
    [invaderXim.zone.ABYSSEA_ULEGUERAND]       = { 1010, 1020, 1025 },
    [invaderXim.zone.ABYSSEA_GRAUBERG]         = { 1010, 1020, 1021 },
    [invaderXim.zone.ABYSSEA_EMPYREAL_PARADOX] = { 1010, 1020, 1021 },
}

-----------------------------------
-- public functions
-----------------------------------

invaderXim.abyssea.visionsCruorProspectorOnTrigger = function(player, npc)
    local active = invaderXim.extravaganza.campaignActive()
    local cipher = 0
    local cruor = player:getCurrency('cruor')
    local demilune = invaderXim.abyssea.getDemiluneAbyssite(player)

    if
        active == invaderXim.extravaganza.campaign.SUMMER_NY or
        active == invaderXim.extravaganza.campaign.BOTH
    then
        cipher = 1
    end

    player:startEvent(2002, cruor, demilune, 0, 0, cipher)
end

invaderXim.abyssea.visionsCruorProspectorOnEventFinish = function(player, csid, option, prospectorItems)
    local itemCategory = bit.band(option, 0x07)
    local itemSelected = bit.band(bit.rshift(option, 16), 0x1F)
    local cruorTotal = player:getCurrency('cruor')

    if itemCategory == itemType.ITEM then
        local itemData = prospectorItems[itemCategory][itemSelected]
        local itemQty = itemData[1] ~= invaderXim.item.FORBIDDEN_KEY and 1 or bit.rshift(option, 24)
        local itemCost = itemData[2] * itemQty

        if
            itemCost <= cruorTotal and
            npcUtil.giveItem(player, { { itemData[1], itemQty } })
        then
            player:delCurrency('cruor', itemCost)
        end
    elseif itemCategory == itemType.TEMP then
        local itemData = prospectorItems[itemCategory][itemSelected]
        local itemCost = itemData[2]

        if
            itemCost <= cruorTotal and
            npcUtil.giveTempItem(player, { { itemData[1], 1 } })
        then
            player:delCurrency('cruor', itemCost)
        end
    elseif itemCategory == itemType.KEYITEM then
        local itemData = prospectorItems[itemCategory][itemSelected]

        if
            itemData[2] <= cruorTotal and
            npcUtil.giveKeyItem(player, itemData[1])
        then
            player:delCurrency('cruor', itemData[2])
        end
    elseif itemCategory == itemType.ENHANCEMENT then
        local enhanceData = prospectorItems[itemCategory][itemSelected]

        if enhanceData[2] <= cruorTotal then
            for _, v in ipairs(enhanceData[1]) do
                player:addStatusEffectEx(v[1], v[2], v[3] + invaderXim.abyssea.getAbyssiteTotal(player, v[4]) * v[5], 0, 0)

                if v[1] == invaderXim.effect.ABYSSEA_HP then
                    player:addHP(v[3] + invaderXim.abyssea.getAbyssiteTotal(player, v[4]) * v[5])
                elseif v[1] == invaderXim.effect.ABYSSEA_MP then
                    player:addMP(v[3] + invaderXim.abyssea.getAbyssiteTotal(player, v[4]) * v[5])
                end
            end

            player:delCurrency('cruor', enhanceData[2])
        end
    end
end

-- returns Traverser Stone KI cap
invaderXim.abyssea.getTraverserCap = function(player)
    local stones = 3

    for keyItem = invaderXim.ki.VIRIDIAN_ABYSSITE_OF_AVARICE, invaderXim.ki.VERMILLION_ABYSSITE_OF_AVARICE do
        if player:hasKeyItem(keyItem) then
            stones = stones + 1
        end
    end

    return stones
end

-- returns total Traverser Stone KI
-- (NOT the reserve value from currency menu)
invaderXim.abyssea.getHeldTraverserStones = function(player)
    local stones = 0

    for keyItem = invaderXim.ki.TRAVERSER_STONE1, invaderXim.ki.TRAVERSER_STONE6 do
        if player:hasKeyItem(keyItem) then
            stones = stones + 1
        end
    end

    return stones
end

-- removes Traverser Stone KIs
invaderXim.abyssea.spendTravStones = function(player, spentstones)
    local numRemoved = 0

    for keyItem = invaderXim.ki.TRAVERSER_STONE6, invaderXim.ki.TRAVERSER_STONE1, -1 do
        if numRemoved == spentstones then
            break
        elseif player:hasKeyItem(keyItem) then
            player:delKeyItem(keyItem)
            numRemoved = numRemoved + 1
        end
    end
end

-- returns total 'Abyssite of <thing>'
invaderXim.abyssea.getAbyssiteTotal = function(player, enumVal)
    local kiCount = 0

    for keyItem = abyssiteKeyItems[enumVal][1], abyssiteKeyItems[enumVal][2] do
        if player:hasKeyItem(keyItem) then
            kiCount = kiCount + 1
        end
    end

    return kiCount
end

invaderXim.abyssea.canGiveNMKI = function(mob, dropChance)
    local redProcValue = mob:getLocalVar('[AbysseaRedProc]')

    if math.random(1, 100) <= dropChance or redProcValue == 1 then
        return true
    end

    return false
end

invaderXim.abyssea.giveNMDrops = function(mob, player, ID)
    if not invaderXim.abyssea.mob[mob:getName()] then
        return
    end

    local atmaDrops = invaderXim.abyssea.mob[mob:getName()]['Atma']
    local normalDrops = invaderXim.abyssea.mob[mob:getName()]['Normal']
    local playerClaimed = GetPlayerByID(mob:getLocalVar('[ClaimedBy]'))

    for _, keyItemId in pairs(normalDrops) do
        if
            playerClaimed and
            invaderXim.abyssea.canGiveNMKI(mob, 20)
        then
            npcUtil.giveKeyItem(playerClaimed, keyItemId, ID.text.PLAYER_KEYITEM_OBTAINED)
        end
    end

    for _, keyItemId in pairs(atmaDrops) do
        if playerClaimed then
            local ally = playerClaimed:getAlliance()

            for _, member in ipairs(ally) do
                if not member:hasKeyItem(keyItemId) and invaderXim.abyssea.canGiveNMKI(mob, 10) then
                    npcUtil.giveKeyItem(member, keyItemId, ID.text.PLAYER_KEYITEM_OBTAINED)
                end
            end

            if not playerClaimed:hasKeyItem(keyItemId) then
                npcUtil.giveKeyItem(playerClaimed, keyItemId, ID.text.PLAYER_KEYITEM_OBTAINED)
            end
        end
    end

    -- TODO: Handle increased droprate with Yellow and Blue procs
end

-- Returns Bitmask of Demulune KeyItems
invaderXim.abyssea.getDemiluneAbyssite = function(player)
    local demiluneMask = 0

    for k, keyItem in ipairs(demiluneKeyItems) do
        if player:hasKeyItem(keyItem) then
            demiluneMask = demiluneMask + bit.lshift(1, k - 1)
        end
    end

    return demiluneMask
end

invaderXim.abyssea.getNewYellowWeakness = function(mob)
    local currentDay = VanadielDayOfTheWeek()                      -- Fetch current day.
    local chosenDay  = math.random(currentDay - 1, currentDay + 1) -- It can be the element of the same day, the day before or the day after.

    -- Acount for day element cycling.
    if chosenDay < invaderXim.day.FIRESDAY then
        chosenDay = invaderXim.day.DARKSDAY
    elseif chosenDay > invaderXim.day.DARKSDAY then
        chosenDay = invaderXim.day.FIRESDAY
    end

    local element = invaderXim.combat.element.getDayElement(chosenDay)

    return yellowWeakness[element][math.random(1, #yellowWeakness[element])] -- Choose an specific spell the mob is weak to.
end

invaderXim.abyssea.getNewRedWeakness = function(mob)
    return redWeakness[math.random(#redWeakness)]
end

invaderXim.abyssea.getNewBlueWeakness = function(mob)
    local time = VanadielHour()
    local table = 3

    if time >= 6 and time < 14 then
        table = 1
    elseif time >= 14 and time < 22 then
        table = 2
    end

    return blueWeakness[table][math.random(#blueWeakness[table])]
end

invaderXim.abyssea.procMonster = function(mob, player, triggerType)
    if player and player:getAllegiance() == 1 then
        local master = player:getMaster()

        if master then
            player = master
        end

        if triggerType == invaderXim.abyssea.triggerType.RED then
            if mob:getLocalVar('[AbysseaRedProc]') == 0 then
                mob:setLocalVar('[AbysseaRedProc]', 1)
            else
                mob:setLocalVar('[AbysseaRedProc]', 0)
            end

            mob:weaknessTrigger(2)
            mob:addStatusEffect(invaderXim.effect.TERROR, 0, 0, 30)
        elseif triggerType == invaderXim.abyssea.triggerType.YELLOW then
            if mob:getLocalVar('[AbysseaYellowProc]') == 0 then
                mob:setLocalVar('[AbysseaYellowProc]', 1)
            else
                mob:setLocalVar('[AbysseaYellowProc]', 0)
            end

            mob:weaknessTrigger(1)
            mob:addStatusEffect(invaderXim.effect.TERROR, 0, 0, 30)
        elseif triggerType == invaderXim.abyssea.triggerType.BLUE then
            if mob:getLocalVar('[AbysseaBlueProc]') == 0 then
                mob:setLocalVar('[AbysseaBlueProc]', 1)
            else
                mob:setLocalVar('[AbysseaBlueProc]', 0)
            end

            mob:weaknessTrigger(0)
            mob:addStatusEffect(invaderXim.effect.TERROR, 0, 0, 30)
        end
    end
end

-- trade to QM to pop mob
invaderXim.abyssea.qmOnTrade = function(player, npc, trade, mobId, reqTrade)
    -- validate QM pop data
    -- local zoneId = player:getZoneID()
    -- validate trade-to-pop
    if #reqTrade == 0 or trade:getItemCount() ~= #reqTrade then
        return false
    end

    -- validate traded items
    for k, v in pairs(reqTrade) do
        if not trade:hasItemQty(v, 1) then
            return false
        end
    end

    if GetMobByID(mobId):isSpawned() then
        return false
    end

    -- complete trade and pop nm
    player:tradeComplete()
    local dx = player:getXPos() + math.random(-1, 1)
    local dy = player:getYPos()
    local dz = player:getZPos() + math.random(-1, 1)
    GetMobByID(mobId):setSpawn(dx, dy, dz)

    SpawnMob(mobId):updateClaim(player)
    GetMobByID(mobId):setLocalVar('[ClaimedBy]', player:getID())

    return true
end

local checkMobID = function(zoneId, mobId)
    for i, v in pairs(zones[zoneId].mob) do
        if v == mobId then
            return true
        end
    end

    return false
end

invaderXim.abyssea.qmOnTrigger = function(player, npc, mobId, kis, tradeReqs)
    -- validate QM pop data
    local zoneId = player:getZoneID()
    local events = popEvents[zoneId]

    if mobId == 0 then
        -- validate trade-to-pop
        local t = tradeReqs
        if #t > 0 then
            for i = 1, 8 do
                if not t[i] then
                    t[i] = 0
                end
            end

            player:startEvent(events[1], t[1], t[2], t[3], t[4], t[5], t[6], t[7], t[8]) -- report required trades
            return true
        end
    end

    -- validate nm status
    if GetMobByID(mobId):isSpawned() then
        return false
    end

    if #kis == 0 then
        return false
    end

    -- validate kis
    local validKis = true
    local kisExpected = {}

    for index = 1, 8 do
        local keyItem = kis[index] or 0

        if keyItem ~= 0 and not player:hasKeyItem(keyItem) then
            validKis = false
        end

        player:setLocalVar('KI' .. index, keyItem)
        kisExpected[index] = keyItem
    end

    local pop = checkMobID(zoneId, mobId)
    player:setLocalVar('[AbysseaPopNmID]', mobId)
    -- start event
    if validKis and pop then
        player:startEvent(events[2], kisExpected[1], kisExpected[2], kisExpected[3], kisExpected[4], kisExpected[5], kisExpected[6], kisExpected[7], kisExpected[8]) -- player has all key items
        return true
    else
        player:startEvent(events[3], kisExpected[1], kisExpected[2], kisExpected[3], kisExpected[4], kisExpected[5], kisExpected[6], kisExpected[7], kisExpected[8]) -- player is missing key items
        return false
    end
end

invaderXim.abyssea.qmOnEventUpdate = function(player, csid, option, npc)
    return false
end

invaderXim.abyssea.qmOnEventFinish = function(player, csid, option, npc)
    local zoneId = player:getZoneID()
    local events = popEvents[zoneId]
    local ID = zones[player:getZoneID()]

    if csid == events[2] and option == 1 then

        for i = 1, 8 do
            local keyItem = player:getLocalVar('KI' .. i)
            if keyItem == 0 then
                break
            end

            if player:hasKeyItem(keyItem) then
                player:delKeyItem(keyItem)
                player:messageSpecial(ID.text.LOST_KEYITEM, keyItem)
            end
        end

        -- pop nm
        local nm = player:getLocalVar('[AbysseaPopNmID]')
        local dx = player:getXPos() + math.random(-1, 1)
        local dy = player:getYPos()
        local dz = player:getZPos() + math.random(-1, 1)

        GetMobByID(nm):setSpawn(dx, dy, dz)
        SpawnMob(nm):updateClaim(player)
        GetMobByID(nm):setLocalVar('[ClaimedBy]', player:getID())

        return true
    end
end

invaderXim.abyssea.isInAbysseaZone = function(player)
    return player:getCurrentRegion() == invaderXim.region.ABYSSEA
end

-----------------------------------
-- Light Handling
-----------------------------------
invaderXim.abyssea.getLightsTable = function(player)
    local lightMaskFirst  = player:getCharVar('abysseaLights1')
    local lightMaskSecond = player:getCharVar('abysseaLights2')
    local lightValues = { 0, 0, 0, 0, 0, 0, 0 }

    for v = 1, 7 do
        if v <= 4 then
            lightValues[v] = bit.band(bit.rshift(lightMaskFirst, (v - 1) * 8), 0xFF)
        else
            lightValues[v] = bit.band(bit.rshift(lightMaskSecond, (v - 5) * 8), 0xFF)
        end
    end

    return lightValues
end

local function setLightsFromTable(player, lightTable)
    local lightMaskFirst  = 0
    local lightMaskSecond = 0

    for k = 1, 7 do
        if k <= 4 then
            lightMaskFirst = lightMaskFirst + bit.lshift(lightTable[k], (k - 1) * 8)
        else
            lightMaskSecond = lightMaskSecond + bit.lshift(lightTable[k], (k - 1) * 8)
        end
    end

    player:setCharVar('abysseaLights1', lightMaskFirst)
    player:setCharVar('abysseaLights2', lightMaskSecond)
end

invaderXim.abyssea.displayAbysseaLights = function(player)
    if invaderXim.abyssea.isInAbysseaZone(player) then
        local ID = zones[player:getZoneID()]
        local lightValues = invaderXim.abyssea.getLightsTable(player)

        player:messageName(ID.text.LIGHTS_MESSAGE_1, nil,
            lightValues[invaderXim.abyssea.lightType.PEARL],
            lightValues[invaderXim.abyssea.lightType.EBON],
            lightValues[invaderXim.abyssea.lightType.GOLDEN],
            lightValues[invaderXim.abyssea.lightType.SILVERY])

        player:messageName(ID.text.LIGHTS_MESSAGE_2, nil,
            lightValues[invaderXim.abyssea.lightType.AZURE],
            lightValues[invaderXim.abyssea.lightType.RUBY],
            lightValues[invaderXim.abyssea.lightType.AMBER])
    end
end

invaderXim.abyssea.resetPlayerLights = function(player)
    player:setCharVar('abysseaLights1', 0)
    player:setCharVar('abysseaLights2', 0)
end

invaderXim.abyssea.setBonusLights = function(player)
    local lightTable = {}

    for _, v in ipairs(invaderXim.abyssea.lightType) do
        lightTable[v] = invaderXim.settings.main.ABYSSEA_BONUSLIGHT_AMOUNT
    end

    setLightsFromTable(player, lightTable)
end

invaderXim.abyssea.addPlayerLights = function(player, light, amount)
    local zoneId = player:getZoneID()
    local ID = zones[zoneId]
    local tierMsg = 0
    local lightAmount = amount or 0

    if lightAmount <= 8 then
        tierMsg = 0
    elseif lightAmount <= 16 then
        tierMsg = 1
    elseif lightAmount <= 32 then
        tierMsg = 2
    elseif lightAmount <= 64 then
        tierMsg = 3
    else
        tierMsg = 4
    end

    if tierMsg > lightData[light][2] then
        tierMsg = lightData[light][2]
    end

    local lightTable = invaderXim.abyssea.getLightsTable(player)
    lightTable[light] = utils.clamp(lightTable[light] + lightAmount, 0, lightData[light][1])
    player:messageSpecial(ID.text.BODY_EMITS_OFFSET + (light - 1), tierMsg)
    setLightsFromTable(player, lightTable)
end

invaderXim.abyssea.getLightValue = function(player, light)
    return bit.band(bit.rshift(player:getCharVar('abysseaLights'), (light - 1) * 2), 0xFF)
end

invaderXim.abyssea.canEnterAbyssea = function(player)
    -- TODO
    return true
end

invaderXim.abyssea.displayTimeRemaining = function(player)
    local ID = zones[player:getZoneID()]
    local visitantEffect = player:getStatusEffect(invaderXim.effect.VISITANT)
    local secondsRemaining = visitantEffect:getTimeRemaining() / 1000

    if secondsRemaining >= 120 then
        player:messageSpecial(ID.text.ABYSSEA_TIME_OFFSET + 1, secondsRemaining / 60, 1)
    elseif secondsRemaining >= 60 then
        player:messageSpecial(ID.text.ABYSSEA_TIME_OFFSET, secondsRemaining / 60, 1)
    else
        player:messageSpecial(ID.text.ABYSSEA_TIME_OFFSET + 1, secondsRemaining, 0)
    end
end

-----------------------------------
-- Zone Global Functions
-----------------------------------
invaderXim.abyssea.onZoneIn = function(player)
    -- If the player is a GM, and has GM toggled active, give them permanent visitant status.
    if player:getGMLevel() > 0 and player:getVisibleGMLevel() >= 3 then
        player:addStatusEffectEx(invaderXim.effect.VISITANT, invaderXim.effect.VISITANT, 0, 0, 0)
    end
end

invaderXim.abyssea.onEventFinish = function(player, csid, option, npc)
    if csid == 2180 then
        local zoneID = player:getZoneID()
        player:setPos(unpack(invaderXim.abyssea.exitPositions[zoneID]))
    end
end

invaderXim.abyssea.afterZoneIn = function(player)
    local zoneID = player:getZoneID()
    local ID = zones[zoneID]

    -- Add 5 minutes of hidden time to get 'real' visitant status.  The additional 4 seconds
    -- is intentional due to tick variances (up to 3s), and the status will be deleted should
    -- the countdown timer for visitant status reach 0 before actually running out of time on
    -- the effect.
    if not player:hasStatusEffect(invaderXim.effect.VISITANT) then
        player:addStatusEffectEx(invaderXim.effect.VISITANT, 0, 0, 3, 304)
    end

    local visitantEffect = player:getStatusEffect(invaderXim.effect.VISITANT)
    if visitantEffect and visitantEffect:getIcon() == 0 then
        player:messageName(ID.text.ABYSSEA_TIME_OFFSET + 5, nil, 5)
    end
end

-----------------------------------
-- Searing Ward Functions
-----------------------------------
local searingWardTetherLocations =
{
    [invaderXim.zone.ABYSSEA_KONSCHTAT]  = {  114, -72.39, -808, 160 },
    [invaderXim.zone.ABYSSEA_TAHRONGI]   = {    0,     40, -676, 192 },
    [invaderXim.zone.ABYSSEA_LA_THEINE]  = { -480,      0,  760,  64 },
    [invaderXim.zone.ABYSSEA_ATTOHWA]    = { -140,     20, -162, 192 },
    [invaderXim.zone.ABYSSEA_MISAREAUX]  = {  608,  -15.8,  280, 128 },
    [invaderXim.zone.ABYSSEA_VUNKERL]    = { -324,  -38.8,  664,   0 },
    [invaderXim.zone.ABYSSEA_ALTEPA]     = {  396,      0,  276,  64 },
    [invaderXim.zone.ABYSSEA_ULEGUERAND] = { -180,    -40, -504, 192 },
    [invaderXim.zone.ABYSSEA_GRAUBERG]   = { -506,     25, -764,   0 },
}

invaderXim.abyssea.searingWardTimer = function(player)
    local zoneID = player:getZoneID()
    local ID = zones[zoneID]
    local tetherTimer = player:getLocalVar('tetherTimer')

    if tetherTimer > 1 then
        player:setLocalVar('tetherTimer', tetherTimer - 1)
        if tetherTimer <= 6 then
            player:messageSpecial(ID.text.RETURNING_TO_SEARING_IN, tetherTimer - 1)
        end

        player:timer(1500, function()
            invaderXim.abyssea.searingWardTimer(player)
        end)
    elseif tetherTimer == 1 then
        player:setLocalVar('tetherTimer', 0)
        player:messageSpecial(ID.text.RETURNING_TO_WARD)
        player:setPos(unpack(searingWardTetherLocations[zoneID]))
    end
end

invaderXim.abyssea.onWardTriggerAreaLeave = function(player)
    local ID = zones[player:getZoneID()]
    local visitantEffect = player:getStatusEffect(invaderXim.effect.VISITANT)

    if visitantEffect and visitantEffect:getIcon() == 0 then
        player:messageName(ID.text.NO_VISITANT_WARD, nil, 10)
        player:setLocalVar('tetherTimer', 11)
    end
end

invaderXim.abyssea.onWardTriggerAreaEnter = function(player)
    player:setLocalVar('tetherTimer', 0)
end

-----------------------------------
-- Support NPC Functions
-- Traverser Stone, Abyssea Warp
-----------------------------------
local supportNPCData =
{
--                           Traverser,  Warp
    [invaderXim.zone.HEAVENS_TOWER]  = {   434,   433 },
    [invaderXim.zone.RULUDE_GARDENS] = { 10186, 10185 },
    [invaderXim.zone.PORT_BASTOK]    = {   405,   404 },
    [invaderXim.zone.PORT_JEUNO]     = {   328,   339 },
    [invaderXim.zone.PORT_SAN_DORIA] = {   796,   795 },
    [invaderXim.zone.PORT_WINDURST]  = {   874,   873 },
}

-- TODO: Combine this into one table with teleportData
local abysseaMawQuests =
{
    [0] = invaderXim.quest.id.abyssea.A_GOLDSTRUCK_GIGAS,
    [1] = invaderXim.quest.id.abyssea.TO_PASTE_A_PEISTE,
    [2] = invaderXim.quest.id.abyssea.MEGADRILE_MENACE,
    [3] = invaderXim.quest.id.abyssea.THE_BEAST_OF_BASTORE,
    [4] = invaderXim.quest.id.abyssea.A_DELECTABLE_DEMON,
    [5] = invaderXim.quest.id.abyssea.A_FLUTTERY_FIEND,
    [6] = invaderXim.quest.id.abyssea.A_BEAKED_BLUSTERER,
    [7] = invaderXim.quest.id.abyssea.A_MAN_EATING_MITE,
    [8] = invaderXim.quest.id.abyssea.AN_ULCEROUS_URAGNITE,
}

local teleportData =
{
    { -562,   0,  640,  26, 102 }, -- La Theine Plateau
    {   91, -68, -582, 237, 108 }, -- Konschtat Highlands
    {  -28,  46, -680,  76, 117 }, -- Tahrongi Canyon
    {  241,   0,   11,  42, 104 }, -- Jugner Forest (Vunkerl)
    {  362,   0, -119,   4, 103 }, -- Valkurm Dunes (Misareaux)
    { -338, -23,   47, 167, 118 }, -- Buburimu Peninsula (Attohwa)
    {  337,   0, -675,  52, 107 }, -- South Gustaberg (Altepa)
    {  269,  -7,  -75, 192, 112 }, -- Xarcabard (Uleguerand)
    {  -71,   0,  601, 126, 106 }, -- North Gustaberg (Grauberg)
}

local function getUnlockedMawTable(player)
    local unlockedMawTable = { 0, 0, 0 }

    for mawIndex = 0, 8 do
        if player:getQuestStatus(invaderXim.questLog.ABYSSEA, abysseaMawQuests[mawIndex]) >= invaderXim.questStatus.QUEST_ACCEPTED then
            local tableKey = math.floor(mawIndex / 3) + 1

            unlockedMawTable[tableKey] = utils.mask.setBit(unlockedMawTable[tableKey], mawIndex % 3, 1)
        end
    end

    return unlockedMawTable
end

invaderXim.abyssea.warpNPCOnTrigger = function(player, npc)
    local totalCruor = player:getCurrency('cruor')
    local unlockedMaws = getUnlockedMawTable(player)
    local statusParam = player:hasCompletedQuest(invaderXim.questLog.ABYSSEA, invaderXim.quest.id.abyssea.THE_TRUTH_BECKONS) and 2 or 0

    player:startEvent(supportNPCData[player:getZoneID()][2], statusParam, totalCruor, unlockedMaws[1], unlockedMaws[2], unlockedMaws[3])
end

invaderXim.abyssea.warpNPCOnEventUpdate = function(player, csid, option, npc)
end

invaderXim.abyssea.warpNPCOnEventFinish = function(player, csid, option, npc)
    local teleportSelection = bit.band(bit.rshift(option, 2), 0xF)

    -- Bit 8 is set for all teleport selections
    if
        utils.mask.getBit(option, 8) and
        player:getCurrency('cruor') >= 200
    then
        player:delCurrency('cruor', 200)
        player:setPos(unpack(teleportData[teleportSelection]))
    end
end

invaderXim.abyssea.traverserNPCOnTrigger = function(player, npc)
    local zoneID = player:getZoneID()
    local ID = zones[zoneID]
    local availableStones = player:getAvailableTraverserStones()
    local numTraverserHeld = invaderXim.abyssea.getHeldTraverserStones(player)
    local maxTraverserCanHold = invaderXim.abyssea.getTraverserCap(player)
    local messageType = availableStones > 0 and 0 or 2

    -- messageType parameter determines what is displayed to the player depending
    -- on other values: 0 = Eligible for Stone, 1 = Holding maximum stones, and
    -- 2 = No stones available

    if numTraverserHeld >= maxTraverserCanHold then
        messageType = 1
    end

    if
        zoneID ~= invaderXim.zone.PORT_JEUNO and
        not player:hasCompletedQuest(invaderXim.questLog.ABYSSEA, invaderXim.quest.id.abyssea.THE_TRUTH_BECKONS)
    then
        player:messageText(npc, ID.text.NOT_ACQUAINTED)
    elseif player:getQuestStatus(invaderXim.questLog.ABYSSEA, invaderXim.quest.id.abyssea.DAWN_OF_DEATH) >= invaderXim.questStatus.QUEST_ACCEPTED then
        player:startEvent(supportNPCData[zoneID][1], 0, availableStones, numTraverserHeld, messageType, 1, 1, 1, 3) -- Post 'The Truth Beckons' Menu
    end
end

invaderXim.abyssea.traverserNPCOnUpdate = function(player, csid, option, npc)
    if csid == supportNPCData[player:getZoneID()][1] then
        if option == 3 then
            -- The following values calculates the amount of time remaining for a stone by working backwards from current time.
            -- Recharge interval is the adjusted value in hours, and remaining is in seconds initially.  Retail will display
            -- the result as a minute value to the player.

            local rechargeInterval = 20 - invaderXim.abyssea.getAbyssiteTotal(player, invaderXim.abyssea.abyssiteType.CELERITY)
            local lastStoneClaimedTime = os.time() - player:getTraverserEpoch() - rechargeInterval * 3600 * player:getClaimedTraverserStones()
            local rechargeRemaining = rechargeInterval * 60 - lastStoneClaimedTime / 60

            player:updateEvent(0, 0, 0, 0, rechargeRemaining)
        end
    end
end

invaderXim.abyssea.traverserNPCOnEventFinish = function(player, csid, option, npc)
    local zoneID = player:getZoneID()

    if
        csid == supportNPCData[zoneID][1] and
        option == 6
    then
        local ID = zones[zoneID]
        local availableStones = player:getAvailableTraverserStones()
        local numTraverserHeld = invaderXim.abyssea.getHeldTraverserStones(player)
        local requestedStones = invaderXim.abyssea.getTraverserCap(player) - numTraverserHeld

        -- Make sure we don't hand out stones if the player doesn't have them in reserve
        if requestedStones > availableStones then
            requestedStones = availableStones
        end

        player:addClaimedTraverserStones(requestedStones)

        local startKeyItem = invaderXim.ki.TRAVERSER_STONE1 + numTraverserHeld - 1
        for keyItem = startKeyItem, startKeyItem + requestedStones do
            player:addKeyItem(keyItem)
        end

        local kiMessage = requestedStones > 1 and ID.text.OBTAINED_NUM_KEYITEMS or ID.text.OBTAINED_NUM_KEYITEMS + 1
        player:messageSpecial(kiMessage, invaderXim.ki.TRAVERSER_STONE1, requestedStones)
    end
end

local zoneQuestReward =
{
    invaderXim.ki.LUNAR_ABYSSITE2,
    invaderXim.ki.IVORY_ABYSSITE_OF_FORTUNE,
    invaderXim.ki.IVORY_ABYSSITE_OF_ACUMEN,
    invaderXim.ki.IVORY_ABYSSITE_OF_THE_REAPER,
    invaderXim.ki.IVORY_ABYSSITE_OF_PERSPICACITY,
    invaderXim.ki.IVORY_ABYSSITE_OF_GUERDON,
    invaderXim.ki.LUNAR_ABYSSITE3,
    invaderXim.ki.IVORY_ABYSSITE_OF_PROSPERITY,
    invaderXim.ki.IVORY_ABYSSITE_OF_DESTINY,
}

invaderXim.abyssea.getZoneKIReward = function(player)
    local numCompleted = 0

    for i = 0, 8 do
        if player:hasCompletedQuest(invaderXim.questLog.ABYSSEA, abysseaMawQuests[i]) then
            numCompleted = numCompleted + 1
        end
    end

    return zoneQuestReward[numCompleted + 1]
end
