-----------------------------------
-- Deeds of Heroism (A.M.A.N. Validator)
-----------------------------------
-- Bastok Markets      : !pos -338.18 -10 -180.19 235
-- Southern San d'Oria : !pos -83.07 1 -55.58 230
-- Windurst Woods      : !pos 89.9 -4.2 -47.63 241
-----------------------------------
require('scripts/globals/npc_util')
require('scripts/globals/utils')
-----------------------------------
xi = xi or {}
invaderXim.deeds = invaderXim.deeds or {}

local validatorNpcEvents =
{
    [invaderXim.zone.BASTOK_MARKETS    ] = 669,
    [invaderXim.zone.SOUTHERN_SAN_DORIA] = 3610,
    [invaderXim.zone.WINDURST_WOODS    ] = 976,
}

-- Raw Rewards from AMAN Validator
-- NOTE: These tables are not configurable, and the client will not change
-- based on the data provided below.
---@class itemRewardEntry
---@field itemId invaderXim.item
---@field qty integer

---@class keyItemRewardEntry
---@field keyItemId invaderXim.keyItem

---@type itemRewardEntry[]|keyItemRewardEntry[]
local validatorRewards =
{
    [  1] = { itemId    = invaderXim.item.COPPER_AMAN_VOUCHER,            qty =  7 },
    [  2] = { itemId    = invaderXim.item.MOGGIEBAG,                      qty =  1 },
    [  3] = { itemId    = invaderXim.item.ENDORSEMENT_RING,               qty =  1 },
    [  4] = { itemId    = invaderXim.item.THEMIS_ORB,                     qty =  1 },

    [  5] = { itemId    = invaderXim.item.COPPER_AMAN_VOUCHER,            qty = 14 },
    [  6] = { itemId    = invaderXim.item.MOOGLES_LARGESSE,               qty =  1 },
    [  7] = { keyItemId = invaderXim.ki.DEED_VOUCHER                               },
    [  8] = { itemId    = invaderXim.item.PHOBOS_ORB,                     qty =  1 },

    [  9] = { itemId    = invaderXim.item.MOGRATUITY,                     qty =  1 },
    [ 10] = { itemId    = invaderXim.item.SPECIAL_GOBBIEDIAL_KEY,         qty =  5 },
    [ 11] = { keyItemId = invaderXim.ki.DEED_VOUCHER_PLUS_1_FEET                   },
    [ 12] = { itemId    = invaderXim.item.DEIMOS_ORB,                     qty =  1 },

    [ 13] = { itemId    = invaderXim.item.POUCH_OF_MOOGLE_MOOLAH,         qty =  1 },
    [ 14] = { itemId    = invaderXim.item.SPECIAL_GOBBIEDIAL_KEY,         qty =  5 },
    [ 15] = { keyItemId = invaderXim.ki.DEED_VOUCHER_PLUS_1_HANDS                  },
    [ 16] = { itemId    = invaderXim.item.ZELOS_ORB,                      qty =  1 },

    [ 17] = { itemId    = invaderXim.item.MOG_KUPON_W_PULSE,              qty =  1 },
    [ 18] = { itemId    = invaderXim.item.SPECIAL_GOBBIEDIAL_KEY,         qty =  5 },
    [ 19] = { keyItemId = invaderXim.ki.DEED_VOUCHER_PLUS_1_HEAD                   },
    [ 20] = { itemId    = invaderXim.item.BIA_ORB,                        qty =  1 },

    [ 21] = { itemId    = invaderXim.item.MOGGIE_GOODIE_BAG,              qty =  1 },
    [ 22] = { itemId    = invaderXim.item.SPECIAL_GOBBIEDIAL_KEY,         qty =  5 },
    [ 23] = { keyItemId = invaderXim.ki.DEED_VOUCHER_PLUS_1_LEGS                   },
    [ 24] = { itemId    = invaderXim.item.MICROCOSMIC_ORB,                qty =  1 },

    [ 25] = { itemId    = invaderXim.item.GOBBIE_GOODIE_BAG,              qty =  1 },
    [ 26] = { itemId    = invaderXim.item.DIAL_KEY_ANV,                   qty =  5 },
    [ 27] = { keyItemId = invaderXim.ki.DEED_VOUCHER_PLUS_1_CHEST                  },
    [ 28] = { itemId    = invaderXim.item.MACROCOSMIC_ORB,                qty =  1 },

    [ 29] = { itemId    = invaderXim.item.AMBUSCADE_VOUCHER_WEAPON,       qty =  1 },
    [ 30] = { itemId    = invaderXim.item.DIAL_KEY_ANV,                   qty =  5 },
    [ 31] = { keyItemId = invaderXim.ki.DEED_VOUCHER_PLUS_2_FEET                   },
    [ 32] = { itemId    = invaderXim.item.MARS_ORB,                       qty =  1 },

    [ 33] = { itemId    = invaderXim.item.WYRMKING_MASQUE,                qty =  1 },
    [ 34] = { itemId    = invaderXim.item.DIAL_KEY_ANV,                   qty =  5 },
    [ 35] = { keyItemId = invaderXim.ki.DEED_VOUCHER_PLUS_2_HANDS                  },
    [ 36] = { itemId    = invaderXim.item.MARS_ORB,                       qty =  1 },

    [ 37] = { itemId    = invaderXim.item.WYRMKING_SUIT,                  qty =  1 },
    [ 38] = { itemId    = invaderXim.item.DIAL_KEY_ANV,                   qty =  5 },
    [ 39] = { keyItemId = invaderXim.ki.DEED_VOUCHER_PLUS_2_HEAD                   },
    [ 40] = { itemId    = invaderXim.item.MARS_ORB,                       qty =  1 },

    [ 41] = { itemId    = invaderXim.item.AKITU_SHIRT,                    qty =  1 },
    [ 42] = { itemId    = invaderXim.item.DIAL_KEY_ANV,                   qty =  5 },
    [ 43] = { keyItemId = invaderXim.ki.DEED_VOUCHER_PLUS_2_LEGS                   },
    [ 44] = { itemId    = invaderXim.item.VENUS_ORB,                      qty =  1 },

    [ 45] = { itemId    = invaderXim.item.CRUSTACEAN_SHIRT,               qty =  1 },
    [ 46] = { itemId    = invaderXim.item.DIAL_KEY_ANV,                   qty =  5 },
    [ 47] = { keyItemId = invaderXim.ki.DEED_VOUCHER_PLUS_2_CHEST                  },
    [ 48] = { itemId    = invaderXim.item.CIPHER_OF_MONBERAUXS_ALTER_EGO, qty =  1 },

    [ 49] = { itemId    = invaderXim.item.COPPER_AMAN_VOUCHER,            qty = 10 },
    [ 50] = { itemId    = invaderXim.item.MAATS_CONCOCTION,               qty =  1 },
    [ 51] = { itemId    = invaderXim.item.DIAL_KEY_FO,                    qty =  5 },
    [ 52] = { itemId    = invaderXim.item.THEMIS_ORB,                     qty =  1 },

    [ 53] = { itemId    = invaderXim.item.ABDHALJS_SEAL,                  qty =  5 },
    [ 54] = { itemId    = invaderXim.item.SPECIAL_GOBBIEDIAL_KEY,         qty =  5 },
    [ 55] = { keyItemId = invaderXim.ki.DEED_TOKEN                                 },
    [ 56] = { itemId    = invaderXim.item.PHOBOS_ORB,                     qty =  1 },

    [ 57] = { itemId    = invaderXim.item.DECANTER_INGRID,                qty =  1 },
    [ 58] = { itemId    = invaderXim.item.SPECIAL_GOBBIEDIAL_KEY,         qty =  5 },
    [ 59] = { keyItemId = invaderXim.ki.DEED_TOKEN_PLUS_1_FEET                     },
    [ 60] = { itemId    = invaderXim.item.DEIMOS_ORB,                     qty =  1 },

    [ 61] = { itemId    = invaderXim.item.DECANTER_DARRCUILN,             qty =  1 },
    [ 62] = { itemId    = invaderXim.item.SPECIAL_GOBBIEDIAL_KEY,         qty =  5 },
    [ 63] = { keyItemId = invaderXim.ki.DEED_TOKEN_PLUS_1_HANDS                    },
    [ 64] = { itemId    = invaderXim.item.ZELOS_ORB,                      qty =  1 },

    [ 65] = { itemId    = invaderXim.item.DECANTER_ARCIELA,               qty =  1 },
    [ 66] = { itemId    = invaderXim.item.SPECIAL_GOBBIEDIAL_KEY,         qty =  5 },
    [ 67] = { keyItemId = invaderXim.ki.DEED_TOKEN_PLUS_1_HEAD                     },
    [ 68] = { itemId    = invaderXim.item.BIA_ORB,                        qty =  1 },

    [ 69] = { itemId    = invaderXim.item.DIAL_KEY_AB,                    qty =  5 },
    [ 70] = { itemId    = invaderXim.item.MICROCOSMIC_ORB,                qty =  1 },
    [ 71] = { keyItemId = invaderXim.ki.DEED_TOKEN_PLUS_1_LEGS                     },
    [ 72] = { keyItemId = invaderXim.ki.PRIMER_ON_MARTIAL_TECHNIQUES               },

    [ 73] = { itemId    = invaderXim.item.DECANTER_MORIMAR,               qty =  1 },
    [ 74] = { itemId    = invaderXim.item.DIAL_KEY_ANV,                   qty =  5 },
    [ 75] = { keyItemId = invaderXim.ki.DEED_TOKEN_PLUS_1_CHEST                    },
    [ 76] = { itemId    = invaderXim.item.MACROCOSMIC_ORB,                qty =  1 },

    [ 77] = { itemId    = invaderXim.item.DECANTER_ROSULATIA,             qty =  1 },
    [ 78] = { itemId    = invaderXim.item.DIAL_KEY_ANV,                   qty =  5 },
    [ 79] = { keyItemId = invaderXim.ki.DEED_TOKEN_PLUS_2_FEET                     },
    [ 80] = { itemId    = invaderXim.item.MARS_ORB,                       qty =  1 },

    [ 81] = { itemId    = invaderXim.item.DECANTER_TEODOR,                qty =  1 },
    [ 82] = { itemId    = invaderXim.item.DIAL_KEY_ANV,                   qty =  5 },
    [ 83] = { keyItemId = invaderXim.ki.DEED_TOKEN_PLUS_2_HANDS                    },
    [ 84] = { itemId    = invaderXim.item.MARS_ORB,                       qty =  1 },

    [ 85] = { itemId    = invaderXim.item.DECANTER_SAJJAKA,               qty =  1 },
    [ 86] = { itemId    = invaderXim.item.DIAL_KEY_ANV,                   qty =  5 },
    [ 87] = { keyItemId = invaderXim.ki.DEED_TOKEN_PLUS_2_HEAD                     },
    [ 88] = { itemId    = invaderXim.item.MARS_ORB,                       qty =  1 },

    [ 89] = { itemId    = invaderXim.item.DECANTER_ARCIELA_II,            qty =  1 },
    [ 90] = { itemId    = invaderXim.item.DIAL_KEY_ANV,                   qty =  5 },
    [ 91] = { keyItemId = invaderXim.ki.DEED_TOKEN_PLUS_2_LEGS                     },
    [ 92] = { itemId    = invaderXim.item.VENUS_ORB,                      qty =  1 },

    [ 93] = { itemId    = invaderXim.item.DECANTER_AUGUST,                qty =  1 },
    [ 94] = { itemId    = invaderXim.item.DIAL_KEY_ANV,                   qty =  5 },
    [ 95] = { keyItemId = invaderXim.ki.DEED_TOKEN_PLUS_2_CHEST                    },
    [ 96] = { keyItemId = invaderXim.ki.TREATISE_ON_MARTIAL_TECHNIQUES             },

    [ 97] = { itemId    = invaderXim.item.COPPER_AMAN_VOUCHER,            qty =  3 },
    [ 98] = { itemId    = invaderXim.item.ABDHALJS_SEAL,                  qty =  1 },
    [ 99] = { itemId    = invaderXim.item.MAATS_MIX,                      qty =  1 },
    [100] = { itemId    = invaderXim.item.SUPER_RERAISER_TANK,            qty =  1 },

    [101] = { itemId    = invaderXim.item.COPPER_AMAN_VOUCHER,            qty =  3 },
    [102] = { itemId    = invaderXim.item.SPECIAL_GOBBIEDIAL_KEY,         qty =  5 },
    [103] = { itemId    = invaderXim.item.MAATS_MIX,                      qty =  1 },
    [104] = { itemId    = invaderXim.item.MARS_ORB,                       qty =  1 },

    [105] = { itemId    = invaderXim.item.COPPER_AMAN_VOUCHER,            qty =  3 },
    [106] = { itemId    = invaderXim.item.ABDHALJS_SEAL,                  qty =  3 },
    [107] = { itemId    = invaderXim.item.MAATS_MIX,                      qty =  1 },
    [108] = { itemId    = invaderXim.item.MARS_ORB,                       qty =  1 },

    [109] = { itemId    = invaderXim.item.COPPER_AMAN_VOUCHER,            qty =  3 },
    [110] = { itemId    = invaderXim.item.DIAL_KEY_FO,                    qty =  5 },
    [111] = { itemId    = invaderXim.item.MAATS_MIX,                      qty =  1 },
    [112] = { itemId    = invaderXim.item.VENUS_ORB,                      qty =  1 },

    [113] = { itemId    = invaderXim.item.COPPER_AMAN_VOUCHER,            qty =  1 },
    [114] = { itemId    = invaderXim.item.ABDHALJS_SEAL,                  qty =  3 },
    [115] = { itemId    = invaderXim.item.MAATS_MIX,                      qty =  1 },
    [116] = { itemId    = invaderXim.item.ABRIDGED_FIENDISH_COMPENDIUM,   qty =  1 },

    [117] = { itemId    = invaderXim.item.COPPER_AMAN_VOUCHER,            qty =  3 },
    [118] = { itemId    = invaderXim.item.SPECIAL_GOBBIEDIAL_KEY,         qty =  5 },
    [119] = { itemId    = invaderXim.item.GREEN_MOG_PELL,                 qty =  1 },
    [120] = { itemId    = invaderXim.item.MAATS_CONCOCTION,               qty =  1 },

    [121] = { itemId    = invaderXim.item.COPPER_AMAN_VOUCHER,            qty =  3 },
    [122] = { itemId    = invaderXim.item.ABDHALJS_SEAL,                  qty =  3 },
    [123] = { itemId    = invaderXim.item.MAATS_MIX,                      qty =  1 },
    [124] = { itemId    = invaderXim.item.MOG_KUPON_W_PULSE,              qty =  1 },

    [125] = { itemId    = invaderXim.item.COPPER_AMAN_VOUCHER,            qty =  3 },
    [126] = { itemId    = invaderXim.item.DIAL_KEY_ANV,                   qty =  5 },
    [127] = { itemId    = invaderXim.item.MAATS_MIX,                      qty =  1 },
    [128] = { itemId    = invaderXim.item.MARS_ORB,                       qty =  1 },

    [129] = { itemId    = invaderXim.item.COPPER_AMAN_VOUCHER,            qty =  3 },
    [130] = { itemId    = invaderXim.item.ABDHALJS_SEAL,                  qty =  3 },
    [131] = { itemId    = invaderXim.item.MAATS_MIX,                      qty =  1 },
    [132] = { itemId    = invaderXim.item.MARS_ORB,                       qty =  1 },

    [133] = { itemId    = invaderXim.item.COPPER_AMAN_VOUCHER,            qty =  3 },
    [134] = { itemId    = invaderXim.item.DIAL_KEY_FO,                    qty =  5 },
    [135] = { itemId    = invaderXim.item.MAATS_MIX,                      qty =  1 },
    [136] = { itemId    = invaderXim.item.VENUS_ORB,                      qty =  1 },

    [137] = { itemId    = invaderXim.item.COPPER_AMAN_VOUCHER,            qty =  3 },
    [138] = { itemId    = invaderXim.item.ABDHALJS_SEAL,                  qty =  3 },
    [139] = { itemId    = invaderXim.item.MAATS_MIX,                      qty =  1 },
    [140] = { itemId    = invaderXim.item.PANDEMONIUM_KEY,                qty =  1 },

    [141] = { itemId    = invaderXim.item.COPPER_AMAN_VOUCHER,            qty =  3 },
    [142] = { itemId    = invaderXim.item.DIAL_KEY_ANV,                   qty =  5 },
    [143] = { itemId    = invaderXim.item.GREEN_MOG_PELL,                 qty =  1 },
    [144] = { itemId    = invaderXim.item.MAATS_CONCOCTION,               qty =  1 },
}

-- Key items by Bit to determine storedVoucher Mask
-- NOTE: This order should not be changed, and does not follow the order
-- in which the player is eligible to purchase.
local voucherKeyItems =
{
    invaderXim.ki.DEED_VOUCHER,
    invaderXim.ki.DEED_VOUCHER_PLUS_1_HEAD,
    invaderXim.ki.DEED_VOUCHER_PLUS_1_CHEST,
    invaderXim.ki.DEED_VOUCHER_PLUS_1_HANDS,
    invaderXim.ki.DEED_VOUCHER_PLUS_1_LEGS,
    invaderXim.ki.DEED_VOUCHER_PLUS_1_FEET,
    invaderXim.ki.DEED_VOUCHER_PLUS_2_HEAD,
    invaderXim.ki.DEED_VOUCHER_PLUS_2_CHEST,
    invaderXim.ki.DEED_VOUCHER_PLUS_2_HANDS,
    invaderXim.ki.DEED_VOUCHER_PLUS_2_LEGS,
    invaderXim.ki.DEED_VOUCHER_PLUS_2_FEET,
    invaderXim.ki.DEED_TOKEN,
    invaderXim.ki.DEED_TOKEN_PLUS_1_HEAD,
    invaderXim.ki.DEED_TOKEN_PLUS_1_CHEST,
    invaderXim.ki.DEED_TOKEN_PLUS_1_HANDS,
    invaderXim.ki.DEED_TOKEN_PLUS_1_LEGS,
    invaderXim.ki.DEED_TOKEN_PLUS_1_FEET,
    invaderXim.ki.DEED_TOKEN_PLUS_2_HEAD,
    invaderXim.ki.DEED_TOKEN_PLUS_2_CHEST,
    invaderXim.ki.DEED_TOKEN_PLUS_2_HANDS,
    invaderXim.ki.DEED_TOKEN_PLUS_2_LEGS,
    invaderXim.ki.DEED_TOKEN_PLUS_2_FEET,
}

-- Subtables to determine what items can be rewarded per store voucher.
-- Sub-keys are by Job ID in the event, which currently align to the Job
-- enum - 1.  In this case, not using the enum in order to specify that
-- this is strictly received from the event itself.
local voucherData =
{
    [0] = -- Deed Voucher
    {
        [0] =
        {
            invaderXim.item.PUMMELERS_MASK,
            invaderXim.item.PUMMELERS_LORICA,
            invaderXim.item.PUMMELERS_MUFFLERS,
            invaderXim.item.PUMMELERS_CUISSES,
            invaderXim.item.PUMMELERS_CALLIGAE,
        },

        [1] =
        {
            invaderXim.item.ANCHORITES_CROWN,
            invaderXim.item.ANCHORITES_CYCLAS,
            invaderXim.item.ANCHORITES_GLOVES,
            invaderXim.item.ANCHORITES_HOSE,
            invaderXim.item.ANCHORITES_GAITERS,
        },

        [2] =
        {
            invaderXim.item.THEOPHANY_CAP,
            invaderXim.item.THEOPHANY_BLIAUT,
            invaderXim.item.THEOPHANY_MITTS,
            invaderXim.item.THEOPHANY_PANTALOONS,
            invaderXim.item.THEOPHANY_DUCKBILLS,
        },

        [3] =
        {
            invaderXim.item.SPAEKONAS_PETASOS,
            invaderXim.item.SPAEKONAS_COAT,
            invaderXim.item.SPAEKONAS_GLOVES,
            invaderXim.item.SPAEKONAS_TONBAN,
            invaderXim.item.SPAEKONAS_SABOTS,
        },

        [4] =
        {
            invaderXim.item.ATROPHY_CHAPEAU,
            invaderXim.item.ATROPHY_TABARD,
            invaderXim.item.ATROPHY_GLOVES,
            invaderXim.item.ATROPHY_TIGHTS,
            invaderXim.item.ATROPHY_BOOTS,
        },

        [5] =
        {
            invaderXim.item.PILLAGERS_BONNET,
            invaderXim.item.PILLAGERS_VEST,
            invaderXim.item.PILLAGERS_ARMLETS,
            invaderXim.item.PILLAGERS_CULOTTES,
            invaderXim.item.PILLAGERS_POULAINES,
        },

        [6] =
        {
            invaderXim.item.REVERENCE_CORONET,
            invaderXim.item.REVERENCE_SURCOAT,
            invaderXim.item.REVERENCE_GAUNTLETS,
            invaderXim.item.REVERENCE_BREECHES,
            invaderXim.item.REVERENCE_LEGGINGS,
        },

        [7] =
        {
            invaderXim.item.IGNOMINY_BURGEONET,
            invaderXim.item.IGNOMINY_CUIRASS,
            invaderXim.item.IGNOMINY_GAUNTLETS,
            invaderXim.item.IGNOMINY_FLANCHARD,
            invaderXim.item.IGNOMINY_SOLLERETS,
        },

        [8] =
        {
            invaderXim.item.TOTEMIC_HELM,
            invaderXim.item.TOTEMIC_JACKCOAT,
            invaderXim.item.TOTEMIC_GLOVES,
            invaderXim.item.TOTEMIC_TROUSERS,
            invaderXim.item.TOTEMIC_GAITERS,
        },

        [9] =
        {
            invaderXim.item.BRIOSO_ROUNDLET,
            invaderXim.item.BRIOSO_JUSTAUCORPS,
            invaderXim.item.BRIOSO_CUFFS,
            invaderXim.item.BRIOSO_CANNIONS,
            invaderXim.item.BRIOSO_SLIPPERS,
        },

        [10] =
        {
            invaderXim.item.ORION_BERET,
            invaderXim.item.ORION_JERKIN,
            invaderXim.item.ORION_BRACERS,
            invaderXim.item.ORION_BRACCAE,
            invaderXim.item.ORION_SOCKS,
        },

        [11] =
        {
            invaderXim.item.WAKIDO_KABUTO,
            invaderXim.item.WAKIDO_DOMARU,
            invaderXim.item.WAKIDO_KOTE,
            invaderXim.item.WAKIDO_HAIDATE,
            invaderXim.item.WAKIDO_SUNE_ATE,
        },

        [12] =
        {
            invaderXim.item.HACHIYA_HATSUBURI,
            invaderXim.item.HACHIYA_CHAINMAIL,
            invaderXim.item.HACHIYA_TEKKO,
            invaderXim.item.HACHIYA_HAKAMA,
            invaderXim.item.HACHIYA_KYAHAN,
        },

        [13] =
        {
            invaderXim.item.VISHAP_ARMET,
            invaderXim.item.VISHAP_MAIL,
            invaderXim.item.VISHAP_FINGER_GAUNTLETS,
            invaderXim.item.VISHAP_BRAIS,
            invaderXim.item.VISHAP_GREAVES,
        },

        [14] =
        {
            invaderXim.item.CONVOKERS_HORN,
            invaderXim.item.CONVOKERS_DOUBLET,
            invaderXim.item.CONVOKERS_BRACERS,
            invaderXim.item.CONVOKERS_SPATS,
            invaderXim.item.CONVOKERS_PIGACHES,
        },

        [15] =
        {
            invaderXim.item.ASSIMILATORS_KEFFIYEH,
            invaderXim.item.ASSIMILATORS_JUBBAH,
            invaderXim.item.ASSIMILATORS_BAZUBANDS,
            invaderXim.item.ASSIMILATORS_SHALWAR,
            invaderXim.item.ASSIMILATORS_CHARUQS,
        },

        [16] =
        {
            invaderXim.item.LAKSAMANAS_TRICORNE,
            invaderXim.item.LAKSAMANAS_FRAC,
            invaderXim.item.LAKSAMANAS_GANTS,
            invaderXim.item.LAKSAMANAS_TREWS,
            invaderXim.item.LAKSAMANAS_BOTTES,
        },

        [17] =
        {
            invaderXim.item.FOIRE_TAJ,
            invaderXim.item.FOIRE_TOBE,
            invaderXim.item.FOIRE_DASTANAS,
            invaderXim.item.FOIRE_CHURIDARS,
            invaderXim.item.FOIRE_BABOUCHES,
        },

        [18] =
        {
            genderSpecific = true,

            [0] =
            {
                invaderXim.item.MAXIIXIM_TIARA_F,
                invaderXim.item.MAXIIXIM_CASAQUE_F,
                invaderXim.item.MAXIIXIM_BANGLES_F,
                invaderXim.item.MAXIIXIM_TIGHTS_F,
                invaderXim.item.MAXIIXIM_TOE_SHOES_F,
            },

            [1] =
            {
                invaderXim.item.MAXIIXIM_TIARA_M,
                invaderXim.item.MAXIIXIM_CASAQUE_M,
                invaderXim.item.MAXIIXIM_BANGLES_M,
                invaderXim.item.MAXIIXIM_TIGHTS_M,
                invaderXim.item.MAXIIXIM_TOE_SHOES_M,
            },
        },

        [19] =
        {
            invaderXim.item.ACADEMICS_MORTARBOARD,
            invaderXim.item.ACADEMICS_GOWN,
            invaderXim.item.ACADEMICS_BRACERS,
            invaderXim.item.ACADEMICS_PANTS,
            invaderXim.item.ACADEMICS_LOAFERS,
        },

        [20] =
        {
            invaderXim.item.GEOMANCY_GALERO,
            invaderXim.item.GEOMANCY_TUNIC,
            invaderXim.item.GEOMANCY_MITAINES,
            invaderXim.item.GEOMANCY_PANTS,
            invaderXim.item.GEOMANCY_SANDALS,
        },

        [21] =
        {
            invaderXim.item.RUNEIST_BANDEAU,
            invaderXim.item.RUNEIST_COAT,
            invaderXim.item.RUNEIST_MITONS,
            invaderXim.item.RUNEIST_TROUSERS,
            invaderXim.item.RUNEIST_BOTTES,
        },
    },

    [1] = -- Deed Voucher +1: Head
    {
        [ 0] = { invaderXim.item.PUMMELERS_MASK_P1        },
        [ 1] = { invaderXim.item.ANCHORITES_CROWN_P1      },
        [ 2] = { invaderXim.item.THEOPHANY_CAP_P1         },
        [ 3] = { invaderXim.item.SPAEKONAS_PETASOS_P1     },
        [ 4] = { invaderXim.item.ATROPHY_CHAPEAU_P1       },
        [ 5] = { invaderXim.item.PILLAGERS_BONNET_P1      },
        [ 6] = { invaderXim.item.REVERENCE_CORONET_P1     },
        [ 7] = { invaderXim.item.IGNOMINY_BURGEONET_P1    },
        [ 8] = { invaderXim.item.TOTEMIC_HELM_P1          },
        [ 9] = { invaderXim.item.BRIOSO_ROUNDLET_P1       },
        [10] = { invaderXim.item.ORION_BERET_P1           },
        [11] = { invaderXim.item.WAKIDO_KABUTO_P1         },
        [12] = { invaderXim.item.HACHIYA_HATSUBURI_P1     },
        [13] = { invaderXim.item.VISHAP_ARMET_P1          },
        [14] = { invaderXim.item.CONVOKERS_HORN_P1        },
        [15] = { invaderXim.item.ASSIMILATORS_KEFFIYEH_P1 },
        [16] = { invaderXim.item.LAKSAMANAS_TRICORNE_P1   },
        [17] = { invaderXim.item.FOIRE_TAJ_P1             },
        [18] =
        {
            genderSpecific = true,

            [0] = { invaderXim.item.MAXIIXIM_TIARA_F_P1 },
            [1] = { invaderXim.item.MAXIIXIM_TIARA_M_P1 },
        },

        [19] = { invaderXim.item.ACADEMICS_MORTARBOARD_P1 },
        [20] = { invaderXim.item.GEOMANCY_GALERO_P1       },
        [21] = { invaderXim.item.RUNEIST_BANDEAU_P1       },
    },

    [2] = -- Deed Voucher +1: Chest
    {
        [ 0] = { invaderXim.item.PUMMELERS_LORICA_P1    },
        [ 1] = { invaderXim.item.ANCHORITES_CYCLAS_P1   },
        [ 2] = { invaderXim.item.THEOPHANY_BLIAUT_P1    },
        [ 3] = { invaderXim.item.SPAEKONAS_COAT_P1      },
        [ 4] = { invaderXim.item.ATROPHY_TABARD_P1      },
        [ 5] = { invaderXim.item.PILLAGERS_VEST_P1      },
        [ 6] = { invaderXim.item.REVERENCE_SURCOAT_P1   },
        [ 7] = { invaderXim.item.IGNOMINY_CUIRASS_P1    },
        [ 8] = { invaderXim.item.TOTEMIC_JACKCOAT_P1    },
        [ 9] = { invaderXim.item.BRIOSO_JUSTAUCORPS_P1  },
        [10] = { invaderXim.item.ORION_JERKIN_P1        },
        [11] = { invaderXim.item.WAKIDO_DOMARU_P1       },
        [12] = { invaderXim.item.HACHIYA_CHAINMAIL_P1   },
        [13] = { invaderXim.item.VISHAP_MAIL_P1         },
        [14] = { invaderXim.item.CONVOKERS_DOUBLET_P1   },
        [15] = { invaderXim.item.ASSIMILATORS_JUBBAH_P1 },
        [16] = { invaderXim.item.LAKSAMANAS_FRAC_P1     },
        [17] = { invaderXim.item.FOIRE_TOBE_P1          },
        [18] =
        {
            genderSpecific = true,

            [0] = { invaderXim.item.MAXIIXIM_CASAQUE_F_P1 },
            [1] = { invaderXim.item.MAXIIXIM_CASAQUE_M_P1 },
        },

        [19] = { invaderXim.item.ACADEMICS_GOWN_P1 },
        [20] = { invaderXim.item.GEOMANCY_TUNIC_P1 },
        [21] = { invaderXim.item.RUNEIST_COAT_P1   },
    },

    [3] = -- Deed Voucher +1: Hands
    {
        [ 0] = { invaderXim.item.PUMMELERS_MUFFLERS_P1      },
        [ 1] = { invaderXim.item.ANCHORITES_GLOVES_P1       },
        [ 2] = { invaderXim.item.THEOPHANY_MITTS_P1         },
        [ 3] = { invaderXim.item.SPAEKONAS_GLOVES_P1        },
        [ 4] = { invaderXim.item.ATROPHY_GLOVES_P1          },
        [ 5] = { invaderXim.item.PILLAGERS_ARMLETS_P1       },
        [ 6] = { invaderXim.item.REVERENCE_GAUNTLETS_P1     },
        [ 7] = { invaderXim.item.IGNOMINY_GAUNTLETS_P1      },
        [ 8] = { invaderXim.item.TOTEMIC_GLOVES_P1          },
        [ 9] = { invaderXim.item.BRIOSO_CUFFS_P1            },
        [10] = { invaderXim.item.ORION_BRACERS_P1           },
        [11] = { invaderXim.item.WAKIDO_KOTE_P1             },
        [12] = { invaderXim.item.HACHIYA_TEKKO_P1           },
        [13] = { invaderXim.item.VISHAP_FINGER_GAUNTLETS_P1 },
        [14] = { invaderXim.item.CONVOKERS_BRACERS_P1       },
        [15] = { invaderXim.item.ASSIMILATORS_BAZUBANDS_P1  },
        [16] = { invaderXim.item.LAKSAMANAS_GANTS_P1        },
        [17] = { invaderXim.item.FOIRE_DASTANAS_P1          },
        [18] =
        {
            genderSpecific = true,

            [0] = { invaderXim.item.MAXIIXIM_BANGLES_F_P1 },
            [1] = { invaderXim.item.MAXIIXIM_BANGLES_M_P1 },
        },

        [19] = { invaderXim.item.ACADEMICS_BRACERS_P1 },
        [20] = { invaderXim.item.GEOMANCY_MITAINES_P1 },
        [21] = { invaderXim.item.RUNEIST_MITONS_P1    },
    },

    [4] = -- Deed Voucher +1: Legs
    {
        [ 0] = { invaderXim.item.PUMMELERS_CUISSES_P1    },
        [ 1] = { invaderXim.item.ANCHORITES_HOSE_P1      },
        [ 2] = { invaderXim.item.THEOPHANY_PANTALOONS_P1 },
        [ 3] = { invaderXim.item.SPAEKONAS_TONBAN_P1     },
        [ 4] = { invaderXim.item.ATROPHY_TIGHTS_P1       },
        [ 5] = { invaderXim.item.PILLAGERS_CULOTTES_P1   },
        [ 6] = { invaderXim.item.REVERENCE_BREECHES_P1   },
        [ 7] = { invaderXim.item.IGNOMINY_FLANCHARD_P1   },
        [ 8] = { invaderXim.item.TOTEMIC_TROUSERS_P1     },
        [ 9] = { invaderXim.item.BRIOSO_CANNIONS_P1      },
        [10] = { invaderXim.item.ORION_BRACCAE_P1        },
        [11] = { invaderXim.item.WAKIDO_HAIDATE_P1       },
        [12] = { invaderXim.item.HACHIYA_HAKAMA_P1       },
        [13] = { invaderXim.item.VISHAP_BRAIS_P1         },
        [14] = { invaderXim.item.CONVOKERS_SPATS_P1      },
        [15] = { invaderXim.item.ASSIMILATORS_SHALWAR_P1 },
        [16] = { invaderXim.item.LAKSAMANAS_TREWS_P1     },
        [17] = { invaderXim.item.FOIRE_CHURIDARS_P1      },
        [18] =
        {
            genderSpecific = true,

            [0] = { invaderXim.item.MAXIIXIM_TIGHTS_F_P1 },
            [1] = { invaderXim.item.MAXIIXIM_TIGHTS_M_P1 },
        },

        [19] = { invaderXim.item.ACADEMICS_PANTS_P1  },
        [20] = { invaderXim.item.GEOMANCY_PANTS_P1   },
        [21] = { invaderXim.item.RUNEIST_TROUSERS_P1 },
    },

    [5] = -- Deed Voucher +1: Feet
    {
        [ 0] = { invaderXim.item.PUMMELERS_CALLIGAE_P1   },
        [ 1] = { invaderXim.item.ANCHORITES_GAITERS_P1   },
        [ 2] = { invaderXim.item.THEOPHANY_DUCKBILLS_P1  },
        [ 3] = { invaderXim.item.SPAEKONAS_SABOTS_P1     },
        [ 4] = { invaderXim.item.ATROPHY_BOOTS_P1        },
        [ 5] = { invaderXim.item.PILLAGERS_POULAINES_P1  },
        [ 6] = { invaderXim.item.REVERENCE_LEGGINGS_P1   },
        [ 7] = { invaderXim.item.IGNOMINY_SOLLERETS_P1   },
        [ 8] = { invaderXim.item.TOTEMIC_GAITERS_P1      },
        [ 9] = { invaderXim.item.BRIOSO_SLIPPERS_P1      },
        [10] = { invaderXim.item.ORION_SOCKS_P1          },
        [11] = { invaderXim.item.WAKIDO_SUNE_ATE_P1      },
        [12] = { invaderXim.item.HACHIYA_KYAHAN_P1       },
        [13] = { invaderXim.item.VISHAP_GREAVES_P1       },
        [14] = { invaderXim.item.CONVOKERS_PIGACHES_P1   },
        [15] = { invaderXim.item.ASSIMILATORS_CHARUQS_P1 },
        [16] = { invaderXim.item.LAKSAMANAS_BOTTES_P1    },
        [17] = { invaderXim.item.FOIRE_BABOUCHES_P1      },
        [18] =
        {
            genderSpecific = true,

            [0] = { invaderXim.item.MAXIIXIM_TOE_SHOES_F_P1 },
            [1] = { invaderXim.item.MAXIIXIM_TOE_SHOES_M_P1 },
        },

        [19] = { invaderXim.item.ACADEMICS_LOAFERS_P1 },
        [20] = { invaderXim.item.GEOMANCY_SANDALS_P1  },
        [21] = { invaderXim.item.RUNEIST_BOTTES_P1    },
    },

    [6] = -- Deed Voucher +2: Head
    {
        [ 0] = { invaderXim.item.PUMMELERS_MASK_P2        },
        [ 1] = { invaderXim.item.ANCHORITES_CROWN_P2      },
        [ 2] = { invaderXim.item.THEOPHANY_CAP_P2         },
        [ 3] = { invaderXim.item.SPAEKONAS_PETASOS_P2     },
        [ 4] = { invaderXim.item.ATROPHY_CHAPEAU_P2       },
        [ 5] = { invaderXim.item.PILLAGERS_BONNET_P2      },
        [ 6] = { invaderXim.item.REVERENCE_CORONET_P2     },
        [ 7] = { invaderXim.item.IGNOMINY_BURGEONET_P2    },
        [ 8] = { invaderXim.item.TOTEMIC_HELM_P2          },
        [ 9] = { invaderXim.item.BRIOSO_ROUNDLET_P2       },
        [10] = { invaderXim.item.ORION_BERET_P2           },
        [11] = { invaderXim.item.WAKIDO_KABUTO_P2         },
        [12] = { invaderXim.item.HACHIYA_HATSUBURI_P2     },
        [13] = { invaderXim.item.VISHAP_ARMET_P2          },
        [14] = { invaderXim.item.CONVOKERS_HORN_P2        },
        [15] = { invaderXim.item.ASSIMILATORS_KEFFIYEH_P2 },
        [16] = { invaderXim.item.LAKSAMANAS_TRICORNE_P2   },
        [17] = { invaderXim.item.FOIRE_TAJ_P2             },
        [18] =
        {
            genderSpecific = true,

            [0] = { invaderXim.item.MAXIIXIM_TIARA_F_P2 },
            [1] = { invaderXim.item.MAXIIXIM_TIARA_M_P2 },
        },

        [19] = { invaderXim.item.ACADEMICS_MORTARBOARD_P2 },
        [20] = { invaderXim.item.GEOMANCY_GALERO_P2       },
        [21] = { invaderXim.item.RUNEIST_BANDEAU_P2       },
    },

    [7] = -- Deed Voucher +2: Chest
    {
        [ 0] = { invaderXim.item.PUMMELERS_LORICA_P2    },
        [ 1] = { invaderXim.item.ANCHORITES_CYCLAS_P2   },
        [ 2] = { invaderXim.item.THEOPHANY_BLIAUT_P2    },
        [ 3] = { invaderXim.item.SPAEKONAS_COAT_P2      },
        [ 4] = { invaderXim.item.ATROPHY_TABARD_P2      },
        [ 5] = { invaderXim.item.PILLAGERS_VEST_P2      },
        [ 6] = { invaderXim.item.REVERENCE_SURCOAT_P2   },
        [ 7] = { invaderXim.item.IGNOMINY_CUIRASS_P2    },
        [ 8] = { invaderXim.item.TOTEMIC_JACKCOAT_P2    },
        [ 9] = { invaderXim.item.BRIOSO_JUSTAUCORPS_P2  },
        [10] = { invaderXim.item.ORION_JERKIN_P2        },
        [11] = { invaderXim.item.WAKIDO_DOMARU_P2       },
        [12] = { invaderXim.item.HACHIYA_CHAINMAIL_P2   },
        [13] = { invaderXim.item.VISHAP_MAIL_P2         },
        [14] = { invaderXim.item.CONVOKERS_DOUBLET_P2   },
        [15] = { invaderXim.item.ASSIMILATORS_JUBBAH_P2 },
        [16] = { invaderXim.item.LAKSAMANAS_FRAC_P2     },
        [17] = { invaderXim.item.FOIRE_TOBE_P2          },
        [18] =
        {
            genderSpecific = true,

            [0] = { invaderXim.item.MAXIIXIM_CASAQUE_F_P2 },
            [1] = { invaderXim.item.MAXIIXIM_CASAQUE_M_P2 },
        },

        [19] = { invaderXim.item.ACADEMICS_GOWN_P2 },
        [20] = { invaderXim.item.GEOMANCY_TUNIC_P2 },
        [21] = { invaderXim.item.RUNEIST_COAT_P2   },
    },

    [8] = -- Deed Voucher +2: Hands
    {
        [ 0] = { invaderXim.item.PUMMELERS_MUFFLERS_P2      },
        [ 1] = { invaderXim.item.ANCHORITES_GLOVES_P2       },
        [ 2] = { invaderXim.item.THEOPHANY_MITTS_P2         },
        [ 3] = { invaderXim.item.SPAEKONAS_GLOVES_P2        },
        [ 4] = { invaderXim.item.ATROPHY_GLOVES_P2          },
        [ 5] = { invaderXim.item.PILLAGERS_ARMLETS_P2       },
        [ 6] = { invaderXim.item.REVERENCE_GAUNTLETS_P2     },
        [ 7] = { invaderXim.item.IGNOMINY_GAUNTLETS_P2      },
        [ 8] = { invaderXim.item.TOTEMIC_GLOVES_P2          },
        [ 9] = { invaderXim.item.BRIOSO_CUFFS_P2            },
        [10] = { invaderXim.item.ORION_BRACERS_P2           },
        [11] = { invaderXim.item.WAKIDO_KOTE_P2             },
        [12] = { invaderXim.item.HACHIYA_TEKKO_P2           },
        [13] = { invaderXim.item.VISHAP_FINGER_GAUNTLETS_P2 },
        [14] = { invaderXim.item.CONVOKERS_BRACERS_P2       },
        [15] = { invaderXim.item.ASSIMILATORS_BAZUBANDS_P2  },
        [16] = { invaderXim.item.LASKAMANAS_GANTS_P2        },
        [17] = { invaderXim.item.FOIRE_DASTANAS_P2          },
        [18] =
        {
            genderSpecific = true,

            [0] = { invaderXim.item.MAXIIXIM_BANGLES_F_P2 },
            [1] = { invaderXim.item.MAXIIXIM_BANGLES_M_P2 },
        },

        [19] = { invaderXim.item.ACADEMICS_BRACERS_P2 },
        [20] = { invaderXim.item.GEOMANCY_MITAINES_P2 },
        [21] = { invaderXim.item.RUNEIST_MITONS_P2    },
    },

    [9] = -- Deed Voucher +2: Legs
    {
        [ 0] = { invaderXim.item.PUMMELERS_CUISSES_P2    },
        [ 1] = { invaderXim.item.ANCHORITES_HOSE_P2      },
        [ 2] = { invaderXim.item.THEOPHANY_PANTALOONS_P2 },
        [ 3] = { invaderXim.item.SPAEKONAS_TONBAN_P2     },
        [ 4] = { invaderXim.item.ATROPHY_TIGHTS_P2       },
        [ 5] = { invaderXim.item.PILLAGERS_CULOTTES_P2   },
        [ 6] = { invaderXim.item.REVERENCE_BREECHES_P2   },
        [ 7] = { invaderXim.item.IGNOMINY_FLANCHARD_P2   },
        [ 8] = { invaderXim.item.TOTEMIC_TROUSERS_P2     },
        [ 9] = { invaderXim.item.BRIOSO_CANNIONS_P2      },
        [10] = { invaderXim.item.ORION_BRACCAE_P2        },
        [11] = { invaderXim.item.WAKIDO_HAIDATE_P2       },
        [12] = { invaderXim.item.HACHIYA_HAKAMA_P2       },
        [13] = { invaderXim.item.VISHAP_BRAIS_P2         },
        [14] = { invaderXim.item.CONVOKERS_SPATS_P2      },
        [15] = { invaderXim.item.ASSIMILATORS_SHALWAR_P2 },
        [16] = { invaderXim.item.LAKSAMANAS_TREWS_P2     },
        [17] = { invaderXim.item.FOIRE_CHURIDARS_P2      },
        [18] =
        {
            genderSpecific = true,

            [0] = { invaderXim.item.MAXIIXIM_TIGHTS_F_P2 },
            [1] = { invaderXim.item.MAXIIXIM_TIGHTS_M_P2 },
        },

        [19] = { invaderXim.item.ACADEMICS_PANTS_P2   },
        [20] = { invaderXim.item.GEOMANCY_PANTS_P2    },
        [21] = { invaderXim.item.RUNIESTS_TROUSERS_P2 },
    },

    [10] = -- Deed Voucher +2: Feet
    {
        [ 0] = { invaderXim.item.PUMMELERS_CALLIGAE_P2   },
        [ 1] = { invaderXim.item.ANCHORITES_GAITERS_P2   },
        [ 2] = { invaderXim.item.THEOPHANY_DUCKBILLS_P2  },
        [ 3] = { invaderXim.item.SPAEKONAS_SABOTS_P2     },
        [ 4] = { invaderXim.item.ATROPHY_BOOTS_P2        },
        [ 5] = { invaderXim.item.PILLAGERS_POULAINES_P2  },
        [ 6] = { invaderXim.item.REVERENCE_LEGGINGS_P2   },
        [ 7] = { invaderXim.item.IGNOMINY_SOLLERETS_P2   },
        [ 8] = { invaderXim.item.TOTEMIC_GAITERS_P2      },
        [ 9] = { invaderXim.item.BRIOSO_SLIPPERS_P2      },
        [10] = { invaderXim.item.ORION_SOCKS_P2          },
        [11] = { invaderXim.item.WAKIDO_SUNE_ATE_P2      },
        [12] = { invaderXim.item.HACHIYA_KYAHAN_P2       },
        [13] = { invaderXim.item.VISHAP_GREAVES_P2       },
        [14] = { invaderXim.item.CONVOKERS_PIGACHES_P2   },
        [15] = { invaderXim.item.ASSIMILATORS_CHARUQS_P2 },
        [16] = { invaderXim.item.LAKSAMANAS_BOTTES_P2    },
        [17] = { invaderXim.item.FOIRE_BABOUCHES_P2      },
        [18] =
        {
            genderSpecific = true,

            [0] = { invaderXim.item.MAXIIXIM_TOE_SHOES_F_P2 },
            [1] = { invaderXim.item.MAXIIXIM_TOE_SHOES_M_P2 },
        },

        [19] = { invaderXim.item.ACADEMICS_LOAFERS_P2 },
        [20] = { invaderXim.item.GEOMANCY_SANDALS_P2  },
        [21] = { invaderXim.item.RUNEIST_BOTTES_P2    },
    },

    [11] = -- Deed Token
    {
        [0] =
        {
            invaderXim.item.AGOGE_MASK,
            invaderXim.item.AGOGE_LORICA,
            invaderXim.item.AGOGE_MUFFLERS,
            invaderXim.item.AGOGE_CUISSES,
            invaderXim.item.AGOGE_CALLIGAE,
        },

        [1] =
        {
            invaderXim.item.HESYCHASTS_CROWN,
            invaderXim.item.HESYCHASTS_CYCLAS,
            invaderXim.item.HESYCHASTS_GLOVES,
            invaderXim.item.HESYCHASTS_HOSE,
            invaderXim.item.HESYCHASTS_GAITERS,
        },

        [2] =
        {
            invaderXim.item.PIETY_CAP,
            invaderXim.item.PIETY_BLIAUT,
            invaderXim.item.PIETY_MITTS,
            invaderXim.item.PIETY_PANTALOONS,
            invaderXim.item.PIETY_DUCKBILLS,
        },

        [3] =
        {
            invaderXim.item.ARCHMAGES_PETASOS,
            invaderXim.item.ARCHMAGES_COAT,
            invaderXim.item.ARCHMAGES_GLOVES,
            invaderXim.item.ARCHMAGES_TONBAN,
            invaderXim.item.ARCHMAGES_SABOTS,
        },

        [4] =
        {
            invaderXim.item.VITIATION_CHAPEAU,
            invaderXim.item.VITIATION_TABARD,
            invaderXim.item.VITIATION_GLOVES,
            invaderXim.item.VITIATION_TIGHTS,
            invaderXim.item.VITIATION_BOOTS,
        },

        [5] =
        {
            invaderXim.item.PLUNDERERS_BONNET,
            invaderXim.item.PLUNDERERS_VEST,
            invaderXim.item.PLUNDERERS_ARMLETS,
            invaderXim.item.PLUNDERERS_CULOTTES,
            invaderXim.item.PLUNDERERS_POULAINES,
        },

        [6] =
        {
            invaderXim.item.CABALLARIUS_CORONET,
            invaderXim.item.CABALLARIUS_SURCOAT,
            invaderXim.item.CABALLARIUS_GAUNTLETS,
            invaderXim.item.CABALLARIUS_BREECHES,
            invaderXim.item.CABALLARIUS_LEGGINGS,
        },

        [7] =
        {
            invaderXim.item.FALLENS_BURGEONET,
            invaderXim.item.FALLENS_CUIRASS,
            invaderXim.item.FALLENS_FINGER_GAUNTLETS,
            invaderXim.item.FALLENS_FLANCHARD,
            invaderXim.item.FALLENS_SOLLERETS,
        },

        [8] =
        {
            invaderXim.item.ANKUSA_HELM,
            invaderXim.item.ANKUSA_JACKCOAT,
            invaderXim.item.ANKUSA_GLOVES,
            invaderXim.item.ANKUSA_TROUSERS,
            invaderXim.item.ANKUSA_GAITERS,
        },

        [9] =
        {
            invaderXim.item.BIHU_ROUNDLET,
            invaderXim.item.BIHU_JUSTAUCORPS,
            invaderXim.item.BIHU_CUFFS,
            invaderXim.item.BIHU_CANNIONS,
            invaderXim.item.BIHU_SLIPPERS,
        },

        [10] =
        {
            invaderXim.item.ARCADIAN_BERET,
            invaderXim.item.ARCADIAN_JERKIN,
            invaderXim.item.ARCADIAN_BRACERS,
            invaderXim.item.ARCADIAN_BRACCAE,
            invaderXim.item.ARCADIAN_SOCKS,
        },

        [11] =
        {
            invaderXim.item.SAKONJI_KABUTO,
            invaderXim.item.SAKONJI_DOMARU,
            invaderXim.item.SAKONJI_KOTE,
            invaderXim.item.SAKONJI_HAIDATE,
            invaderXim.item.SAKONJI_SUNE_ATE,
        },

        [12] =
        {
            invaderXim.item.MOCHIZUKI_HATSUBURI,
            invaderXim.item.MOCHIZUKI_CHAINMAIL,
            invaderXim.item.MOCHIZUKI_TEKKO,
            invaderXim.item.MOCHIZUKI_HAKAMA,
            invaderXim.item.MOCHIZUKI_KYAHAN,
        },

        [13] =
        {
            invaderXim.item.PTEROSLAVER_ARMET,
            invaderXim.item.PTEROSLAVER_MAIL,
            invaderXim.item.PTEROSLAVER_FINGER_GAUNTLETS,
            invaderXim.item.PTEROSLAVER_BRAIS,
            invaderXim.item.PTEROSLAVER_GREAVES,
        },

        [14] =
        {
            invaderXim.item.GLYPHIC_HORN,
            invaderXim.item.GLYPHIC_DOUBLET,
            invaderXim.item.GLYPHIC_BRACERS,
            invaderXim.item.GLYPHIC_SPATS,
            invaderXim.item.GLYPHIC_PIGACHES,
        },

        [15] =
        {
            invaderXim.item.LUHLAZA_KEFFIYEH,
            invaderXim.item.LUHLAZA_JUBBAH,
            invaderXim.item.LUHLAZA_BAZUBANDS,
            invaderXim.item.LUHLAZA_SHALWAR,
            invaderXim.item.LUHLAZA_CHARUQS,
        },

        [16] =
        {
            invaderXim.item.LANUN_TRICORNE,
            invaderXim.item.LANUN_FRAC,
            invaderXim.item.LANUN_GANTS,
            invaderXim.item.LANUN_CULOTTES,
            invaderXim.item.LANUN_BOTTES,
        },

        [17] =
        {
            invaderXim.item.PITRE_TAJ,
            invaderXim.item.PITRE_TOBE,
            invaderXim.item.PITRE_DASTANAS,
            invaderXim.item.PITRE_CHURIDARS,
            invaderXim.item.PITRE_BABOUCHES,
        },

        [18] =
        {
            invaderXim.item.HOROS_TIARA,
            invaderXim.item.HOROS_CASAQUE,
            invaderXim.item.HOROS_BANGLES,
            invaderXim.item.HOROS_TIGHTS,
            invaderXim.item.HOROS_TOE_SHOES,
        },

        [19] =
        {
            invaderXim.item.PEDAGOGY_MORTARBOARD,
            invaderXim.item.PEDAGOGY_GOWN,
            invaderXim.item.PEDAGOGY_BRACERS,
            invaderXim.item.PEDAGOGY_PANTS,
            invaderXim.item.PEDAGOGY_LOAFERS,
        },

        [20] =
        {
            invaderXim.item.BAGUA_GALERO,
            invaderXim.item.BAGUA_TUNIC,
            invaderXim.item.BAGUA_MITAINES,
            invaderXim.item.BAGUA_PANTS,
            invaderXim.item.BAGUA_SANDALS,
        },

        [21] =
        {
            invaderXim.item.FUTHARK_BANDEAU,
            invaderXim.item.FUTHARK_COAT,
            invaderXim.item.FUTHARK_MITONS,
            invaderXim.item.FUTHARK_TROUSERS,
            invaderXim.item.FUTHARK_BOOTS,
        },
    },

    [12] = -- Deed Token +1: Head
    {
        [ 0] = { invaderXim.item.AGOGE_MASK_P1           },
        [ 1] = { invaderXim.item.HESYCHASTS_CROWN_P1     },
        [ 2] = { invaderXim.item.PIETY_CAP_P1            },
        [ 3] = { invaderXim.item.ARCHMAGES_PETASOS_P1    },
        [ 4] = { invaderXim.item.VITIATION_CHAPEAU_P1    },
        [ 5] = { invaderXim.item.PLUNDERERS_BONNET_P1    },
        [ 6] = { invaderXim.item.CABALLARIUS_CORONET_P1  },
        [ 7] = { invaderXim.item.FALLENS_BURGEONET_P1    },
        [ 8] = { invaderXim.item.ANKUSA_HELM_P1          },
        [ 9] = { invaderXim.item.BIHU_ROUNDLET_P1        },
        [10] = { invaderXim.item.ARCADIAN_BERET_P1       },
        [11] = { invaderXim.item.SAKONJI_KABUTO_P1       },
        [12] = { invaderXim.item.MOCHIZUKI_HATSUBURI_P1  },
        [13] = { invaderXim.item.PTEROSLAVER_ARMET_P1    },
        [14] = { invaderXim.item.GLYPHIC_HORN_P1         },
        [15] = { invaderXim.item.LUHLAZA_KEFFIYEH_P1     },
        [16] = { invaderXim.item.LANUN_TRICORNE_P1       },
        [17] = { invaderXim.item.PITRE_TAJ_P1            },
        [18] = { invaderXim.item.HOROS_TIARA_P1          },
        [19] = { invaderXim.item.PEDAGOGY_MORTARBOARD_P1 },
        [20] = { invaderXim.item.BAGUA_GALERO_P1         },
        [21] = { invaderXim.item.FUTHARK_BANDEAU_P1      },
    },

    [13] = -- Deed Token +1: Chest
    {
        [ 0] = { invaderXim.item.AGOGE_LORICA_P1        },
        [ 1] = { invaderXim.item.HESYCHASTS_CYCLAS_P1   },
        [ 2] = { invaderXim.item.PIETY_BLIAUT_P1        },
        [ 3] = { invaderXim.item.ARCHMAGES_COAT_P1      },
        [ 4] = { invaderXim.item.VITIATION_TABARD_P1    },
        [ 5] = { invaderXim.item.PLUNDERERS_VEST_P1     },
        [ 6] = { invaderXim.item.CABALLARIUS_SURCOAT_P1 },
        [ 7] = { invaderXim.item.FALLENS_CUIRASS_P1     },
        [ 8] = { invaderXim.item.ANKUSA_JACKCOAT_P1     },
        [ 9] = { invaderXim.item.BIHU_JUSTAUCORPS_P1    },
        [10] = { invaderXim.item.ARCADIAN_JERKIN_P1     },
        [11] = { invaderXim.item.SAKONJI_DOMARU_P1      },
        [12] = { invaderXim.item.MOCHIZUKI_CHAINMAIL_P1 },
        [13] = { invaderXim.item.PTEROSLAVER_MAIL_P1    },
        [14] = { invaderXim.item.GLYPHIC_DOUBLET_P1     },
        [15] = { invaderXim.item.LUHLAZA_JUBBAH_P1      },
        [16] = { invaderXim.item.LANUN_FRAC_P1          },
        [17] = { invaderXim.item.PITRE_TOBE_P1          },
        [18] = { invaderXim.item.HOROS_CASAQUE_P1       },
        [19] = { invaderXim.item.PEDAGOGY_GOWN_P1       },
        [20] = { invaderXim.item.BAGUA_TUNIC_P1         },
        [21] = { invaderXim.item.FUTHARK_COAT_P1        },
    },

    [14] = -- Deed Token +1: Hands
    {
        [ 0] = { invaderXim.item.AGOGE_MUFFLERS_P1               },
        [ 1] = { invaderXim.item.HESYCHASTS_GLOVES_P1            },
        [ 2] = { invaderXim.item.PIETY_MITTS_P1                  },
        [ 3] = { invaderXim.item.ARCHMAGES_GLOVES_P1             },
        [ 4] = { invaderXim.item.VITIATION_GLOVES_P1             },
        [ 5] = { invaderXim.item.PLUNDERERS_ARMLETS_P1           },
        [ 6] = { invaderXim.item.CABALLARIUS_GAUNTLETS_P1        },
        [ 7] = { invaderXim.item.FALLENS_FINGER_GAUNTLETS_P1     },
        [ 8] = { invaderXim.item.ANKUSA_GLOVES_P1                },
        [ 9] = { invaderXim.item.BIHU_CUFFS_P1                   },
        [10] = { invaderXim.item.ARCADIAN_BRACERS_P1             },
        [11] = { invaderXim.item.SAKONJI_KOTE_P1                 },
        [12] = { invaderXim.item.MOCHIZUKI_TEKKO_P1              },
        [13] = { invaderXim.item.PTEROSLAVER_FINGER_GAUNTLETS_P1 },
        [14] = { invaderXim.item.GLYPHIC_BRACERS_P1              },
        [15] = { invaderXim.item.LUHLAZA_BAZUBANDS_P1            },
        [16] = { invaderXim.item.LANUN_GANTS_P1                  },
        [17] = { invaderXim.item.PITRE_DASTANAS_P1               },
        [18] = { invaderXim.item.HOROS_BANGLES_P1                },
        [19] = { invaderXim.item.PEDAGOGY_BRACERS_P1             },
        [20] = { invaderXim.item.BAGUA_MITAINES_P1               },
        [21] = { invaderXim.item.FUTHARK_MITONS_P1               },
    },

    [15] = -- Deed Token +1: Legs
    {
        [ 0] = { invaderXim.item.AGOGE_CUISSES_P1        },
        [ 1] = { invaderXim.item.HESYCHASTS_HOSE_P1      },
        [ 2] = { invaderXim.item.PIETY_PANTALOONS_P1     },
        [ 3] = { invaderXim.item.ARCHMAGES_TONBAN_P1     },
        [ 4] = { invaderXim.item.VITIATION_TIGHTS_P1     },
        [ 5] = { invaderXim.item.PLUNDERERS_CULOTTES_P1  },
        [ 6] = { invaderXim.item.CABALLARIUS_BREECHES_P1 },
        [ 7] = { invaderXim.item.FALLENS_FLANCHARD_P1    },
        [ 8] = { invaderXim.item.ANKUSA_TROUSERS_P1      },
        [ 9] = { invaderXim.item.BIHU_CANNIONS_P1        },
        [10] = { invaderXim.item.ARCADIAN_BRACCAE_P1     },
        [11] = { invaderXim.item.SAKONJI_HAIDATE_P1      },
        [12] = { invaderXim.item.MOCHIZUKI_HAKAMA_P1     },
        [13] = { invaderXim.item.PTEROSLAVER_BRAIS_P1    },
        [14] = { invaderXim.item.GLYPHIC_SPATS_P1        },
        [15] = { invaderXim.item.LUHLAZA_SHALWAR_P1      },
        [16] = { invaderXim.item.LANUN_CULOTTES_P1       },
        [17] = { invaderXim.item.PITRE_CHURIDARS_P1      },
        [18] = { invaderXim.item.HOROS_TIGHTS_P1         },
        [19] = { invaderXim.item.PEDAGOGY_PANTS_P1       },
        [20] = { invaderXim.item.BAGUA_PANTS_P1          },
        [21] = { invaderXim.item.FUTHARK_TROUSERS_P1     },
    },

    [16] = -- Deed Token +1: Feet
    {
        [ 0] = { invaderXim.item.AGOGE_CALLIGAE_P1       },
        [ 1] = { invaderXim.item.HESYCHASTS_GAITERS_P1   },
        [ 2] = { invaderXim.item.PIETY_DUCKBILLS_P1      },
        [ 3] = { invaderXim.item.ARCHMAGES_SABOTS_P1     },
        [ 4] = { invaderXim.item.VITIATION_BOOTS_P1      },
        [ 5] = { invaderXim.item.PLUNDERERS_POULAINES_P1 },
        [ 6] = { invaderXim.item.CABALLARIUS_LEGGINGS_P1 },
        [ 7] = { invaderXim.item.FALLENS_SOLLERETS_P1    },
        [ 8] = { invaderXim.item.ANKUSA_GAITERS_P1       },
        [ 9] = { invaderXim.item.BIHU_SLIPPERS_P1        },
        [10] = { invaderXim.item.ARCADIAN_SOCKS_P1       },
        [11] = { invaderXim.item.SAKONJI_SUNE_ATE_P1     },
        [12] = { invaderXim.item.MOCHIZUKI_KYAHAN_P1     },
        [13] = { invaderXim.item.PTEROSLAVER_GREAVES_P1  },
        [14] = { invaderXim.item.GLYPHIC_PIGACHES_P1     },
        [15] = { invaderXim.item.LUHLAZA_CHARUQS_P1      },
        [16] = { invaderXim.item.LANUN_BOTTES_P1         },
        [17] = { invaderXim.item.PITRE_BABOUCHES_P1      },
        [18] = { invaderXim.item.HOROS_TOE_SHOES_P1      },
        [19] = { invaderXim.item.PEDAGOGY_LOAFERS_P1     },
        [20] = { invaderXim.item.BAGUA_SANDALS_P1        },
        [21] = { invaderXim.item.FUTHARK_BOOTS_P1        },
    },

    [17] = -- Deed Token +2: Head
    {
        [ 0] = { invaderXim.item.AGOGE_MASK_P2           },
        [ 1] = { invaderXim.item.HESYCHASTS_CROWN_P2     },
        [ 2] = { invaderXim.item.PIETY_CAP_P2            },
        [ 3] = { invaderXim.item.ARCHMAGES_PETASOS_P2    },
        [ 4] = { invaderXim.item.VITIATION_CHAPEAU_P2    },
        [ 5] = { invaderXim.item.PLUNDERERS_BONNET_P2    },
        [ 6] = { invaderXim.item.CABALLARIUS_CORONET_P2  },
        [ 7] = { invaderXim.item.FALLENS_BURGEONET_P2    },
        [ 8] = { invaderXim.item.ANKUSA_HELM_P2          },
        [ 9] = { invaderXim.item.BIHU_ROUNDLET_P2        },
        [10] = { invaderXim.item.ARCADIAN_BERET_P2       },
        [11] = { invaderXim.item.SAKONJI_KABUTO_P2       },
        [12] = { invaderXim.item.MOCHIZUKI_HATSUBURI_P2  },
        [13] = { invaderXim.item.PTEROSLAVER_ARMET_P2    },
        [14] = { invaderXim.item.GLYPHIC_HORN_P2         },
        [15] = { invaderXim.item.LUHLAZA_KEFFIYEH_P2     },
        [16] = { invaderXim.item.LANUN_TRICORNE_P2       },
        [17] = { invaderXim.item.PITRE_TAJ_P2            },
        [18] = { invaderXim.item.HOROS_TIARA_P2          },
        [19] = { invaderXim.item.PEDAGOGY_MORTARBOARD_P2 },
        [20] = { invaderXim.item.BAGUA_GALERO_P2         },
        [21] = { invaderXim.item.FUTHARK_BANDEAU_P2      },
    },

    [18] = -- Deed Token +2: Chest
    {
        [ 0] = { invaderXim.item.AGOGE_LORICA_P2        },
        [ 1] = { invaderXim.item.HESYCHASTS_CYCLAS_P2   },
        [ 2] = { invaderXim.item.PIETY_BLIAUT_P2        },
        [ 3] = { invaderXim.item.ARCHMAGES_COAT_P2      },
        [ 4] = { invaderXim.item.VITIATION_TABARD_P2    },
        [ 5] = { invaderXim.item.PLUNDERERS_VEST_P2     },
        [ 6] = { invaderXim.item.CABALLARIUS_SURCOAT_P2 },
        [ 7] = { invaderXim.item.FALLENS_CUIRASS_P2     },
        [ 8] = { invaderXim.item.ANKUSA_JACKCOAT_P2     },
        [ 9] = { invaderXim.item.BIHU_JUSTAUCORPS_P2    },
        [10] = { invaderXim.item.ARCADIAN_JERKIN_P2     },
        [11] = { invaderXim.item.SAKONJI_DOMARU_P2      },
        [12] = { invaderXim.item.MOCHIZUKI_CHAINMAIL_P2 },
        [13] = { invaderXim.item.PTEROSLAVER_MAIL_P2    },
        [14] = { invaderXim.item.GLYPHIC_DOUBLET_P2     },
        [15] = { invaderXim.item.LUHLAZA_JUBBAH_P2      },
        [16] = { invaderXim.item.LANUN_FRAC_P2          },
        [17] = { invaderXim.item.PITRE_TOBE_P2          },
        [18] = { invaderXim.item.HOROS_CASAQUE_P2       },
        [19] = { invaderXim.item.PEDAGOGY_GOWN_P2       },
        [20] = { invaderXim.item.BAGUA_TUNIC_P2         },
        [21] = { invaderXim.item.FUTHARK_COAT_P2        },
    },

    [19] = -- Deed Token +2: Hands
    {
        [ 0] = { invaderXim.item.AGOGE_MUFFLERS_P2               },
        [ 1] = { invaderXim.item.HESYCHASTS_GLOVES_P2            },
        [ 2] = { invaderXim.item.PIETY_MITTS_P2                  },
        [ 3] = { invaderXim.item.ARCHMAGES_GLOVES_P2             },
        [ 4] = { invaderXim.item.VITIATION_GLOVES_P2             },
        [ 5] = { invaderXim.item.PLUNDERERS_ARMLETS_P2           },
        [ 6] = { invaderXim.item.CABALLARIUS_GAUNTLETS_P2        },
        [ 7] = { invaderXim.item.FALLENS_FINGER_GAUNTLETS_P2     },
        [ 8] = { invaderXim.item.ANKUSA_GLOVES_P2                },
        [ 9] = { invaderXim.item.BIHU_CUFFS_P2                   },
        [10] = { invaderXim.item.ARCADIAN_BRACERS_P2             },
        [11] = { invaderXim.item.SAKONJI_KOTE_P2                 },
        [12] = { invaderXim.item.MOCHIZUKI_TEKKO_P2              },
        [13] = { invaderXim.item.PTEROSLAVER_FINGER_GAUNTLETS_P2 },
        [14] = { invaderXim.item.GLYPHIC_BRACERS_P2              },
        [15] = { invaderXim.item.LUHLAZA_BAZUBANDS_P2            },
        [16] = { invaderXim.item.LANUN_GANTS_P2                  },
        [17] = { invaderXim.item.PITRE_DASTANAS_P2               },
        [18] = { invaderXim.item.HOROS_BANGLES_P2                },
        [19] = { invaderXim.item.PEDAGOGY_BRACERS_P2             },
        [20] = { invaderXim.item.BAGUA_MITAINES_P2               },
        [21] = { invaderXim.item.FUTHARK_MITONS_P2               },
    },

    [20] = -- Deed Token +2: Legs
    {
        [ 0] = { invaderXim.item.AGOGE_CUISSES_P2        },
        [ 1] = { invaderXim.item.HESYCHASTS_HOSE_P2      },
        [ 2] = { invaderXim.item.PIETY_PANTALOONS_P2     },
        [ 3] = { invaderXim.item.ARCHMAGES_TONBAN_P2     },
        [ 4] = { invaderXim.item.VITIATION_TIGHTS_P2     },
        [ 5] = { invaderXim.item.PLUNDERERS_CULOTTES_P2  },
        [ 6] = { invaderXim.item.CABALLARIUS_BREECHES_P2 },
        [ 7] = { invaderXim.item.FALLENS_FLANCHARD_P2    },
        [ 8] = { invaderXim.item.ANKUSA_TROUSERS_P2      },
        [ 9] = { invaderXim.item.BIHU_CANNIONS_P2        },
        [10] = { invaderXim.item.ARCADIAN_BRACCAE_P2     },
        [11] = { invaderXim.item.SAKONJI_HAIDATE_P2      },
        [12] = { invaderXim.item.MOCHIZUKI_HAKAMA_P2     },
        [13] = { invaderXim.item.PTEROSLAVER_BRAIS_P2    },
        [14] = { invaderXim.item.GLYPHIC_SPATS_P2        },
        [15] = { invaderXim.item.LUHLAZA_SHALWAR_P2      },
        [16] = { invaderXim.item.LANUN_TREWS_P2          },
        [17] = { invaderXim.item.PITRE_CHURIDARS_P2      },
        [18] = { invaderXim.item.HOROS_TIGHTS_P2         },
        [19] = { invaderXim.item.PEDAGOGY_PANTS_P2       },
        [20] = { invaderXim.item.BAGUA_PANTS_P2          },
        [21] = { invaderXim.item.FUTHARK_TROUSERS_P2     },
    },

    [21] = -- Deed Token +2: Feet
    {
        [ 0] = { invaderXim.item.AGOGE_CALLIGAE_P2       },
        [ 1] = { invaderXim.item.HESYCHASTS_GAITERS_P2   },
        [ 2] = { invaderXim.item.PIETY_DUCKBILLS_P2      },
        [ 3] = { invaderXim.item.ARCHMAGES_SABOTS_P2     },
        [ 4] = { invaderXim.item.VITIATION_BOOTS_P2      },
        [ 5] = { invaderXim.item.PLUNDERERS_POULAINES_P2 },
        [ 6] = { invaderXim.item.CABALLARIUS_LEGGINGS_P2 },
        [ 7] = { invaderXim.item.FALLENS_SOLLERETS_P2    },
        [ 8] = { invaderXim.item.ANKUSA_GAITERS_P2       },
        [ 9] = { invaderXim.item.BIHU_SLIPPERS_P2        },
        [10] = { invaderXim.item.ARCADIAN_SOCKS_P2       },
        [11] = { invaderXim.item.SAKONJI_SUNE_ATE_P2     },
        [12] = { invaderXim.item.MOCHIZUKI_KYAHAN_P2     },
        [13] = { invaderXim.item.PTEROSLAVER_GREAVES_P2  },
        [14] = { invaderXim.item.GLYPHIC_PIGACHES_P2     },
        [15] = { invaderXim.item.LUHLAZA_CHARUQS_P2      },
        [16] = { invaderXim.item.LANUN_BOTTES_P2         },
        [17] = { invaderXim.item.PITRE_BABOUCHES_P2      },
        [18] = { invaderXim.item.HOROS_TOE_SHOES_P2      },
        [19] = { invaderXim.item.PEDAGOGY_LOAFERS_P2     },
        [20] = { invaderXim.item.BAGUA_SANDALS_P2        },
        [21] = { invaderXim.item.FUTHARK_BOOTS_P2        },
    },
}

local function getStoredVoucherMask(player)
    local voucherMask = 0

    for keyItemIndex = 1, #voucherKeyItems do
        if player:hasKeyItem(voucherKeyItems[keyItemIndex]) then
            voucherMask = utils.mask.setBit(voucherMask, keyItemIndex - 1, true)
        end
    end

    return voucherMask
end

local function updateValidatorEvent(player)
    local claimedRewards = player:getClaimedDeedMask()
    local storedVouchers = getStoredVoucherMask(player)
    local numDeeds       = player:getCurrency('deeds')
    local showOrHide     = bit.band(claimedRewards[1], 0x1)

    player:updateEvent(
        numDeeds,
        claimedRewards[1],
        claimedRewards[2],
        claimedRewards[3],
        claimedRewards[4],
        claimedRewards[5],
        storedVouchers,
        showOrHide
    )
end

local function hasItemInSet(player, setTable)
    for _, itemId in ipairs(setTable) do
        if player:hasItem(itemId) then
            return true
        end
    end

    return false
end

invaderXim.deeds.validatorOnTrigger = function(player, npc)
    local zoneId         = player:getZoneID()
    local numDeeds       = player:getCurrency('deeds')
    local claimedRewards = player:getClaimedDeedMask()
    local storedVouchers = getStoredVoucherMask(player)
    local showOrHide     = bit.band(claimedRewards[1], 0x1)

    player:startEvent(validatorNpcEvents[zoneId],
        numDeeds,
        claimedRewards[1],
        claimedRewards[2],
        claimedRewards[3],
        claimedRewards[4],
        claimedRewards[5],
        storedVouchers,
        showOrHide
    )
end

invaderXim.deeds.validatorOnEventUpdate = function(player, csid, option, npc)
    -- TODO: Determine what happens if inventory is full, or rare/ex item cannot
    -- be obtained.
    local updateAction = bit.rshift(option, 16)
    local updateOption = bit.band(option, 0xFFFF)

    if
        (updateAction == 1 or updateAction == 3) and
        validatorRewards[updateOption]
    then
        local bitLocation    = updateOption
        local claimedRewards = player:getClaimedDeedMask()
        local numDeeds       = player:getCurrency('deeds')
        local totalCost      = updateOption * 10

        -- NOTE: Resettable rewards (970+) are handled in the same table; however, the stored
        -- data is offset by one bit in the fourth parameter.  This block handles the conversion
        -- for the following condition.
        if updateAction == 3 then
            updateOption = updateOption > 0 and updateOption + 96 or 0
            bitLocation  = updateOption + 1
            totalCost    = 480 * bit.rshift(claimedRewards[5], 18) + updateOption * 10
        end

        if numDeeds >= totalCost then
            if validatorRewards[updateOption]['keyItemId'] then
                npcUtil.giveKeyItem(player, validatorRewards[updateOption]['keyItemId'])
                player:setClaimedDeed(bitLocation)
            elseif npcUtil.giveItem(player, { { validatorRewards[updateOption]['itemId'], validatorRewards[updateOption]['qty'] } }) then
                player:setClaimedDeed(bitLocation)
            end

            -- Only update event if the player can purchase the item.
            updateValidatorEvent(player)
        end
    elseif updateAction == 2 then
        local keyItemIndex = bit.rshift(updateOption, 8)
        local selectedSet  = bit.band(updateOption, 0xFF)
        local rewardTable  = {}

        -- NOTE: Lua tables are passed by reference on assignment, and need to ensure
        -- that we're not accidentally overwriting data when determining what to use.
        if voucherData[keyItemIndex][selectedSet].genderSpecific then
            rewardTable = voucherData[keyItemIndex][selectedSet][player:getGender()]
        else
            rewardTable = voucherData[keyItemIndex][selectedSet]
        end

        -- NOTE: Do not attempt to give any of the items if the player cannot obtain them
        -- all.  All of the rewarded items are R/EX, so it is safe to check count and hasItem.
        if
            player:getFreeSlotsCount() >= #rewardTable and
            not hasItemInSet(player, rewardTable)
        then
            player:delKeyItem(voucherKeyItems[keyItemIndex + 1])

            for _, itemId in ipairs(rewardTable) do
                if type(itemId) ~= 'boolean' then
                    npcUtil.giveItem(player, itemId)
                end
            end
        else
            local ID = zones[player:getZoneID()]

            player:messageSpecial(ID.text.CANNOT_OBTAIN_THE_ITEM)
        end

        updateValidatorEvent(player)
    elseif updateAction == 4 and updateOption == 0 then
        player:resetClaimedDeeds()
        updateValidatorEvent(player)
    elseif updateAction == 10 and updateOption == 0 then
        player:toggleReceivedDeedRewards()
        updateValidatorEvent(player)
    end
end

invaderXim.deeds.validatorOnEventFinish = function(player, csid, option, npc)
end
