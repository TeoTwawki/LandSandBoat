-----------------------------------
-- Dealer Moogles & Kupon Global
-- https://www.bg-wiki.com/ffxi/Category:Mog_Bonanza
-----------------------------------
xi = xi or {}
invaderXim.dealerMoogle = invaderXim.dealerMoogle or {}

local debug =
{
    ENABLED     = false,    -- will disable ki consumption and print instead
    SHOWITEM    = false,    -- will display acquisition message to player if debug.ENABLED
    TO_PLAYER   = false,    -- will print debug info to player if debug.ENABLED
}

local csidLookup =
{
    [invaderXim.zone.CHOCOBO_CIRCUIT] = { 416, 417 },
    [invaderXim.zone.PORT_SAN_DORIA]  = { 790, 791 },
    [invaderXim.zone.PORT_BASTOK]     = { 398, 399 },
    [invaderXim.zone.PORT_WINDURST]   = { 856, 857 },
}

-- WARNING!!! These items cannot be customised!
-- Everything is dictacted by the client!
local kuponLookup =
{
    -- [coupon item id] = { related key item id, index of items in itemList (table below) }
    [invaderXim.item.MOG_KUPON_A_DBCD   ] = { invaderXim.ki.MOG_KUPON_A_DBCD,    1 },
    [invaderXim.item.MOG_KUPON_A_DXAR   ] = { invaderXim.ki.MOG_KUPON_A_DXAR,    2 },
    [invaderXim.item.MOG_KUPON_AW_ABS   ] = { invaderXim.ki.MOG_KUPON_AW_ABS,    3 },
    [invaderXim.item.MOG_KUPON_AW_PAN   ] = { invaderXim.ki.MOG_KUPON_AW_PAN,    4 },
    [invaderXim.item.MOG_KUPON_A_LUM    ] = { invaderXim.ki.MOG_KUPON_A_LUM,     5 },
    [invaderXim.item.MOG_KUPON_W_E85    ] = { invaderXim.ki.MOG_KUPON_W_E85,     6 },
    [invaderXim.item.MOG_KUPON_A_RJOB   ] = { invaderXim.ki.MOG_KUPON_A_RJOB,    7 },
    [invaderXim.item.MOG_KUPON_W_R90    ] = { invaderXim.ki.MOG_KUPON_W_R90,     8 },
    [invaderXim.item.MOG_KUPON_W_M90    ] = { invaderXim.ki.MOG_KUPON_W_M90,     9 },
    [invaderXim.item.MOG_KUPON_W_E90    ] = { invaderXim.ki.MOG_KUPON_W_E90,    10 },
    [invaderXim.item.MOG_KUPON_A_E2     ] = { invaderXim.ki.MOG_KUPON_A_E2,     11 },
    [invaderXim.item.MOG_KUPON_I_SEAL   ] = { invaderXim.ki.MOG_KUPON_I_SEAL,   12 },
    [invaderXim.item.MOG_KUPON_A_DEII   ] = { invaderXim.ki.MOG_KUPON_A_DEII,   13 },
    [invaderXim.item.MOG_KUPON_A_DE     ] = { invaderXim.ki.MOG_KUPON_A_DE,     14 },
    [invaderXim.item.MOG_KUPON_A_SAL    ] = { invaderXim.ki.MOG_KUPON_A_SAL,    15 },
    [invaderXim.item.MOG_KUPON_A_NYZ    ] = { invaderXim.ki.MOG_KUPON_A_NYZ,    16 },
    [invaderXim.item.MOG_KUPON_I_S5     ] = { invaderXim.ki.MOG_KUPON_I_S5,     17 },
    [invaderXim.item.MOG_KUPON_I_S2     ] = { invaderXim.ki.MOG_KUPON_I_S2,     18 },
    [invaderXim.item.MOG_KUPON_I_ORCHE  ] = { invaderXim.ki.MOG_KUPON_I_ORCHE,  19 },
    [invaderXim.item.MOG_KUPON_I_AF109  ] = { invaderXim.ki.MOG_KUPON_I_AF109,  20 },
    [invaderXim.item.MOG_KUPON_W_EWS    ] = { invaderXim.ki.MOG_KUPON_W_EWS,    21 },
    [invaderXim.item.MOG_KUPON_AW_WK    ] = { invaderXim.ki.MOG_KUPON_AW_WK,    22 },
    [invaderXim.item.MOG_KUPON_I_S3     ] = { invaderXim.ki.MOG_KUPON_I_S3,     23 },
    [invaderXim.item.MOG_KUPON_A_PK109  ] = { invaderXim.ki.MOG_KUPON_A_PK109,  24 },
    [invaderXim.item.MOG_KUPON_I_S1     ] = { invaderXim.ki.MOG_KUPON_I_S1,     25 },
    [invaderXim.item.MOG_KUPON_I_SKILL  ] = { invaderXim.ki.MOG_KUPON_I_SKILL,  26 },
    [invaderXim.item.MOG_KUPON_I_RME    ] = { invaderXim.ki.MOG_KUPON_I_RME,    27 },
--  [invaderXim.item.NOT_IN_USE         ] = { invaderXim.ki.MOG_KUPON_I,        28 },
    [invaderXim.item.MOG_KUPON_W_JOB    ] = { invaderXim.ki.MOG_KUPON_W_JOB,    29 },
    [invaderXim.item.MOG_KUPON_I_MAT    ] = { invaderXim.ki.MOG_KUPON_I_MAT,    30 },
    [invaderXim.item.MOG_KUPON_W_DEIII  ] = { invaderXim.ki.MOG_KUPON_W_DEIII,  31 },
    [invaderXim.item.MOG_KUPON_AW_MIS   ] = { invaderXim.ki.MOG_KUPON_AW_MIS,   32 },
    [invaderXim.item.MOG_KUPON_AW_VGR   ] = { invaderXim.ki.MOG_KUPON_AW_VGR,   33 },
    [invaderXim.item.MOG_KUPON_AW_VGRII ] = { invaderXim.ki.MOG_KUPON_AW_VGRII, 34 },
    [invaderXim.item.MOG_KUPON_W_PULSE  ] = { invaderXim.ki.MOG_KUPON_W_PULSE,  35 },
    [invaderXim.item.MOG_KUPON_I_STONE  ] = { invaderXim.ki.MOG_KUPON_I_STONE,  36 },
    [invaderXim.item.MOG_KUPON_AW_GFIII ] = { invaderXim.ki.MOG_KUPON_AW_GFIII, 37 },
    [invaderXim.item.MOG_KUPON_AW_GFII  ] = { invaderXim.ki.MOG_KUPON_AW_GFII,  38 },
    [invaderXim.item.MOG_KUPON_AW_GF    ] = { invaderXim.ki.MOG_KUPON_AW_GF,    39 },
    [invaderXim.item.MOG_KUPON_AW_UWIII ] = { invaderXim.ki.MOG_KUPON_AW_UWIII, 40 },
    [invaderXim.item.MOG_KUPON_AW_UWII  ] = { invaderXim.ki.MOG_KUPON_AW_UWII,  41 },
    [invaderXim.item.MOG_KUPON_AW_UW    ] = { invaderXim.ki.MOG_KUPON_AW_UW,    42 },
    [invaderXim.item.MOG_KUPON_A_AB     ] = { invaderXim.ki.MOG_KUPON_A_AB,     43 },
    [invaderXim.item.MOG_KUPON_AW_COS   ] = { invaderXim.ki.MOG_KUPON_AW_COS,   44 },
    [invaderXim.item.MOG_KUPON_AW_KUPO  ] = { invaderXim.ki.MOG_KUPON_AW_KUPO,  45 },
    [invaderXim.item.MOG_KUPON_W_EMI    ] = { invaderXim.ki.MOG_KUPON_W_EMI,    46 },
    [invaderXim.item.MOG_KUPON_A_EMI    ] = { invaderXim.ki.MOG_KUPON_A_EMI,    47 },
    [invaderXim.item.MOG_KUPON_W_SRW    ] = { invaderXim.ki.MOG_KUPON_W_SRW,    48 },
    [invaderXim.item.MOG_KUPON_W_SCC    ] = { invaderXim.ki.MOG_KUPON_W_SCC,    49 },
    [invaderXim.item.MOG_KUPON_A_SYW    ] = { invaderXim.ki.MOG_KUPON_A_SYW,    50 },
    [invaderXim.item.MOG_KUPON_W_ASRW   ] = { invaderXim.ki.MOG_KUPON_W_ASRW,   51 },
    [invaderXim.item.MOG_KUPON_W_ASCC   ] = { invaderXim.ki.MOG_KUPON_W_ASCC,   52 },
    [invaderXim.item.MOG_KUPON_A_ASYW   ] = { invaderXim.ki.MOG_KUPON_A_ASYW,   53 },
    [invaderXim.item.MOG_KUPON_W_R119   ] = { invaderXim.ki.MOG_KUPON_W_R119,   54 },
    [invaderXim.item.MOG_KUPON_W_M119   ] = { invaderXim.ki.MOG_KUPON_W_M119,   55 },
    [invaderXim.item.MOG_KUPON_W_E119   ] = { invaderXim.ki.MOG_KUPON_W_E119,   56 },
    [invaderXim.item.MOG_KUPON_W_A119   ] = { invaderXim.ki.MOG_KUPON_W_A119,   57 },
    [invaderXim.item.MOG_KUPON_AW_GEIV  ] = { invaderXim.ki.MOG_KUPON_AW_GEIV,  58 },
    [invaderXim.item.MOG_KUPON_A_OMII   ] = { invaderXim.ki.MOG_KUPON_A_OMII,   59 },
    [invaderXim.item.MOG_KUPON_I_AF119  ] = { invaderXim.ki.MOG_KUPON_I_AF119,  60 },
    [invaderXim.item.MOG_KUPON_AW_OM    ] = { invaderXim.ki.MOG_KUPON_AW_OM,    61 },
    [invaderXim.item.MOG_KUPON_W_RMEA   ] = { invaderXim.ki.MOG_KUPON_W_RMEA,   62 },
--  [invaderXim.item.NEXT_POTENTIAL_ID  ] = { invaderXim.ki.NEXT_POTENTIAL_ID,  63 },

}

-- WARNING!!! These items cannot be customised, and must be in the order
-- they appear in the in-game menus! Everything is dictated by the client!
local itemList =
{
    -- Kupon A-DBcd: Dynamis - Beaucedine (MOG_KUPON_A_DBCD = 2745)
    [1] =
    {
        invaderXim.item.WARRIORS_CUISSES,
        invaderXim.item.MELEE_CYCLAS,
        invaderXim.item.CLERICS_BLIAUT,
        invaderXim.item.SORCERERS_COAT,
        invaderXim.item.DUELISTS_TABARD,
        invaderXim.item.ASSASSINS_CULOTTES,
        invaderXim.item.VALOR_BREECHES,
        invaderXim.item.ABYSS_CUIRASS,
        invaderXim.item.MONSTER_GAITERS,
        invaderXim.item.BARDS_JUSTAUCORPS,
        invaderXim.item.SCOUTS_SOCKS,
        invaderXim.item.SAOTOME_DOMARU,
        invaderXim.item.KOGA_CHAINMAIL,
        invaderXim.item.WYRM_MAIL,
        invaderXim.item.SUMMONERS_DOUBLET,
        invaderXim.item.MIRAGE_JUBBAH,
        invaderXim.item.COMMODORE_FRAC,
        invaderXim.item.PANTIN_TOBE,
        invaderXim.item.ETOILE_TIGHTS,
        invaderXim.item.ARGUTE_GOWN,
    },

    -- Kupon A-DXar: Dynamis - Xarcabard (MOG_KUPON_A_DXAR = 2746)
    [2] =
    {
        invaderXim.item.WARRIORS_LORICA,
        invaderXim.item.MELEE_CROWN,
        invaderXim.item.CLERICS_MITTS,
        invaderXim.item.SORCERERS_PETASOS,
        invaderXim.item.DUELISTS_CHAPEAU,
        invaderXim.item.ASSASSINS_ARMLETS,
        invaderXim.item.VALOR_SURCOAT,
        invaderXim.item.ABYSS_BURGEONET,
        invaderXim.item.MONSTER_GLOVES,
        invaderXim.item.BARDS_CANNIONS,
        invaderXim.item.SCOUTS_JERKIN,
        invaderXim.item.SAOTOME_KABUTO,
        invaderXim.item.KOGA_TEKKO,
        invaderXim.item.WYRM_ARMET,
        invaderXim.item.SUMMONERS_HORN,
        invaderXim.item.MIRAGE_KEFFIYEH,
        invaderXim.item.COMMODORE_TRICORNE,
        invaderXim.item.PANTIN_TAJ,
        invaderXim.item.ETOILE_CASAQUE,
        invaderXim.item.ARGUTE_MORTARBOARD,
    },

    -- Kupon AW-Abs: Absolute Virtue (MOG_KUPON_AW_ABS = 2802)
    [3] =
    {
        invaderXim.item.NINURTAS_SASH,
        invaderXim.item.MARSS_RING,
        invaderXim.item.BELLONAS_RING,
        invaderXim.item.MINERVAS_RING,
        invaderXim.item.FUTSUNO_MITAMA,
        invaderXim.item.AUREOLE,
        invaderXim.item.RAPHAELS_ROD,
    },

    -- Kupon AW-Pan: Pandemonium Warden (MOG_KUPON_AW_PAN = 2801)
    [4] =
    {
        invaderXim.item.HACHIRYU_HARAMAKI,
        invaderXim.item.NANATSUSAYA,
        invaderXim.item.DORJE,
        invaderXim.item.SHENLONGS_BAGHNAKHS,
    },

    -- Kupon A-Lum: Sea NM System (MOG_KUPON_A_LUM = 2736)
    [5] =
    {
        invaderXim.item.JUSTICE_TORQUE,
        invaderXim.item.HOPE_TORQUE,
        invaderXim.item.PRUDENCE_TORQUE,
        invaderXim.item.FORTITUDE_TORQUE,
        invaderXim.item.FAITH_TORQUE,
        invaderXim.item.TEMPERANCE_TORQUE,
        invaderXim.item.LOVE_TORQUE,
        invaderXim.item.MERCIFUL_CAPE,
        invaderXim.item.ALTRUISTIC_CAPE,
        invaderXim.item.ASTUTE_CAPE,
    },

    -- Kupon W-E85: Lv85 Empyrean Weapons (MOG_KUPON_W_E85 = 2958)
    [6] =
    {
        invaderXim.item.VERETHRAGNA_85,
        invaderXim.item.TWASHTAR_85,
        invaderXim.item.ALMACE_85,
        invaderXim.item.CALADBOLG_85,
        invaderXim.item.FARSHA_85,
        invaderXim.item.UKONVASARA_85,
        invaderXim.item.REDEMPTION_85,
        invaderXim.item.RHONGOMIANT_85,
        invaderXim.item.KANNAGI_85,
        invaderXim.item.MASAMUNE_85,
        invaderXim.item.GAMBANTEINN_85,
        invaderXim.item.HVERGELMIR_85,
        invaderXim.item.GANDIVA_85,
        invaderXim.item.ARMAGEDDON_85,
    },

    -- Kupon A-RJob: Lv70 Relic Armor Accessories (MOG_KUPON_A_RJOB = 2959)
    [7] =
    {
        invaderXim.item.WARRIORS_STONE,
        invaderXim.item.MELEE_CAPE,
        invaderXim.item.CLERICS_BELT,
        invaderXim.item.SORCERERS_BELT,
        invaderXim.item.DUELISTS_BELT,
        invaderXim.item.ASSASSINS_CAPE,
        invaderXim.item.VALOR_CAPE,
        invaderXim.item.ABYSS_CAPE,
        invaderXim.item.MONSTER_BELT,
        invaderXim.item.BARDS_CAPE,
        invaderXim.item.SCOUTS_BELT,
        invaderXim.item.SAOTOME_KOSHI_ATE,
        invaderXim.item.KOGA_SARASHI,
        invaderXim.item.WYRM_BELT,
        invaderXim.item.SUMMONERS_CAPE,
        invaderXim.item.MIRAGE_MANTLE,
        invaderXim.item.COMMODORE_BELT,
        invaderXim.item.PANTIN_CAPE,
        invaderXim.item.ETOILE_CAPE,
        invaderXim.item.ARGUTE_BELT,
    },

    -- Kupon W-R90: Lv90 Relic Weapons and upgrade materials (MOG_KUPON_W_R90 = 3438)
    [8] =
    {
        { invaderXim.item.AEGIS_90,            { invaderXim.item.VIAL_OF_UMBRAL_MARROW, 5 }                           },
        { invaderXim.item.GJALLARHORN_90,      { invaderXim.item.VIAL_OF_UMBRAL_MARROW, 5 }                           },
        { invaderXim.item.SPHARAI_90,          { invaderXim.item.VIAL_OF_UMBRAL_MARROW, 5 }, { invaderXim.item.PLUTON, 300 } },
        { invaderXim.item.MANDAU_90,           { invaderXim.item.VIAL_OF_UMBRAL_MARROW, 5 }, { invaderXim.item.PLUTON, 300 } },
        { invaderXim.item.EXCALIBUR_90,        { invaderXim.item.VIAL_OF_UMBRAL_MARROW, 5 }, { invaderXim.item.PLUTON, 300 } },
        { invaderXim.item.RAGNAROK_90,         { invaderXim.item.VIAL_OF_UMBRAL_MARROW, 5 }, { invaderXim.item.PLUTON, 300 } },
        { invaderXim.item.GUTTLER_90,          { invaderXim.item.VIAL_OF_UMBRAL_MARROW, 5 }, { invaderXim.item.PLUTON, 300 } },
        { invaderXim.item.BRAVURA_90,          { invaderXim.item.VIAL_OF_UMBRAL_MARROW, 5 }, { invaderXim.item.PLUTON, 300 } },
        { invaderXim.item.GUNGNIR_90,          { invaderXim.item.VIAL_OF_UMBRAL_MARROW, 5 }, { invaderXim.item.PLUTON, 300 } },
        { invaderXim.item.APOCALYPSE_90,       { invaderXim.item.VIAL_OF_UMBRAL_MARROW, 5 }, { invaderXim.item.PLUTON, 300 } },
        { invaderXim.item.KIKOKU_90,           { invaderXim.item.VIAL_OF_UMBRAL_MARROW, 5 }, { invaderXim.item.PLUTON, 300 } },
        { invaderXim.item.AMANOMURAKUMO_90,    { invaderXim.item.VIAL_OF_UMBRAL_MARROW, 5 }, { invaderXim.item.PLUTON, 300 } },
        { invaderXim.item.MJOLLNIR_90,         { invaderXim.item.VIAL_OF_UMBRAL_MARROW, 5 }, { invaderXim.item.PLUTON, 300 } },
        { invaderXim.item.CLAUSTRUM_90,        { invaderXim.item.VIAL_OF_UMBRAL_MARROW, 5 }, { invaderXim.item.PLUTON, 300 } },
        { invaderXim.item.ANNIHILATOR_90,      { invaderXim.item.VIAL_OF_UMBRAL_MARROW, 5 }, { invaderXim.item.PLUTON, 300 } },
        { invaderXim.item.YOICHINOYUMI_90,     { invaderXim.item.VIAL_OF_UMBRAL_MARROW, 5 }, { invaderXim.item.PLUTON, 300 } },
    },

    -- Kupon W-M90: Lv90 Mythic Weapons (MOG_KUPON_W_M90 = 3439)
    [9] =
    {
        { invaderXim.item.CONQUEROR_90,        { invaderXim.item.MULCIBARS_SCORIA, 3 }, { invaderXim.item.BEITETSU, 300 } },
        { invaderXim.item.GLANZFAUST_90,       { invaderXim.item.MULCIBARS_SCORIA, 3 }, { invaderXim.item.BEITETSU, 300 } },
        { invaderXim.item.YAGRUSH_90,          { invaderXim.item.MULCIBARS_SCORIA, 3 }, { invaderXim.item.BEITETSU, 300 } },
        { invaderXim.item.LAEVATEINN_90,       { invaderXim.item.MULCIBARS_SCORIA, 3 }, { invaderXim.item.BEITETSU, 300 } },
        { invaderXim.item.MURGLEIS_90,         { invaderXim.item.MULCIBARS_SCORIA, 3 }, { invaderXim.item.BEITETSU, 300 } },
        { invaderXim.item.VAJRA_90,            { invaderXim.item.MULCIBARS_SCORIA, 3 }, { invaderXim.item.BEITETSU, 300 } },
        { invaderXim.item.BURTGANG_90,         { invaderXim.item.MULCIBARS_SCORIA, 3 }, { invaderXim.item.BEITETSU, 300 } },
        { invaderXim.item.LIBERATOR_90,        { invaderXim.item.MULCIBARS_SCORIA, 3 }, { invaderXim.item.BEITETSU, 300 } },
        { invaderXim.item.AYMUR_90,            { invaderXim.item.MULCIBARS_SCORIA, 3 }, { invaderXim.item.BEITETSU, 300 } },
        { invaderXim.item.CARNWENHAN_90,       { invaderXim.item.MULCIBARS_SCORIA, 3 }, { invaderXim.item.BEITETSU, 300 } },
        { invaderXim.item.GASTRAPHETES_90,     { invaderXim.item.MULCIBARS_SCORIA, 3 }, { invaderXim.item.BEITETSU, 300 } },
        { invaderXim.item.KOGARASUMARU_90,     { invaderXim.item.MULCIBARS_SCORIA, 3 }, { invaderXim.item.BEITETSU, 300 } },
        { invaderXim.item.NAGI_90,             { invaderXim.item.MULCIBARS_SCORIA, 3 }, { invaderXim.item.BEITETSU, 300 } },
        { invaderXim.item.RYUNOHIGE_90,        { invaderXim.item.MULCIBARS_SCORIA, 3 }, { invaderXim.item.BEITETSU, 300 } },
        { invaderXim.item.NIRVANA_90,          { invaderXim.item.MULCIBARS_SCORIA, 3 }, { invaderXim.item.BEITETSU, 300 } },
        { invaderXim.item.TIZONA_90,           { invaderXim.item.MULCIBARS_SCORIA, 3 }, { invaderXim.item.BEITETSU, 300 } },
        { invaderXim.item.DEATH_PENALTY_90,    { invaderXim.item.MULCIBARS_SCORIA, 3 }, { invaderXim.item.BEITETSU, 300 } },
        { invaderXim.item.KENKONKEN_90,        { invaderXim.item.MULCIBARS_SCORIA, 3 }, { invaderXim.item.BEITETSU, 300 } },
        { invaderXim.item.TERPSICHORE_90,      { invaderXim.item.MULCIBARS_SCORIA, 3 }, { invaderXim.item.BEITETSU, 300 } },
        { invaderXim.item.TUPSIMATI_90,        { invaderXim.item.MULCIBARS_SCORIA, 3 }, { invaderXim.item.BEITETSU, 300 } },
    },

    -- Kupon W-E90: Lv90 Empyrean Weapons (MOG_KUPON_W_E90 = 3440)
    [10] =
    {
        { invaderXim.item.VERETHRAGNA_90,  invaderXim.item.DENSE_CLUSTER, { invaderXim.item.PINCH_OF_RIFTCINDER, 60 }, { invaderXim.item.RIFTBORN_BOULDER, 300 } },
        { invaderXim.item.TWASHTAR_90,     invaderXim.item.DENSE_CLUSTER, { invaderXim.item.CLUMP_OF_RIFTDROSS,  60 }, { invaderXim.item.RIFTBORN_BOULDER, 300 } },
        { invaderXim.item.ALMACE_90,       invaderXim.item.DENSE_CLUSTER, { invaderXim.item.PINCH_OF_RIFTCINDER, 60 }, { invaderXim.item.RIFTBORN_BOULDER, 300 } },
        { invaderXim.item.CALADBOLG_90,    invaderXim.item.DENSE_CLUSTER, { invaderXim.item.CLUMP_OF_RIFTDROSS,  60 }, { invaderXim.item.RIFTBORN_BOULDER, 300 } },
        { invaderXim.item.FARSHA_90,       invaderXim.item.DENSE_CLUSTER, { invaderXim.item.PINCH_OF_RIFTCINDER, 60 }, { invaderXim.item.RIFTBORN_BOULDER, 300 } },
        { invaderXim.item.UKONVASARA_90,   invaderXim.item.DENSE_CLUSTER, { invaderXim.item.CLUMP_OF_RIFTDROSS,  60 }, { invaderXim.item.RIFTBORN_BOULDER, 300 } },
        { invaderXim.item.REDEMPTION_90,   invaderXim.item.DENSE_CLUSTER, { invaderXim.item.PINCH_OF_RIFTCINDER, 60 }, { invaderXim.item.RIFTBORN_BOULDER, 300 } },
        { invaderXim.item.RHONGOMIANT_90,  invaderXim.item.DENSE_CLUSTER, { invaderXim.item.PINCH_OF_RIFTCINDER, 60 }, { invaderXim.item.RIFTBORN_BOULDER, 300 } },
        { invaderXim.item.KANNAGI_90,      invaderXim.item.DENSE_CLUSTER, { invaderXim.item.CLUMP_OF_RIFTDROSS,  60 }, { invaderXim.item.RIFTBORN_BOULDER, 300 } },
        { invaderXim.item.MASAMUNE_90,     invaderXim.item.DENSE_CLUSTER, { invaderXim.item.PINCH_OF_RIFTCINDER, 60 }, { invaderXim.item.RIFTBORN_BOULDER, 300 } },
        { invaderXim.item.GAMBANTEINN_90,  invaderXim.item.DENSE_CLUSTER, { invaderXim.item.CLUMP_OF_RIFTDROSS,  60 }, { invaderXim.item.RIFTBORN_BOULDER, 300 } },
        { invaderXim.item.HVERGELMIR_90,   invaderXim.item.DENSE_CLUSTER, { invaderXim.item.CLUMP_OF_RIFTDROSS,  60 }, { invaderXim.item.RIFTBORN_BOULDER, 300 } },
        { invaderXim.item.GANDIVA_90,      invaderXim.item.DENSE_CLUSTER, { invaderXim.item.PINCH_OF_RIFTCINDER, 60 }, { invaderXim.item.RIFTBORN_BOULDER, 300 } },
        { invaderXim.item.ARMAGEDDON_90,   invaderXim.item.DENSE_CLUSTER, { invaderXim.item.CLUMP_OF_RIFTDROSS,  60 }, { invaderXim.item.RIFTBORN_BOULDER, 300 } },
        { invaderXim.item.DAURDABLA_90,    invaderXim.item.DENSE_CLUSTER, { invaderXim.item.PINCH_OF_RIFTCINDER, 60 },                                    },
        { invaderXim.item.OCHAIN_90,       invaderXim.item.DENSE_CLUSTER, { invaderXim.item.CLUMP_OF_RIFTDROSS,  60 },                                    },
    },

    -- Kupon A-E+2: Empyrean Armor +2 (MOG_KUPON_A_E2 = 3441)
    [11] =
    {
        { invaderXim.item.RAVAGERS_MASK_P2,        invaderXim.item.RAVAGERS_LORICA_P2,    invaderXim.item.RAVAGERS_MUFFLERS_P2,      invaderXim.item.RAVAGERS_CUISSES_P2,   invaderXim.item.RAVAGERS_CALLIGAE_P2   },
        { invaderXim.item.TANTRA_CROWN_P2,         invaderXim.item.TANTRA_CYCLAS_P2,      invaderXim.item.TANTRA_GLOVES_P2,          invaderXim.item.TANTRA_HOSE_P2,        invaderXim.item.TANTRA_GAITERS_P2      },
        { invaderXim.item.ORISON_CAP_P2,           invaderXim.item.ORISON_BLIAUD_P2,      invaderXim.item.ORISON_MITTS_P2,           invaderXim.item.ORISON_PANTALOONS_P2,  invaderXim.item.ORISON_DUCKBILLS_P2    },
        { invaderXim.item.GOETIA_PETASOS_P2,       invaderXim.item.GOETIA_COAT_P2,        invaderXim.item.GOETIA_GLOVES_P2,          invaderXim.item.GOETIA_CHAUSSES_P2,    invaderXim.item.GOETIA_SABOTS_P2       },
        { invaderXim.item.ESTOQUEURS_CHAPPEL_P2,   invaderXim.item.ESTOQUEURS_SAYON_P2,   invaderXim.item.ESTOQUEURS_GANTHEROTS_P2,  invaderXim.item.ESTOQUEURS_FUSEAU_P2,  invaderXim.item.ESTOQUEURS_HOUSEAUX_P2 },
        { invaderXim.item.RAIDERS_BONNET_P2,       invaderXim.item.RAIDERS_VEST_P2,       invaderXim.item.RAIDERS_ARMLETS_P2,        invaderXim.item.RAIDERS_CULOTTES_P2,   invaderXim.item.RAIDERS_POULAINES_P2   },
        { invaderXim.item.CREED_ARMET_P2,          invaderXim.item.CREED_CUIRASS_P2,      invaderXim.item.CREED_GAUNTLETS_P2,        invaderXim.item.CREED_CUISSES_P2,      invaderXim.item.CREED_SABATONS_P2      },
        { invaderXim.item.BALE_BURGEONET_P2,       invaderXim.item.BALE_CUIRASS_P2,       invaderXim.item.BALE_GAUNTLETS_P2,         invaderXim.item.BALE_FLANCHARD_P2,     invaderXim.item.BALE_SOLLERETS_P2      },
        { invaderXim.item.FERINE_CABASSET_P2,      invaderXim.item.FERINE_GAUSAPE_P2,     invaderXim.item.FERINE_MANOPLAS_P2,        invaderXim.item.FERINE_QUIJOTES_P2,    invaderXim.item.FERINE_OCREAE_P2       },
        { invaderXim.item.AOIDOS_CALOT_P2,         invaderXim.item.AOIDOS_HONGRELINE_P2,  invaderXim.item.AOIDOS_MANCHETTES_P2,      invaderXim.item.AOIDOS_RHINGRAVE_P2,   invaderXim.item.AOIDOS_COTHURNES_P2    },
        { invaderXim.item.SYLVAN_GAPETTE_P2,       invaderXim.item.SYLVAN_CABAN_P2,       invaderXim.item.SYLVAN_GLOVELETTES_P2,     invaderXim.item.SYLVAN_BRAGUES_P2,     invaderXim.item.SYLVAN_BOTTILLONS_P2   },
        { invaderXim.item.UNKAI_KABUTO_P2,         invaderXim.item.UNKAI_DOMARU_P2,       invaderXim.item.UNKAI_KOTE_P2,             invaderXim.item.UNKAI_HAIDATE_P2,      invaderXim.item.UNKAI_SUNE_ATE_P2      },
        { invaderXim.item.IGA_ZUKIN_P2,            invaderXim.item.IGA_NINGI_P2,          invaderXim.item.IGA_TEKKO_P2,              invaderXim.item.IGA_HAKAMA_P2,         invaderXim.item.IGA_KYAHAN_P2          },
        { invaderXim.item.LANCERS_MEZAIL_P2,       invaderXim.item.LANCERS_PLACKART_P2,   invaderXim.item.LANCERS_VAMBRACES_P2,      invaderXim.item.LANCERS_CUISSOTS_P2,   invaderXim.item.LANCERS_SCHYNBALDS_P2  },
        { invaderXim.item.CALLERS_HORN_P2,         invaderXim.item.CALLERS_DOUBLET_P2,    invaderXim.item.CALLERS_BRACERS_P2,        invaderXim.item.CALLERS_SPATS_P2,      invaderXim.item.CALLERS_PIGACHES_P2    },
        { invaderXim.item.MAVI_KAVUK_P2,           invaderXim.item.MAVI_MINTAN_P2,        invaderXim.item.MAVI_BAZUBANDS_P2,         invaderXim.item.MAVI_TAYT_P2,          invaderXim.item.MAVI_BASMAK_P2         },
        { invaderXim.item.NAVARCHS_TRICORNE_P2,    invaderXim.item.NAVARCHS_FRAC_P2,      invaderXim.item.NAVARCHS_GANTS_P2,         invaderXim.item.NAVARCHS_CULOTTES_P2,  invaderXim.item.NAVARCHS_BOTTES_P2     },
        { invaderXim.item.CIRQUE_CAPPELLO_P2,      invaderXim.item.CIRQUE_FARSETTO_P2,    invaderXim.item.CIRQUE_GUANTI_P2,          invaderXim.item.CIRQUE_PANTALONI_P2,   invaderXim.item.CIRQUE_SCARPE_P2       },
        { invaderXim.item.CHARIS_TIARA_P2,         invaderXim.item.CHARIS_CASAQUE_P2,     invaderXim.item.CHARIS_BANGLES_P2,         invaderXim.item.CHARIS_TIGHTS_P2,      invaderXim.item.CHARIS_TOE_SHOES_P2    },
        { invaderXim.item.SAVANTS_BONNET_P2,       invaderXim.item.SAVANTS_GOWN_P2,       invaderXim.item.SAVANTS_BRACERS_P2,        invaderXim.item.SAVANTS_PANTS_P2,      invaderXim.item.SAVANTS_LOAFERS_P2     },
    },
    -- Kupon I-Seal: 10 (Body) or 8 (other) of any One Empyrean Armor upgrade seals (MOG_KUPON_I_SEAL = 3442)
    [12] =
    {-- List 12 uses submenus and requires different table formatting to address each { itemid, qty } pairing. Item = List[12][Job][Slot]
        { { invaderXim.item.RAVAGERS_SEAL_HEAD,   8 }, { invaderXim.item.RAVAGERS_SEAL_BODY,   10 }, { invaderXim.item.RAVAGERS_SEAL_HANDS,   8 }, { invaderXim.item.RAVAGERS_SEAL_LEGS,   8 }, { invaderXim.item.RAVAGERS_SEAL_FEET,   8 } },
        { { invaderXim.item.TANTRA_SEAL_HEAD,     8 }, { invaderXim.item.TANTRA_SEAL_BODY,     10 }, { invaderXim.item.TANTRA_SEAL_HANDS,     8 }, { invaderXim.item.TANTRA_SEAL_LEGS,     8 }, { invaderXim.item.TANTRA_SEAL_FEET,     8 } },
        { { invaderXim.item.ORISON_SEAL_HEAD,     8 }, { invaderXim.item.ORISON_SEAL_BODY,     10 }, { invaderXim.item.ORISON_SEAL_HANDS,     8 }, { invaderXim.item.ORISON_SEAL_LEGS,     8 }, { invaderXim.item.ORISON_SEAL_FEET,     8 } },
        { { invaderXim.item.GOETIA_SEAL_HEAD,     8 }, { invaderXim.item.GOETIA_SEAL_BODY,     10 }, { invaderXim.item.GOETIA_SEAL_HANDS,     8 }, { invaderXim.item.GOETIA_SEAL_LEGS,     8 }, { invaderXim.item.GOETIA_SEAL_FEET,     8 } },
        { { invaderXim.item.ESTOQUEURS_SEAL_HEAD, 8 }, { invaderXim.item.ESTOQUEURS_SEAL_BODY, 10 }, { invaderXim.item.ESTOQUEURS_SEAL_HANDS, 8 }, { invaderXim.item.ESTOQUEURS_SEAL_LEGS, 8 }, { invaderXim.item.ESTOQUEURS_SEAL_FEET, 8 } },
        { { invaderXim.item.RAIDERS_SEAL_HEAD,    8 }, { invaderXim.item.RAIDERS_SEAL_BODY,    10 }, { invaderXim.item.RAIDERS_SEAL_HANDS,    8 }, { invaderXim.item.RAIDERS_SEAL_LEGS,    8 }, { invaderXim.item.RAIDERS_SEAL_FEET,    8 } },
        { { invaderXim.item.CREED_SEAL_HEAD,      8 }, { invaderXim.item.CREED_SEAL_BODY,      10 }, { invaderXim.item.CREED_SEAL_HANDS,      8 }, { invaderXim.item.CREED_SEAL_LEGS,      8 }, { invaderXim.item.CREED_SEAL_FEET,      8 } },
        { { invaderXim.item.BALE_SEAL_HEAD,       8 }, { invaderXim.item.BALE_SEAL_BODY,       10 }, { invaderXim.item.BALE_SEAL_HANDS,       8 }, { invaderXim.item.BALE_SEAL_LEGS,       8 }, { invaderXim.item.BALE_SEAL_FEET,       8 } },
        { { invaderXim.item.FERINE_SEAL_HEAD,     8 }, { invaderXim.item.FERINE_SEAL_BODY,     10 }, { invaderXim.item.FERINE_SEAL_HANDS,     8 }, { invaderXim.item.FERINE_SEAL_LEGS,     8 }, { invaderXim.item.FERINE_SEAL_FEET,     8 } },
        { { invaderXim.item.AOIDOS_SEAL_HEAD,     8 }, { invaderXim.item.AOIDOS_SEAL_BODY,     10 }, { invaderXim.item.AOIDOS_SEAL_HANDS,     8 }, { invaderXim.item.AOIDOS_SEAL_LEGS,     8 }, { invaderXim.item.AOIDOS_SEAL_FEET,     8 } },
        { { invaderXim.item.SYLVAN_SEAL_HEAD,     8 }, { invaderXim.item.SYLVAN_SEAL_BODY,     10 }, { invaderXim.item.SYLVAN_SEAL_HANDS,     8 }, { invaderXim.item.SYLVAN_SEAL_LEGS,     8 }, { invaderXim.item.SYLVAN_SEAL_FEET,     8 } },
        { { invaderXim.item.UNKAI_SEAL_HEAD,      8 }, { invaderXim.item.UNKAI_SEAL_BODY,      10 }, { invaderXim.item.UNKAI_SEAL_HANDS,      8 }, { invaderXim.item.UNKAI_SEAL_LEGS,      8 }, { invaderXim.item.UNKAI_SEAL_FEET,      8 } },
        { { invaderXim.item.IGA_SEAL_HEAD,        8 }, { invaderXim.item.IGA_SEAL_BODY,        10 }, { invaderXim.item.IGA_SEAL_HANDS,        8 }, { invaderXim.item.IGA_SEAL_LEGS,        8 }, { invaderXim.item.IGA_SEAL_FEET,        8 } },
        { { invaderXim.item.LANCERS_SEAL_HEAD,    8 }, { invaderXim.item.LANCERS_SEAL_BODY,    10 }, { invaderXim.item.LANCERS_SEAL_HANDS,    8 }, { invaderXim.item.LANCERS_SEAL_LEGS,    8 }, { invaderXim.item.LANCERS_SEAL_FEET,    8 } },
        { { invaderXim.item.CALLERS_SEAL_HEAD,    8 }, { invaderXim.item.CALLERS_SEAL_BODY,    10 }, { invaderXim.item.CALLERS_SEAL_HANDS,    8 }, { invaderXim.item.CALLERS_SEAL_LEGS,    8 }, { invaderXim.item.CALLERS_SEAL_FEET,    8 } },
        { { invaderXim.item.MAVI_SEAL_HEAD,       8 }, { invaderXim.item.MAVI_SEAL_BODY,       10 }, { invaderXim.item.MAVI_SEAL_HANDS,       8 }, { invaderXim.item.MAVI_SEAL_LEGS,       8 }, { invaderXim.item.MAVI_SEAL_FEET,       8 } },
        { { invaderXim.item.NAVARCHS_SEAL_HEAD,   8 }, { invaderXim.item.NAVARCHS_SEAL_BODY,   10 }, { invaderXim.item.NAVARCHS_SEAL_HANDS,   8 }, { invaderXim.item.NAVARCHS_SEAL_LEGS,   8 }, { invaderXim.item.NAVARCHS_SEAL_FEET,   8 } },
        { { invaderXim.item.CIRQUE_SEAL_HEAD,     8 }, { invaderXim.item.CIRQUE_SEAL_BODY,     10 }, { invaderXim.item.CIRQUE_SEAL_HANDS,     8 }, { invaderXim.item.CIRQUE_SEAL_LEGS,     8 }, { invaderXim.item.CIRQUE_SEAL_FEET,     8 } },
        { { invaderXim.item.CHARIS_SEAL_HEAD,     8 }, { invaderXim.item.CHARIS_SEAL_BODY,     10 }, { invaderXim.item.CHARIS_SEAL_HANDS,     8 }, { invaderXim.item.CHARIS_SEAL_LEGS,     8 }, { invaderXim.item.CHARIS_SEAL_FEET,     8 } },
        { { invaderXim.item.SAVANTS_SEAL_HEAD,    8 }, { invaderXim.item.SAVANTS_SEAL_BODY,    10 }, { invaderXim.item.SAVANTS_SEAL_HANDS,    8 }, { invaderXim.item.SAVANTS_SEAL_LEGS,    8 }, { invaderXim.item.SAVANTS_SEAL_FEET,    8 } },
    },
    -- Kupon A-DeII: Delve boss armor pieces (MOG_KUPON_A_DEII = 3967)
    [13] =
    {
        invaderXim.item.YAOYOTL_HELM,
        invaderXim.item.YAOYOTL_GLOVES,
        invaderXim.item.WHIRLPOOL_MASK,
        invaderXim.item.WHIRLPOOL_GREAVES,
        invaderXim.item.NAHTIRAH_HAT,
        invaderXim.item.NAHTIRAH_TROUSERS,
        invaderXim.item.UMBANI_CAP,
        invaderXim.item.UMBANI_BOOTS,
        invaderXim.item.UMUTHI_HAT,
        invaderXim.item.UMUTHI_GLOVES,
        invaderXim.item.IGHWA_CAP,
        invaderXim.item.IGHWA_TROUSERS,
    },

    -- Kupon A-De: Delve field armor pieces (MOG_KUPON_A_DE = 3968)
    [14] =
    {
        { invaderXim.item.MIKINAAK_HELM,           { invaderXim.item.AIRLIXIR_P2, 3 } },
        { invaderXim.item.MIKINAAK_BREASTPLATE,    { invaderXim.item.AIRLIXIR_P2, 3 } },
        { invaderXim.item.MIKINAAK_GAUNTLETS,      { invaderXim.item.AIRLIXIR_P2, 3 } },
        { invaderXim.item.MIKINAAK_CUISSES,        { invaderXim.item.AIRLIXIR_P2, 3 } },
        { invaderXim.item.MIKINAAK_GREAVES,        { invaderXim.item.AIRLIXIR_P2, 3 } },
        { invaderXim.item.MANIBOZHO_BERET,         { invaderXim.item.AIRLIXIR_P2, 3 } },
        { invaderXim.item.MANIBOZHO_JERKIN,        { invaderXim.item.AIRLIXIR_P2, 3 } },
        { invaderXim.item.MANIBOZHO_GLOVES,        { invaderXim.item.AIRLIXIR_P2, 3 } },
        { invaderXim.item.MANIBOZHO_BRAIS,         { invaderXim.item.AIRLIXIR_P2, 3 } },
        { invaderXim.item.MANIBOZHO_BOOTS,         { invaderXim.item.AIRLIXIR_P2, 3 } },
        { invaderXim.item.BOKWUS_CIRCLET,          { invaderXim.item.AIRLIXIR_P2, 3 } },
        { invaderXim.item.BOKWUS_ROBE,             { invaderXim.item.AIRLIXIR_P2, 3 } },
        { invaderXim.item.BOKWUS_GLOVES,           { invaderXim.item.AIRLIXIR_P2, 3 } },
        { invaderXim.item.BOKWUS_SLOPS,            { invaderXim.item.AIRLIXIR_P2, 3 } },
        { invaderXim.item.BOKWUS_BOOTS,            { invaderXim.item.AIRLIXIR_P2, 3 } },
    },

    -- Kupon A-Sal: Salvage II (MOG_KUPON_A_SAL = 3969)
    [15] =
    {
        invaderXim.item.ARES_MASK_P1,
        invaderXim.item.ARES_CUIRASS_P1,
        invaderXim.item.ARES_GAUNTLETS_P1,
        invaderXim.item.ARES_FLANCHARD_P1,
        invaderXim.item.ARES_SOLLERETS_P1,
        invaderXim.item.SKADIS_VISOR_P1,
        invaderXim.item.SKADIS_CUIRIE_P1,
        invaderXim.item.SKADIS_BAZUBANDS_P1,
        invaderXim.item.SKADIS_CHAUSSES_P1,
        invaderXim.item.SKADIS_JAMBEAUX_P1,
        invaderXim.item.USUKANE_SOMEN_P1,
        invaderXim.item.USUKANE_HARAMAKI_P1,
        invaderXim.item.USUKANE_GOTE_P1,
        invaderXim.item.USUKANE_HIZAYOROI_P1,
        invaderXim.item.USUKANE_SUNE_ATE_P1,
        invaderXim.item.MARDUKS_TIARA_P1,
        invaderXim.item.MARDUKS_JUBBAH_P1,
        invaderXim.item.MARDUKS_DASTANAS_P1,
        invaderXim.item.MARDUKS_SHALWAR_P1,
        invaderXim.item.MARDUKS_CRACKOWS_P1,
        invaderXim.item.MORRIGANS_CORONAL_P1,
        invaderXim.item.MORRIGANS_ROBE_P1,
        invaderXim.item.MORRIGANS_CUFFS_P1,
        invaderXim.item.MORRIGANS_SLOPS_P1,
        invaderXim.item.MORRIGANS_PIGACHES_P1,
    },

    -- Kupon A-Nyz: Nyzul Isle Uncharted Area Survey (MOG_KUPON_A_NYZ = 3970)
    [16] =
    {
        invaderXim.item.PHORCYS_SALADE,
        invaderXim.item.PHORCYS_KORAZIN,
        invaderXim.item.PHORCYS_MITTS,
        invaderXim.item.PHORCYS_DIRS,
        invaderXim.item.PHORCYS_SCHUHS,
        invaderXim.item.THAUMAS_HAT,
        invaderXim.item.THAUMAS_COAT,
        invaderXim.item.THAUMAS_GLOVES,
        invaderXim.item.THAUMAS_KECKS,
        invaderXim.item.THAUMAS_NAILS,
        invaderXim.item.NARES_CAP,
        invaderXim.item.NARES_SAIO,
        invaderXim.item.NARES_CUFFS,
        invaderXim.item.NARES_TREWS,
        invaderXim.item.NARES_CLOGS,
    },
    -- Kupon I-S5: Skirmish Rank V Simulacrum Segments (MOG_KUPON_I_S5 = 3971)
    [17] =
    {
        invaderXim.item.RALA_VISAGE_V,
        invaderXim.item.CIRDAS_VISAGE_V,
        invaderXim.item.FAITHFULS_TORSO_V,
        invaderXim.item.PAIR_OF_FAITHFULS_LEGS_V,
        invaderXim.item.YORCIA_VISAGE_V,
        invaderXim.item.RAKAZNAR_VISAGE_V,
    },

    -- Kupon I-S2: Skirmish Rank II Simulacrum Segments (MOG_KUPON_I_S2 = 3972)
    [18] =
    {
        invaderXim.item.RALA_VISAGE_II,
        invaderXim.item.CIRDAS_VISAGE_II,
        invaderXim.item.FAITHFULS_TORSO_II,
        invaderXim.item.PAIR_OF_FAITHFULS_LEGS_II,
        invaderXim.item.YORCIA_VISAGE_II,
        invaderXim.item.RAKAZNAR_VISAGE_II,
    },

    -- Kupon I-Orche: Orchestrion music (MOG_KUPON_I_ORCHE = 3973)
    [19] =
    {
        invaderXim.keyItem.SHEET_OF_E_ADOULINIAN_TUNES,
        invaderXim.keyItem.SHEET_OF_W_ADOULINIAN_TUNES,
        invaderXim.keyItem.SHEET_OF_ZILART_TUNES,
        invaderXim.keyItem.SHEET_OF_CONFLICT_TUNES,
    },
    -- Kupon I-AF109: 12 of each REM's Tale Chapters 1-10 (MOG_KUPON_I_AF109 = 8729)
    [20] =
    {
        {
            { invaderXim.item.COPY_OF_REMS_TALE_CHAPTER_1,  12 },
            { invaderXim.item.COPY_OF_REMS_TALE_CHAPTER_2,  12 },
            { invaderXim.item.COPY_OF_REMS_TALE_CHAPTER_3,  12 },
            { invaderXim.item.COPY_OF_REMS_TALE_CHAPTER_4,  12 },
            { invaderXim.item.COPY_OF_REMS_TALE_CHAPTER_5,  12 },
            { invaderXim.item.COPY_OF_REMS_TALE_CHAPTER_6,  12 },
            { invaderXim.item.COPY_OF_REMS_TALE_CHAPTER_7,  12 },
            { invaderXim.item.COPY_OF_REMS_TALE_CHAPTER_8,  12 },
            { invaderXim.item.COPY_OF_REMS_TALE_CHAPTER_9,  12 },
            { invaderXim.item.COPY_OF_REMS_TALE_CHAPTER_10, 12 },
        },
    },

    -- Kupon W-EWS: Walk of Echoes Weapons (MOG_KUPON_W_EWS = 8730)
    [21] =
    {
        invaderXim.item.DUMUZIS,
        invaderXim.item.KHANDORMA,
        invaderXim.item.BRUNELLO,
        invaderXim.item.XIPHIAS,
        invaderXim.item.SACRIPANTE,
        invaderXim.item.SHAMASH,
        invaderXim.item.UMILIATI,
        invaderXim.item.DABOYA,
        invaderXim.item.KASASAGI,
        invaderXim.item.TORIGASHIRANOTACHI,
        invaderXim.item.ROSE_COUVERTE,
        invaderXim.item.PAIKEA,
        invaderXim.item.CIRCINAE,
        invaderXim.item.MOLLFRITH,
    },
    -- Kupon AW-WK: Weapon or Armor from Wildskeeper Reives (MOG_KUPON_AW_WK = 8731)
    [22] =
    {
        -- Colkhab
        {
            invaderXim.item.PHAWAYLLA_EARRING,
            invaderXim.item.IK_CAPE,
            invaderXim.item.HUANI_COLLAR,
            invaderXim.item.KUKU_STONE,
            invaderXim.item.HATXIIK,
            invaderXim.item.KUAKUAKAIT,
            invaderXim.item.KAABNAX_HAT,
            invaderXim.item.KAABNAX_TROUSERS,
            invaderXim.item.TAIKOGANE,
        },
        -- Tchakka
        {
            invaderXim.item.ATZINTLI_NECKLACE,
            invaderXim.item.TUILHA_CAPE,
            invaderXim.item.KALBORON_STONE,
            invaderXim.item.CHOJ_BAND,
            invaderXim.item.ATOYAC,
            invaderXim.item.AZUKINAGAMITSU,
            invaderXim.item.ATETEPEYORG,
            invaderXim.item.EJEKAMAL_MASK,
            invaderXim.item.EJEKAMAL_BOOTS,
        },
        -- Achuka
        {
            invaderXim.item.CUAMIZ_COLLAR,
            invaderXim.item.BUQUWIK_CAPE,
            invaderXim.item.AQREQAQ_BOMBLET,
            invaderXim.item.ACHAQ_GRIP,
            invaderXim.item.MAOCHINOLI,
            invaderXim.item.XIUTLEATO,
            invaderXim.item.OTOMI_HELM,
            invaderXim.item.OTOMI_GLOVES,
        },
        -- Hurkan
        {
            invaderXim.item.HUNAHPU,
            invaderXim.item.XBALANQUE,
            invaderXim.item.TZACAB_GRIP,
            invaderXim.item.ANIMIKII_BULLET,
            invaderXim.item.KAQULJAAN,
            invaderXim.item.UKUXKAJ_CAP,
            invaderXim.item.UKUXKAJ_BOOTS,
            invaderXim.item.JUKUKIK_FEATHER,
            invaderXim.item.KAYAPA_CAPE,
            invaderXim.item.PAQICHIKAJI_RING,
            invaderXim.item.JAQIJ_SASH,
        },
        -- Yumcax
        {
            invaderXim.item.IXTAB,
            invaderXim.item.TAMAXCHI,
            invaderXim.item.BUREMTE_HAT,
            invaderXim.item.BUREMTE_GLOVES,
            invaderXim.item.PAHTLI_CAPE,
            invaderXim.item.OCACHI_GORGET,
            invaderXim.item.KUNAJI_RING,
            invaderXim.item.IXIMULEW_CAPE,
            invaderXim.item.CHUQABA_BELT,
            invaderXim.item.QUANPUR_NECKLACE,
            invaderXim.item.BARATARIA_RING,
        },
        -- Kumhau
        {
            invaderXim.item.TORO_CAPE,
            invaderXim.item.FRIOMISI_EARRING,
            invaderXim.item.TLAMIZTLI_COLLAR,
            invaderXim.item.CETL_BELT,
            invaderXim.item.AJJUB_BOW,
            invaderXim.item.BAQIL_STAFF,
            invaderXim.item.QUIAHUIZ_HELM,
            invaderXim.item.QUIAHUIZ_TROUSERS,
            invaderXim.item.NEPOTE_BELL,
        },
    },

    -- Kupon I-S3: Skirmish Rank III Simulacrum Segments (MOG_KUPON_I_S3 = 8732)
    [23] =
    {
        invaderXim.item.RALA_VISAGE_III,
        invaderXim.item.CIRDAS_VISAGE_III,
        invaderXim.item.FAITHFULS_TORSO_III,
        invaderXim.item.PAIR_OF_FAITHFULS_LEGS_III,
        invaderXim.item.YORCIA_VISAGE_III,
        invaderXim.item.RAKAZNAR_VISAGE_III,
    },

    -- Kupon A-PK109: iLevel 109 Peacekeeper Coalition Armor (MOG_KUPON_A_PK109 = 8733)
    [24] =
    {
        invaderXim.item.KARIEYH_MORION_P1,
        invaderXim.item.KARIEYH_HAUBERT_P1,
        invaderXim.item.KARIEYH_MOUFLES_P1,
        invaderXim.item.KARIEYH_BRAYETTES_P1,
        invaderXim.item.KARIEYH_SOLLERETS_P1,
        invaderXim.item.THURANDAUT_CHAPEAU_P1,
        invaderXim.item.THURANDAUT_TABARD_P1,
        invaderXim.item.THURANDAUT_GLOVES_P1,
        invaderXim.item.THURANDAUT_TIGHTS_P1,
        invaderXim.item.THURANDAUT_BOOTS_P1,
        invaderXim.item.ORVAIL_CORONA_P1,
        invaderXim.item.ORVAIL_ROBE_P1,
        invaderXim.item.ORVAIL_CUFFS_P1,
        invaderXim.item.ORVAIL_PANTS_P1,
        invaderXim.item.ORVAIL_SOULIERS_P1,
    },

    -- Kupon I-S1: Skirmish Rank I Simulacrum Segments (MOG_KUPON_I_S1 = 8734)
    [25] =
    {
        invaderXim.item.RALA_VISAGE_I,
        invaderXim.item.CIRDAS_VISAGE_I,
        invaderXim.item.FAITHFULS_TORSO_I,
        invaderXim.item.PAIR_OF_FAITHFULS_LEGS_I,
        invaderXim.item.YORCIA_VISAGE_I,
        invaderXim.item.RAKAZNAR_VISAGE_I,
    },

    -- Kupon I-Skill: Skill books (MOG_KUPON_I_SKILL = 8735)
    [26] =
    {
        -- Combat
        {
            invaderXim.item.COPY_OF_MIKHES_MEMO,
            invaderXim.item.DAGGER_ENCHIRIDION,
            invaderXim.item.COPY_OF_SWING_AND_STAB,
            invaderXim.item.COPY_OF_MIEUSELOIRS_DIARY,
            invaderXim.item.COPY_OF_STRIKING_BULLS_DIARY,
            invaderXim.item.COPY_OF_DEATH_FOR_DIMWITS,
            invaderXim.item.COPY_OF_LUDWIGS_REPORT,
            invaderXim.item.COPY_OF_CLASH_OF_TITANS,
            invaderXim.item.COPY_OF_KAGETORAS_DIARY,
            invaderXim.item.COPY_OF_NOILLURIES_LOG,
            invaderXim.item.COPY_OF_FERREOUSS_DIARY,
            invaderXim.item.COPY_OF_KAYEEL_PAYEELS_MEMOIRS,
            invaderXim.item.COPY_OF_PERIHS_PRIMER,
            invaderXim.item.COPY_OF_BARRELS_OF_FUN,
            invaderXim.item.THROWING_WEAPON_ENCHIRIDION,
            invaderXim.item.COPY_OF_MIKHES_NOTE,
            invaderXim.item.COPY_OF_SONIAS_DIARY,
            invaderXim.item.COPY_OF_THE_SUCCESSOR,
            invaderXim.item.COPY_OF_KATETORAS_JOURNAL,
        },
        -- Magic
        {
            invaderXim.item.COPY_OF_ALTANAS_HYMN,
            invaderXim.item.COPY_OF_COVEFFE_BARROWS_MUSINGS,
            invaderXim.item.COPY_OF_AID_FOR_ALL,
            invaderXim.item.INVESTIGATIVE_REPORT,
            invaderXim.item.BOUNTY_LIST,
            invaderXim.item.COPY_OF_DARK_DEEDS,
            invaderXim.item.COPY_OF_BREEZY_LIBRETTO,
            invaderXim.item.CAVERNOUS_SCORE,
            invaderXim.item.BEAMING_SCORE,
            invaderXim.item.COPY_OF_YOMIS_DIAGRAM,
            invaderXim.item.COPY_OF_ASTRAL_HOMELAND,
            invaderXim.item.COPY_OF_LIFE_FORM_STUDY,
            invaderXim.item.COPY_OF_HROHJS_RECORD,
            invaderXim.item.COPY_OF_THE_BELL_TOLLS,
        },
    },

    -- Kupon I-RME: RME Upgrade Materials x300 (MOG_KUPON_I_RME = 8738)
    [27] =
    {
        { { invaderXim.item.PLUTON,            300 } },
        { { invaderXim.item.BEITETSU,          300 } },
        { { invaderXim.item.RIFTBORN_BOULDER,  300 } },
    },

    -- 28: blank menu

    -- Kupon W-Job: JSE Oboro Weapons (MOG_KUPON_W_JOB = 8793)
    [29] =
    {
        invaderXim.item.MINOS,
        invaderXim.item.NYEPEL,
        invaderXim.item.SINDRI,
        invaderXim.item.KALADANDA,
        invaderXim.item.EGEKING,
        invaderXim.item.SANDUNG,
        invaderXim.item.PRIWEN,
        invaderXim.item.CRONUS,
        invaderXim.item.ARKTOI,
        invaderXim.item.TERPANDER,
        invaderXim.item.LIONSQUALL,
        invaderXim.item.KURIKARANOTACHI,
        invaderXim.item.SHIGI,
        invaderXim.item.AREADBHAR,
        invaderXim.item.GRIDARVOR,
        invaderXim.item.MIMESIS,
        invaderXim.item.DEATHLOCKE,
        invaderXim.item.OHTAS,
        invaderXim.item.POLYHYMNIA,
        invaderXim.item.COEUS,
        invaderXim.item.DUNNA,
        invaderXim.item.AETTIR,
    },
    -- Kupon I-Mat: One type of special material (MOG_KUPON_I_MAT = 8794)
    [30] =
    {
        invaderXim.item.BZTAVIAN_STINGER,
        invaderXim.item.BZTAVIAN_WING,
        invaderXim.item.ROCKFIN_TOOTH,
        invaderXim.item.ROCKFIN_FIN,
        invaderXim.item.GABBRATH_HORN,
        invaderXim.item.SLICE_OF_GABBRATH_MEAT,
        invaderXim.item.WAKTZA_ROSTRUM,
        invaderXim.item.WAKTZA_CREST,
        invaderXim.item.YGGDREANT_BOLE,
        invaderXim.item.YGGDREANT_ROOT,
        invaderXim.item.CEHUETZI_CLAW,
        invaderXim.item.CEHUETZI_PELT,
        invaderXim.item.CEHUETZI_ICE_SHARD,
        invaderXim.item.SCARLETITE_INGOT,
        invaderXim.item.ORMOLU_INGOT,
        invaderXim.item.VOIDWROUGHT_PLATE,
        invaderXim.item.KAGGENS_CUTICLE,
        invaderXim.item.AKVANS_PENNON,
        invaderXim.item.SUIT_OF_HAHAVAS_MAIL,
        invaderXim.item.PILS_TUILLE,
        invaderXim.item.CELAENOS_CLOTH,
    },

    -- Kupon W-DeIII: Delve boss weapons (MOG_KUPON_DEIII = 8795)
    [31] =
    {
        invaderXim.item.OATIXUR,
        invaderXim.item.KEREHCATL,
        invaderXim.item.UPUKIREX,
        invaderXim.item.IZHIIKOH,
        invaderXim.item.TSURUMARU,
        invaderXim.item.ILLAPA,
        invaderXim.item.BURAMENKAH,
        invaderXim.item.UKUDYONI,
        invaderXim.item.IZIZOEKSI,
        invaderXim.item.TAJABIT,
        invaderXim.item.QALGWER,
        invaderXim.item.BOLELABUNGA,
        invaderXim.item.NGQOQWANB,
        invaderXim.item.FALUBEZA,
        invaderXim.item.JUSHIMATSU,
    },

    -- Kupon AW-Mis: Equipment or a weapon from High-Tier Mission Battlefields (MOG_KUPON_AW_MIS = 8796)
    [32] =
    {
            -- Ark Angel 1
        {
            invaderXim.item.LITHELIMB_CAP,
            invaderXim.item.BLOODRAIN_STRAP,
            invaderXim.item.ANAHERA_SABER,
            invaderXim.item.CASTIGATION,
            invaderXim.item.MANABYSS_PIGACHES,
        },
            -- Ark Angel 2
        {
            invaderXim.item.ANAHERA_SCYTHE,
            invaderXim.item.FRAVASHI_MANTLE,
            invaderXim.item.VENABULUM,
            invaderXim.item.SCAMPS_SOLLERETS,
            invaderXim.item.THEURGISTS_SLACKS,
        },
            -- Ark Angel 3
        {
            invaderXim.item.SEKHMET_CORSET,
            invaderXim.item.REGIMEN_MITTENS,
            invaderXim.item.FELISTRIS_MASK,
            invaderXim.item.RAIMITSUKANE,
            invaderXim.item.ANAHERA_TABAR,
        },
            -- Ark Angel 4
        {
            invaderXim.item.CAGLIOSTROS_ROD,
            invaderXim.item.ANAHERA_SWORD,
            invaderXim.item.PATRICIUS_RING,
            invaderXim.item.DYNASTY_MITTS,
            invaderXim.item.OSMIUM_CUISSES,
        },
            -- Ark Angel 5
        {
            invaderXim.item.AGITATORS_COLLAR,
            invaderXim.item.DAIHANSHI_HABAKI,
            invaderXim.item.TUNGLMYRKVI,
            invaderXim.item.LURID_MITTS,
            invaderXim.item.ANAHERA_BLADE,
        },
            -- Pentacide Perpetrator
        {
            invaderXim.item.KYUJUTSUGI,
            invaderXim.item.LENTUS_GRIP,
            invaderXim.item.NONE, -- Gap slot 3
            invaderXim.item.NONE, -- Gap slot 4
            invaderXim.item.TRUX_EARRING,
            invaderXim.item.SANARE_EARRING,
            invaderXim.item.GELAI_EARRING,
            invaderXim.item.CREMATIO_EARRING,
            invaderXim.item.TRIPUDIO_EARRING,
        },
            -- Return to Delkfutt's Tower
        {
            invaderXim.item.MESYOHI_HAUBERGEON,
            invaderXim.item.MESYOHI_SLACKS,
            invaderXim.item.MESYOHI_SWORD,
            invaderXim.item.MESYOHI_ROD,
        },
            -- The Celestial Nexus
        {
            invaderXim.item.VANIR_GUN,
            invaderXim.item.VANIR_KNIFE,
            invaderXim.item.VANIR_COTEHARDIE,
            invaderXim.item.VANIR_BATTERY,
            invaderXim.item.VANIR_BOOTS,
        },
            -- The Savage
        {
            invaderXim.item.ISCHEMIA_CHASUBLE,
            invaderXim.item.SCUFFLERS_COSCIALES,
            invaderXim.item.HEGIRA_WRISTBANDS,
            invaderXim.item.METALSINGER_BELT,
            invaderXim.item.DOMESTICATORS_EARRING,
        },
            -- The Warriors Path
        {
            invaderXim.item.HANGAKU_NO_YUMI,
            invaderXim.item.SUKEROKU_HACHIMAKI,
            invaderXim.item.BATTLECAST_GAITERS,
            invaderXim.item.GINSEN,
            invaderXim.item.MIZUKAGE_NO_KUBIKAZARI,
        },
            -- Puppet In Peril
        {
            invaderXim.item.SAVAS_JAWSHAN,
            invaderXim.item.SIFAHIR_SLACKS,
            invaderXim.item.SAHIP_HELM,
            invaderXim.item.BESTAS_BANE,
            invaderXim.item.PRATIK_EARRING,
        },
            -- Legacy of the Lost
        {
            invaderXim.item.PTICA_HEADGEAR,
            invaderXim.item.KARMESIN_VEST,
            invaderXim.item.KANDZA_CRACKOWS,
            invaderXim.item.TENGU_NO_HANE,
            invaderXim.item.TENGU_NO_OBI,
        },
            -- Rank Five Missions
        {
            invaderXim.item.LIGHTREAVER,
            invaderXim.item.DREAD_JUPON,
            invaderXim.item.ONIMUSHA_NO_KOTE,
            invaderXim.item.PERDITION_SLOPS,
            invaderXim.item.TREPIDITY_MANTLE,
        },
            -- Head Wind
        {
            invaderXim.item.DURGAI_LEGGINGS,
            invaderXim.item.CHIDORI,
            invaderXim.item.BAGHERE_SALADE,
            invaderXim.item.SHETAL_STONE,
            invaderXim.item.NILGAL_POLE,
        },
            -- Trial By Fire
        {
            invaderXim.item.ATAKIGIRI,
            invaderXim.item.COALRAKE_SABOTS,
            invaderXim.item.PERFERVID_SWORD,
            invaderXim.item.IMMOLATION_GRIP,
            invaderXim.item.ANNEALED_MANTLE,
        },
            -- Trial By Ice
        {
            invaderXim.item.FRAZIL_STAFF,
            invaderXim.item.FLOESTONE,
            invaderXim.item.CALVED_CLAWS,
            invaderXim.item.NILAS_GLOVES,
            invaderXim.item.RIMEICE_EARRING,
        },
            -- Trial By Wind
        {
            invaderXim.item.LEVANTE_DAGGER,
            invaderXim.item.PONENTE_SASH,
            invaderXim.item.LEBECHE_RING,
            invaderXim.item.TRAMONTANE_AXE,
            invaderXim.item.OSTRO_GREAVES,
        },
            -- Trial By Earth
        {
            invaderXim.item.MAFIC_CUDGEL,
            invaderXim.item.SUPERSHEAR_RING,
            invaderXim.item.TOGAKUSHI_SHURIKEN_POUCH,
            invaderXim.item.FORESHOCK_SWORD,
            invaderXim.item.PLUMOSE_SACHET,
        },
            -- Trial By Lightning
        {
            invaderXim.item.STACCATO_STAFF,
            invaderXim.item.DONAR_GUN,
            invaderXim.item.UKKO_SASH,
            invaderXim.item.VOLTSURGE_TORQUE,
            invaderXim.item.BRONTES_CUISSES,
        },
            -- Trial By Water
        {
            invaderXim.item.PHREATIC_AXE,
            invaderXim.item.PELAGOS_LANCE,
            invaderXim.item.VADOSE_ROD,
            invaderXim.item.BENTHOS_GRIP,
            invaderXim.item.NERITIC_EARRING,
        },
            -- The Moonlit Path
        {
            invaderXim.item.MEDEINA_KILIJ,
            invaderXim.item.CAPITOLINE_STRAP,
            invaderXim.item.MAIITSOH_HAUBE,
            invaderXim.item.VRIKODARA_JUPON,
            invaderXim.item.LUPINE_CAPE,
        },
            -- Waking the Beast
        {
            invaderXim.item.MARQUETRY_STAFF,
            invaderXim.item.LAPIDARY_TUNIC,
            invaderXim.item.DIAMANTAIRE_SOLLERETS,
            invaderXim.item.SATLADA_NECKLACE,
            invaderXim.item.ENGRAVED_BELT,
        },
            -- Waking Dreams
        {
            invaderXim.item.SHUHANSADAMUNE,
            invaderXim.item.CHOZORON_COSELETE,
            invaderXim.item.LOAGAETH_CUFFS,
            invaderXim.item.DARKSIDE_EARRING,
            invaderXim.item.PERNICIOUS_RING,
        },
            -- One to Be Feared
        {
            invaderXim.item.DENOUEMENTS,
            invaderXim.item.TERMINAL_HELM,
            invaderXim.item.TERMINAL_PLATE,
            invaderXim.item.CONSUMMATION_TORQUE,
            invaderXim.item.CULMINUS,
            invaderXim.item.CESSANCE_EARRING,
        },
            -- Dawn
        {
            invaderXim.item.GYVE_DOUBLET,
            invaderXim.item.FETTERING_BLADE,
            invaderXim.item.VENERY_BOW,
            invaderXim.item.LATRIA_SASH,
            invaderXim.item.GYVE_TROUSERS,
            invaderXim.item.LAIC_MANTLE,
        },
            -- Other
        {
            invaderXim.item.DIVINATOR,
            invaderXim.item.DIVINATOR_II,
            invaderXim.item.SERAPHICALLER,
        },
    },

    -- Kupon AW-Vgr: Equipment from Vagary Notorious Monsters Perfiden and Plouton (MOG_KUPON_AW_VGR = 9087)
    [33] =
    {
            -- Perfidien
        {
            invaderXim.item.COUNTS_GARB,
            invaderXim.item.COUNTS_CUFFS,
            invaderXim.item.ETIOLATION_EARRING,
            invaderXim.item.ENERVATING_EARRING,
        },
            -- Plouton
        {
            invaderXim.item.TARTARUS_PLATEMAIL,
            invaderXim.item.BEFOULED_CROWN,
            invaderXim.item.ODIUM,
            invaderXim.item.INCARNATION_SASH,
        }
    },

    -- Kupon AW-VgrII: Equipment from Vagary NMs Palloritus, Putraxia and Rancibus (MOG_KUPON_AW_VGRII = 9088)
    [34] =
    {
            -- Palloritus
        {
            invaderXim.item.ACHIUCHIKAPU,
            invaderXim.item.RHADAMANTHUS,
            invaderXim.item.PUNCHINELLOS,
            invaderXim.item.DEFIANT_COLLAR,
        },
            -- Putraxia
        {
            invaderXim.item.SOULCLEAVER,
            invaderXim.item.ACCLIMATOR,
            invaderXim.item.CRUSHERS_GAUNTLETS,
            invaderXim.item.RUMINATION_SASH,
        },
            -- Rancibus
        {
            invaderXim.item.MIASMIC_PANTS,
            invaderXim.item.CRYPTIC_EARRING,
            invaderXim.item.MINDMELTER,
            invaderXim.item.DEVIVIFIER,
        },
    },
    -- Mog Kupon W-Pulse: Pulse weapons (MOG_KUPON_W_PULSE = 9089)
    [35] =
    {
        invaderXim.item.GIRRU,
        invaderXim.item.CORUSCANTI,
        invaderXim.item.ASTERIA,
        invaderXim.item.GUSTERION,
        invaderXim.item.SAGASINGER,
        invaderXim.item.EPHEMERON,
        invaderXim.item.BOREALIS,
        invaderXim.item.AYTANRI,
        invaderXim.item.HIMTHIGE,
        invaderXim.item.DELPHINIUS,
        invaderXim.item.ADFLICTIO,
        invaderXim.item.IKARIGIRI,
        invaderXim.item.MURASAMEMARU,
        invaderXim.item.TENKOMARU,
        invaderXim.item.DUKKHA,
    },

    -- Kupon I-Stone: Skirmish Stones +2 (MOG_KUPON_I_STONE = 9090)
    [36] =
    {
        { { invaderXim.item.VERDIGRIS_STONE_P2,          12 } },
        { { invaderXim.item.GHASTLY_STONE_P2,            12 } },
        { { invaderXim.item.WAILING_STONE_P2,            12 } },
        { { invaderXim.item.SNOWSLIT_STONE_P2,           12 } },
        { { invaderXim.item.SNOWTIP_STONE_P2,            12 } },
        { { invaderXim.item.SNOWDIM_STONE_P2,            12 } },
        { { invaderXim.item.SNOWORB_STONE_P2,            12 } },
        { { invaderXim.item.LEAFSLIT_STONE_P2,           12 } },
        { { invaderXim.item.LEAFTIP_STONE_P2,            12 } },
        { { invaderXim.item.LEAFDIM_STONE_P2,            12 } },
        { { invaderXim.item.LEAFORB_STONE_P2,            12 } },
        { { invaderXim.item.DUSKSLIT_STONE_P2,           12 } },
        { { invaderXim.item.DUSKTIP_STONE_P2,            12 } },
        { { invaderXim.item.DUSKDIM_STONE_P2,            12 } },
        { { invaderXim.item.DUSKORB_STONE_P2,            12 } },
        { { invaderXim.item.FRAYED_SACK_OF_FECUNDITY,    12 } },
        { { invaderXim.item.FRAYED_SACK_OF_PLENTY,       12 } },
        { { invaderXim.item.FRAYED_SACK_OF_OPULENCE,     12 } },
    },
    -- Kupon AW-GFIII: Geas Fete (Content Level 119+) (MOG_KUPON_AW_GFIII = 9175)
    [37] =
    {
            -- HAND-TO-HAND WEAPONS
        {
            invaderXim.item.NIBIRU_SAINTI,
            invaderXim.item.CHASTISERS,
            invaderXim.item.HAMMERFISTS,
            invaderXim.item.MIDNIGHTS,
            invaderXim.item.ESHUS,
            invaderXim.item.CONDEMNERS,
        },
            -- DAGGERS
        {
            invaderXim.item.NIBIRU_KNIFE,
            invaderXim.item.ENCHUFLA,
            invaderXim.item.SHIJO,
            invaderXim.item.KALI,
            invaderXim.item.SKINFLAYER,
            invaderXim.item.SANGOMA,
        },
            -- SWORDS
        {
            invaderXim.item.NIBIRU_BLADE,
            invaderXim.item.NIXXER,
            invaderXim.item.EMISSARY,
            invaderXim.item.IRIS,
            invaderXim.item.COLADA,
            invaderXim.item.NONE, -- Gap slot 6
            invaderXim.item.DEACON_SABER,
            invaderXim.item.DEACON_SWORD,
            invaderXim.item.KOBOTO,
            invaderXim.item.REIKIKO,
        },
            -- GREAT SWORDS
        {
            invaderXim.item.NIBIRU_FAUSSAR,
            invaderXim.item.BIDENHANDER,
            invaderXim.item.ZULFIQAR,
        },
            -- AXES
        {
            invaderXim.item.NIBIRU_TABAR,
            invaderXim.item.SKULLRENDER,
            invaderXim.item.DIGIRBALAG,
            invaderXim.item.NONE, -- Gap slot 4
            invaderXim.item.DEACON_TABAR,
        },
            -- GREAT AXES
        {
            invaderXim.item.NIBIRU_CHOPPER,
            invaderXim.item.ROUTER,
            invaderXim.item.INSTIGATOR,
            invaderXim.item.AGANOSHE,
            invaderXim.item.NONE, -- Gap slot 5
            invaderXim.item.REIKIONO,
            invaderXim.item.JOKUSHUONO,
        },
            -- POLEARMS
        {
            invaderXim.item.NIBIRU_LANCE,
            invaderXim.item.ANNEALED_LANCE,
            invaderXim.item.RHOMPHAIA,
            invaderXim.item.REIENKYO,
            invaderXim.item.NONE, -- Gap slot 5
            invaderXim.item.HABILE_MAZRAK,
        },
            -- SCYTHES
        {
            invaderXim.item.NIBIRU_SICKLE,
            invaderXim.item.DEATHBANE,
            invaderXim.item.OBSCHINE,
            invaderXim.item.MISANTHROPY,
            invaderXim.item.DACNOMANIA,
            invaderXim.item.DEACON_SCYTHE,
            invaderXim.item.SHUKUYUS_SCYTHE,
        },
            -- KATANAS
        {
            invaderXim.item.MIJIN,
            invaderXim.item.AIZUSHINTOGO,
            invaderXim.item.KANARIA,
        },
            -- GREAT KATANAS
        {
            invaderXim.item.SENSUI,
            invaderXim.item.ICHIGOHITOFURI,
            invaderXim.item.UMARU,
            invaderXim.item.NONE, -- Gap slot 4
            invaderXim.item.DEACON_BLADE,
        },
            -- CLUBS
        {
            invaderXim.item.NIBIRU_CUDGEL,
            invaderXim.item.QUELLER_ROD,
            invaderXim.item.SOLSTICE,
            invaderXim.item.SUCELLUS,
            invaderXim.item.GADA,
        },
            -- STAVES
        {
            invaderXim.item.NIBIRU_STAFF,
            invaderXim.item.ESPIRITUS,
            invaderXim.item.AKADEMOS,
            invaderXim.item.LATHI,
            invaderXim.item.GRIOAVOLR,
            invaderXim.item.NONE, -- Gap slot 6
            invaderXim.item.NONE, -- Gap slot 7
            invaderXim.item.REIKIKON,
        },
            -- THROWING WEAPONS
        {
            invaderXim.item.SERAPHIC_AMPULLA,
            invaderXim.item.GRENADE_CORE,
            invaderXim.item.SAPIENCE_ORB,
            invaderXim.item.FALCON_EYE,
            invaderXim.item.ALBIN_BANE,
            invaderXim.item.AMAR_CLUSTER,
            invaderXim.item.HYDROCERA,
            invaderXim.item.MANTOPTERA_EYE,
            invaderXim.item.EXPEDITIOUS_PINION,
            invaderXim.item.PEMPHREDO_TATHLUM,
            invaderXim.item.ELIS_TOME,
        },
            -- BOWS
        {
            invaderXim.item.NIBIRU_BOW,
            invaderXim.item.VIJAYA_BOW,
            invaderXim.item.TELLER,
        },
            -- GUNS
        {
            invaderXim.item.NIBIRU_GUN,
            invaderXim.item.COMPENSATOR,
            invaderXim.item.NONE, -- Gap slot 3
            invaderXim.item.HOLLIDAY,
            invaderXim.item.MOLYBDOSIS,
        },
            -- SHIELDS
        {
            invaderXim.item.NIBIRU_SHIELD,
            invaderXim.item.GENMEI_SHIELD,
        },
            -- INSTRUMENTS
        {
            invaderXim.item.NIBIRU_HARP,
        },
            -- GRIPS
        {
            invaderXim.item.CLEMENCY_GRIP,
            invaderXim.item.WILLPOWER_GRIP,
            invaderXim.item.FOREFATHERS_GRIP,
            invaderXim.item.GIUOCO_GRIP,
            invaderXim.item.BALARAMA_GRIP,
            invaderXim.item.NIOBID_STRAP,
            invaderXim.item.POTENT_GRIP,
            invaderXim.item.THRACE_STRAP,
            invaderXim.item.ALBER_STRAP,
        },
            -- HEADGEAR
        {
            invaderXim.item.ESCHITE_HELM,
            invaderXim.item.PSYCLOTH_TIARA,
            invaderXim.item.RAWHIDE_MASK,
            invaderXim.item.DESPAIR_HELM,
            invaderXim.item.VANYA_HOOD,
            invaderXim.item.PURSUERS_BERET,
            invaderXim.item.NAGA_SOMEN,
            invaderXim.item.SKORMOTH_MASK,
            invaderXim.item.ODYSSEAN_HELM,
            invaderXim.item.VALOROUS_MASK,
            invaderXim.item.HERCULEAN_HELM,
            invaderXim.item.MERLINIC_HOOD,
            invaderXim.item.CHIRONIC_HAT,
            invaderXim.item.NONE, -- Gap slot 14
            invaderXim.item.NONE, -- Gap slot 15
            invaderXim.item.GENMEI_KABUTO,
        },
            -- CHEST ARMOR
        {
            invaderXim.item.ESCHITE_BREASTPLATE,
            invaderXim.item.PSYCLOTH_VEST,
            invaderXim.item.RAWHIDE_VEST,
            invaderXim.item.DESPAIR_MAIL,
            invaderXim.item.VANYA_ROBE,
            invaderXim.item.PURSUERS_DOUBLET,
            invaderXim.item.NAGA_SAMUE,
            invaderXim.item.SWELLERS_HARNESS,
            invaderXim.item.ONCA_SUIT,
            invaderXim.item.KUBIRA_MEIKOGAI,
            invaderXim.item.ANNOINTED_KALASIRIS,
            invaderXim.item.MAKORA_MEIKOGAI,
            invaderXim.item.ENFORCERS_HARNESS,
            invaderXim.item.UAC_JERKIN,
            invaderXim.item.SHANGO_ROBE,
            invaderXim.item.ABNOBA_KAFTAN,
            invaderXim.item.ODYSSEAN_CHESTPLATE,
            invaderXim.item.VALOROUS_MAIL,
            invaderXim.item.HERCULEAN_VEST,
            invaderXim.item.MERLINIC_JUBBAH,
            invaderXim.item.CHIRONIC_DOUBLET,
            invaderXim.item.NONE, -- Gap slot 22
            invaderXim.item.NONE, -- Gap slot 23
            invaderXim.item.NONE, -- Gap slot 24
            invaderXim.item.ZENDIK_ROBE,
            invaderXim.item.REIKI_OSODE,
        },
            -- GLOVES AND GAUNTLETS
        {
            invaderXim.item.NAGA_TEKKO,
            invaderXim.item.ESCHITE_GAUNTLETS,
            invaderXim.item.PSYCLOTH_MANILLAS,
            invaderXim.item.RAWHIDE_GLOVES,
            invaderXim.item.DESPAIR_FINGER_GLOVES,
            invaderXim.item.VANYA_CUFFS,
            invaderXim.item.PURSUERS_CUFFS,
            invaderXim.item.SHRIEKERS_CUFFS,
            invaderXim.item.KURYS_GLOVES,
            invaderXim.item.ODYSSEAN_GAUNTLETS,
            invaderXim.item.VALOROUS_MITTS,
            invaderXim.item.HERCULEAN_GLOVES,
            invaderXim.item.MERLINIC_DASTANAS,
            invaderXim.item.CHIRONIC_GLOVES,
            invaderXim.item.COMPOSERS_MITTS,
            invaderXim.item.NONE, -- Gap slot 16
            invaderXim.item.NONE, -- Gap slot 17
            invaderXim.item.KOBO_KOTE,
        },
            -- LEG ARMOR
        {
            invaderXim.item.NAGA_HAKAMA,
            invaderXim.item.ESCHITE_CUISSES,
            invaderXim.item.PSYCLOTH_LAPPAS,
            invaderXim.item.RAWHIDE_TROUSERS,
            invaderXim.item.DESPAIR_CUISSES,
            invaderXim.item.VANYA_SLOPS,
            invaderXim.item.PURSUERS_PANTS,
            invaderXim.item.DOYEN_PANTS,
            invaderXim.item.OBATALA_SUBLIGAR,
            invaderXim.item.SELVANS_SUBLIGAR,
            invaderXim.item.ODYSSEAN_CUISSES,
            invaderXim.item.VALOROUS_HOSE,
            invaderXim.item.HERCULEAN_TROUSERS,
            invaderXim.item.MERLINIC_SHALWAR,
            invaderXim.item.CHIRONIC_HOSE,
            invaderXim.item.NONE, -- Gap slot 16
            invaderXim.item.JOKUSHU_HAIDATE,
        },
            -- BOOTS AND GREAVES
        {
            invaderXim.item.PURSUERS_GAITERS,
            invaderXim.item.NAGA_KYAHAN,
            invaderXim.item.ESCHITE_GREAVES,
            invaderXim.item.PSYCLOTH_BOOTS,
            invaderXim.item.RAWHIDE_BOOTS,
            invaderXim.item.DESPAIR_GREAVES,
            invaderXim.item.VANYA_CLOGS,
            invaderXim.item.INSPIRITED_BOOTS,
            invaderXim.item.TUTYR_SABOTS,
            invaderXim.item.ODYSSEAN_GREAVES,
            invaderXim.item.VALOROUS_GREAVES,
            invaderXim.item.HERCULEAN_BOOTS,
            invaderXim.item.MERLINIC_CRACKOWS,
            invaderXim.item.CHIRONIC_SLIPPERS,
            invaderXim.item.COMPOSERS_SABOTS,
            invaderXim.item.NONE, -- Gap slot 16
            invaderXim.item.NONE, -- Gap slot 17
            invaderXim.item.NONE, -- Gap slot 18
            invaderXim.item.SHUKUYU_SUNE_ATE,
        },
            -- NECK PIECES
        {
            invaderXim.item.MARKED_GORGET,
            invaderXim.item.SUBTLETY_SPECTACLES,
            invaderXim.item.DAMPENERS_TORQUE,
            invaderXim.item.EMPATH_NECKLACE,
            invaderXim.item.RETI_PENDANT,
            invaderXim.item.DIEMER_GORGET,
            invaderXim.item.CARO_NECKLACE,
            invaderXim.item.NODENS_GORGET,
            invaderXim.item.CLOTHARIUS_TORQUE,
            invaderXim.item.DEINO_COLLAR,
            invaderXim.item.HOMERIC_GORGET,
            invaderXim.item.AINIA_COLLAR,
            invaderXim.item.JOKUSHU_CHAIN,
        },
            -- EARRINGS
        {
            invaderXim.item.MENDICANTS_EARRING,
            invaderXim.item.INFUSED_EARRING,
            invaderXim.item.CALAMITOUS_EARRING,
            invaderXim.item.HERMETIC_EARRING,
            invaderXim.item.HALASZ_EARRING,
            invaderXim.item.ASSUAGE_EARRING,
            invaderXim.item.ISHVARA_EARRING,
            invaderXim.item.EVANS_EARRING,
            invaderXim.item.LEMPO_EARRING,
            invaderXim.item.THUREOUS_EARRING,
            invaderXim.item.DIGNITARYS_EARRING,
            invaderXim.item.TELOS_EARRING,
            invaderXim.item.GENMEI_EARRING,
        },
            -- BELTS AND SASHES
        {
            invaderXim.item.LUCIDITY_SASH,
            invaderXim.item.SINEW_BELT,
            invaderXim.item.ESCHAN_STONE,
            invaderXim.item.GRUNFELD_ROPE,
            invaderXim.item.POROUS_ROPE,
            invaderXim.item.SULLA_BELT,
            invaderXim.item.YEMAYA_BELT,
            invaderXim.item.CHANNELERS_STONE,
            invaderXim.item.ASKLEPIAN_BELT,
            invaderXim.item.SARISSAPHOROI_BELT,
            invaderXim.item.LUMINARY_SASH,
            invaderXim.item.KERYGMA_BELT,
            invaderXim.item.REIKI_YOTAI,
            invaderXim.item.KOBO_OBI,
        },
            -- RINGS
        {
            invaderXim.item.OVERBEARING_RING,
            invaderXim.item.RESONANCE_RING,
            invaderXim.item.PURITY_RING,
            invaderXim.item.WARDENS_RING,
            invaderXim.item.PETROV_RING,
            invaderXim.item.FORTIFIED_RING,
            invaderXim.item.VERTIGO_RING,
            invaderXim.item.EVANESCENCE_RING,
            invaderXim.item.BEGRUDGING_RING,
            invaderXim.item.APATE_RING,
            invaderXim.item.PERSIS_RING,
            invaderXim.item.HETAIROI_RING,
            invaderXim.item.SHUKUYU_RING,
            invaderXim.item.RAHAB_RING,
        },
            -- CAPES AND CLOAKS
        {
            invaderXim.item.DISPERSERS_CAPE,
            invaderXim.item.THAUMATURGES_CAPE,
            invaderXim.item.PENETRATING_CAPE,
            invaderXim.item.PHILIDOR_MANTLE,
            invaderXim.item.SOKOLSKI_MANTLE,
            invaderXim.item.QUARREL_MANTLE,
            invaderXim.item.XUCAU_MANTLE,
            invaderXim.item.TANTALIC_CAPE,
            invaderXim.item.SCINTILLATING_CAPE,
            invaderXim.item.PHALANGITE_MANTLE,
            invaderXim.item.PERIMEDE_CAPE,
            invaderXim.item.AGEMA_CAPE,
            invaderXim.item.ENUMA_MANTLE,
            invaderXim.item.REIKI_CLOAK,
        },
            -- OTHER
        {
            invaderXim.item.SEKI_SHURIKEN_POUCH,
        },
    },

    -- Kupon AW-GFII: Geas Fete (MOG_KUPN_AW_GWII = 9176)
    [38] =
    {
            -- HAND-TO-HAND WEAPONS
        {
            invaderXim.item.NIBIRU_SAINTI,
            invaderXim.item.CHASTISERS,
            invaderXim.item.HAMMERFISTS,
            invaderXim.item.MIDNIGHTS,
            invaderXim.item.ESHUS,
            invaderXim.item.CONDEMNERS,
        },
            -- DAGGERS
        {
            invaderXim.item.NIBIRU_KNIFE,
            invaderXim.item.ENCHUFLA,
            invaderXim.item.SHIJO,
            invaderXim.item.KALI,
            invaderXim.item.SKINFLAYER,
        },
            -- SWORDS
        {
            invaderXim.item.NIBIRU_BLADE,
            invaderXim.item.NIXXER,
            invaderXim.item.EMISSARY,
            invaderXim.item.IRIS,
            invaderXim.item.COLADA,
        },
            -- GREAT SWORDS
        {
            invaderXim.item.NIBIRU_FAUSSAR,
            invaderXim.item.BIDENHANDER,
            invaderXim.item.ZULFIQAR,
        },
            -- AXES
        {
            invaderXim.item.NIBIRU_TABAR,
            invaderXim.item.SKULLRENDER,
            invaderXim.item.DIGIRBALAG,
        },
            -- GREAT AXES
        {
            invaderXim.item.NIBIRU_CHOPPER,
            invaderXim.item.ROUTER,
            invaderXim.item.INSTIGATOR,
            invaderXim.item.AGANOSHE,
        },
            -- POLEARMS
        {
            invaderXim.item.NIBIRU_LANCE,
            invaderXim.item.ANNEALED_LANCE,
            invaderXim.item.RHOMPHAIA,
            invaderXim.item.REIENKYO,
        },
            -- SCYTHES
        {
            invaderXim.item.NIBIRU_SICKLE,
            invaderXim.item.DEATHBANE,
            invaderXim.item.OBSCHINE,
        },
            -- KATANAS
        {
            invaderXim.item.MIJIN,
            invaderXim.item.AIZUSHINTOGO,
            invaderXim.item.KANARIA,
        },
            -- GREAT KATANAS
        {
            invaderXim.item.SENSUI,
            invaderXim.item.ICHIGOHITOFURI,
            invaderXim.item.UMARU,
        },
            -- CLUBS
        {
            invaderXim.item.NIBIRU_CUDGEL,
            invaderXim.item.QUELLER_ROD,
            invaderXim.item.SOLSTICE,
            invaderXim.item.SUCELLUS,
            invaderXim.item.GADA,
        },
            -- STAVES
        {
            invaderXim.item.NIBIRU_STAFF,
            invaderXim.item.ESPIRITUS,
            invaderXim.item.AKADEMOS,
            invaderXim.item.LATHI,
            invaderXim.item.GRIOAVOLR,
        },
            -- THROWING WEAPONS
        {
            invaderXim.item.SERAPHIC_AMPULLA,
            invaderXim.item.GRENADE_CORE,
            invaderXim.item.SAPIENCE_ORB,
            invaderXim.item.FALCON_EYE,
            invaderXim.item.ALBIN_BANE,
            invaderXim.item.AMAR_CLUSTER,
            invaderXim.item.HYDROCERA,
            invaderXim.item.MANTOPTERA_EYE,
            invaderXim.item.EXPEDITIOUS_PINION,
            invaderXim.item.PEMPHREDO_TATHLUM,
        },
            -- BOWS
        {
            invaderXim.item.NIBIRU_BOW,
            invaderXim.item.VIJAYA_BOW,
            invaderXim.item.TELLER,
        },
            -- GUNS
        {
            invaderXim.item.NIBIRU_GUN,
            invaderXim.item.COMPENSATOR,
            invaderXim.item.NONE, -- Gap slot 3
            invaderXim.item.HOLLIDAY,
        },
            -- SHIELDS
        {
            invaderXim.item.NIBIRU_SHIELD,
        },
            -- INSTRUMENTS
        {
            invaderXim.item.NIBIRU_HARP,
        },
            -- GRIPS
        {
            invaderXim.item.CLEMENCY_GRIP,
            invaderXim.item.WILLPOWER_GRIP,
            invaderXim.item.FOREFATHERS_GRIP,
            invaderXim.item.GIUOCO_GRIP,
            invaderXim.item.BALARAMA_GRIP,
            invaderXim.item.NIOBID_STRAP,
            invaderXim.item.POTENT_GRIP,
        },
            -- HEADGEAR
        {
            invaderXim.item.ESCHITE_HELM,
            invaderXim.item.PSYCLOTH_TIARA,
            invaderXim.item.RAWHIDE_MASK,
            invaderXim.item.DESPAIR_HELM,
            invaderXim.item.VANYA_HOOD,
            invaderXim.item.PURSUERS_BERET,
            invaderXim.item.NAGA_SOMEN,
            invaderXim.item.SKORMOTH_MASK,
            invaderXim.item.ODYSSEAN_HELM,
            invaderXim.item.VALOROUS_MASK,
            invaderXim.item.HERCULEAN_HELM,
            invaderXim.item.MERLINIC_HOOD,
            invaderXim.item.CHIRONIC_HAT,
        },
            -- CHEST ARMOR
        {
            invaderXim.item.ESCHITE_BREASTPLATE,
            invaderXim.item.PSYCLOTH_VEST,
            invaderXim.item.RAWHIDE_VEST,
            invaderXim.item.DESPAIR_MAIL,
            invaderXim.item.VANYA_ROBE,
            invaderXim.item.PURSUERS_DOUBLET,
            invaderXim.item.NAGA_SAMUE,
            invaderXim.item.SWELLERS_HARNESS,
            invaderXim.item.ONCA_SUIT,
            invaderXim.item.KUBIRA_MEIKOGAI,
            invaderXim.item.ANNOINTED_KALASIRIS,
            invaderXim.item.MAKORA_MEIKOGAI,
            invaderXim.item.ENFORCERS_HARNESS,
            invaderXim.item.UAC_JERKIN,
            invaderXim.item.SHANGO_ROBE,
            invaderXim.item.ABNOBA_KAFTAN,
        },
            -- GLOVES AND GAUNTLETS
        {
            invaderXim.item.NAGA_TEKKO,
            invaderXim.item.ESCHITE_GAUNTLETS,
            invaderXim.item.PSYCLOTH_MANILLAS,
            invaderXim.item.RAWHIDE_GLOVES,
            invaderXim.item.DESPAIR_FINGER_GLOVES,
            invaderXim.item.VANYA_CUFFS,
            invaderXim.item.PURSUERS_CUFFS,
            invaderXim.item.SHRIEKERS_CUFFS,
            invaderXim.item.KURYS_GLOVES,
            invaderXim.item.ODYSSEAN_GAUNTLETS,
            invaderXim.item.VALOROUS_MITTS,
            invaderXim.item.HERCULEAN_GLOVES,
            invaderXim.item.MERLINIC_DASTANAS,
            invaderXim.item.CHIRONIC_GLOVES,
        },
            -- LEG ARMOR
        {
            invaderXim.item.NAGA_HAKAMA,
            invaderXim.item.ESCHITE_CUISSES,
            invaderXim.item.PSYCLOTH_LAPPAS,
            invaderXim.item.RAWHIDE_TROUSERS,
            invaderXim.item.DESPAIR_CUISSES,
            invaderXim.item.VANYA_SLOPS,
            invaderXim.item.PURSUERS_PANTS,
            invaderXim.item.DOYEN_PANTS,
            invaderXim.item.OBATALA_SUBLIGAR,
            invaderXim.item.SELVANS_SUBLIGAR,
            invaderXim.item.ODYSSEAN_CUISSES,
            invaderXim.item.VALOROUS_HOSE,
            invaderXim.item.HERCULEAN_TROUSERS,
            invaderXim.item.MERLINIC_SHALWAR,
            invaderXim.item.CHIRONIC_HOSE,
        },
            -- BOOTS AND GREAVES
        {
            invaderXim.item.PURSUERS_GAITERS,
            invaderXim.item.NAGA_KYAHAN,
            invaderXim.item.ESCHITE_GREAVES,
            invaderXim.item.PSYCLOTH_BOOTS,
            invaderXim.item.RAWHIDE_BOOTS,
            invaderXim.item.DESPAIR_GREAVES,
            invaderXim.item.VANYA_CLOGS,
            invaderXim.item.INSPIRITED_BOOTS,
            invaderXim.item.TUTYR_SABOTS,
            invaderXim.item.ODYSSEAN_GREAVES,
            invaderXim.item.VALOROUS_GREAVES,
            invaderXim.item.HERCULEAN_BOOTS,
            invaderXim.item.MERLINIC_CRACKOWS,
            invaderXim.item.CHIRONIC_SLIPPERS,
        },
            -- NECK PIECES
        {
            invaderXim.item.MARKED_GORGET,
            invaderXim.item.SUBTLETY_SPECTACLES,
            invaderXim.item.DAMPENERS_TORQUE,
            invaderXim.item.EMPATH_NECKLACE,
            invaderXim.item.RETI_PENDANT,
            invaderXim.item.DIEMER_GORGET,
            invaderXim.item.CARO_NECKLACE,
            invaderXim.item.NODENS_GORGET,
            invaderXim.item.CLOTHARIUS_TORQUE,
            invaderXim.item.DEINO_COLLAR,
            invaderXim.item.HOMERIC_GORGET,
        },
            -- EARRINGS
        {
            invaderXim.item.MENDICANTS_EARRING,
            invaderXim.item.INFUSED_EARRING,
            invaderXim.item.CALAMITOUS_EARRING,
            invaderXim.item.HERMETIC_EARRING,
            invaderXim.item.HALASZ_EARRING,
            invaderXim.item.ASSUAGE_EARRING,
            invaderXim.item.ISHVARA_EARRING,
            invaderXim.item.EVANS_EARRING,
            invaderXim.item.LEMPO_EARRING,
            invaderXim.item.THUREOUS_EARRING,
            invaderXim.item.DIGNITARYS_EARRING,
        },
            -- BELTS AND SASHES
        {
            invaderXim.item.LUCIDITY_SASH,
            invaderXim.item.SINEW_BELT,
            invaderXim.item.ESCHAN_STONE,
            invaderXim.item.GRUNFELD_ROPE,
            invaderXim.item.POROUS_ROPE,
            invaderXim.item.SULLA_BELT,
            invaderXim.item.YEMAYA_BELT,
            invaderXim.item.CHANNELERS_STONE,
            invaderXim.item.ASKLEPIAN_BELT,
            invaderXim.item.SARISSAPHOROI_BELT,
        },
            -- RINGS
        {
            invaderXim.item.OVERBEARING_RING,
            invaderXim.item.RESONANCE_RING,
            invaderXim.item.PURITY_RING,
            invaderXim.item.WARDENS_RING,
            invaderXim.item.PETROV_RING,
            invaderXim.item.FORTIFIED_RING,
            invaderXim.item.VERTIGO_RING,
            invaderXim.item.EVANESCENCE_RING,
            invaderXim.item.BEGRUDGING_RING,
            invaderXim.item.APATE_RING,
            invaderXim.item.PERSIS_RING,
        },
            -- CAPES AND CLOAKS
        {
            invaderXim.item.DISPERSERS_CAPE,
            invaderXim.item.THAUMATURGES_CAPE,
            invaderXim.item.PENETRATING_CAPE,
            invaderXim.item.PHILIDOR_MANTLE,
            invaderXim.item.SOKOLSKI_MANTLE,
            invaderXim.item.QUARREL_MANTLE,
            invaderXim.item.XUCAU_MANTLE,
            invaderXim.item.TANTALIC_CAPE,
            invaderXim.item.SCINTILLATING_CAPE,
            invaderXim.item.PHALANGITE_MANTLE,
        },
    },

    -- Kupon AW-GF: Geas Fete (Content Level 119) (MOG_KUPON_AW_GF = 9177)
    [39] =
    {
        { --[[ Null Menu 01 --]] },
        { --[[ Null Menu 02 --]] },
        { --[[ Null Menu 03 --]] },
        { --[[ Null Menu 04 --]] },
        { --[[ Null Menu 05 --]] },
        { --[[ Null Menu 06 --]] },
        { --[[ Null Menu 07 --]] },
        { --[[ Null Menu 08 --]] },
        { --[[ Null Menu 09 --]] },
        { --[[ Null Menu 10 --]] },
        { --[[ Null Menu 11 --]] },
        { --[[ Null Menu 12 --]] },

            -- THROWING WEAPONS
        {
            invaderXim.item.GRENADE_CORE,
            invaderXim.item.SERAPHIC_AMPULLA,
            invaderXim.item.ALBIN_BANE,
            invaderXim.item.AMAR_CLUSTER,
            invaderXim.item.HYDROCERA,
            invaderXim.item.MANTOPTERA_EYE,
        },

        { --[[ Null Menu 14 --]] },
        { --[[ Null Menu 15 --]] },
        { --[[ Null Menu 16 --]] },
        { --[[ Null Menu 17 --]] },

            -- GRIPS
        {
            invaderXim.item.WILLPOWER_GRIP,
            invaderXim.item.CLEMENCY_GRIP,
            invaderXim.item.GIUOCO_GRIP,
            invaderXim.item.BALARAMA_GRIP,
        },
            -- HEADGEAR
        {
            invaderXim.item.ESCHITE_HELM,
            invaderXim.item.VANYA_HOOD,
            invaderXim.item.PSYCLOTH_TIARA,
            invaderXim.item.DESPAIR_HELM,
            invaderXim.item.PURSUERS_BERET,
            invaderXim.item.RAWHIDE_MASK,
            invaderXim.item.NAGA_SOMEN,
        },
            -- CHEST ARMOR
        {
            invaderXim.item.VANYA_ROBE,
            invaderXim.item.ESCHITE_BREASTPLATE,
            invaderXim.item.PSYCLOTH_VEST,
            invaderXim.item.DESPAIR_MAIL,
            invaderXim.item.PURSUERS_DOUBLET,
            invaderXim.item.RAWHIDE_VEST,
            invaderXim.item.NAGA_SAMUE,
        },
            -- GLOVES AND GAUNTLETS
        {
            invaderXim.item.VANYA_CUFFS,
            invaderXim.item.ESCHITE_GAUNTLETS,
            invaderXim.item.PSYCLOTH_MANILLAS,
            invaderXim.item.DESPAIR_FINGER_GLOVES,
            invaderXim.item.PURSUERS_CUFFS,
            invaderXim.item.RAWHIDE_GLOVES,
            invaderXim.item.NAGA_TEKKO,
        },
            -- LEG ARMOR
        {
            invaderXim.item.VANYA_SLOPS,
            invaderXim.item.ESCHITE_CUISSES,
            invaderXim.item.PSYCLOTH_LAPPAS,
            invaderXim.item.DESPAIR_CUISSES,
            invaderXim.item.PURSUERS_PANTS,
            invaderXim.item.RAWHIDE_TROUSERS,
            invaderXim.item.NAGA_HAKAMA,
        },
            -- BOOTS AND GREAVES
        {
            invaderXim.item.VANYA_CLOGS,
            invaderXim.item.ESCHITE_GREAVES,
            invaderXim.item.PSYCLOTH_BOOTS,
            invaderXim.item.DESPAIR_GREAVES,
            invaderXim.item.PURSUERS_GAITERS,
            invaderXim.item.RAWHIDE_BOOTS,
            invaderXim.item.NAGA_KYAHAN,
        },
            -- NECK PIECES
        {
            invaderXim.item.SUBTLETY_SPECTACLES,
            invaderXim.item.MARKED_GORGET,
            invaderXim.item.RETI_PENDANT,
            invaderXim.item.DIEMER_GORGET,
            invaderXim.item.CARO_NECKLACE,
            invaderXim.item.NODENS_GORGET,
        },
            -- EARRINGS
        {
            invaderXim.item.INFUSED_EARRING,
            invaderXim.item.MENDICANTS_EARRING,
            invaderXim.item.HALASZ_EARRING,
            invaderXim.item.ASSUAGE_EARRING,
            invaderXim.item.ISHVARA_EARRING,
            invaderXim.item.EVANS_EARRING,
        },
            -- BELTS AND SASHES
        {
            invaderXim.item.LUCIDITY_SASH,
            invaderXim.item.GRUNFELD_ROPE,
            invaderXim.item.POROUS_ROPE,
            invaderXim.item.SULLA_BELT,
        },
            -- RINGS
        {
            invaderXim.item.OVERBEARING_RING,
            invaderXim.item.RESONANCE_RING,
            invaderXim.item.PETROV_RING,
            invaderXim.item.FORTIFIED_RING,
            invaderXim.item.VERTIGO_RING,
            invaderXim.item.EVANESCENCE_RING,
        },
            -- CAPES AND CLOAKS
        {
            invaderXim.item.DISPERSERS_CAPE,
            invaderXim.item.PHILIDOR_MANTLE,
            invaderXim.item.SOKOLSKI_MANTLE,
            invaderXim.item.QUARREL_MANTLE,
        },
    },
    -- Kupon AW-UWIII: Unity Wanted Battles 119 - 145 (MOG_KUPON_AW_UWIII = 9179)
    [40] =
    {
            -- HAND-TO-HAND WEAPONS,
        {
            invaderXim.item.FISTS_OF_FURY_P1,
            invaderXim.item.EMEICI_P1,
            invaderXim.item.COMEUPPANCES_P1,
        },
            -- DAGGERS,
        {
            invaderXim.item.JUGO_KUKRI_P1,
            invaderXim.item.ANATHEMA_HARPE_P1,
            invaderXim.item.TERNION_DAGGER_P1,
            invaderXim.item.KUSTAWI_P1,
        },
            -- SWORDS,
        {
            invaderXim.item.SANGARIUS_P1,
            invaderXim.item.PUKULATMUJ_P1,
            invaderXim.item.DEMERSAL_DEGEN_P1,
            invaderXim.item.TANMOGAYI_P1,
            invaderXim.item.FLYSSA_P1,
            invaderXim.item.COMBUSTER_P1,
        },
            -- GREAT SWORDS,
        {
            invaderXim.item.KLADENETS_P1,
            invaderXim.item.MONTANTE_P1,
            invaderXim.item.NULLIS_P1,
            invaderXim.item.USHENZI_P1,
        },
            -- AXES,
        {
            invaderXim.item.BURAMGH_P1,
            invaderXim.item.PERUN_P1,
            invaderXim.item.MDOMO_AXE_P1,
            invaderXim.item.HABILITATOR_P1,
        },
            -- GREAT AXES,
        {
            invaderXim.item.AIZKORA_P1,
            invaderXim.item.BEHEADER_P1,
        },
            -- POLEARMS,
        {
            invaderXim.item.GAE_DERG_P1,
        },
            -- SCYTHES,
        {
            invaderXim.item.TRISKA_SCYTHE_P1,
            invaderXim.item.PIXQUIZPAN_P1,
        },
            -- KATANAS,
        {
            invaderXim.item.TANCHO_P1,
            invaderXim.item.RAICHO_P1,
        },
            -- GREAT KATANAS,
        {
            invaderXim.item.KUNIMUNE_P1,
            invaderXim.item.NORIFUSA_P1,
        },
            -- CLUBS,
        {
            invaderXim.item.MAGESMASHER_P1,
            invaderXim.item.LOXOTIC_MACE_P1,
            invaderXim.item.SEPTOPTIC_P1,
        },
            -- STAVES,
        {
            invaderXim.item.POUWHENUA_P1,
            invaderXim.item.ABABINILI_P1,
            invaderXim.item.MARIN_STAFF_P1,
            invaderXim.item.CONTEMPLATOR_P1,
        },
            -- THROWING WEAPONS,
        {
            invaderXim.item.WINGCUTTER_P1,
            invaderXim.item.GHASTLY_TATHLUM_P1,
            invaderXim.item.SEETHING_BOMBLET_P1,
            invaderXim.item.ANTITAIL_P1,
        },
            -- BOWS,
        {
            invaderXim.item.MENGADO_P1,
            invaderXim.item.PALOMA_BOW_P1,
        },
            -- GUNS,
        {
            invaderXim.item.MALISON_P1,
            invaderXim.item.IMATI_P1,
        },
            -- SHIELDS,
        {
            invaderXim.item.EVALACH_P1,
            invaderXim.item.AJAX_P1,
            invaderXim.item.DELIVERANCE_P1,
            invaderXim.item.FORFEND_P1,
        },
        { --[[ INSTRUMENTS --]] },
            -- GRIPS,
        {
            invaderXim.item.RIGOROUS_GRIP_P1,
            invaderXim.item.REFINED_GRIP_P1,
        },
            -- HEADGEAR,
        {
            invaderXim.item.IMPERIAL_WING_HAIRPIN_P1,
            invaderXim.item.ADORNED_HELM_P1,
            invaderXim.item.STINGER_HELM_P1,
            invaderXim.item.HIKE_KHAT_P1,
            invaderXim.item.ALHAZEN_HAT_P1,
            invaderXim.item.BLISTERING_SALLET_P1,
            invaderXim.item.LOESS_BARBUTA_P1,
        },
            -- CHEST ARMOR,
        {
            invaderXim.item.ROSETTE_JASERAN_P1,
            invaderXim.item.EMET_HARNESS_P1,
            invaderXim.item.HIME_DOMARU_P1,
            invaderXim.item.SHOMONJIJOE_P1,
            invaderXim.item.LUGRA_CLOAK_P1,
            invaderXim.item.AGONY_JERKIN_P1,
            invaderXim.item.COHORT_CLOAK_P1,
            invaderXim.item.TATENASHI_HARAMAKI_P1,
            invaderXim.item.OBVIATION_CUIRASS_P1,
        },
            -- GLOVES AND GAUNTLETS,
        {
            invaderXim.item.MACABRE_GAUNTLETS_P1,
            invaderXim.item.SHIGURE_TEKKO_P1,
            invaderXim.item.KACHIMUSHA_KOTE_P1,
            invaderXim.item.ASTERIA_MITTS_P1,
            invaderXim.item.LAMASSU_MITTS_P1,
            invaderXim.item.TATENASHI_GOTE_P1,
            invaderXim.item.GAZU_BRACELETS_P1,
        },
            -- LEG ARMOR,
        {
            invaderXim.item.ASSIDUITY_PANTS_P1,
            invaderXim.item.AUGURY_CUISSES_P1,
            invaderXim.item.ZOAR_SUBLIGAR_P1,
            invaderXim.item.TATENASHI_HAIDATE_P1,
        },
            -- BOOTS AND GREAVES,
        {
            invaderXim.item.REGAL_PUMPS_P1,
            invaderXim.item.JUTE_BOOTS_P1,
            invaderXim.item.HIPPOMENES_SOCKS_P1,
            invaderXim.item.HYGIEIA_CLOGS_P1,
            invaderXim.item.TATENASHI_SUNE_ATE_P1,
        },
            -- NECK PIECES,
        {
            invaderXim.item.UNMOVING_COLLAR_P1,
            invaderXim.item.CANTO_NECKLACE_P1,
            invaderXim.item.WARDERS_CHARM_P1,
            invaderXim.item.BATHY_CHOKER_P1,
            invaderXim.item.VIM_TORQUE_P1,
            invaderXim.item.LORICATE_TORQUE_P1,
        },
            -- EARRINGS,
        {
            invaderXim.item.NOURISHING_EARRING_P1,
            invaderXim.item.HANDLERS_EARRING_P1,
            invaderXim.item.ARETE_DEL_LUNA_P1,
            invaderXim.item.LUGRA_EARRING_P1,
            invaderXim.item.ZWAZO_EARRING_P1,
            invaderXim.item.DOMINANCE_EARRING_P1,
            invaderXim.item.ODNOWA_EARRING_P1,
        },
            -- BELTS AND SASHES,
        {
            invaderXim.item.SHINJUTSU_NO_OBI_P1,
            invaderXim.item.SAILFI_BELT_P1,
            invaderXim.item.ACUITY_BELT_P1,
            invaderXim.item.KENTARCH_BELT_P1,
        },
            -- RINGS,
        {
            invaderXim.item.METAMORPH_RING_P1,
            invaderXim.item.APEILE_RING_P1,
            invaderXim.item.MEPHITASS_RING_P1,
            invaderXim.item.GELATINOUS_RING_P1,
            invaderXim.item.CACOETHIC_RING_P1,
        },
            -- CAPES AND CLOAKS,
        {
            invaderXim.item.GROUNDED_MANTLE_P1,
            invaderXim.item.FI_FOLLET_CAPE_P1,
            invaderXim.item.AURISTS_CAPE_P1,
        },
            -- OTHER,
        {
            invaderXim.item.STINGER_BULLET_POUCH,
        },
    },
    -- Kupon AW-UWII: Unity Wanted Battles 119 - 128 (MOG_KUPON_AW_UWII = 9180)
    [41] =
    {
            -- HAND-TO-HAND WEAPONS,
        {
            invaderXim.item.FISTS_OF_FURY_P1,
            invaderXim.item.EMEICI_P1,
        },
            -- DAGGERS,
        {
            invaderXim.item.JUGO_KUKRI_P1,
            invaderXim.item.ANATHEMA_HARPE_P1,
            invaderXim.item.TERNION_DAGGER_P1,
            invaderXim.item.KUSTAWI_P1,
        },
            -- SWORDS,
        {
            invaderXim.item.SANGARIUS_P1,
            invaderXim.item.PUKULATMUJ_P1,
            invaderXim.item.DEMERSAL_DEGEN_P1,
        },
            -- GREAT SWORDS,
        {
            invaderXim.item.KLADENETS_P1,
            invaderXim.item.USHENZI_P1,
        },
            -- AXES,
        {
            invaderXim.item.BURAMGH_P1,
            invaderXim.item.PERUN_P1,
            invaderXim.item.MDOMO_AXE_P1,
        },
            -- GREAT AXES,
        {
            invaderXim.item.AIZKORA_P1,
            invaderXim.item.BEHEADER_P1,
        },
            -- POLEARMS,
        {
            invaderXim.item.GAE_DERG_P1,
        },
            -- SCYTHES,
        {
            invaderXim.item.TRISKA_SCYTHE_P1,
            invaderXim.item.PIXQUIZPAN_P1,
        },
            -- KATANAS,
        {
            invaderXim.item.TANCHO_P1,
            invaderXim.item.RAICHO_P1,
        },
            -- GREAT KATANAS,
        {
            invaderXim.item.KUNIMUNE_P1,
            invaderXim.item.NORIFUSA_P1,
        },
            -- CLUBS,
        {
            invaderXim.item.MAGESMASHER_P1,
            invaderXim.item.LOXOTIC_MACE_P1,
        },
            -- STAVES,
        {
            invaderXim.item.POUWHENUA_P1,
            invaderXim.item.ABABINILI_P1,
            invaderXim.item.MARIN_STAFF_P1,
        },
            -- THROWING WEAPONS,
        {
            invaderXim.item.WINGCUTTER_P1,
            invaderXim.item.GHASTLY_TATHLUM_P1,
            invaderXim.item.SEETHING_BOMBLET_P1,
        },
            -- BOWS,
        {
            invaderXim.item.MENGADO_P1,
            invaderXim.item.PALOMA_BOW_P1,
        },
            -- GUNS,
        {
            invaderXim.item.IMATI_P1,
        },
            -- SHIELDS,
        {
            invaderXim.item.EVALACH_P1,
            invaderXim.item.AJAX_P1,
            invaderXim.item.DELIVERANCE_P1,
        },
        { --[[ INSTRUMENTS --]] },
            -- GRIPS,
        {
            invaderXim.item.RIGOROUS_GRIP_P1,
            invaderXim.item.REFINED_GRIP_P1,
        },
            -- HEADGEAR,
        {
            invaderXim.item.IMPERIAL_WING_HAIRPIN_P1,
            invaderXim.item.ADORNED_HELM_P1,
            invaderXim.item.STINGER_HELM_P1,
            invaderXim.item.HIKE_KHAT_P1,
            invaderXim.item.ALHAZEN_HAT_P1,
            invaderXim.item.BLISTERING_SALLET_P1,
        },
            -- CHEST ARMOR,
        {
            invaderXim.item.ROSETTE_JASERAN_P1,
            invaderXim.item.EMET_HARNESS_P1,
            invaderXim.item.HIME_DOMARU_P1,
            invaderXim.item.SHOMONJIJOE_P1,
            invaderXim.item.LUGRA_CLOAK_P1,
            invaderXim.item.AGONY_JERKIN_P1,
            invaderXim.item.COHORT_CLOAK_P1,
        },
            -- GLOVES AND GAUNTLETS,
        {
            invaderXim.item.MACABRE_GAUNTLETS_P1,
            invaderXim.item.SHIGURE_TEKKO_P1,
            invaderXim.item.KACHIMUSHA_KOTE_P1,
            invaderXim.item.ASTERIA_MITTS_P1,
            invaderXim.item.LAMASSU_MITTS_P1,
            invaderXim.item.GAZU_BRACELETS_P1,
        },
            -- LEG ARMOR,
        {
            invaderXim.item.ASSIDUITY_PANTS_P1,
            invaderXim.item.AUGURY_CUISSES_P1,
            invaderXim.item.ZOAR_SUBLIGAR_P1,
        },
            -- BOOTS AND GREAVES,
        {
            invaderXim.item.REGAL_PUMPS_P1,
            invaderXim.item.JUTE_BOOTS_P1,
            invaderXim.item.HIPPOMENES_SOCKS_P1,
            invaderXim.item.HYGIEIA_CLOGS_P1,
        },
            -- NECK PIECES,
        {
            invaderXim.item.UNMOVING_COLLAR_P1,
            invaderXim.item.CANTO_NECKLACE_P1,
            invaderXim.item.WARDERS_CHARM_P1,
            invaderXim.item.BATHY_CHOKER_P1,
        },
            -- EARRINGS,
        {
            invaderXim.item.NOURISHING_EARRING_P1,
            invaderXim.item.HANDLERS_EARRING_P1,
            invaderXim.item.ARETE_DEL_LUNA_P1,
            invaderXim.item.LUGRA_EARRING_P1,
            invaderXim.item.ZWAZO_EARRING_P1,
            invaderXim.item.ODNOWA_EARRING_P1,
        },
            -- BELTS AND SASHES,
        {
            invaderXim.item.SHINJUTSU_NO_OBI_P1,
            invaderXim.item.SAILFI_BELT_P1,
            invaderXim.item.ACUITY_BELT_P1,
            invaderXim.item.KENTARCH_BELT_P1,
        },
            -- RINGS,
        {
            invaderXim.item.METAMORPH_RING_P1,
            invaderXim.item.APEILE_RING_P1,
            invaderXim.item.MEPHITASS_RING_P1,
            invaderXim.item.GELATINOUS_RING_P1,
            invaderXim.item.CACOETHIC_RING_P1,
        },
            -- CAPES AND CLOAKS,
        {
            invaderXim.item.GROUNDED_MANTLE_P1,
            invaderXim.item.FI_FOLLET_CAPE_P1,
            invaderXim.item.AURISTS_CAPE_P1,
        },
            -- OTHER,
        {
            invaderXim.item.STINGER_BULLET_POUCH,
        },
    },
    -- Kupon AW-UW: Unity Wanted Battles 119 (MOG_KUPON_AW_UW = 9181)
    [42] =
    {
        invaderXim.item.BURAMGH_P1,
        invaderXim.item.TANCHO_P1,
        invaderXim.item.WINGCUTTER_P1,
        invaderXim.item.EVALACH_P1,
        invaderXim.item.IMPERIAL_WING_HAIRPIN_P1,
        invaderXim.item.MACABRE_GAUNTLETS_P1,
        invaderXim.item.ASSIDUITY_PANTS_P1,
        invaderXim.item.REGAL_PUMPS_P1,
        invaderXim.item.HIPPOMENES_SOCKS_P1,
        invaderXim.item.UNMOVING_COLLAR_P1,
        invaderXim.item.NOURISHING_EARRING_P1,
        invaderXim.item.METAMORPH_RING_P1,
        invaderXim.item.APEILE_RING_P1,
        invaderXim.item.SHINJUTSU_NO_OBI_P1,
    },
    -- Kupon A-Ab: iLevel 119 P1 Abjuration Armor Sets (MOG_KUPON_A_AB = 9178)
    [43] =
    {
        {
            invaderXim.item.ARGOSY_CELATA_P1,
            invaderXim.item.ARGOSY_HAUBERK_P1,
            invaderXim.item.ARGOSY_MUFFLERS_P1,
            invaderXim.item.ARGOSY_BREECHES_P1,
            invaderXim.item.ARGOSY_SOLLERETS_P1,
        },
        {
            invaderXim.item.ADHEMAR_BONNET_P1,
            invaderXim.item.ADHEMAR_JACKET_P1,
            invaderXim.item.ADHEMAR_WRISTBANDS_P1,
            invaderXim.item.ADHEMAR_KECKS_P1,
            invaderXim.item.ADHEMAR_GAMASHES_P1,
        },
        {
            invaderXim.item.APOGEE_CROWN_P1,
            invaderXim.item.APOGEE_DALMATICA_P1,
            invaderXim.item.APOGEE_MITTS_P1,
            invaderXim.item.APOGEE_SLACKS_P1,
            invaderXim.item.APOGEE_PUMPS_P1,
        },
        {
            invaderXim.item.AMALRIC_COIF_P1,
            invaderXim.item.AMALRIC_DOUBLET_P1,
            invaderXim.item.AMALRIC_GAGES_P1,
            invaderXim.item.AMALRIC_SLOPS_P1,
            invaderXim.item.AMALRIC_NAILS_P1,
        },
        {
            invaderXim.item.EMICHO_CORONET_P1,
            invaderXim.item.EMICHO_HAUBERT_P1,
            invaderXim.item.EMICHO_GAUNTLETS_P1,
            invaderXim.item.EMICHO_HOSE_P1,
            invaderXim.item.EMICHO_GAMBIERAS_P1,
        },
        {
            invaderXim.item.CARMINE_MASK_P1,
            invaderXim.item.CARMINE_SCALE_MAIL_P1,
            invaderXim.item.CARMINE_FINGER_GAUNTLETS_P1,
            invaderXim.item.CARMINE_CUISSES_P1,
            invaderXim.item.CARMINE_GREAVES_P1,
        },
        {
            invaderXim.item.KAYKAUS_MITRA_P1,
            invaderXim.item.KAYKAUS_BLIAUT_P1,
            invaderXim.item.KAYKAUS_CUFFS_P1,
            invaderXim.item.KAYKAUS_TIGHTS_P1,
            invaderXim.item.KAYKAUS_BOOTS_P1,
        },
        {
            invaderXim.item.SOUVERAN_SCHALLER_P1,
            invaderXim.item.SOUVERAN_CUIRASS_P1,
            invaderXim.item.SOUVERAN_HANDSCHUHS_P1,
            invaderXim.item.SOUVERAN_DIECHLINGS_P1,
            invaderXim.item.SOUVERAN_SCHUHS_P1,
        },
        {
            invaderXim.item.LUSTRATIO_CAP_P1,
            invaderXim.item.LUSTRATIO_HARNESS_P1,
            invaderXim.item.LUSTRATIO_MITTENS_P1,
            invaderXim.item.LUSTRATIO_SUBLIGAR_P1,
            invaderXim.item.LUSTRATIO_LEGGINGS_P1,
        },
        {
            invaderXim.item.RAO_KABUTO_P1,
            invaderXim.item.RAO_TOGI_P1,
            invaderXim.item.RAO_KOTE_P1,
            invaderXim.item.RAO_HAIDATE_P1,
            invaderXim.item.RAO_SUNE_ATE_P1,
        },
        {
            invaderXim.item.RYUO_SOMEN_P1,
            invaderXim.item.RYUO_DOMARU_P1,
            invaderXim.item.RYUO_TEKKO_P1,
            invaderXim.item.RYUO_HAKAMA_P1,
            invaderXim.item.RYUO_SUNE_ATE_P1,
        },
    },

    -- Kupon AW-Cos: Various Costumes (MOG_KUPON_AW_COS = 9182)
    -- Some items are gender specific, with varying shifts between the F/M versions of
    -- items. Index defaults to the itemID for the Female version of the item, and
    -- has the shift distance specififed as a second param. Final/actual itemID is
    -- processed in getItemSelection.
    --
    -- Example: { invaderXim.item.COSSIE_TOP_P1,         2 }, itemID 26968, shift value of 2
    --          The Male version of the item is invaderXim.item.TA_MOKO_P1 = 26966
    [44] =
    {
            -- HAND-TO-HAND WEAPONS
        {
            { invaderXim.item.WORM_FEELERS_P1          },
        },
            -- SWORDS
        {
            { invaderXim.item.IBUSHI_SHINAI_P1         },
            { invaderXim.item.ARK_SABER                },
            { invaderXim.item.ARK_SWORD                },
            { invaderXim.item.EXCALIPOOR_II            },
        },
            -- AXES
        {
            { invaderXim.item.ARK_TABAR                },
        },
            -- POLEARMS
        {
            { invaderXim.item.PITCHFORK_P1             },
        },
            -- SCYTHES
        {
            { invaderXim.item.ARK_SCYTHE               },
        },
            -- GREAT KATANAS
        {
            { invaderXim.item.HARDWOOD_KATANA          },
            { invaderXim.item.LOTUS_KATANA             },
            { invaderXim.item.SHINAI                   },
            { invaderXim.item.ARK_TACHI                },
        },
            -- CLUBS
        {
            { invaderXim.item.CHOCOBO_WAND             },
            { invaderXim.item.CHARM_WAND_P1            },
            { invaderXim.item.NOMAD_MOOGLE_ROD         },
            { invaderXim.item.MIRACLE_WAND_P1          },
            { invaderXim.item.BATTLEDORE               },
            { invaderXim.item.DREAM_BELL_P1            },
            { invaderXim.item.HEARTSTOPPER_P1          },
            { invaderXim.item.HEARTBEATER_P1           },
            { invaderXim.item.LEAFKIN_BOPPER_P1        },
            { invaderXim.item.KYUKA_UCHIWA_P1          },
            { invaderXim.item.PURPLE_SPRIGGAN_CLUB     },
            { invaderXim.item.RED_SPRIGGAN_CLUB        },
            { invaderXim.item.HAGOITA                  },
            { invaderXim.item.GREEN_SPRIGGAN_CLUB      },
            { invaderXim.item.SEIKA_UCHIWA_P1          },
            { invaderXim.item.JINGLY_ROD_P1            },
        },
            -- STAVES
        {
            { invaderXim.item.TREAT_STAFF              },
            { invaderXim.item.TREAT_STAFF_II           },
            { invaderXim.item.MALICE_MASHER_P1         },
        },
            -- SHIELDS
        {
            { invaderXim.item.JANUS_GUARD              },
            { invaderXim.item.MOOGLE_GUARD_P1          },
            { invaderXim.item.CHOCOBO_SHIELD_P1        },
            { invaderXim.item.CASSIES_SHIELD           },
            { invaderXim.item.CAIT_SITH_GUARD_P1       },
            { invaderXim.item.SHE_SLIME_SHIELD         },
            { invaderXim.item.METAL_SLIME_SHIELD       },
            { invaderXim.item.HATCHLING_SHIELD         },
            { invaderXim.item.MUNDUS_SHIELD            },
            { invaderXim.item.SLIME_SHIELD             },
            { invaderXim.item.GLINTING_SHIELD          },
        },
            -- HEADGEAR 1
        {
            { invaderXim.item.DECENNIAL_TIARA_P1,    1 },
            { invaderXim.item.PYRACMON_CAP             },
            { invaderXim.item.SNOW_BUNNY_HAT_P1        },
            { invaderXim.item.HORROR_HEAD              },
            { invaderXim.item.HORROR_HEAD_II           },
            { invaderXim.item.DREAM_HAT_P1             },
            { invaderXim.item.COVEN_HAT                },
            { invaderXim.item.EGG_HELM                 },
            { invaderXim.item.REDEYES                  },
            { invaderXim.item.BUFFALO_CAP              },
            { invaderXim.item.STARLET_FLOWER,        1 },
            { invaderXim.item.CARBIE_CAP_P1            },
            { invaderXim.item.CASSIES_CAP              },
            { invaderXim.item.LYCOPODIUM_MASQUE_P1     },
            { invaderXim.item.MANDRAGORA_MASQUE_P1     },
            { invaderXim.item.FLAN_MASQUE_P1           },
            { invaderXim.item.CAIT_SITH_CAP_P1         },
            { invaderXim.item.SHEEP_CAP_P1             },
            { invaderXim.item.FROSTY_CAP               },
            { invaderXim.item.COROLLA                  },
            { invaderXim.item.CELESTE_CAP              },
            { invaderXim.item.LEAFKIN_CAP_P1           },
            { invaderXim.item.RABBIT_CAP               },
            { invaderXim.item.SHOBUHOUOU_KABUTO        },
            { invaderXim.item.BEHEMOTH_MASQUE_P1       },
            { invaderXim.item.GOBLIN_MASQUE            },
            { invaderXim.item.GREEN_MOOGLE_MASQUE      },
            { invaderXim.item.WORM_MASQUE_P1           },
            { invaderXim.item.SHE_SLIME_HAT            },
            { invaderXim.item.METAL_SLIME_HAT          },
        },
            -- HEADGEAR 2
        {
            { invaderXim.item.SLIME_CAP                },
            { invaderXim.item.BOMB_MASQUE_P1           },
            { invaderXim.item.CHOCOBO_MASQUE_P1        },
            { invaderXim.item.WYRMKING_MASQUE_P1       },
            { invaderXim.item.SNOLL_MASQUE_P1          },
            { invaderXim.item.RARAB_CAP_P1             },
            { invaderXim.item.CRAB_CAP_P1              },
            { invaderXim.item.KAKAI_CAP_P1             },
            { invaderXim.item.CUMULUS_MASQUE_P1        },
        },
            -- CHEST ARMOR
        {
            { invaderXim.item.DECENNIAL_DRESS_P1,    1 },
            { invaderXim.item.EERIE_CLOAK_P1           },
            { invaderXim.item.OMINAESHI_YUKATA,      1 },
            { invaderXim.item.DINNER_JACKET            },
            { invaderXim.item.NOVENNIAL_DRESS,       1 },
            { invaderXim.item.HIMEGAMI_YUKATA,       1 },
            { invaderXim.item.LADYS_YUKATA,          1 },
            { invaderXim.item.DREAM_ROBE_P1            },
            { invaderXim.item.ONNAGIMI_YUKATA,       1 },
            { invaderXim.item.BOTULUS_SUIT_P1          },
            { invaderXim.item.TRACK_SHIRT_P1           },
            { invaderXim.item.HEART_APRON_P1           },
            { invaderXim.item.PUPILS_SHIRT             },
            { invaderXim.item.BEHEMOTH_SUIT_P1         },
            { invaderXim.item.POROGGO_COAT_P1          },
            { invaderXim.item.COSSIE_TOP_P1,         2 },
            { invaderXim.item.STARLET_JABOT,         1 },
            { invaderXim.item.SHOAL_MAILLOT_P1,      1 },
            { invaderXim.item.MANDRAGORA_SUIT_P1       },
            { invaderXim.item.SHOKUJO_HAPPI,         1 },
            { invaderXim.item.GOBLIN_SUIT              },
            { invaderXim.item.GREEN_MOOGLE_SUIT        },
            { invaderXim.item.PURPLE_SPRIGGAN_COAT     },
            { invaderXim.item.RED_SPRIGGAN_COAT        },
            { invaderXim.item.ALLIANCE_SHIRT_P1        },
            { invaderXim.item.GREEN_SPRIGGAN_COAT      },
            { invaderXim.item.CHOCOBO_SUIT_P1          },
            { invaderXim.item.WYRMKING_SUIT_P1         },
            { invaderXim.item.RHAPSODY_SHIRT_P1        },
            { invaderXim.item.AKITU_SHIRT              },
        },
            -- CHEST ARMOR 2
        {
            { invaderXim.item.JUBILEE_SHIRT            },
        },
            -- GLOVES AND GAUNTLETS
        {
            { invaderXim.item.DREAM_MITTENS_P1         },
            { invaderXim.item.STARLET_GLOVES,        1 },
        },
            -- LEG ARMOR
        {
            { invaderXim.item.DECENNIAL_HOSE_P1,     1 },
            { invaderXim.item.NOVENNIAL_THIGH_BOOTS, 1 },
            { invaderXim.item.DREAM_PANTS_P1,        2 },
            { invaderXim.item.DINNER_HOSE              },
            { invaderXim.item.PUPILS_TROUSERS          },
            { invaderXim.item.COSSIE_BOTTOM_P1,      2 },
            { invaderXim.item.STARLET_SKIRT,         1 },
            { invaderXim.item.TRACK_PANTS_P1           },
            { invaderXim.item.SHOAL_TRUNKS_P1,       1 },
            { invaderXim.item.SHOKUJO_HANMOMOHIKI,   1 },
            { invaderXim.item.ALLIANCE_PANTS           },
        },
            -- BOOTS AND GREAVES
        {
            { invaderXim.item.DREAM_BOOTS_P1           },
            { invaderXim.item.PUPILS_SHOES             },
            { invaderXim.item.STARLET_BOOTS,         1 },
            { invaderXim.item.ALLIANCE_BOOTS           },
        },
    },

    -- Kupon AW-Kupo: All four Kupo items
    [45] =
    {
        {
            invaderXim.item.KUPO_ROD,
            invaderXim.item.KUPO_MASQUE,
            invaderXim.item.KUPO_SUIT,
            invaderXim.item.KUPO_SHIELD,
        },
    },

    -- Kupon W-EMI: iLevel 117 Sparks of Eminence Weapons (MOG_KUPON_W_EMI = 9188)
    [46] =
    {
        invaderXim.item.EMINENT_BAGHNAKHS,
        invaderXim.item.EMINENT_DAGGER,
        invaderXim.item.EMINENT_SCIMITAR,
        invaderXim.item.EMINENT_SWORD,
        invaderXim.item.EMINENT_AXE,
        invaderXim.item.EMINENT_VOULGE,
        invaderXim.item.EMINENT_SICKLE,
        invaderXim.item.EMINENT_LANCE,
        invaderXim.item.KAITSUBURI,
        invaderXim.item.ICHIMONJI_YOFUSA,
        invaderXim.item.EMINENT_WAND,
        invaderXim.item.EMINENT_STAFF,
        invaderXim.item.EMINENT_POLE,
        invaderXim.item.EMINENT_BOW,
        invaderXim.item.EMINENT_CROSSBOW,
        invaderXim.item.EMINENT_GUN,
        invaderXim.item.EMINENT_SHIELD,
        invaderXim.item.EMINENT_ANIMATOR,
        invaderXim.item.EMINENT_SACHET,
        invaderXim.item.EMINENT_BELL,
        invaderXim.item.EMINENT_FLUTE,
        invaderXim.item.EMINENT_ANIMATOR_II,
    },

    -- Kupon A-EMI: iLevel 117 Records of Eminence armor (MOG_KUPON_A_EMI = 9226)
    [47] =
    {
        {
            invaderXim.item.OUTRIDER_MASK,
            invaderXim.item.OUTRIDER_MAIL,
            invaderXim.item.OUTRIDER_MITTENS,
            invaderXim.item.OUTRIDER_HOSE,
            invaderXim.item.OUTRIDER_GREAVES,
        },
        {
            invaderXim.item.ESPIAL_CAP,
            invaderXim.item.ESPIAL_GAMBISON,
            invaderXim.item.ESPIAL_BRACERS,
            invaderXim.item.ESPIAL_HOSE,
            invaderXim.item.ESPIAL_SOCKS,
        },
        {
            invaderXim.item.WAYFARER_CIRCLET,
            invaderXim.item.WAYFARER_ROBE,
            invaderXim.item.WAYFARER_CUFFS,
            invaderXim.item.WAYFARER_SLOPS,
            invaderXim.item.WAYFARER_CLOGS,
        },
    },

    -- Kupon W-SRW: Rala Waterways Skirmish Weapons +2 (MOG_KUPON_W_SRW = 9189)
    [48] =
    {
        invaderXim.item.AEDOLD_P2,
        invaderXim.item.CROBACI_P2,
        invaderXim.item.FAIZZEER_P2,
        invaderXim.item.HGAFIRCIAN_P2,
        invaderXim.item.ICLAMAR_P2,
        invaderXim.item.KANNAKIRI_P2,
        invaderXim.item.LEHBRAILG_P2,
    },

    -- Kupon W-SCC: Cirdas Caverns Skirmish Weapons +2 (MOG_KUPON_W_SCC = 9190)
    [49] =
    {
        invaderXim.item.NINZAS_P2,
        invaderXim.item.LEISILONU_P2,
        invaderXim.item.IZTAASU_P2,
        invaderXim.item.IIZAMAL_P2,
        invaderXim.item.QATSUNOCI_P2,
        invaderXim.item.SHICHISHITO_P2,
        invaderXim.item.UFFRAT_P2,
        invaderXim.item.BOCLUAMNI_P2,
    },

    -- Kupon A-SYW: Yorcia Weald Skirmish Armor +1 (MOG_KUPON_A_SYW = 9227)
    [50] =
    {
        {
            invaderXim.item.CIZIN_HELM_P1,
            invaderXim.item.CIZIN_MAIL_P1,
            invaderXim.item.CIZIN_MUFFLERS_P1,
            invaderXim.item.CIZIN_BREECHES_P1,
            invaderXim.item.CIZIN_GREAVES_P1,
        },
        {
            invaderXim.item.OTRONIF_MASK_P1,
            invaderXim.item.OTRONIF_HARNESS_P1,
            invaderXim.item.OTRONIF_GLOVES_P1,
            invaderXim.item.OTRONIF_BRAIS_P1,
            invaderXim.item.OTRONIF_BOOTS_P1,
        },
        {
            invaderXim.item.IUITL_HEADGEAR_P1,
            invaderXim.item.IUITL_VEST_P1,
            invaderXim.item.IUITL_WRISTBANDS_P1,
            invaderXim.item.IUITL_TIGHTS_P1,
            invaderXim.item.IUITL_GAITERS_P1,
        },
        {
            invaderXim.item.GENDEWITHA_CAUBEEN_P1,
            invaderXim.item.GENDEWITHA_BLIAUT_P1,
            invaderXim.item.GENDEWITHA_GAGES_P1,
            invaderXim.item.GENDEWITHA_SPATS_P1,
            invaderXim.item.GENDEWITHA_GALOSHES_P1,
        },
        {
            invaderXim.item.HAGONDES_HAT_P1,
            invaderXim.item.HAGONDES_COAT_P1,
            invaderXim.item.HAGONDES_CUFFS_P1,
            invaderXim.item.HAGONDES_PANTS_P1,
            invaderXim.item.HAGONDES_SABOTS_P1,
        },
        {
            invaderXim.item.BEATIFIC_SHIELD_P1,
        },
    },
    -- Kupon W-ASRW: Rala Waterways Alluvion Skirmish Weapons (MOG_KUPON_W_ASRW = 9191)
    [51] =
    {
        invaderXim.item.OHRMAZD,
        invaderXim.item.IPETAM,
        invaderXim.item.CLAIDHEAMH_SOLUIS,
        invaderXim.item.MACBAIN,
        invaderXim.item.KUMBHAKARNA,
        invaderXim.item.SVARGA,
        invaderXim.item.INANNA,
        invaderXim.item.KERAUNOS,
    },

    -- Kupon W-ASCC: Cirdas Caverns Alluvion Skirmish Weapons (MOG_KUPON_W_ASCC = 9192)
    [52] =
    {
        invaderXim.item.OLYNDICUS,
        invaderXim.item.IZUNA,
        invaderXim.item.NENEKIRIMARU,
        invaderXim.item.NEHUSHTAN,
        invaderXim.item.PHAOSPHAELIA,
        invaderXim.item.LINOS,
        invaderXim.item.DOOMSDAY,
        invaderXim.item.SVALINN,
    },

    -- Kupon A-ASYW: Yorcia Weald Alluvion Skirmish Armor (MOG_KUPON_A_ASYW = 9228)
    [53] =
    {
        {
            invaderXim.item.YORIUM_BARBUTA,
            invaderXim.item.YORIUM_CUIRASS,
            invaderXim.item.YORIUM_GAUNTLETS,
            invaderXim.item.YORIUM_CUISSES,
            invaderXim.item.YORIUM_SABATONS,
        },
        {
            invaderXim.item.ACRO_HELM,
            invaderXim.item.ACRO_SURCOAT,
            invaderXim.item.ACRO_GAUNTLETS,
            invaderXim.item.ACRO_BREECHES,
            invaderXim.item.ACRO_LEGGINGS,
        },
        {
            invaderXim.item.TAEON_CHAPEAU,
            invaderXim.item.TAEON_TABARD,
            invaderXim.item.TAEON_GLOVES,
            invaderXim.item.TAEON_TIGHTS,
            invaderXim.item.TAEON_BOOTS,
        },
        {
            invaderXim.item.TELCHINE_CAP,
            invaderXim.item.TELCHINE_CHASUBLE,
            invaderXim.item.TELCHINE_GLOVES,
            invaderXim.item.TELCHINE_BRACONI,
            invaderXim.item.TELCHINE_PIGACHES,
        },
        {
            invaderXim.item.HELIOS_BAND,
            invaderXim.item.HELIOS_JACKET,
            invaderXim.item.HELIOS_GLOVES,
            invaderXim.item.HELIOS_SPATS,
            invaderXim.item.HELIOS_BOOTS,
        },
    },
    -- Kupon W-R119: iLevel 119 III Relic Weapons (MOG_KUPON_W_R119 = 9183)
    [54] =
    {
        invaderXim.item.SPHARAI_119_III,
        invaderXim.item.MANDAU_119_III,
        invaderXim.item.EXCALIBUR_119_III,
        invaderXim.item.RAGNAROK_119_III,
        invaderXim.item.GUTTLER_119_III,
        invaderXim.item.BRAVURA_119_III,
        invaderXim.item.APOCALYPSE_119_III,
        invaderXim.item.GUNGNIR_119_III,
        invaderXim.item.KIKOKU_119_III,
        invaderXim.item.AMANOMURAKUMO_119_III,
        invaderXim.item.MJOLLNIR_119_III,
        invaderXim.item.CLAUSTRUM_119_III,
        invaderXim.item.YOICHINOYUMI_119_III,  -- Quiver Version
        invaderXim.item.ANNIHILATOR_119_III,   -- Quiver Version
    },

    -- Kupon W-M119: iLevel 119 III Mythic Weapons and Ergon Weapons (MOG_KUPON_W_M119 = 9184)
    [55] =
    {
        invaderXim.item.GLANZFAUST_119_III,
        invaderXim.item.KENKONKEN_119_III,
        invaderXim.item.VAJRA_119_III,
        invaderXim.item.CARNWENHAN_119_III,
        invaderXim.item.TERPSICHORE_119_III,
        invaderXim.item.MURGLEIS_119_III,
        invaderXim.item.BURTGANG_119_III,
        invaderXim.item.TIZONA_119_III,
        invaderXim.item.EPEOLATRY_119_II,
        invaderXim.item.AYMUR_119_III,
        invaderXim.item.CONQUEROR_119_III,
        invaderXim.item.LIBERATOR_119_III,
        invaderXim.item.RYUNOHIGE_119_III,
        invaderXim.item.NAGI_119_III,
        invaderXim.item.KOGARASUMARU_119_III,
        invaderXim.item.YAGRUSH_119_III,
        invaderXim.item.IDRIS_119_II,
        invaderXim.item.LAEVATEINN_119_III,
        invaderXim.item.NIRVANA_119_III,
        invaderXim.item.TUPSIMATI_119_III,
        invaderXim.item.GASTRAPHETES_119_III,  -- Quiver Version
        invaderXim.item.DEATH_PENALTY_119_III, -- Quiver Version
    },

    -- Kupon W-E119: iLevel 119 III Empyrean Weapons (MOG_KUPON_W_E119 = 9185)
    [56] =
    {
        invaderXim.item.VERETHRAGNA_119_III,
        invaderXim.item.TWASHTAR_119_III,
        invaderXim.item.ALMACE_119_III,
        invaderXim.item.CALADBOLG_119_III,
        invaderXim.item.FARSHA_119_III,
        invaderXim.item.UKONVASARA_119_III,
        invaderXim.item.REDEMPTION_119_III,
        invaderXim.item.RHONGOMIANT_119_III,
        invaderXim.item.KANNAGI_119_III,
        invaderXim.item.MASAMUNE_119_III,
        invaderXim.item.GAMBANTEINN_119_III,
        invaderXim.item.HVERGELMIR_119_III,
        invaderXim.item.GANDIVA_119_III,       -- Quiver Version
        invaderXim.item.ARMAGEDDON_119_III,    -- Quiver Version
    },

    -- Kupon W-A119: Aeonic Weapons (MOG_KUPON_W_A119 = 9186)
    [57] =
    {
        invaderXim.item.GODHANDS,
        invaderXim.item.AENEAS,
        invaderXim.item.SEQUENCE,
        invaderXim.item.LIONHEART,
        invaderXim.item.TRI_EDGE,
        invaderXim.item.CHANGO,
        invaderXim.item.TRISHULA,
        invaderXim.item.ANGUTA,
        invaderXim.item.HEISHI_SHORINKEN,
        invaderXim.item.DOJIKIRI_YASUTSUNA,
        invaderXim.item.TISHTRYA,
        invaderXim.item.KHATVANGA,
        invaderXim.item.FAIL_NOT,      -- Quiver Version
        invaderXim.item.FOMALHAUT,     -- Quiver Version
        invaderXim.item.SRIVATSA,
        invaderXim.item.MARSYAS,
    },

    -- Kupon AW-GeIV: Geas Fete (Any Content Level) (MOG_KUPON_AW_GEIV = 9187)
    [58] =
    {
            -- HAND-TO-HAND WEAPONS
        {
            invaderXim.item.NIBIRU_SAINTI,
            invaderXim.item.CHASTISERS,
            invaderXim.item.HAMMERFISTS,
            invaderXim.item.MIDNIGHTS,
            invaderXim.item.ESHUS,
            invaderXim.item.CONDEMNERS,
            invaderXim.item.SUWAIYAS,
        },
            -- DAGGERS
        {
            invaderXim.item.NIBIRU_KNIFE,
            invaderXim.item.ENCHUFLA,
            invaderXim.item.SHIJO,
            invaderXim.item.KALI,
            invaderXim.item.SKINFLAYER,
            invaderXim.item.SANGOMA,
        },
            -- SWORDS
        {
            invaderXim.item.NIBIRU_BLADE,
            invaderXim.item.NIXXER,
            invaderXim.item.EMISSARY,
            invaderXim.item.IRIS,
            invaderXim.item.COLADA,
            invaderXim.item.FIRANGI,
            invaderXim.item.DEACON_SABER,
            invaderXim.item.DEACON_SWORD,
            invaderXim.item.KOBOTO,
            invaderXim.item.REIKIKO,
        },
            -- GREAT SWORDS
        {
            invaderXim.item.NIBIRU_FAUSSAR,
            invaderXim.item.BIDENHANDER,
            invaderXim.item.ZULFIQAR,
            invaderXim.item.TAKOBA,
        },
            -- AXES
        {
            invaderXim.item.NIBIRU_TABAR,
            invaderXim.item.SKULLRENDER,
            invaderXim.item.DIGIRBALAG,
            invaderXim.item.FREYDIS,
            invaderXim.item.DEACON_TABAR,
        },
            -- GREAT AXES
        {
            invaderXim.item.NIBIRU_CHOPPER,
            invaderXim.item.ROUTER,
            invaderXim.item.INSTIGATOR,
            invaderXim.item.AGANOSHE,
            invaderXim.item.HODADENON,
            invaderXim.item.REIKIONO,
            invaderXim.item.JOKUSHUONO,
        },
            -- POLEARMS
        {
            invaderXim.item.NIBIRU_LANCE,
            invaderXim.item.ANNEALED_LANCE,
            invaderXim.item.RHOMPHAIA,
            invaderXim.item.REIENKYO,
            invaderXim.item.LEMBING,
            invaderXim.item.HABILE_MAZRAK,
        },
            -- SCYTHES
        {
            invaderXim.item.NIBIRU_SICKLE,
            invaderXim.item.DEATHBANE,
            invaderXim.item.OBSCHINE,
            invaderXim.item.MISANTHROPY,
            invaderXim.item.DACNOMANIA,
            invaderXim.item.DEACON_SCYTHE,
            invaderXim.item.SHUKUYUS_SCYTHE,
        },
            -- KATANAS
        {
            invaderXim.item.MIJIN,
            invaderXim.item.AIZUSHINTOGO,
            invaderXim.item.KANARIA,
            invaderXim.item.TAKA,
        },
            -- GREAT KATANAS
        {
            invaderXim.item.SENSUI,
            invaderXim.item.ICHIGOHITOFURI,
            invaderXim.item.UMARU,
            invaderXim.item.SHISHIO,
            invaderXim.item.DEACON_BLADE,
        },
            -- CLUBS
        {
            invaderXim.item.NIBIRU_CUDGEL,
            invaderXim.item.QUELLER_ROD,
            invaderXim.item.SOLSTICE,
            invaderXim.item.SUCELLUS,
            invaderXim.item.GADA,
            invaderXim.item.IZCALLI,
        },
            -- STAVES
        {
            invaderXim.item.NIBIRU_STAFF,
            invaderXim.item.ESPIRITUS,
            invaderXim.item.AKADEMOS,
            invaderXim.item.LATHI,
            invaderXim.item.GRIOAVOLR,
            invaderXim.item.ORANYAN,
            invaderXim.item.GOZUKI_MEZUKI,
            invaderXim.item.REIKIKON,
        },
            -- THROWING WEAPONS
        {
            invaderXim.item.SERAPHIC_AMPULLA,
            invaderXim.item.GRENADE_CORE,
            invaderXim.item.SAPIENCE_ORB,
            invaderXim.item.FALCON_EYE,
            invaderXim.item.ALBIN_BANE,
            invaderXim.item.AMAR_CLUSTER,
            invaderXim.item.HYDROCERA,
            invaderXim.item.MANTOPTERA_EYE,
            invaderXim.item.EXPEDITIOUS_PINION,
            invaderXim.item.PEMPHREDO_TATHLUM,
            invaderXim.item.ELIS_TOME,
        },
            -- BOWS
        {
            invaderXim.item.NIBIRU_BOW,
            invaderXim.item.VIJAYA_BOW,
            invaderXim.item.TELLER,
            invaderXim.item.STEINTHOR,
        },
            -- GUNS
        {
            invaderXim.item.NIBIRU_GUN,
            invaderXim.item.COMPENSATOR,
            invaderXim.item.WOCHOWSEN,
            invaderXim.item.HOLLIDAY,
            invaderXim.item.MOLYBDOSIS,
        },
            -- SHIELDS
        {
            invaderXim.item.NIBIRU_SHIELD,
            invaderXim.item.GENMEI_SHIELD,
        },
            -- INSTRUMENTS
        {
            invaderXim.item.NIBIRU_HARP,
        },
            -- GRIPS
        {
            invaderXim.item.CLEMENCY_GRIP,
            invaderXim.item.WILLPOWER_GRIP,
            invaderXim.item.FOREFATHERS_GRIP,
            invaderXim.item.GIUOCO_GRIP,
            invaderXim.item.BALARAMA_GRIP,
            invaderXim.item.NIOBID_STRAP,
            invaderXim.item.POTENT_GRIP,
            invaderXim.item.THRACE_STRAP,
            invaderXim.item.ALBER_STRAP,
        },
            -- HEADGEAR
        {
            invaderXim.item.ESCHITE_HELM,
            invaderXim.item.PSYCLOTH_TIARA,
            invaderXim.item.RAWHIDE_MASK,
            invaderXim.item.DESPAIR_HELM,
            invaderXim.item.VANYA_HOOD,
            invaderXim.item.PURSUERS_BERET,
            invaderXim.item.NAGA_SOMEN,
            invaderXim.item.SKORMOTH_MASK,
            invaderXim.item.ODYSSEAN_HELM,
            invaderXim.item.VALOROUS_MASK,
            invaderXim.item.HERCULEAN_HELM,
            invaderXim.item.MERLINIC_HOOD,
            invaderXim.item.CHIRONIC_HAT,
            invaderXim.item.IPOCA_BERET,
            invaderXim.item.YNGLINGA_SALLET,
            invaderXim.item.GENMEI_KABUTO,
        },
            -- CHEST ARMOR
        {
            invaderXim.item.ESCHITE_BREASTPLATE,
            invaderXim.item.PSYCLOTH_VEST,
            invaderXim.item.RAWHIDE_VEST,
            invaderXim.item.DESPAIR_MAIL,
            invaderXim.item.VANYA_ROBE,
            invaderXim.item.PURSUERS_DOUBLET,
            invaderXim.item.NAGA_SAMUE,
            invaderXim.item.SWELLERS_HARNESS,
            invaderXim.item.ONCA_SUIT,
            invaderXim.item.KUBIRA_MEIKOGAI,
            invaderXim.item.ANNOINTED_KALASIRIS,
            invaderXim.item.MAKORA_MEIKOGAI,
            invaderXim.item.ENFORCERS_HARNESS,
            invaderXim.item.UAC_JERKIN,
            invaderXim.item.SHANGO_ROBE,
            invaderXim.item.ABNOBA_KAFTAN,
            invaderXim.item.ODYSSEAN_CHESTPLATE,
            invaderXim.item.VALOROUS_MAIL,
            invaderXim.item.HERCULEAN_VEST,
            invaderXim.item.MERLINIC_JUBBAH,
            invaderXim.item.CHIRONIC_DOUBLET,
            invaderXim.item.VEDIC_COAT,
            invaderXim.item.NZINGHA_CUIRASS,
            invaderXim.item.SAYADIOS_KAFTAN,
            invaderXim.item.ZENDIK_ROBE,
            invaderXim.item.REIKI_OSODE,
        },
            -- GLOVES AND GAUNTLETS
        {
            invaderXim.item.NAGA_TEKKO,
            invaderXim.item.ESCHITE_GAUNTLETS,
            invaderXim.item.PSYCLOTH_MANILLAS,
            invaderXim.item.RAWHIDE_GLOVES,
            invaderXim.item.DESPAIR_FINGER_GLOVES,
            invaderXim.item.VANYA_CUFFS,
            invaderXim.item.PURSUERS_CUFFS,
            invaderXim.item.SHRIEKERS_CUFFS,
            invaderXim.item.KURYS_GLOVES,
            invaderXim.item.ODYSSEAN_GAUNTLETS,
            invaderXim.item.VALOROUS_MITTS,
            invaderXim.item.HERCULEAN_GLOVES,
            invaderXim.item.MERLINIC_DASTANAS,
            invaderXim.item.CHIRONIC_GLOVES,
            invaderXim.item.COMPOSERS_MITTS,
            invaderXim.item.MRIGAVYADHA_GLOVES,
            invaderXim.item.IKTOMI_DASTANAS,
            invaderXim.item.KOBO_KOTE,
        },
            -- LEG ARMOR
        {
            invaderXim.item.NAGA_HAKAMA,
            invaderXim.item.ESCHITE_CUISSES,
            invaderXim.item.PSYCLOTH_LAPPAS,
            invaderXim.item.RAWHIDE_TROUSERS,
            invaderXim.item.DESPAIR_CUISSES,
            invaderXim.item.VANYA_SLOPS,
            invaderXim.item.PURSUERS_PANTS,
            invaderXim.item.DOYEN_PANTS,
            invaderXim.item.OBATALA_SUBLIGAR,
            invaderXim.item.SELVANS_SUBLIGAR,
            invaderXim.item.ODYSSEAN_CUISSES,
            invaderXim.item.VALOROUS_HOSE,
            invaderXim.item.HERCULEAN_TROUSERS,
            invaderXim.item.MERLINIC_SHALWAR,
            invaderXim.item.CHIRONIC_HOSE,
            invaderXim.item.ARJUNA_BREECHES,
            invaderXim.item.JOKUSHU_HAIDATE,
        },
            -- BOOTS AND GREAVES
        {
            invaderXim.item.PURSUERS_GAITERS,
            invaderXim.item.NAGA_KYAHAN,
            invaderXim.item.ESCHITE_GREAVES,
            invaderXim.item.PSYCLOTH_BOOTS,
            invaderXim.item.RAWHIDE_BOOTS,
            invaderXim.item.DESPAIR_GREAVES,
            invaderXim.item.VANYA_CLOGS,
            invaderXim.item.INSPIRITED_BOOTS,
            invaderXim.item.TUTYR_SABOTS,
            invaderXim.item.ODYSSEAN_GREAVES,
            invaderXim.item.VALOROUS_GREAVES,
            invaderXim.item.HERCULEAN_BOOTS,
            invaderXim.item.MERLINIC_CRACKOWS,
            invaderXim.item.CHIRONIC_SLIPPERS,
            invaderXim.item.COMPOSERS_SABOTS,
            invaderXim.item.AHOSI_LEGGINGS,
            invaderXim.item.SKAOI_BOOTS,
            invaderXim.item.NAVON_CRACKOWS,
            invaderXim.item.SHUKUYU_SUNE_ATE,
        },
            -- NECK PIECES
        {
            invaderXim.item.MARKED_GORGET,
            invaderXim.item.SUBTLETY_SPECTACLES,
            invaderXim.item.DAMPENERS_TORQUE,
            invaderXim.item.EMPATH_NECKLACE,
            invaderXim.item.RETI_PENDANT,
            invaderXim.item.DIEMER_GORGET,
            invaderXim.item.CARO_NECKLACE,
            invaderXim.item.NODENS_GORGET,
            invaderXim.item.CLOTHARIUS_TORQUE,
            invaderXim.item.DEINO_COLLAR,
            invaderXim.item.HOMERIC_GORGET,
            invaderXim.item.AINIA_COLLAR,
            invaderXim.item.JOKUSHU_CHAIN,
        },
            -- EARRINGS
        {
            invaderXim.item.MENDICANTS_EARRING,
            invaderXim.item.INFUSED_EARRING,
            invaderXim.item.CALAMITOUS_EARRING,
            invaderXim.item.HERMETIC_EARRING,
            invaderXim.item.HALASZ_EARRING,
            invaderXim.item.ASSUAGE_EARRING,
            invaderXim.item.ISHVARA_EARRING,
            invaderXim.item.EVANS_EARRING,
            invaderXim.item.LEMPO_EARRING,
            invaderXim.item.THUREOUS_EARRING,
            invaderXim.item.DIGNITARYS_EARRING,
            invaderXim.item.TELOS_EARRING,
            invaderXim.item.GENMEI_EARRING,
        },
            -- BELTS AND SASHES
        {
            invaderXim.item.LUCIDITY_SASH,
            invaderXim.item.SINEW_BELT,
            invaderXim.item.ESCHAN_STONE,
            invaderXim.item.GRUNFELD_ROPE,
            invaderXim.item.POROUS_ROPE,
            invaderXim.item.SULLA_BELT,
            invaderXim.item.YEMAYA_BELT,
            invaderXim.item.CHANNELERS_STONE,
            invaderXim.item.ASKLEPIAN_BELT,
            invaderXim.item.SARISSAPHOROI_BELT,
            invaderXim.item.LUMINARY_SASH,
            invaderXim.item.KERYGMA_BELT,
            invaderXim.item.REIKI_YOTAI,
            invaderXim.item.KOBO_OBI,
        },
            -- RINGS
        {
            invaderXim.item.OVERBEARING_RING,
            invaderXim.item.RESONANCE_RING,
            invaderXim.item.PURITY_RING,
            invaderXim.item.WARDENS_RING,
            invaderXim.item.PETROV_RING,
            invaderXim.item.FORTIFIED_RING,
            invaderXim.item.VERTIGO_RING,
            invaderXim.item.EVANESCENCE_RING,
            invaderXim.item.BEGRUDGING_RING,
            invaderXim.item.APATE_RING,
            invaderXim.item.PERSIS_RING,
            invaderXim.item.HETAIROI_RING,
            invaderXim.item.SHUKUYU_RING,
            invaderXim.item.RAHAB_RING,
        },
            -- CAPES AND CLOAKS
        {
            invaderXim.item.DISPERSERS_CAPE,
            invaderXim.item.THAUMATURGES_CAPE,
            invaderXim.item.PENETRATING_CAPE,
            invaderXim.item.PHILIDOR_MANTLE,
            invaderXim.item.SOKOLSKI_MANTLE,
            invaderXim.item.QUARREL_MANTLE,
            invaderXim.item.XUCAU_MANTLE,
            invaderXim.item.TANTALIC_CAPE,
            invaderXim.item.SCINTILLATING_CAPE,
            invaderXim.item.PHALANGITE_MANTLE,
            invaderXim.item.PERIMEDE_CAPE,
            invaderXim.item.AGEMA_CAPE,
            invaderXim.item.ENUMA_MANTLE,
            invaderXim.item.REIKI_CLOAK,
        },
            -- OTHER
        {
            invaderXim.item.SEKI_SHURIKEN_POUCH,
        },
    },

    -- Kupon A-OmII: Body pieces from Omen bosses (MOG_KUPON_A_OMII = 9169)
    [59] =
    {
        invaderXim.item.DAGON_BREASTPLATE,
        invaderXim.item.ASHERA_HARNESS,
        invaderXim.item.SHAMASH_ROBE,
        invaderXim.item.UDUG_JACKET,
        invaderXim.item.NISHROCH_JERKIN,
    },

    -- Kupon I-AF119: Scale needed for the Reforged Artifact Armor +3 process (MOG_KUPON_I_AF119 = 9170)
    [60] =
    {
        invaderXim.item.KINS_SCALE,
        invaderXim.item.GINS_SCALE,
        invaderXim.item.KEIS_SCALE,
        invaderXim.item.KYOUS_SCALE,
        invaderXim.item.FUS_SCALE,
    },

    -- Kupon AW-Om: Equipment pieces from Omen mid-bosses (MOG_KUPON_AW_OM = 9171)
    [61] =
    {
        invaderXim.item.ENKI_STRAP,
        invaderXim.item.KNOBKIERRIE,
        invaderXim.item.ADAD_AMULET,
        invaderXim.item.ANU_TORQUE,
        invaderXim.item.ERRA_PENDANT,
        invaderXim.item.SHERIDA_EARRING,
        invaderXim.item.KISHAR_RING,
        invaderXim.item.ADAPA_SHIELD,
        invaderXim.item.NUSKU_SHIELD,
    },

    -- Kupon W-RMEA: iLevel 119 III Relic, Mythic, Empyrean or Aeonic Weapon (MOG_KUPON_W_RMEA = 9879)
    [62] =
    -- TODO: Implement and Apply Rank Augments
    {
            -- Relic
        {
            invaderXim.item.SPHARAI_119_III,
            invaderXim.item.MANDAU_119_III,
            invaderXim.item.EXCALIBUR_119_III,
            invaderXim.item.RAGNAROK_119_III,
            invaderXim.item.GUTTLER_119_III,
            invaderXim.item.BRAVURA_119_III,
            invaderXim.item.APOCALYPSE_119_III,
            invaderXim.item.GUNGNIR_119_III,
            invaderXim.item.KIKOKU_119_III,
            invaderXim.item.AMANOMURAKUMO_119_III,
            invaderXim.item.MJOLLNIR_119_III,
            invaderXim.item.CLAUSTRUM_119_III,
            { invaderXim.item.YOICHINOYUMI_119_III_NO_QUIVER,  invaderXim.item.YOICHIS_QUIVER             },
            { invaderXim.item.ANNIHILATOR_119_III_NO_QUIVER,   invaderXim.item.ERADICATING_BULLET_POUCH   },
        },
            -- Mythic
        {
            invaderXim.item.GLANZFAUST_119_III,
            invaderXim.item.KENKONKEN_119_III,
            invaderXim.item.VAJRA_119_III,
            invaderXim.item.CARNWENHAN_119_III,
            invaderXim.item.TERPSICHORE_119_III,
            invaderXim.item.MURGLEIS_119_III,
            invaderXim.item.BURTGANG_119_III,
            invaderXim.item.TIZONA_119_III,
            invaderXim.item.AYMUR_119_III,
            invaderXim.item.CONQUEROR_119_III,
            invaderXim.item.LIBERATOR_119_III,
            invaderXim.item.RYUNOHIGE_119_III,
            invaderXim.item.NAGI_119_III,
            invaderXim.item.KOGARASUMARU_119_III,
            invaderXim.item.YAGRUSH_119_III,
            invaderXim.item.LAEVATEINN_119_III,
            invaderXim.item.NIRVANA_119_III,
            invaderXim.item.TUPSIMATI_119_III,
            { invaderXim.item.GASTRAPHETES_119_III_NO_QUIVER,  invaderXim.item.QUELLING_BOLT_QUIVER   },
            { invaderXim.item.DEATH_PENALTY_119_III_NO_QUIVER, invaderXim.item.LIVING_BULLET_POUCH    },
        },
            -- Empyrean
        {
            invaderXim.item.VERETHRAGNA_119_III,
            invaderXim.item.TWASHTAR_119_III,
            invaderXim.item.ALMACE_119_III,
            invaderXim.item.CALADBOLG_119_III,
            invaderXim.item.FARSHA_119_III,
            invaderXim.item.UKONVASARA_119_III,
            invaderXim.item.REDEMPTION_119_III,
            invaderXim.item.RHONGOMIANT_119_III,
            invaderXim.item.KANNAGI_119_III,
            invaderXim.item.MASAMUNE_119_III,
            invaderXim.item.GAMBANTEINN_119_III,
            invaderXim.item.HVERGELMIR_119_III,
            { invaderXim.item.GANDIVA_119_III_NO_QUIVER,       invaderXim.item.ARTEMISS_QUIVER            },
            { invaderXim.item.ARMAGEDDON_119_III_NO_QUIVER,    invaderXim.item.DEVASTATING_BULLET_POUCH   },
        },
            -- Ergon
        {
            invaderXim.item.IDRIS_119_II,
            invaderXim.item.EPEOLATRY_119_II,
        },
            -- Aeonic
        {
            invaderXim.item.GODHANDS,
            invaderXim.item.AENEAS,
            invaderXim.item.SEQUENCE,
            invaderXim.item.LIONHEART,
            invaderXim.item.TRI_EDGE,
            invaderXim.item.CHANGO,
            invaderXim.item.TRISHULA,
            invaderXim.item.ANGUTA,
            invaderXim.item.HEISHI_SHORINKEN,
            invaderXim.item.DOJIKIRI_YASUTSUNA,
            invaderXim.item.TISHTRYA,
            invaderXim.item.KHATVANGA,
            { invaderXim.item.FAIL_NOT_NO_QUIVER,              invaderXim.item.CHRONO_QUIVER          },
            { invaderXim.item.FOMALHAUT_NO_QUIVER,             invaderXim.item.CHRONO_BULLET_POUCH    },
            invaderXim.item.SRIVATSA,
            invaderXim.item.MARSYAS,
        },
    }
}

local countKeyItems = function(player)
    local count = 0
    for _, v in pairs (kuponLookup) do
        local ki = v[1]
        if player:hasKeyItem(ki) then
            count = count + 1
        end
    end

    return count
end

local listToKeyItem = function(listID)
    for k, v in pairs (kuponLookup) do
        if v[2] == listID then
            return v[1]
        end
    end

    return nil
end

local buildMask = function(player, shift)
    local mask = 0
    local kiID = 0
    for k, v in pairs (kuponLookup) do
        if shift == 2 then
            if v[2] >= 32 and v[2] <= 62 then -- Mask 1 contains index 32 -> 62
                if player:hasKeyItem(v[1]) then
                    mask = mask + bit.lshift(shift, v[2])
                    kiID = v[2] -- Store the Key Item Index ID, used if there is only one KI found
                end
            end
        else
            if v[2] >= 1 and v[2] <= 31 then -- Mask 2 contains index 1 -> 31
                if player:hasKeyItem(v[1]) then
                    mask = mask + bit.lshift(shift, v[2])
                    kiID = v[2]
                end
            end
        end
    end

    return { mask, kiID } -- return both the completed mask and the kiID
end

local getIndexParams = function(list, option)
    local idxAlt1  = 0
    local idxAlt2  = 0
    local keyItems = 0

    if
        list == 12 or                   -- I-Seal
        list == 22 or                   -- AW-WK
        list == 26 or                   -- I-Skill
        (list >= 32 and list <= 34) or  -- AW-Mis / AW-Vgr / AW-VgrII
        (list >= 37 and list <= 41) or  -- AW-GFIII / AW-GFII / AW-GF / AW-UWIII / AW-UWII
        list == 44 or                   -- AW-Cos
        list == 47 or                   -- A-EMI
        list == 50 or                   -- A-SYW
        list == 53 or                   -- A-ASYW
        list == 58 or                   -- AW-GeIV
        list == 62                      -- W-RMEA
    then
        idxAlt1 = bit.rshift(option, 24)                -- Submenu ID
        idxAlt2 = bit.band(bit.rshift(option, 8), 0xFF) -- Item ID

        if list == 12 then
            idxAlt1 = bit.band(bit.rshift(option, 16), 0xFF)
        end
    end

    if list == 19 then -- List has keyitems
        keyItems = 1
    end

    return { idxAlt1, idxAlt2, keyItems }
end

local getItemSelection = function(player, list, idx, idxAlt1, idxAlt2)
    local item = 0

    if
        list == 12 or                   -- I-Seal
        list == 22 or                   -- AW-WK
        list == 26 or                   -- I-Skill
        (list >= 32 and list <= 34) or  -- AW-Mis / AW-Vgr / AW-VgrII
        (list >= 37 and list <= 41) or  -- AW-GFIII / AW-GFII / AW-GF / AW-UWIII / AW-UWII
        list == 47 or                   -- A-EMI
        list == 50 or                   -- A-SYW
        list == 53 or                   -- A-ASYW
        list == 58 or                   -- AW-GeIV
        list == 62                      -- W-RMEA
    then
        if debug.ENABLED and not debug.SHOWITEM then
            item = 0
        else
            --- TODO: Find better way to determine behavior based on list type.
            ---@diagnostic disable-next-line: cast-local-type
            item = itemList[list][idxAlt1][idxAlt2]
        end

        if list == 12 then  -- Item, Quantity
            --- TODO: Find better way to determine behavior based on list type.
            ---@diagnostic disable-next-line: cast-local-type
            item = item
        end
    elseif
        list == 44 -- AW-Cos (Index Defaults to Female itemID, CS will automatically swap items based on gender)
    then
        local gender    = player:getGender()                        -- Female: 0, Male: 1
        local itemID    = itemList[list][idxAlt1][idxAlt2][1]       -- Extract the base itemID (F) from the index
        local modifier  = itemList[list][idxAlt1][idxAlt2][2] or 0  -- Extract the base shift value from the index (typically 1 or 2)

        item = itemID - (gender * modifier) -- Generate the actual itemID by subtracting the shift value from the base itemID
    else
        --- TODO: Find better way to determine behavior based on list type.
        ---@diagnostic disable-next-line: cast-local-type
        item = itemList[list][idx]
    end

    return { item }
end

local debugInfo = function(player, items, list, option, altIDs, idx)
    local ID        = zones[player:getZoneID()]
    local idxAlt1   = altIDs[1]
    local idxAlt2   = altIDs[2]
    local keyitem   = altIDs[3]

    if debug.SHOWITEM then
        if keyitem == 0 then
            player:messageSpecial(ID.text.ITEM_OBTAINED, items[1])
        else
            player:messageSpecial(ID.text.KEYITEM_OBTAINED, items[1])
        end
    end

    if debug.TO_PLAYER then
        player:printToPlayer(string.format('DEBUG: list: %u, idx: %u, submenuid %u, slot: %u', list, idx, idxAlt1, idxAlt2), invaderXim.msg.channel.SYSTEM_3)
    else
        print(string.format('DEBUG: list: %u, idx: %u, submenuid %u, slot: %u', list, idx, idxAlt1, idxAlt2))
    end
end

invaderXim.dealerMoogle.onTrade = function(player, npc, trade)
    local itemID = trade:getItemId()
    if trade:getItemCount() > 1 then
        return -- Prevent accidental trade of stacks (first vana'diel problems, kupo!)
    end

    if not kuponLookup[itemID] then
        return
    end

    local zoneID = player:getZoneID()
    local csid   = csidLookup[zoneID][2]
    local kiID   = kuponLookup[itemID][1]
    local listID = kuponLookup[itemID][2]

    -- Trade Item (itemID) will only be consumed if the player does not yet have the corresponding KI. It will be replaced with a
    -- key item version! No need to tell the player, the CS handles all of the messaging. If the Player already has the Key Item,
    -- the itemID will not be consumed, but the Key Item will only be consumed upon completing a successful transaction.

    -- Scenario 1:  Player trades the item, but does NOT already have the corresponding Key Item. The trade is consumed. Player will
    --              either receive the item(s) of their choice or they will receive the corresponding Key Item if they back out of
    --              the menu without completing a transaction. In actuality, the Key Item is added silently as soon as the trade
    --              occurs, and deleted only if the player completes the transaction. This is to prevent the player from losing
    --              access to the reward in the event of a disconnect mid-transaction.

    -- Scenario 2:  Player trades the item and DOES already have the corresponding Key Item. The CS menu will present as if the player
    --              triggered the dealer while in posession of the Key Item. If the player completes the transaction, they will receive
    --              the item(s) of their choice, the Key Item will be consumed, the traded item will not be consumed. If the player does
    --              not complete the transaction, they will retain both the traded Item and Key Item.

    if player:hasItem(itemID) then
        if player:hasKeyItem(kiID) then -- Player already has the KI for the traded item. Present the KI version of the CS, consume the KI only if transaction completes.
            player:startEvent(csid, itemID, kiID, listID, 1)
        else -- Player doesn't have the KI corresponding to the item. Consume the item on trade and convert to Key Item immediately.
            trade:confirmItem(itemID, 1)
            player:confirmTrade()
            player:addKeyItem(kiID)

            player:startEvent(csid, itemID, kiID, listID)
        end
    end
end

invaderXim.dealerMoogle.onTrigger = function(player, npc)
    local zoneID = player:getZoneID()
    local cs     = csidLookup[zoneID][2]
    local numKIs = countKeyItems(player)
    local mask1  = buildMask(player, 2)[1]
    local mask2  = buildMask(player, 1)[1]
    local kiID   = buildMask(player, 2)[2] + buildMask(player, 1)[2]

    if numKIs < 1 then -- play default CS if no KIs found
        cs = csidLookup[zoneID][1]
    end

    -- Capture of multiple stored KIs: CS2: 0, 0, 51, 4, 0, 0, 1843200, 0

    player:startEvent(cs, 0, 0, kiID, numKIs, 0, 0, mask1, mask2)
end

invaderXim.dealerMoogle.onEventUpdate = function(player, csid, option, npc)
    -- print('update', csid, option)
end

invaderXim.dealerMoogle.onEventFinish = function(player, csid, option, npc)
    -- print('finish', csid, option)
    if option == 0 then
        return
    end

    local zoneID = player:getZoneID()
    local itemCsid = csidLookup[zoneID][2]

    if csid == itemCsid then
        local list      = bit.band(option, 0xFF)
        local idx       = bit.rshift(option, 8)
        local altIDs    = getIndexParams(list, option)
        local idxAlt1   = altIDs[1]
        local idxAlt2   = altIDs[2]
        local keyItems  = altIDs[3]

        if list > 0 and idx == 0 then
            player:addKeyItem(listToKeyItem(list))
        elseif list > 0 and idx > 0 then
            local items = getItemSelection(player, list, idx, idxAlt1, idxAlt2)

            if
                debug.ENABLED and
                #items > 0
            then
                debugInfo(player, items, list, option, altIDs, idx)
            else
                if keyItems == 0 then
                    if npcUtil.giveItem(player, items) then
                        player:delKeyItem(listToKeyItem(list))
                    else
                        -- TODO: CS Messaging that getting the item has failed
                    end
                else
                    if not player:hasKeyItem(items) then
                        -- TODO: Refactor this so that we can more clearly define KI vs Item
                        ---@diagnostic disable-next-line: param-type-mismatch
                        npcUtil.giveKeyItem(player, items)
                        player:delKeyItem(listToKeyItem(list))
                    elseif #items > 0 then
                        player:messageBasic(invaderXim.msg.basic.ALREADY_HAVE_KEY_ITEM, 0, items[1])
                        -- TODO: CS Messaging that getting the item has failed
                    end
                end
            end
        end
    end
end
