-----------------------------------
-- Festive Moogle
-----------------------------------
require('scripts/globals/crafting/crafting_utils')
require('scripts/globals/npc_util')
require('scripts/globals/utils')
-----------------------------------
xi = xi or {}
invaderXim.festiveMoogle = {}

local festiveMoogleEvents =
{
    [invaderXim.zone.PORT_BASTOK   ] = { 380, 381, 439 },
    [invaderXim.zone.PORT_SAN_DORIA] = { 773, 774, 807 },
    [invaderXim.zone.WINDURST_WALLS] = { 503, 504, 531 },
}

local grantedItems =
{
    [invaderXim.item.NOMAD_CAP      ] = 'festiveMoogleNomadCap',
    [invaderXim.item.MOOGLE_CAP     ] = 'festiveMoogleMoogleCap',
    [invaderXim.item.MOOGLE_ROD     ] = 'festiveMoogleMoogleRod',
    [invaderXim.item.HARPSICHORD    ] = 'festiveMoogleHarpsichord',
    [invaderXim.item.STUFFED_CHOCOBO] = 'festiveMooglestuffedChocobo',
    [invaderXim.item.TIDAL_TALISMAN ] = 'festiveMoogleTidalTalisman',
    [invaderXim.item.DESTRIER_BERET ] = 'festiveMoogleDestrierBeret',
    [invaderXim.item.CHOCOBO_SHIRT  ] = 'festiveMoogleChocoboShirt',
}

local tradeItems =
{
    [invaderXim.item.GOLD_MOG_PELL   ] = 0,
    [invaderXim.item.RED_MOG_PELL    ] = 1,
    [invaderXim.item.GREEN_MOG_PELL  ] = 2,
    [invaderXim.item.OCHRE_MOG_PELL  ] = 3,
    [invaderXim.item.MARBLE_MOG_PELL ] = 4,
    [invaderXim.item.RAINBOW_MOG_PELL] = 5,
    [invaderXim.item.SILVER_MOG_PELL ] = 6,
}

-- NOTE: These items are hardcoded into the events, and cannot be changed!
local rewardItems =
{
    [tradeItems[invaderXim.item.GOLD_MOG_PELL]] =
    {
        [1] = -- Equipment
        {
            [ 0] = invaderXim.item.RIDILL,
            [ 1] = invaderXim.item.JOYEUSE,
            [ 2] = invaderXim.item.BYAKKOS_HAIDATE,
            [ 3] = invaderXim.item.GENBUS_SHIELD,
            [ 4] = invaderXim.item.SEIRYUS_KOTE,
            [ 5] = invaderXim.item.SUZAKUS_SUNE_ATE,
            [ 6] = invaderXim.item.HAUTECLAIRE,
            [ 7] = invaderXim.item.HOFUD,
            [ 8] = invaderXim.item.VALKYRIES_FORK,
            [ 9] = invaderXim.item.ALGOL,
            [10] = invaderXim.item.SEVENEYES,
            [11] = invaderXim.item.NIGHTFALL,
            [12] = invaderXim.item.NOCTURNUS_MAIL,
            [13] = invaderXim.item.NOCTURNUS_HELM,
            [14] = invaderXim.item.UNDECENNIAL_RING,
        },

        [2] = -- Items
        {
            [0] = { invaderXim.item.BEASTMENS_SEAL,              50 },
            [1] = { invaderXim.item.KINDREDS_SEAL,               50 },
            [2] = { invaderXim.item.KINDREDS_CREST,              50 },
            [3] = { invaderXim.item.HIGH_KINDREDS_CREST,         50 },
            [4] = { invaderXim.item.SACRED_KINDREDS_CREST,       50 },
            [5] = { invaderXim.item.COPY_OF_REMS_TALE_CHAPTER_1,  3 },
            [6] = { invaderXim.item.COPY_OF_REMS_TALE_CHAPTER_2,  3 },
            [7] = { invaderXim.item.COPY_OF_REMS_TALE_CHAPTER_3,  3 },
            [8] = { invaderXim.item.COPY_OF_REMS_TALE_CHAPTER_4,  3 },
            [9] = { invaderXim.item.COPY_OF_REMS_TALE_CHAPTER_5,  3 },
        },

        [3] = -- Currency
        {
            [0] = { 'conquest_points',   50000, 'RECEIVED_CONQUEST_POINTS',    3 },
            [1] = { 'imperial_standing', 50000, 'IMPERIAL_STANDING_INCREASED', 2 },
            [2] = { 'allied_notes',      50000, 'EARNED_ALLIED_NOTES',         2 },
            [3] = { 'bayld',             50000, 'RECEIVE_BAYLD',               2 },
            [4] = { 'guild_points',      50000, 'OBTAINED_GUILD_POINTS',       2 },
        },
    },

    [tradeItems[invaderXim.item.RED_MOG_PELL]] =
    {
        [1] = -- Equipment
        {
            [0] = invaderXim.item.ECHAD_RING,
            [1] = invaderXim.item.TRIZEK_RING,
        },

        [2] = -- Items
        {
            [ 0] = { invaderXim.item.BEASTMENS_SEAL,                   40 },
            [ 1] = { invaderXim.item.KINDREDS_SEAL,                    40 },
            [ 2] = { invaderXim.item.KINDREDS_CREST,                   40 },
            [ 3] = { invaderXim.item.HIGH_KINDREDS_CREST,              40 },
            [ 4] = { invaderXim.item.SACRED_KINDREDS_CREST,            40 },
            [ 5] = { invaderXim.item.RALA_VISAGE_IV,                    1 },
            [ 6] = { invaderXim.item.FAITHFULS_TORSO_IV,                1 },
            [ 7] = { invaderXim.item.PAIR_OF_FAITHFULS_LEGS_IV,         1 },
            [ 8] = { invaderXim.item.CIRDAS_VISAGE_IV,                  1 },
            [ 9] = { invaderXim.item.YORCIA_VISAGE_IV,                  1 },
            [10] = { invaderXim.item.RAKAZNAR_VISAGE_IV,                1 },
            [11] = { invaderXim.item.EUDAEMON_BLADE,                    1 },
            [12] = { invaderXim.item.EUDAEMON_CAPE,                     1 },
            [13] = { invaderXim.item.EUDAEMON_RING,                     1 },
            [14] = { invaderXim.item.EUDAEMON_SASH,                     1 },
            [15] = { invaderXim.item.EUDAEMON_SHIELD,                   1 },
            [16] = { invaderXim.item.WAILING_STONE_P1,                 12 },
            [17] = { invaderXim.item.SNOWSLIT_STONE_P1,                12 },
            [18] = { invaderXim.item.LEAFSLIT_STONE_P1,                12 },
            [19] = { invaderXim.item.DUSKSLIT_STONE_P1,                12 },
            [20] = { invaderXim.item.SNOWTIP_STONE_P1,                 12 },
            [21] = { invaderXim.item.LEAFTIP_STONE_P1,                 12 },
            [22] = { invaderXim.item.DUSKTIP_STONE_P1,                 12 },
            [23] = { invaderXim.item.SNOWDIM_STONE_P1,                 12 },
            [24] = { invaderXim.item.LEAFDIM_STONE_P1,                 12 },
            [25] = { invaderXim.item.DUSKDIM_STONE_P1,                 12 },
            [26] = { invaderXim.item.SNOWORB_STONE_P1,                 12 },
            [27] = { invaderXim.item.LEAFORB_STONE_P1,                 12 },
            [28] = { invaderXim.item.DUSKORB_STONE_P1,                 12 },
            [29] = { invaderXim.item.PULCHRIDOPT_WING,                  6 },
            [30] = { invaderXim.item.LEBONDOPT_WING,                    6 },
            [31] = { invaderXim.item.MELLIDOPT_WING,                    6 },
            [32] = { invaderXim.item.CIPHER_OF_ZEIDS_ALTER_EGO,         1 },
            [33] = { invaderXim.item.CIPHER_OF_LIONS_ALTER_EGO,         1 },
            [34] = { invaderXim.item.CIPHER_OF_NAJAS_ALTER_EGO,         1 },
            [35] = { invaderXim.item.CIPHER_OF_LEHKOS_ALTER_EGO,        1 },
            [36] = { invaderXim.item.CIPHER_OF_LUZAFS_ALTER_EGO,        1 },
            [37] = { invaderXim.item.CIPHER_OF_NAJELITHS_ALTER_EGO,     1 },
            [38] = { invaderXim.item.CIPHER_OF_ALDOS_ALTER_EGO,         1 },
            [39] = { invaderXim.item.CIPHER_OF_A_MOOGLES_ALTER_EGO,     1 },
            [40] = { invaderXim.item.CIPHER_OF_FABLINIXS_ALTER_EGO,     1 },
            [41] = { invaderXim.item.CIPHER_OF_D_SHANTOTTOS_ALTER_EGO,  1 },
            [42] = { invaderXim.item.CIPHER_OF_STAR_SIBYLS_ALTER_EGO,   1 },
            [43] = { invaderXim.item.CIPHER_OF_UKAS_ALTER_EGO,          1 },
            [44] = { invaderXim.item.CIPHER_OF_KUYINS_ALTER_EGO,        1 },
            [45] = { invaderXim.item.CIPHER_OF_KARAHAS_ALTER_EGO,       1 },
            [46] = { invaderXim.item.CIPHER_OF_ABENZIOS_ALTER_EGO,      1 },
            [47] = { invaderXim.item.CIPHER_OF_RUGHADJEENS_ALTER_EGO,   1 },
            [48] = { invaderXim.item.CIPHER_OF_AREUHATS_ALTER_EGO,      1 },
            [49] = { invaderXim.item.CIPHER_OF_LHES_ALTER_EGO,          1 },
            [50] = { invaderXim.item.CIPHER_OF_MAYAKOVS_ALTER_EGO,      1 },
            [51] = { invaderXim.item.CIPHER_OF_BRYGIDS_ALTER_EGO,       1 },
            [52] = { invaderXim.item.CIPHER_OF_MILDAURIONS_ALTER_EGO,   1 },
            [53] = { invaderXim.item.CIPHER_OF_RONGELOUTSS_ALTER_EGO,   1 },
            [54] = { invaderXim.item.CIPHER_OF_KUPOFRIEDS_ALTER_EGO,    1 },
        },
    },

    [tradeItems[invaderXim.item.GREEN_MOG_PELL]] =
    {
        [1] = -- Equipment
        {
            [ 0] = invaderXim.item.GOBLIN_SUIT,
            [ 1] = invaderXim.item.GREEN_MOOGLE_SUIT,
            [ 2] = invaderXim.item.GOBLIN_MASQUE,
            [ 3] = invaderXim.item.GREEN_MOOGLE_MASQUE,
            [ 4] = invaderXim.item.MORBOL_CAP,
            [ 5] = invaderXim.item.MORBOL_SHIELD,
            [ 6] = invaderXim.item.CAIT_SITH_GUARD,
            [ 7] = invaderXim.item.CAIT_SITH_CAP,
            [ 8] = invaderXim.item.ALLIANCE_SHIRT,
            [ 9] = invaderXim.item.ALLIANCE_PANTS,
            [10] = invaderXim.item.ALLIANCE_BOOTS,
            [11] = invaderXim.item.WORM_FEELERS,
            [12] = invaderXim.item.WORM_MASQUE,
            [13] = invaderXim.item.KYUKA_UCHIWA,
            [14] = invaderXim.item.ARK_TACHI,
            [15] = invaderXim.item.ARK_SABER,
            [16] = invaderXim.item.ARK_SCYTHE,
            [17] = invaderXim.item.ARK_TABAR,
            [18] = invaderXim.item.ARK_SWORD,
            [19] = invaderXim.item.CHOCOBO_MASQUE,
            [20] = invaderXim.item.CHOCOBO_SUIT,
            [21] = invaderXim.item.BOMB_MASQUE,
            [22] = invaderXim.item.EXCALIPOOR,
            [23] = invaderXim.item.PUPILS_SHIRT,
            [24] = invaderXim.item.PUPILS_TROUSERS,
            [25] = invaderXim.item.PUPILS_SHOES,
            [26] = invaderXim.item.PUPILS_CAMISA,
            [27] = invaderXim.item.LYCOPODIUM_MASQUE,
            [28] = invaderXim.item.LEAFKIN_CAP,
            [29] = invaderXim.item.SHEEP_CAP,
            [30] = invaderXim.item.HEARTBEATER,
            [31] = invaderXim.item.POROGGO_COAT,
            [32] = invaderXim.item.DUODECENNIAL_RING,
            [33] = invaderXim.item.VOCATION_RING,
        },

        [2] = -- Items
        {
            [0] = { invaderXim.item.COPPER_AMAN_VOUCHER, 10 },
            [1] = { invaderXim.item.CHERRY_TREE,          1 },
            [2] = { invaderXim.item.FAR_EAST_HEARTH,      1 },
        },
    },

    [tradeItems[invaderXim.item.OCHRE_MOG_PELL]] =
    {
        [2] = -- Items
        {
            [ 0] = { invaderXim.item.CIPHER_OF_ZEIDS_ALTER_EGO,         1 },
            [ 1] = { invaderXim.item.CIPHER_OF_LIONS_ALTER_EGO,         1 },
            [ 2] = { invaderXim.item.CIPHER_OF_TENZENS_ALTER_EGO,       1 },
            [ 3] = { invaderXim.item.CIPHER_OF_MIHLIS_ALTER_EGO,        1 },
            [ 4] = { invaderXim.item.CIPHER_OF_VALAINERALS_ALTER_EGO,   1 },
            [ 5] = { invaderXim.item.CIPHER_OF_JOACHIMS_ALTER_EGO,      1 },
            [ 6] = { invaderXim.item.CIPHER_OF_NAJAS_ALTER_EGO,         1 },
            [ 7] = { invaderXim.item.CIPHER_OF_LEHKOS_ALTER_EGO,        1 },
            [ 8] = { invaderXim.item.CIPHER_OF_OVJANGS_ALTER_EGO,       1 },
            [ 9] = { invaderXim.item.CIPHER_OF_MNEJINGS_ALTER_EGO,      1 },
            [10] = { invaderXim.item.CIPHER_OF_SAKURAS_ALTER_EGO,       1 },
            [11] = { invaderXim.item.CIPHER_OF_LUZAFS_ALTER_EGO,        1 },
            [12] = { invaderXim.item.CIPHER_OF_NAJELITHS_ALTER_EGO,     1 },
            [13] = { invaderXim.item.CIPHER_OF_ALDOS_ALTER_EGO,         1 },
            [14] = { invaderXim.item.CIPHER_OF_A_MOOGLES_ALTER_EGO,     1 },
            [15] = { invaderXim.item.CIPHER_OF_FABLINIXS_ALTER_EGO,     1 },
            [16] = { invaderXim.item.CIPHER_OF_D_SHANTOTTOS_ALTER_EGO,  1 },
            [17] = { invaderXim.item.CIPHER_OF_ELIVIRAS_ALTER_EGO,      1 },
            [18] = { invaderXim.item.CIPHER_OF_NOILLURIES_ALTER_EGO,    1 },
            [19] = { invaderXim.item.CIPHER_OF_LHUS_ALTER_EGO,          1 },
            [20] = { invaderXim.item.CIPHER_OF_F_COFFINS_ALTER_EGO,     1 },
            [21] = { invaderXim.item.CIPHER_OF_STAR_SIBYLS_ALTER_EGO,   1 },
            [22] = { invaderXim.item.CIPHER_OF_MUMORS_ALTER_EGO,        1 },
            [23] = { invaderXim.item.CIPHER_OF_UKAS_ALTER_EGO,          1 },
            [24] = { invaderXim.item.CIPHER_OF_CIDS_ALTER_EGO,          1 },
            [25] = { invaderXim.item.CIPHER_OF_RAHALS_ALTER_EGO,        1 },
            [26] = { invaderXim.item.CIPHER_OF_KORU_MORUS_ALTER_EGO,    1 },
            [27] = { invaderXim.item.CIPHER_OF_KUYINS_ALTER_EGO,        1 },
            [28] = { invaderXim.item.CIPHER_OF_KARAHAS_ALTER_EGO,       1 },
            [29] = { invaderXim.item.CIPHER_OF_BABBANS_ALTER_EGO,       1 },
            [30] = { invaderXim.item.CIPHER_OF_ABENZIOS_ALTER_EGO,      1 },
            [31] = { invaderXim.item.CIPHER_OF_RUGHADJEENS_ALTER_EGO,   1 },
            [32] = { invaderXim.item.CIPHER_OF_KUKKIS_ALTER_EGO,        1 },
            [33] = { invaderXim.item.CIPHER_OF_MARGRETS_ALTER_EGO,      1 },
            [34] = { invaderXim.item.CIPHER_OF_GILGAMESHS_ALTER_EGO,    1 },
            [35] = { invaderXim.item.CIPHER_OF_AREUHATS_ALTER_EGO,      1 },
            [36] = { invaderXim.item.CIPHER_OF_LHES_ALTER_EGO,          1 },
            [37] = { invaderXim.item.CIPHER_OF_MAYAKOVS_ALTER_EGO,      1 },
            [38] = { invaderXim.item.CIPHER_OF_QULTADAS_ALTER_EGO,      1 },
            [39] = { invaderXim.item.CIPHER_OF_ADELHEIDS_ALTER_EGO,     1 },
            [40] = { invaderXim.item.CIPHER_OF_AMCHUCHUS_ALTER_EGO,     1 },
            [41] = { invaderXim.item.CIPHER_OF_BRYGIDS_ALTER_EGO,       1 },
            [42] = { invaderXim.item.CIPHER_OF_MILDAURIONS_ALTER_EGO,   1 },
            [43] = { invaderXim.item.CIPHER_OF_RONGELOUTSS_ALTER_EGO,   1 },
            [44] = { invaderXim.item.CIPHER_OF_KUPOFRIEDS_ALTER_EGO,    1 },
            [45] = { invaderXim.item.CIPHER_OF_LEONOYNES_ALTER_EGO,     1 },
            [46] = { invaderXim.item.CIPHER_OF_MAXIMILIANS_ALTER_EGO,   1 },
            [47] = { invaderXim.item.CIPHER_OF_KAYEELS_ALTER_EGO,       1 },
            [48] = { invaderXim.item.CIPHER_OF_ROBEL_AKBELS_ALTER_EGO,  1 },
            [49] = { invaderXim.item.CIPHER_OF_INGRIDS_ALTER_EGO_II,    1 },
            [50] = { invaderXim.item.CIPHER_OF_AUGUSTS_ALTER_EGO,       1 },
            [51] = { invaderXim.item.CIPHER_OF_ROSULATIAS_ALTER_EGO,    1 },
            [52] = { invaderXim.item.CIPHER_OF_MUMORS_ALTER_EGO_II,     1 },
            [53] = { invaderXim.item.CIPHER_OF_ULLEGORES_ALTER_EGO,     1 },
            [54] = { invaderXim.item.CIPHER_OF_TEODORS_ALTER_EGO,       1 },
            [55] = { invaderXim.item.CIPHER_OF_MAKKIS_ALTER_EGO,        1 },
            [56] = { invaderXim.item.CIPHER_OF_KINGS_ALTER_EGO,         1 },
            [57] = { invaderXim.item.CIPHER_OF_MORIMARS_ALTER_EGO,      1 },
            [58] = { invaderXim.item.CIPHER_OF_DARRCUILNS_ALTER_EGO,    1 },
            [59] = { invaderXim.item.CIPHER_OF_SHANTOTTOS_ALTER_EGO_II, 1 },
        },
    },

    [tradeItems[invaderXim.item.MARBLE_MOG_PELL]] =
    {
        [2] = -- Items
        {
            [ 0] = { invaderXim.item.ADAMANTOISE_STATUE,     1 },
            [ 1] = { invaderXim.item.BEHEMOTH_STATUE,        1 },
            [ 2] = { invaderXim.item.FAFNIR_STATUE,          1 },
            [ 3] = { invaderXim.item.NOMAD_MOOGLE_STATUE,    1 },
            [ 4] = { invaderXim.item.SHADOW_LORD_STATUE,     1 },
            [ 5] = { invaderXim.item.ODIN_STATUE,            1 },
            [ 6] = { invaderXim.item.ALEXANDER_STATUE,       1 },
            [ 7] = { invaderXim.item.ARK_ANGEL_HM_STATUE,    1 },
            [ 8] = { invaderXim.item.ARK_ANGEL_EV_STATUE,    1 },
            [ 9] = { invaderXim.item.ARK_ANGEL_TT_STATUE,    1 },
            [10] = { invaderXim.item.ARK_ANGEL_MR_STATUE,    1 },
            [11] = { invaderXim.item.ARK_ANGEL_GK_STATUE,    1 },
            [12] = { invaderXim.item.PRISHE_STATUE,          1 },
            [13] = { invaderXim.item.CARDIAN_STATUE,         1 },
            [14] = { invaderXim.item.SHADOW_LORD_STATUE_II,  1 },
            [15] = { invaderXim.item.SHADOW_LORD_STATUE_III, 1 },
            [16] = { invaderXim.item.ATOMOS_STATUE,          1 },
            [17] = { invaderXim.item.YOVRA_REPLICA,          1 },
            [18] = { invaderXim.item.GOOBBUE_STATUE,         1 },
            [19] = { invaderXim.item.LAMB_CARVING,           1 },
            [20] = { invaderXim.item.POLISHED_LAMB_CARVING,  1 },
        },
    },

    [tradeItems[invaderXim.item.RAINBOW_MOG_PELL]] =
    {
        [2] = -- Items
        {
            [ 0] = { invaderXim.item.MOOGLE_ROD,            1 },
            [ 1] = { invaderXim.item.NOMAD_MOOGLE_ROD,      1 },
            [ 2] = { invaderXim.item.MOOGLE_CAP,            1 },
            [ 3] = { invaderXim.item.NOMAD_CAP,             1 },
            [ 4] = { invaderXim.item.TIDAL_TALISMAN,        1 },
            [ 5] = { invaderXim.item.TOWN_MOOGLE_SHIELD,    1 },
            [ 6] = { invaderXim.item.NOMAD_MOOGLE_SHIELD,   1 },
            [ 7] = { invaderXim.item.CHOCOBO_BERET,         1 },
            [ 8] = { invaderXim.item.DESTRIER_BERET,        1 },
            [ 9] = { invaderXim.item.MAESTROS_BATON,        1 },
            [10] = { invaderXim.item.MOOGLE_MASQUE,         1 },
            [11] = { invaderXim.item.MOOGLE_SUIT,           1 },
            [12] = { invaderXim.item.SHELL_SCEPTER,         1 },
            [13] = { invaderXim.item.GOBBIE_GAVEL,          1 },
            [14] = { invaderXim.item.MELOMANE_MALLET,       1 },
            [15] = { invaderXim.item.MANDRAGUARD,           1 },
            [16] = { invaderXim.item.CHOCOBO_SHIRT,         1 },
            [17] = { invaderXim.item.KORRIGAN_BERET,        1 },
            [18] = { invaderXim.item.DECAZOOM_MK_XI,        1 },
            [19] = { invaderXim.item.ESCRITORIO,            1 },
            [20] = { invaderXim.item.HARPSICHORD,           1 },
            [21] = { invaderXim.item.STUFFED_CHOCOBO,       1 },
            [22] = { invaderXim.item.SPINET,                1 },
            [23] = { invaderXim.item.NANAA_MIHGO_STATUE,    1 },
            [24] = { invaderXim.item.NANAA_MIHGO_STATUE_II, 1 },
        },
    },

    [tradeItems[invaderXim.item.SILVER_MOG_PELL]] =
    {
        [1] = -- Equipment
        {
            [ 0] = invaderXim.item.CICHOLS_MANTLE,
            [ 1] = invaderXim.item.SEGOMOS_MANTLE,
            [ 2] = invaderXim.item.ALAUNUSS_CAPE,
            [ 3] = invaderXim.item.TARANUSS_CAPE,
            [ 4] = invaderXim.item.SUCELLOSS_CAPE,
            [ 5] = invaderXim.item.TOUTATISS_CAPE,
            [ 6] = invaderXim.item.RUDIANOSS_MANTLE,
            [ 7] = invaderXim.item.ANKOUS_MANTLE,
            [ 8] = invaderXim.item.ARTIOS_MANTLE,
            [ 9] = invaderXim.item.INTARABUSS_CAPE,
            [10] = invaderXim.item.BELENUSS_CAPE,
            [11] = invaderXim.item.SMERTRIOSS_MANTLE,
            [12] = invaderXim.item.ANDARTIAS_MANTLE,
            [13] = invaderXim.item.BRIGANTIAS_MANTLE,
            [14] = invaderXim.item.CAMPESTRESS_CAPE,
            [15] = invaderXim.item.ROSMERTAS_CAPE,
            [16] = invaderXim.item.CAMULUSS_MANTLE,
            [17] = invaderXim.item.VISUCIUSS_MANTLE,
            [18] = invaderXim.item.SENUNAS_MANTLE,
            [19] = invaderXim.item.LUGHS_CAPE,
            [20] = invaderXim.item.NANTOSUELTAS_CAPE,
            [21] = invaderXim.item.OGMAS_CAPE,
        },

        [2] = -- Items
        {
            [ 0] = { invaderXim.item.BEASTMENS_SEAL,           60 },
            [ 1] = { invaderXim.item.KINDREDS_SEAL,            60 },
            [ 2] = { invaderXim.item.KINDREDS_CREST,           60 },
            [ 3] = { invaderXim.item.HIGH_KINDREDS_CREST,      60 },
            [ 4] = { invaderXim.item.SACRED_KINDREDS_CREST,    60 },
            [ 5] = { invaderXim.item.ROLANBERRY_DELIGHTARU,     1 },
            [ 6] = { invaderXim.item.HARVEST_PASTRY,            1 },
            [ 7] = { invaderXim.item.CHERRY_TREE,               1 },
            [ 8] = { invaderXim.item.FAR_EAST_HEARTH,           1 },
            [ 9] = { invaderXim.item.POT_OF_WARDS,              1 },
            [10] = { invaderXim.item.POT_OF_WHITE_CLEMATIS,     1 },
            [11] = { invaderXim.item.POT_OF_PINK_CLEMATIS,      1 },
            [12] = { invaderXim.item.BIRCH_TREE,                1 },
            [13] = { invaderXim.item.SPOOL_OF_ABDHALJS_THREAD, 10 },
            [14] = { invaderXim.item.PINCH_OF_ABDHALJS_DUST,   10 },
            [15] = { invaderXim.item.BOTTLE_OF_ABDHALJS_SAP,    5 },
            [16] = { invaderXim.item.POT_OF_ABDHALJS_DYE,       3 },
            [17] = { invaderXim.item.ABDHALJS_SEAL,             2 },
            [18] = { invaderXim.item.ABDHALJS_NEEDLE,           1 },
            [19] = { invaderXim.item.AMBUSCADE_VOUCHER_HEAD,    1 },
            [20] = { invaderXim.item.AMBUSCADE_VOUCHER_BODY,    1 },
            [21] = { invaderXim.item.AMBUSCADE_VOUCHER_HANDS,   1 },
            [22] = { invaderXim.item.AMBUSCADE_VOUCHER_LEGS,    1 },
            [23] = { invaderXim.item.AMBUSCADE_VOUCHER_FEET,    1 },
            [24] = { invaderXim.item.MOUNT_TIGER,               1 },
            [25] = { invaderXim.item.MOUNT_CRAB,                1 },
            [26] = { invaderXim.item.MOUNT_RED_CRAB,            1 },
            [27] = { invaderXim.item.MOUNT_BOMB,                1 },
            [28] = { invaderXim.item.MOUNT_CRAWLER,             1 },
        },
    },
}

local function getFestiveItems(player)
    local availableItems = {}

    for itemId, varName in pairs(grantedItems) do
        if player:getCharVar(varName) == 1 then
            table.insert(availableItems, itemId)
        end
    end

    return availableItems
end

invaderXim.festiveMoogle.onTrade = function(player, npc, trade)
    for pellItemId, pellType in pairs(tradeItems) do
        if npcUtil.tradeHasExactly(trade, pellItemId) then
            local craftingGuild = player:getCharVar('[GUILD]currentGuild') - 1
            local equipmentMask = 0

            -- Build a mask for denying the player Rare/Ex equipment that they already own.  This
            -- appears to only be valid for the equipment category, and not for items.
            if rewardItems[pellType][1] then
                for bitPos, rewardItemId in pairs(rewardItems[pellType][1]) do
                    local itemObj = GetItemByID(rewardItemId)

                    if
                        itemObj and
                        bit.band(itemObj:getFlag(), invaderXim.itemFlag.RARE) ~= 0 and
                        player:hasItem(rewardItemId)
                    then
                        equipmentMask = utils.mask.setBit(equipmentMask, bitPos, true)
                    end
                end
            end

            player:setLocalVar('tradedPell', pellItemId)

            player:startEvent(festiveMoogleEvents[player:getZoneID()][3], 0, pellType, equipmentMask, 0, craftingGuild)
        end
    end
end

invaderXim.festiveMoogle.onTrigger = function(player, npc)
    local zoneId       = player:getZoneID()
    local festiveItems = getFestiveItems(player)

    if #festiveItems > 0 then
        player:startEvent(festiveMoogleEvents[zoneId][1], unpack(festiveItems))
    else
        player:startEvent(festiveMoogleEvents[zoneId][2])
    end
end

invaderXim.festiveMoogle.onEventUpdate = function(player, csid, option, npc)
end

invaderXim.festiveMoogle.onEventFinish = function(player, csid, option, npc)
    local zoneId = player:getZoneID()

    -- Granted Item was selected
    if
        csid == festiveMoogleEvents[zoneId][1] and
        option ~= utils.EVENT_CANCELLED_OPTION
    then
        local festiveItems = getFestiveItems(player)
        local itemId       = festiveItems[option]

        if npcUtil.giveItem(player, itemId) then
            player:setCharVar(grantedItems[itemId], 0)
        end

    -- Pell Item was selected
    elseif csid == festiveMoogleEvents[zoneId][3] then
        local ID = zones[zoneId]

        if option ~= utils.EVENT_CANCELLED_OPTION then
            local pellType     = bit.band(bit.rshift(option, 8), 0xFF)
            local itemCategory = bit.band(option, 0xFF)
            local selectedItem = bit.rshift(option, 16)
            local rewardEntry  = rewardItems[pellType][itemCategory][selectedItem]

            if itemCategory == 3 then
                if rewardEntry[1] == 'conquest_points' then
                    player:addCP(rewardEntry[2])
                elseif rewardEntry[1] == 'guild_points' then
                    local craftingGuild = player:getCharVar('[GUILD]currentGuild') - 1

                    player:addCurrency(invaderXim.crafting.guildTable[craftingGuild][2], rewardEntry[2])
                else
                    player:addCurrency(rewardEntry[1], rewardEntry[2])
                end

                local messageParams = { 0, 0, 0 }

                messageParams[1]              = ID.text[rewardEntry[3]]
                messageParams[rewardEntry[4]] = rewardEntry[2]

                player:messageSpecial(unpack(messageParams))
                player:confirmTrade()
            else
                if npcUtil.giveItem(player, { rewardEntry }) then
                    player:confirmTrade()
                end
            end
        else
            player:messageSpecial(ID.text.ITEM_RETURNED, player:getLocalVar('tradedPell'))
        end
    end
end
