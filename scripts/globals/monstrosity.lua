-----------------------------------
-- Monstrosity (MON)
--
-- === How does it work? ===
--
-- Monstrosity is enabled through two mechanisms: setting your job to JOB_MON (23) and zoning.
-- Currently, there are some details that seemingly can only be populated at zone-time, so switching in/out
-- of MON mode is reliant on zoning.
--
-- When you zone your job will be checked, and if it is JOB_MON, then PChar->m_PMonstrosity will get
-- populated with your relevant Monstrosity data from table defined in char_monstrosity.sql. If you don't have
-- this information yet, it'll be created and saved for you with the defaults (the starting 3 MONs and the basic instincts).
--
-- Most other logic for determining stats, exp, exp ranges, traits, etc. will check you are either JOB_MON
-- or have m_PMonstrosity populated, and then look up what main/sub job your current species is, and then
-- forward that information into the relevant code for working out stats, etc.
--
-- IT IS VITAL that m_PMonstrosity is managed correctly, or that it's existance is constantly checked.
--
-- There is _a lot_ of client-side validation for MON, but we have all the information available server-side,
-- so we make sure to validate everything that comes through the zone_in and MON equip packets. It's also important
-- to validate all things for MON, because if they're invalid the client will get stuck in a state where they can't change
-- jobs, species, instincts, or names without GM intervention.
--
-- MONs main and subjob are in lock-step, so if you are a MNK15/NIN, the NIN will also be Lv15, and you'll get all the abilities,
-- traits, and stat contributions (TODO?) from both - except for the 2H which comes from the main job.
-----------------------------------
require('scripts/globals/npc_util')
require('scripts/globals/quests')
-----------------------------------
xi = xi or {}
invaderXim.monstrosity = invaderXim.monstrosity or {}

-----------------------------------
-- Enums
-----------------------------------

invaderXim.monstrosity.species =
{
    RABBIT    = 1,
    BEHEMOTH  = 2,
    TIGER     = 3,
    SHEEP     = 4,
    RAM       = 5,
    DHALMEL   = 6,
    COEURL    = 7,
    OPO_OPO   = 8,
    MANTICORE = 9,
    BUFFALO   = 10,
    MARID     = 11,
    CERBERUS  = 12,
    GNOLE     = 13,

    FUNGUAR        = 15,
    TREANT_SAPLING = 16,
    MORBOL         = 17,
    MANDRAGORA     = 18,
    SABOTENDER     = 19,
    FLYTRAP        = 20,
    GOOBBUE        = 21,
    RAFFLESIA      = 22,
    PANOPT         = 23,

    BEE          = 27,
    BEETLE       = 28,
    CRAWLER      = 29,
    FLY          = 30,
    SCORPION     = 31,
    SPIDER       = 32,
    ANTLION      = 33,
    DIREMITE     = 34,
    CHIGOE       = 35,
    WAMOURACAMPA = 36,
    LADYBUG      = 37,
    GNAT         = 38,

    LIZARD      = 43,
    RAPTOR      = 44,
    ADAMANTOISE = 45,
    BUGARD      = 46,
    EFT         = 47,
    WIVRE       = 48,
    PEISTE      = 49,

    SLIME    = 52,
    HECTEYES = 53,
    FLAN     = 54,
    SLUG     = 56,
    SANDWORM = 57,
    LEECH    = 58,

    CRAB     = 60,
    PUGIL    = 61,
    SEA_MONK = 62,
    URAGNITE = 63,
    OROBON   = 64,
    RUSZOR   = 65,
    TOAD     = 66,

    BIRD       = 69,
    COCKATRICE = 70,
    ROC        = 71,
    BAT        = 72,
    HIPPOGRYPH = 73,
    APKALLU    = 74,
    COLIBRI    = 75,
    AMPHIPTERE = 76,

    ASTOLTIAN_SLIME  = 126,
    EORZEAN_SPRIGGAN = 127,
}

invaderXim.monstrosity.variants =
{
    -- Rabbit
    ONYX_RABBIT      = 0,
    ALABASTER_RABBIT = 1,
    LAPINION         = 2,

    -- Behemoth
    ELASMOTH = 3,

    -- Tiger
    LEGENDARY_TIGER = 5,
    SMILODON        = 6,

    -- Sheep
    KARAKUL = 7,

    -- Coeurl
    LYNX = 10,
    COLLARED_LYNX = 11,

    -- Manticore
    LEGENDARY_MANTICORE = 12,

    -- Cerberus
    ORTHRUS = 13,

    -- Gnole
    BIPEDAL_GNOLE = 14,

    -- Funguar
    COPPERCAP = 15,

    -- Treant Sapling
    TREANT                = 16,
    FLOWERING_TREANT      = 17,
    SCARLET_TINGED_TREANT = 18,
    BARREN_TREANT         = 19,
    NECKLACED_TREANT      = 20,

    -- Morbol
    PYGMY_MORBOL = 21,
    SCARE_MORBOL = 22,
    AMERETAT     = 23,
    PURBOL       = 24,

    -- Mandragora
    KORRIGAN               = 25,
    LYCOPODIUM             = 26,
    PYGMY_MANDRAGORA       = 27,
    ADENIUM                = 28,
    PACHYPODIUM            = 29,
    ENLIGHTENED_MANDRAGORA = 30,
    NEW_YEAR_MANDRAGORA    = 31,

    -- Sabotender
    SABOTENDER_FLORIDO = 32,

    -- Rafflesia
    MITRASTEMA = 33,

    -- Bee
    VERMILLION_AND_ONYX_BEE = 34,
    ZAFFRE_BEE              = 35,

    -- Beetle
    ONYX_BEETLE    = 36,
    GAMBOGE_BEETLE = 37,

    -- Crawler
    ERUCA                 = 38,
    EMERALD_CRAWLER       = 39,
    PYGMY_EMERALD_CRAWLER = 40,

    -- Fly
    VERMILLION_FLY = 41,

    -- Scorpion
    SCOLOPENDRID         = 42,
    UNUSUAL_SCOLOPENDRID = 43,

    -- Spider
    RETICULATED_SPIDER         = 44,
    VERMILLION_AND_ONYX_SPIDER = 45,

    -- Antlion
    ONYX_ANTLION = 46,
    FORMICEROS   = 47,

    -- Diremite
    ARUNDIMITE = 48,

    -- Chigoe
    AZURE_CHIGOE = 49,

    -- Wamouracampa
    COILED_WAMOURACAMPA = 50,

    -- Wamoura
    WAMOURA       = 51,
    CORAL_WAMOURA = 52,

    -- Ladybug
    GOLD_LADYBUG = 53,

    -- Gnat
    MIDGE = 54,

    -- Lizard
    ASHEN_LIZARD = 59,

    -- Raptor
    EMERALD_RAPTOR    = 60,
    VERMILLION_RAPTOR = 61,

    -- Adamantoise
    PYGMY_ADAMANTOISE     = 62,
    LEGENDARY_ADAMANTOISE = 63,
    FERROMANTOISE         = 64,

    -- Bugard
    ABYSSOBUGARD = 65,

    -- Eft
    TARICHUK = 66,

    -- Wivre
    UNUSUAL_WIVRE = 67,

    -- Peiste
    SIBILUS = 68,

    -- Slime
    CLOT       = 73,
    GOLD_SLIME = 74,
    BOIL       = 75,

    -- Flan
    GOLD_FLAN  = 76,
    BLANCMANGE = 77,

    -- Sandworm
    PYGMY_SANDWORM = 78,
    GIGAWORM       = 79,

    -- Leech
    AZURE_LEECH = 80,
    OBDELLA     = 81,

    -- Crab
    VERMILLION_CRAB                 = 84,
    BASKET_BURDENED_CRAB            = 85,
    VERMILLION_BASKET_BURDENED_CRAB = 86,
    PORTER_CRAB                     = 87,

    -- Pugil
    JAGIL = 88,

    -- Sea Monk
    AZURE_SEA_MONK = 89,

    -- Uragnite
    LIMASCABRA = 90,

    -- Orobon
    PYGMY_OROBON = 91,
    OGREBON      = 92,

    -- Toad
    AZURE_TOAD      = 93,
    VERMILLION_TOAD = 94,

    -- Bird
    ONYX_BIRD = 95,

    -- Cockatrice
    ZIZ = 96,

    -- Roc
    LEGENDARY_ROC = 97,
    GAGANA        = 98,

    -- Bat
    BATS            = 99,
    VERMILLION_BAT  = 100,
    VERMILLION_BATS = 101,

    -- Apkallu
    INGUZA = 102,

    -- Colibri
    TOUCALIBRI = 103,

    -- Amphiptere
    SANGUIPTERE = 104,

    -- Slime
    SHE_SLIME   = 252,
    METAL_SLIME = 253,

    -- Spriggan
    SPRIGGAN_C = 254,
    SPRIGGAN_G = 255,
}

invaderXim.monstrosity.purchasableInstincts =
{
    -- Default (0x1F)
    HUME_I   = 0,
    ELVAAN_I = 1,
    TARU_I   = 2,
    MITHRA_I = 3,
    GALKA_I  = 4,

    HUME_II   = 5,
    ELVAAN_II = 6,
    TARU_II   = 7,
    MITHRA_II = 8,
    GALKA_II  = 9,

    WAR = 10,
    MNK = 11,
    WHM = 12,
    BLM = 13,
    RDM = 14,
    THF = 15,
    PLD = 16,
    DRK = 17,
    BST = 18,
    BRD = 19,
    RNG = 20,
    SAM = 21,
    NIN = 22,
    DRG = 23,
    SMN = 24,
    BLU = 25,
    COR = 26,
    PUP = 27,
    DNC = 28,
    SCH = 29,
    GEO = 30,
    RUN = 31,
}

local limitBreakQuests =
{
    [invaderXim.job.BLU] = { invaderXim.questLog.AHT_URHGAN,  invaderXim.quest.id.ahtUrhgan.THE_BEAST_WITHIN           },
    [invaderXim.job.COR] = { invaderXim.questLog.AHT_URHGAN,  invaderXim.quest.id.ahtUrhgan.BREAKING_THE_BONDS_OF_FATE },
    [invaderXim.job.PUP] = { invaderXim.questLog.BASTOK,      invaderXim.quest.id.bastok.ACHIEVING_TRUE_POWER          },
    [invaderXim.job.DNC] = { invaderXim.questLog.JEUNO,       invaderXim.quest.id.jeuno.A_FURIOUS_FINALE               },
    [invaderXim.job.SCH] = { invaderXim.questLog.OTHER_AREAS, invaderXim.quest.id.otherAreas.SURVIVAL_OF_THE_WISEST    },
    [invaderXim.job.GEO] = { invaderXim.questLog.ADOULIN,     invaderXim.quest.id.adoulin.ELEMENTARY_MY_DEAR_SYLVIE    },
    [invaderXim.job.RUN] = { invaderXim.questLog.ADOULIN,     invaderXim.quest.id.adoulin.ENDEAVORING_TO_AWAKEN        },
}

-- NOTE: Cost and granted species/variant are hardcoded into Terynon's event; however, the requirements
-- to get each of these purchasable MONs is not displayed, and can be modified to a different set or
-- level.  The requirements are limited to species!
local terynonMonData =
{
    [0] = -- Beasts
    {
        [0] =
        {
            monVariant   = invaderXim.monstrosity.variants.LAPINION,
            infamyCost   = 7500,
            requirements =
            {
                { invaderXim.monstrosity.species.RABBIT, 90 },
            },
        },

        [1] =
        {
            monSpecies = invaderXim.monstrosity.species.SHEEP,
            infamyCost = 3000,
        },

        [2] =
        {
            monSpecies   = invaderXim.monstrosity.species.BEHEMOTH,
            infamyCost   = 10000,
            requirements =
            {
                { invaderXim.monstrosity.species.RABBIT,  75 },
                { invaderXim.monstrosity.species.OPO_OPO, 75 },
                { invaderXim.monstrosity.species.GNOLE,   75 },
            },
        },

        [3] =
        {
            monVariant   = invaderXim.monstrosity.variants.ELASMOTH,
            infamyCost   = 25000,
            requirements =
            {
                { invaderXim.monstrosity.species.BEHEMOTH, 50 },
            },
        },

        [4] =
        {
            monSpecies   = invaderXim.monstrosity.species.CERBERUS,
            infamyCost   = 10000,
            requirements =
            {
                { invaderXim.monstrosity.species.BUFFALO,   60 },
                { invaderXim.monstrosity.species.MANTICORE, 60 },
                { invaderXim.monstrosity.species.MARID,     60 },
                { invaderXim.monstrosity.species.SHEEP,     60 },
                { invaderXim.monstrosity.species.DHALMEL,   60 },
            },
        },

        [5] =
        {
            monVariant   = invaderXim.monstrosity.variants.ORTHRUS,
            infamyCost   = 25000,
            requirements =
            {
                { invaderXim.monstrosity.species.CERBERUS, 50 },
            },
        },
    },

    [1] = -- Plantoids
    {
        [0] =
        {
            monVariant   = invaderXim.monstrosity.variants.PYGMY_MANDRAGORA,
            infamyCost   = 7500,
            requirements =
            {
                { invaderXim.monstrosity.species.MANDRAGORA, 45 },
            },
        },

        [1] =
        {
            monSpecies = invaderXim.monstrosity.species.TREANT,
            infamyCost = 3000,
        },

        [2] =
        {
            monVariant   = invaderXim.monstrosity.variants.PYGMY_MORBOL,
            infamyCost   = 7500,
            requirements =
            {
                { invaderXim.monstrosity.species.MORBOL, 1 },
            },
        },

        [3] =
        {
            monVariant   = invaderXim.monstrosity.variants.PURBOL,
            infamyCost   = 15000,
            requirements =
            {
                { invaderXim.monstrosity.species.MORBOL, 75 },
            },
        },
    },

    [2] = -- Vermin
    {
        [0] =
        {
            monVariant   = invaderXim.monstrosity.variants.GOLD_LADYBUG,
            infamyCost   = 7500,
            requirements =
            {
                { invaderXim.monstrosity.species.LADYBUG, 50 },
            },
        },

        [1] =
        {
            monSpecies = invaderXim.monstrosity.species.BEETLE,
            infamyCost = 3000,
        },

        [2] =
        {
            monVariant   = invaderXim.monstrosity.variants.UNUSUAL_SCOLOPENDRID,
            infamyCost   = 10000,
            requirements =
            {
                { invaderXim.monstrosity.species.SCORPION, 60 },
            },
        },

        [3] =
        {
            monSpecies   = invaderXim.monstrosity.species.ANTLION,
            infamyCost   = 7500,
            requirements =
            {
                { invaderXim.monstrosity.species.SCORPION, 60 },
            },
        },

        [4] =
        {
            monVariant   = invaderXim.monstrosity.variants.FORMICEROS,
            infamyCost   = 15000,
            requirements =
            {
                { invaderXim.monstrosity.species.ANTLION, 60 },
            },
        },

        [5] =
        {
            monVariant   = invaderXim.monstrosity.variants.PYGMY_EMERALD_CRAWLER,
            infamyCost   = 6000,
            requirements =
            {
                { invaderXim.monstrosity.species.CRAWLER, 60 },
            },
        },

        [6] =
        {
            monVariant   = invaderXim.monstrosity.variants.CORAL_WAMOURA,
            infamyCost   = 15000,
            requirements =
            {
                { invaderXim.monstrosity.species.WAMOURACAMPA, 60 },
            },
        },

        [7] =
        {
            monSpecies   = invaderXim.monstrosity.species.GNAT,
            infamyCost   = 5000,
            requirements =
            {
                { invaderXim.monstrosity.species.LADYBUG,      50 },
                { invaderXim.monstrosity.species.WAMOURACAMPA, 50 },
            },
        },
    },

    [3] = -- Lizards
    {
        [0] =
        {
            monVariant   = invaderXim.monstrosity.species.UNUSUAL_WIVRE,
            infamyCost   = 7500,
            requirements =
            {
                { invaderXim.monstrosity.species.WIVRE, 60 },
            },
        },

        [1] =
        {
            monSpecies   = invaderXim.monstrosity.species.ADAMANTOISE,
            infamyCost   = 10000,
            requirements =
            {
                { invaderXim.monstrosity.species.BUGARD, 60 },
                { invaderXim.monstrosity.species.LIZARD, 60 },
                { invaderXim.monstrosity.species.WIVRE,  60 },
            },
        },

        [2] =
        {
            monVariant   = invaderXim.monstrosity.variants.FERROMANTOISE,
            infamyCost   = 20000,
            requirements =
            {
                { invaderXim.monstrosity.species.ADAMANTOISE, 70 },
            },
        },

        [3] =
        {
            monSpecies = invaderXim.monstrosity.species.RAPTOR,
            infamyCost = 3000,
        },

        [4] =
        {
            monSpecies   = invaderXim.monstrosity.species.PEISTE,
            infamyCost   = 8000,
            requirements =
            {
                { invaderXim.monstrosity.species.EFT,    50 },
                { invaderXim.monstrosity.species.RAPTOR, 50 },
            },
        },

        [5] =
        {
            monVariant   = invaderXim.monstrosity.variants.SIBILUS,
            infamyCost   = 15000,
            requirements =
            {
                { invaderXim.monstrosity.species.PEISTE, 50 },
            },
        },
    },

    [4] = -- Amorphs
    {
        [0] =
        {
            monSpecies = invaderXim.monstrosity.species.SLIME,
            infamyCost = 3000,
        },

        [1] =
        {
            monVariant   = invaderXim.monstrosity.variants.BOIL,
            infamyCost   = 25000,
            requirements =
            {
                { invaderXim.monstrosity.species.SLIME, 50 },
            },
        },

        [2] =
        {
            monVariant   = invaderXim.monstrosity.variants.PYGMY_SANDWORM,
            infamyCost   = 10000,
            requirements =
            {
                { invaderXim.monstrosity.species.SANDWORM, 1 },
            },
        },

        [3] =
        {
            monVariant   = invaderXim.monstrosity.variants.GIGAWORM,
            infamyCost   = 25000,
            requirements =
            {
                { invaderXim.monstrosity.species.SANDWORM, 60 },
            },
        },

        [4] =
        {
            monSpecies = invaderXim.monstrosity.species.LEECH,
            infamyCost = 2000,
        },
    },

    [5] = -- Aquans
    {
        [0] =
        {
            monSpecies = invaderXim.monstrosity.species.CRAB,
            infamyCost = 2000,
        },

        [1] =
        {
            monVariant   = invaderXim.monstrosity.variants.BASKET_BURDENED_CRAB,
            infamyCost   = 20000,
            requirements =
            {
                { invaderXim.monstrosity.species.CRAB, 1 },
            },
        },

        [2] =
        {
            monVariant   = invaderXim.monstrosity.variants.VERMILLION_BASKET_BURDENED_CRAB,
            infamyCost   = 20000,
            requirements =
            {
                { invaderXim.monstrosity.species.CRAB, 15 },
            },
        },

        [3] =
        {
            monVariant   = invaderXim.monstrosity.variants.PORTER_CRAB,
            infamyCost   = 15000,
            requirements =
            {
                { invaderXim.monstrosity.species.CRAB, 60 },
            },
        },

        [4] =
        {
            monSpecies = invaderXim.monstrosity.species.PUGIL,
            infamyCost = 3000,
        },

        [5] =
        {
            monVariant   = invaderXim.monstrosity.variants.LIMASCABRA,
            infamyCost   = 15000,
            requirements =
            {
                { invaderXim.monstrosity.species.URAGNITE, 50 },
            },
        },

        [6] =
        {
            monVariant   = invaderXim.monstrosity.variants.PYGMY_OROBON,
            infamyCost   = 10000,
            requirements =
            {
                { invaderXim.monstrosity.species.OROBON, 1 },
            },
        },

        [7] =
        {
            monVariant   = invaderXim.monstrosity.variants.OGREBON,
            infamyCost   = 18000,
            requirements =
            {
                { invaderXim.monstrosity.species.OROBON, 50 },
            },
        },

        [8] =
        {
            monSpecies   = invaderXim.monstrosity.species.RUSZOR,
            infamyCost   = 10000,
            requirements =
            {
                { invaderXim.monstrosity.species.OROBON,   75 },
                { invaderXim.monstrosity.species.URAGNITE, 75 },
            },
        },
    },

    [6] = -- Birds
    {
        [0] =
        {
            monSpecies = invaderXim.monstrosity.species.COCKATRICE,
            infamyCost = 3000,
        },

        [1] =
        {
            monVariant   = invaderXim.monstrosity.variants.GAGANA,
            infamyCost   = 15000,
            requirements =
            {
                { invaderXim.monstrosity.species.ROC, 75 },
            },
        },

        [2] =
        {
            monSpecies = invaderXim.monstrosity.species.BAT,
            infamyCost = 2000,
        },

        [3] =
        {
            monVariant   = invaderXim.monstrosity.variants.INGUZA,
            infamyCost   = 15000,
            requirements =
            {
                { invaderXim.monstrosity.species.APKALLU, 50 },
            },
        },

        [4] =
        {
            monSpecies = invaderXim.monstrosity.species.COLIBRI,
            infamyCost = 5000,
            requirements =
            {
                { invaderXim.monstrosity.species.BAT,  50 },
                { invaderXim.monstrosity.species.BIRD, 45 },
            },
        },

        [5] =
        {
            monVariant   = invaderXim.monstrosity.variants.TOUCALIBRI,
            infamyCost   = 15000,
            requirements =
            {
                { invaderXim.monstrosity.species.COLIBRI, 50 },
            },
        },

        [6] =
        {
            monSpecies   = invaderXim.monstrosity.species.AMPHIPTERE,
            infamyCost   = 10000,
            requirements =
            {
                { invaderXim.monstrosity.species.COCKATRICE, 75 },
                { invaderXim.monstrosity.species.ROC,        75 },
                { invaderXim.monstrosity.species.HIPPOGRYPH, 75 },
            },
        },

        [7] =
        {
            monVariant   = invaderXim.monstrosity.variants.SANGUIPTERE,
            infamyCost   = 20000,
            requirements =
            {
                { invaderXim.monstrosity.species.AMPHIPTERE, 50 },
            },
        },
    },
}

invaderXim.monstrosity.teleports =
{
    [invaderXim.zone.EAST_RONFAURE] =
    {
        { 120,     0.5, -530, 192 },
        { 115, -59.684,  247,  16 },
    },

    [invaderXim.zone.QUFIM_ISLAND] =
    {
        {  -2, -20.001, 324,  64 },
        { 161,     -20,  37, 192 },
    },

    [invaderXim.zone.SOUTH_GUSTABERG] =
    {
        { -115, -0.136, -165, 64 },
    },

    [invaderXim.zone.VALKURM_DUNES] =
    {
        { 838, 0, -162, 64 },
    },

    [invaderXim.zone.WESTERN_ALTEPA_DESERT] =
    {
        { 685.548, -1.744, -50.395, 128 },
    },
}

-- NOTE: The zones in this list are not customisable, but the level caps are!
invaderXim.monstrosity.belligerencyCaps =
{
    [invaderXim.zone.BUBURIMU_PENINSULA] = 30,
    [invaderXim.zone.XARCABARD]          = 60,
    [invaderXim.zone.ULEGUERAND_RANGE]   = 90,
}

-----------------------------------
-- Helpers
-----------------------------------
-- Use invaderXim.monstrosity.species
invaderXim.monstrosity.unlockStartingMONs = function(player, choice)
    local data =
    {
        monstrosityId = choice,
        species       = choice,
    }

    player:setMonstrosityData(data)
end

-- Use invaderXim.monstrosity.species
invaderXim.monstrosity.getSpeciesLevel = function(player, species)
    local data = player:getMonstrosityData()
    return data['levels'][species]
end

-- Use invaderXim.monstrosity.species
invaderXim.monstrosity.hasUnlockedSpecies = function(player, species)
    return invaderXim.monstrosity.getSpeciesLevel(player, species) > 0
end

-- Use invaderXim.monstrosity.species
invaderXim.monstrosity.setSpeciesLevel = function(player, species, level)
    local data = player:getMonstrosityData()
    data.levels[species] = level
    player:setMonstrosityData(data)
end

-- Use invaderXim.monstrosity.species
invaderXim.monstrosity.unlockSpecies = function(player, species)
    if not invaderXim.monstrosity.hasUnlockedSpecies(player, species) then
        invaderXim.monstrosity.setSpeciesLevel(player, species, 1)
    end
end

-- Use invaderXim.monstrosity.variants
invaderXim.monstrosity.hasUnlockedVariant = function(player, variant)
    local data = player:getMonstrosityData()

    local byteOffset  = math.floor(variant / 8)
    local shiftAmount = variant % 8

    if byteOffset < 32 then
        return bit.band(data.variants[byteOffset] or 0, bit.lshift(0x01, shiftAmount)) > 0
    end

    return false
end

-- Use invaderXim.monstrosity.variants
invaderXim.monstrosity.unlockVariant = function(player, variant)
    if not invaderXim.monstrosity.hasUnlockedVariant(player, variant) then
        local data = player:getMonstrosityData()

        local byteOffset   = math.floor(variant / 8)
        local shiftAmount  = variant % 8

        if byteOffset < 32 then
            data.variants[byteOffset] = bit.bor(data.variants[byteOffset] or 0, bit.lshift(0x01, shiftAmount))
        else
            print('byteOffset out of range')
        end

        player:setMonstrosityData(data)
    end
end

local function hasPurchasedInstinct(player, purchasableInstinctId)
    local data        = player:getMonstrosityData()
    local byteOffset  = 20 + math.floor(purchasableInstinctId / 8)
    local shiftAmount = purchasableInstinctId % 8

    if byteOffset >= 20 and byteOffset < 24 then
        return bit.band(data.instincts[byteOffset], bit.lshift(1, shiftAmount)) > 0
    else
        print('byteOffset out of range')
    end
end

local function getPurchasedInstinctsMask(player)
    local instinctMask = 0

    for _, purchasableInstinctId in pairs(invaderXim.monstrosity.purchasableInstincts) do
        if
            purchasableInstinctId >= invaderXim.monstrosity.purchasableInstincts.HUME_II and
            hasPurchasedInstinct(player, purchasableInstinctId)
        then
            instinctMask = utils.mask.setBit(instinctMask, purchasableInstinctId - invaderXim.monstrosity.purchasableInstincts.HUME_II, true)
        end
    end

    return instinctMask
end

local function addPurchasedInstinct(player, purchasableInstinctId)
    local data        = player:getMonstrosityData()
    local byteOffset  = 20 + math.floor(purchasableInstinctId / 8)
    local shiftAmount = purchasableInstinctId % 8

    if byteOffset >= 20 and byteOffset < 24 then
        data.instincts[byteOffset] = bit.bor(data.instincts[byteOffset] or 0, bit.lshift(0x01, shiftAmount))
    else
        print('byteOffset out of range')
    end

    player:setMonstrosityData(data)
end

-- When generating Terynon's mask for discounts, we need a bitmask for
-- specific jobs.  Since only one quest exists for pre-ToAU jobs, use
-- Maat's Cap tracking for those.
local function hasCompletedLimitBreak(player, jobId)
    if jobId <= invaderXim.job.SMN then
        local maatsCap = player:getCharVar('maatsCap')

        return utils.mask.getBit(maatsCap, jobId - 1)
    else
        return player:hasCompletedQuest(unpack(limitBreakQuests[jobId]))
    end
end

local function getLimitBreakMask(player)
    local limitMask = 0

    for jobId = invaderXim.job.WAR, invaderXim.job.RUN do
        if hasCompletedLimitBreak(player, jobId) then
            limitMask = utils.mask.setBit(limitMask, jobId - 1, true)
        end
    end

    return limitMask
end

local function hasPurchaseRequirements(player, monCategory, selectedMon)
    local selectedMonData = terynonMonData[monCategory][selectedMon]
    local eligibleSpecies = selectedMonData.monSpecies and invaderXim.monstrosity.getSpeciesLevel(player, selectedMonData.monSpecies) == 0
    local eligibleVariant = selectedMonData.monVariant and not invaderXim.monstrosity.hasUnlockedVariant(player, selectedMonData.monVariant)

    if
        eligibleSpecies or
        eligibleVariant
    then
        if selectedMonData.requirements then
            for _, reqTable in ipairs(selectedMonData.requirements) do
                if invaderXim.monstrosity.getSpeciesLevel(player, reqTable[1]) < reqTable[2] then
                    return false
                end
            end
        end

        return true
    end

    return false
end

local function getMonPageMask(player, monCategory)
    local pageMask = 0

    if terynonMonData[monCategory] then
        local categoryTable = terynonMonData[monCategory]

        for bitPos, _ in pairs(categoryTable) do
            if hasPurchaseRequirements(player, monCategory, bitPos) then
                pageMask = utils.mask.setBit(pageMask, bitPos, true)
            end
        end
    end

    return pageMask
end

-----------------------------------
-- Bound by C++ (DO NOT CHANGE SIGNATURE)
-----------------------------------

invaderXim.monstrosity.onMonstrosityUpdate = function(player, data)
    -- Tap level-based unlocks

    -- Instincts by MON level
    -- NOTE: Since this is a bitfield, it's zero-indexed!
    for _, val in pairs(invaderXim.monstrosity.species) do
        local speciesKey   = val
        local speciesLevel = data.levels[val]
        local byteOffset   = math.floor(speciesKey / 4)
        local unlockAmount = math.floor(speciesLevel / 30)
        local shiftAmount  = (speciesKey * 2) % 8

        -- Special case for writing Slime & Spriggan data at the end of the 64-byte array
        if byteOffset == 31 then
            byteOffset = 63
        end

        if byteOffset < 64 then
            data.instincts[byteOffset] = bit.bor(data.instincts[byteOffset] or 0, bit.lshift(unlockAmount, shiftAmount))
        else
            print('byteOffset out of range')
        end
    end

    -- TODO: Handle level-based variants here
end

invaderXim.monstrosity.onMonstrosityReturnToEntrance = function(player)
    local data = player:getMonstrosityData()

    local x      = data.entry_x
    local y      = data.entry_y
    local z      = data.entry_z
    local rot    = data.entry_rot
    local zoneId = data.entry_zone_id
    local mjob   = data.entry_mjob
    local sjob   = data.entry_sjob

    -- TODO: Sanity check

    for _, effect in pairs(player:getStatusEffects()) do
        player:delStatusEffectSilent(effect:getEffectType())
    end

    if invaderXim.settings.main.MONSTROSITY_TELEPORT_TO_FERETORY == 1 then
        if player:getZoneID() ~= invaderXim.zone.FERETORY then
            player:setPos(-358, -3.4, -440, 64, invaderXim.zone.FERETORY)
            return
        end

        -- Otherwise fallthrough and exit as normal
    end

    player:changeJob(mjob)
    player:changesJob(sjob)
    player:setPos(x, y, z, rot, zoneId)
end

-----------------------------------
-- Relinquish
-----------------------------------

invaderXim.monstrosity.relinquishSteps =
{
    [0] = function(player)
        player:messageBasic(invaderXim.msg.basic.FERETORY_COUNTDOWN, 0, 4)
    end,

    [1] = function(player)
        player:messageBasic(invaderXim.msg.basic.FERETORY_COUNTDOWN, 0, 3)
    end,

    [2] = function(player)
        player:messageBasic(invaderXim.msg.basic.FERETORY_COUNTDOWN, 0, 2)
    end,

    [3] = function(player)
        player:messageBasic(invaderXim.msg.basic.FERETORY_COUNTDOWN, 0, 1)
    end,

    [4] = function(player)
        invaderXim.monstrosity.onMonstrosityReturnToEntrance(player)
    end,
}

invaderXim.monstrosity.relinquishFuncBody = function(player)
    -- TODO: Make this countdown interruptable
    player:timer(1000, function(playerArg)
        local step = utils.clamp(playerArg:getLocalVar('RELINQUISH_COUNTDOWN'), 0, 4)
        invaderXim.monstrosity.relinquishSteps[step](playerArg)
        playerArg:setLocalVar('RELINQUISH_COUNTDOWN', step + 1)
        invaderXim.monstrosity.relinquishFuncBody(playerArg)
    end)
end

invaderXim.monstrosity.relinquishOnAbility = function(player, target, ability)
    invaderXim.monstrosity.relinquishFuncBody(player)
end

-----------------------------------
-- Debug
-----------------------------------

invaderXim.monstrosity.unlockAll = function(player)
    -- Complete quest
    local logId = invaderXim.questLog.OTHER_AREAS
    player:completeQuest(logId, invaderXim.quest.id[invaderXim.quest.area[logId]].MONSTROSITY)

    -- Add Monstrosity key item
    player:addKeyItem(invaderXim.keyItem.RING_OF_SUPERNAL_DISJUNCTION)

    local data = player:getMonstrosityData()

    -- Set all levels to 99
    for _, val in pairs(invaderXim.monstrosity.species) do
        data.levels[val] = 99
    end

    -- Instincts by MON level
    -- NOTE: Since this is a bitfield, it's zero-indexed!
    for _, val in pairs(invaderXim.monstrosity.species) do
        local speciesKey   = val
        local speciesLevel = data.levels[val]
        local byteOffset   = math.floor(speciesKey / 4)
        local unlockAmount = math.floor(speciesLevel / 30)
        local shiftAmount  = (speciesKey * 2) % 8

        -- Special case for writing Slime & Spriggan data at the end of the 64-byte array
        if byteOffset == 31 then
            byteOffset = 63
        end

        if byteOffset < 64 then
            data.instincts[byteOffset] = bit.bor(data.instincts[byteOffset] or 0, bit.lshift(unlockAmount, shiftAmount))
        else
            print('byteOffset out of range')
        end
    end

    -- Instincts (Purchasable)
    for _, val in pairs(invaderXim.monstrosity.purchasableInstincts) do
        local byteOffset   = 20 + math.floor(val / 8)
        local shiftAmount  = val % 8

        if byteOffset >= 20 and byteOffset < 24 then
            data.instincts[byteOffset] = bit.bor(data.instincts[byteOffset] or 0, bit.lshift(0x01, shiftAmount))
        else
            print('byteOffset out of range')
        end
    end

    -- Variants
    -- Force unlock all
    for _, val in pairs(invaderXim.monstrosity.variants) do
        local speciesKey   = val
        local byteOffset   = math.floor(speciesKey / 8)
        local shiftAmount  = speciesKey % 8

        if byteOffset < 32 then
            data.variants[byteOffset] = bit.bor(data.variants[byteOffset] or 0, bit.lshift(0x01, shiftAmount))
        else
            print('byteOffset out of range')
        end
    end

    -- Set data
    player:setMonstrosityData(data)
end

-----------------------------------
-- Odyssean Passage (Feretory Only)
-----------------------------------

invaderXim.monstrosity.odysseanPassageOnTrade = function(player, npc, trade)
end

invaderXim.monstrosity.odysseanPassageOnTrigger = function(player, npc)
    if invaderXim.settings.main.ENABLE_MONSTROSITY ~= 1 then
        return
    end

    local monSize         = player:getMonstrositySize()
    local hasBelligerency = player:getBelligerencyFlag() and 1 or 0

    -- Show the full menu, not the restricted one
    if invaderXim.settings.main.MONSTROSITY_PVP_ZONE_BYPASS == 1 then
        hasBelligerency = 0
    end

    -- NOTE: The list of available zones is built from the char's list of
    -- visited zones. If you haven't visited any zones in a category it'll back
    -- out immediately.
    -- NOTE: Param5 is not consistent, Bee has seen 0, 1, and 2 so far
    -- player:startEvent(5, 0, 0, 0, 0, 2, 0, 0, 0) -- Bee
    player:startEvent(5, 0, monSize, hasBelligerency, 0, 0, 0, 0, 0)
end

invaderXim.monstrosity.odysseanPassageOnEventUpdate = function(player, csid, option, npc)
    local zoneSelected = bit.rshift(option, 4)
    player:updateEvent(invaderXim.monstrosity.belligerencyCaps[zoneSelected], 0, 0, 0, 1, 0, 0, 0)
end

invaderXim.monstrosity.odysseanPassageOnEventFinish = function(player, csid, option, npc)
    local eventOption  = bit.band(option, 0xF)
    local zoneSelected = bit.rshift(option, 4)

    if eventOption == 1 then
        if zoneSelected == 0 then
            invaderXim.monstrosity.onMonstrosityReturnToEntrance(player)
        else
            if invaderXim.monstrosity.teleports[zoneSelected] then
                local teleportPos = invaderXim.monstrosity.teleports[zoneSelected][math.random(1, #invaderXim.monstrosity.teleports[zoneSelected])]

                player:setPos(teleportPos[1],
                    teleportPos[2],
                    teleportPos[3],
                    teleportPos[4],
                    zoneSelected
                )
            else
                print('Monstrosity Teleport - No Valid Entries for Zone ' .. zoneSelected .. '. Setting pos to (0, 0, 0)!')
                player:setPos(0, 0, 0, 0, zoneSelected)
            end
        end
    end
end

-----------------------------------
-- Feretory
-----------------------------------

invaderXim.monstrosity.feretoryOnZoneIn = function(player, prevZone)
    local cs = -1

    if
        player:getXPos() == 0 and
        player:getYPos() == 0 and
        player:getZPos() == 0
    then
        player:setPos(-358.000, -3.400, -440.00, 63)
    end

    if invaderXim.settings.main.ENABLE_MONSTROSITY ~= 1 then
        return cs
    end

    if player:getMainJob() ~= invaderXim.job.MON then
        player:changeJob(invaderXim.job.MON)
    end

    for _, effect in pairs(player:getStatusEffects()) do
        player:delStatusEffectSilent(effect:getEffectType())
    end

    return cs
end

invaderXim.monstrosity.feretoryOnZoneOut = function(player)
    if invaderXim.settings.main.ENABLE_MONSTROSITY ~= 1 then
        return
    end

    -- Mark all status effects so they'll survive zoning
    -- (there are some routines that will force them off anyway)
    for _, effect in pairs(player:getStatusEffects()) do
        effect:delEffectFlag(invaderXim.effectFlag.ON_ZONE)
        effect:delEffectFlag(invaderXim.effectFlag.LOGOUT)
    end
end

invaderXim.monstrosity.feretoryOnEventUpdate = function(player, csid, option, npc)
end

invaderXim.monstrosity.feretoryOnEventFinish = function(player, csid, option, npc)
end

-----------------------------------
-- Aengus (Feretory NPC)
-----------------------------------

invaderXim.monstrosity.aengusOnTrade = function(player, npc, trade)
end

invaderXim.monstrosity.aengusOnTrigger = function(player, npc)
    if invaderXim.settings.main.ENABLE_MONSTROSITY ~= 1 then
        return
    end

    local inBelligerency = player:getBelligerencyFlag() and 1 or 0
    player:startEvent(13, inBelligerency, player:getCurrency('infamy'), 0, 0, 0, 0, 0, 0)
end

invaderXim.monstrosity.aengusOnEventUpdate = function(player, csid, option, npc)
end

invaderXim.monstrosity.aengusOnEventFinish = function(player, csid, option, npc)
    if csid == 13 and option == 1 then
        -- Toggle
        player:setBelligerencyFlag(not player:getBelligerencyFlag())
    end
end

-----------------------------------
-- Teyrnon (Feretory NPC)
-----------------------------------

invaderXim.monstrosity.teyrnonOnTrade = function(player, npc, trade)
end

invaderXim.monstrosity.teyrnonOnTrigger = function(player, npc)
    if invaderXim.settings.main.ENABLE_MONSTROSITY ~= 1 then
        return
    end

    player:startEvent(7, player:getCurrency('infamy'), 0, 0, 0, 0, 0, 0, 0)
end

invaderXim.monstrosity.teyrnonOnEventUpdate = function(player, csid, option, npc)
    if csid == 7 then
        local optionType = bit.band(option, 0xFF)

        if optionType == 0 then
            -- Monsters

            local monPage       = bit.rshift(option, 16)
            local availableMons = getMonPageMask(player, monPage)

            player:updateEvent(availableMons, 0, 0, 0, 0, 0, 0, 0)
        elseif optionType == 1 then
            -- Instincts

            local purchasedInstincts = getPurchasedInstinctsMask(player)
            local completedLimits    = getLimitBreakMask(player)

            player:updateEvent(purchasedInstincts, completedLimits, 0, 0, 0, 0, 0, 0)
        end
    end
end

invaderXim.monstrosity.teyrnonOnEventFinish = function(player, csid, option, npc)
    local optionType = bit.band(option, 0xFF)

    if optionType == 1 then
        local selectedCategory = bit.band(bit.rshift(option, 8), 0xF) - 1
        local selectedMon      = bit.rshift(option, 16)
        local monData          = terynonMonData[selectedCategory][selectedMon]

        if not monData then
            print(string.format('Invalid Event Finish Option received by Terynon! (%s:%d)', player:getName(), option))
            return
        end

        if player:getCurrency('infamy') >= monData.infamyCost then
            player:delCurrency('infamy', monData.infamyCost)

            if monData.monSpecies then
                invaderXim.monstrosity.unlockSpecies(player, monData.monSpecies)
            elseif monData.monVariant then
                invaderXim.monstrosity.unlockVariant(player, monData.monVariant)
            end

            player:messageSpecial(zones[invaderXim.zone.FERETORY].text.MAY_POSSESS_BEASTS + 3 * selectedCategory, 0, selectedMon)
        else
            player:messageSpecial(zones[invaderXim.zone.FERETORY].text.THY_BRAZEN_DISREGARD)
        end

    elseif optionType == 2 then
        -- Instincts: Costs are hardcoded, and adjusted based on having completed certain
        -- prerequisites.  This data is not tabled with Terynon, as it cannot be controlled.

        local selectedInstinct = bit.band(bit.rshift(option, 8), 0xFF)
        local instinctPrice    = selectedInstinct > invaderXim.monstrosity.purchasableInstincts.GALKA_II and 10000 or 500
        local checkValue       = bit.rshift(option, 16)

        if checkValue ~= 119 then
            print(string.format('Invalid Event Finish Option received by Terynon! (%s:%d)', player:getName(), option))
            return
        end

        if
            selectedInstinct > invaderXim.monstrosity.purchasableInstincts.GALKA_II and
            hasCompletedLimitBreak(player, selectedInstinct - invaderXim.monstrosity.purchasableInstincts.GALKA_II)
        then
            instinctPrice = instinctPrice / 2
        end

        if player:getCurrency('infamy') >= instinctPrice then
            player:delCurrency('infamy', instinctPrice)
            addPurchasedInstinct(player, selectedInstinct)

            -- NOTE: The offset below is the beginning parameter for purchased instincts used by this message, and
            -- lower values will result in an item being placed in the message.  Base offset for all instincts
            -- is 29696 (29696 + 3 -> Rabbit Instinct I)
            player:messageSpecial(zones[invaderXim.zone.FERETORY].text.YOU_LEARNED_INSTINCT, 30464 + selectedInstinct)
        else
            player:messageSpecial(zones[invaderXim.zone.FERETORY].text.THY_BRAZEN_DISREGARD)
        end

    elseif optionType == 3 then
        -- TODO: The casting effects and animations

        local tryPayCost = function(playerArg, cost)
            if playerArg:getCurrency('infamy') < cost then
                playerArg:messageSpecial(zones[invaderXim.zone.FERETORY].text.THY_BRAZEN_DISREGARD)
                return false
            end

            playerArg:delCurrency('infamy', cost)
            return true
        end

        local selectedEffect = bit.rshift(option, 8)
        switch(selectedEffect): caseof
        {
            -- 0: Dedication 1
            -- 50% experience bonus 60 minutes or until a maximum bonus of 10,000 EXP is gained
            [0] = function()
                if not tryPayCost(player, 3000) then
                    return
                end

                local effect   = invaderXim.effect.DEDICATION
                local power    = 50
                local duration = utils.minutes(60)
                local subpower = 10000
                player:delStatusEffectSilent(power)
                invaderXim.itemUtils.addItemExpEffect(player, effect, power, duration, subpower)
            end,

            -- 1: Dedication 2
            -- 100% experience bonus 60 minutes or until a maximum bonus of 2,000 EXP is gained
            [1] = function()
                if not tryPayCost(player, 400) then
                    return
                end

                local effect   = invaderXim.effect.DEDICATION
                local power    = 100
                local duration = utils.minutes(60)
                local subpower = 2000
                player:delStatusEffectSilent(power)
                invaderXim.itemUtils.addItemExpEffect(player, effect, power, duration, subpower)
            end,

            -- 2: Regen
            [2] = function()
                if not tryPayCost(player, 10) then
                    return
                end

                player:delStatusEffectSilent(invaderXim.effect.REGEN)
                player:addStatusEffect(invaderXim.effect.REGEN, 1, 3, 3600)
            end,

            -- 3: Refresh
            [3] = function()
                if not tryPayCost(player, 10) then
                    return
                end

                player:delStatusEffectSilent(invaderXim.effect.REFRESH)
                player:delStatusEffect(invaderXim.effect.SUBLIMATION_COMPLETE)
                player:delStatusEffect(invaderXim.effect.SUBLIMATION_ACTIVATED)
                player:addStatusEffect(invaderXim.effect.REFRESH, 1, 3, 3600, 0, 3)
            end,

            -- 4: Protect
            [4] = function()
                if not tryPayCost(player, 100) then
                    return
                end

                local mLvl  = player:getMainLvl()
                local power = 220
                local tier  = 5

                if mLvl < 27 then
                    power = 20
                    tier = 1
                elseif mLvl < 47 then
                    power = 50
                    tier = 2
                elseif mLvl < 63 then
                    power = 90
                    tier = 3
                elseif mLvl < 76 then
                    power = 140
                    tier = 4
                end

                local bonus = 0
                if player:getMod(invaderXim.mod.ENHANCES_PROT_SHELL_RCVD) > 0 then
                    bonus = 2 -- 2x Tier from MOD
                end

                power = power + (bonus * tier)
                player:delStatusEffectSilent(invaderXim.effect.PROTECT)
                player:addStatusEffect(invaderXim.effect.PROTECT, power, 0, 1800, 0, 0, tier)
            end,

            -- 5: Shell
            [5] = function()
                if not tryPayCost(player, 100) then
                    return
                end

                local mLvl  = player:getMainLvl()

                -- Shell V (75/256)
                local power = 2930
                local tier  = 5

                if mLvl < 37 then
                    power = 1055 -- Shell I   (27/256)
                    tier = 1
                elseif mLvl < 57 then
                    power = 1641 -- Shell II  (42/256)
                    tier = 2
                elseif mLvl < 68 then
                    power = 2188 -- Shell III (56/256)
                    tier = 3
                elseif mLvl < 76 then
                    power = 2617 -- Shell IV  (67/256)
                    tier = 4
                end

                local bonus = 0
                if player:getMod(invaderXim.mod.ENHANCES_PROT_SHELL_RCVD) > 0 then
                    bonus = 39   -- (1/256 bonus buff per tier of spell)
                end

                power = power + (bonus * tier)
                player:delStatusEffectSilent(invaderXim.effect.SHELL)
                player:addStatusEffect(invaderXim.effect.SHELL, power, 0, 1800, 0, 0, tier)
            end,

            -- 6: Haste
            [6] = function()
                player:delStatusEffectSilent(invaderXim.effect.HASTE)
                player:addStatusEffect(invaderXim.effect.HASTE, 1000, 0, 600)
            end,
        }
    end
end

-----------------------------------
-- Maccus (Feretory NPC)
-----------------------------------

invaderXim.monstrosity.maccusOnTrade = function(player, npc, trade)
end

invaderXim.monstrosity.maccusOnTrigger = function(player, npc)
    if invaderXim.settings.main.ENABLE_MONSTROSITY ~= 1 then
        return
    end

    player:startEvent(9, 285, 2, 2, 0, 0, 0, 0, 0)
end

invaderXim.monstrosity.maccusOnEventUpdate = function(player, csid, option, npc)
    -- print('update', csid, option)
end

invaderXim.monstrosity.maccusOnEventFinish = function(player, csid, option, npc)
    -- print('finish', csid, option)
end
