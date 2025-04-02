invaderXim.equipment = invaderXim.equipment or {}

invaderXim.equipment.baseNyzulWeapons =
{
    invaderXim.item.STURDY_AXE,     -- (WAR)
    invaderXim.item.BURNING_FISTS,  -- (MNK)
    invaderXim.item.WEREBUSTER,     -- (WHM)
    invaderXim.item.MAGES_STAFF,    -- (BLM)
    invaderXim.item.VORPAL_SWORD,   -- (RDM)
    invaderXim.item.SWORDBREAKER,   -- (THF)
    invaderXim.item.BRAVE_BLADE,    -- (PLD)
    invaderXim.item.DEATH_SICKLE,   -- (DRK)
    invaderXim.item.DOUBLE_AXE,     -- (BST)
    invaderXim.item.DANCING_DAGGER, -- (BRD)
    invaderXim.item.KILLER_BOW,     -- (RNG)
    invaderXim.item.WINDSLICER,     -- (SAM)
    invaderXim.item.SASUKE_KATANA,  -- (NIN)
    invaderXim.item.RADIANT_LANCE,  -- (DRG)
    invaderXim.item.SCEPTER_STAFF,  -- (SMN)
    invaderXim.item.WIGHTSLAYER,    -- (BLU)
    invaderXim.item.QUICKSILVER,    -- (COR)
    invaderXim.item.INFERNO_CLAWS,  -- (PUP)
    invaderXim.item.MAIN_GAUCHE,    -- (DNC)
    invaderXim.item.ELDER_STAFF     -- (SCH)
}

-----------------------------------
-- Relic/Mythic/Empyrean tables
-----------------------------------

invaderXim.equipment.relic =
{
    SPHARAI       = 0,
    MANDAU        = 1,
    EXCALIBUR     = 2,
    RAGNAROK      = 3,
    GUTTLER       = 4,
    BRAVURA       = 5,
    APOCALYPSE    = 6,
    GUNGNIR       = 7,
    KIKOKU        = 8,
    AMANOMURAKUMO = 9,
    MJOLLNIR      = 10,
    CLAUSTRUM     = 11,
    YOICHINOYUMI  = 12,
    ANNIHILATOR   = 13,
    GJALLARHORN   = 14,
    AEGIS         = 15
}

invaderXim.equipment.relicIDs =
{
    [invaderXim.equipment.relic.SPHARAI] =
    {
        invaderXim.item.SPHARAI_75,
        invaderXim.item.SPHARAI_80,
        invaderXim.item.SPHARAI_85,
        invaderXim.item.SPHARAI_90,
        invaderXim.item.SPHARAI_95,
        invaderXim.item.SPHARAI_99,
        invaderXim.item.SPHARAI_99_II,
        invaderXim.item.SPHARAI_119,
        invaderXim.item.SPHARAI_119_II,
        invaderXim.item.SPHARAI_119_III,
    },

    [invaderXim.equipment.relic.MANDAU] =
    {
        invaderXim.item.MANDAU_75,
        invaderXim.item.MANDAU_80,
        invaderXim.item.MANDAU_85,
        invaderXim.item.MANDAU_90,
        invaderXim.item.MANDAU_95,
        invaderXim.item.MANDAU_99,
        invaderXim.item.MANDAU_99_II,
        invaderXim.item.MANDAU_119,
        invaderXim.item.MANDAU_119_II,
        invaderXim.item.MANDAU_119_III,
    },

    [invaderXim.equipment.relic.EXCALIBUR] =
    {
        invaderXim.item.EXCALIBUR_75,
        invaderXim.item.EXCALIBUR_80,
        invaderXim.item.EXCALIBUR_85,
        invaderXim.item.EXCALIBUR_90,
        invaderXim.item.EXCALIBUR_95,
        invaderXim.item.EXCALIBUR_99,
        invaderXim.item.EXCALIBUR_99_II,
        invaderXim.item.EXCALIBUR_119,
        invaderXim.item.EXCALIBUR_119_II,
        invaderXim.item.EXCALIBUR_119_III,
    },

    [invaderXim.equipment.relic.RAGNAROK] =
    {
        invaderXim.item.RAGNAROK_75,
        invaderXim.item.RAGNAROK_80,
        invaderXim.item.RAGNAROK_85,
        invaderXim.item.RAGNAROK_90,
        invaderXim.item.RAGNAROK_95,
        invaderXim.item.RAGNAROK_99,
        invaderXim.item.RAGNAROK_99_II,
        invaderXim.item.RAGNAROK_119,
        invaderXim.item.RAGNAROK_119_II,
        invaderXim.item.RAGNAROK_119_III,
    },

    [invaderXim.equipment.relic.GUTTLER] =
    {
        invaderXim.item.GUTTLER_75,
        invaderXim.item.GUTTLER_80,
        invaderXim.item.GUTTLER_85,
        invaderXim.item.GUTTLER_90,
        invaderXim.item.GUTTLER_95,
        invaderXim.item.GUTTLER_99,
        invaderXim.item.GUTTLER_99_II,
        invaderXim.item.GUTTLER_119,
        invaderXim.item.GUTTLER_119_II,
        invaderXim.item.GUTTLER_119_III,
    },

    [invaderXim.equipment.relic.BRAVURA] =
    {
        invaderXim.item.BRAVURA_75,
        invaderXim.item.BRAVURA_80,
        invaderXim.item.BRAVURA_85,
        invaderXim.item.BRAVURA_90,
        invaderXim.item.BRAVURA_95,
        invaderXim.item.BRAVURA_99,
        invaderXim.item.BRAVURA_99_II,
        invaderXim.item.BRAVURA_119,
        invaderXim.item.BRAVURA_119_II,
        invaderXim.item.BRAVURA_119_III,
    },

    [invaderXim.equipment.relic.APOCALYPSE] =
    {
        invaderXim.item.APOCALYPSE_75,
        invaderXim.item.APOCALYPSE_80,
        invaderXim.item.APOCALYPSE_85,
        invaderXim.item.APOCALYPSE_90,
        invaderXim.item.APOCALYPSE_95,
        invaderXim.item.APOCALYPSE_99,
        invaderXim.item.APOCALYPSE_99_II,
        invaderXim.item.APOCALYPSE_119,
        invaderXim.item.APOCALYPSE_119_II,
        invaderXim.item.APOCALYPSE_119_III,
    },

    [invaderXim.equipment.relic.GUNGNIR] =
    {
        invaderXim.item.GUNGNIR_75,
        invaderXim.item.GUNGNIR_80,
        invaderXim.item.GUNGNIR_85,
        invaderXim.item.GUNGNIR_90,
        invaderXim.item.GUNGNIR_95,
        invaderXim.item.GUNGNIR_99,
        invaderXim.item.GUNGNIR_99_II,
        invaderXim.item.GUNGNIR_119,
        invaderXim.item.GUNGNIR_119_II,
        invaderXim.item.GUNGNIR_119_III,
    },

    [invaderXim.equipment.relic.KIKOKU] =
    {
        invaderXim.item.KIKOKU_75,
        invaderXim.item.KIKOKU_80,
        invaderXim.item.KIKOKU_85,
        invaderXim.item.KIKOKU_90,
        invaderXim.item.KIKOKU_95,
        invaderXim.item.KIKOKU_99,
        invaderXim.item.KIKOKU_99_II,
        invaderXim.item.KIKOKU_119,
        invaderXim.item.KIKOKU_119_II,
        invaderXim.item.KIKOKU_119_III,
    },

    [invaderXim.equipment.relic.AMANOMURAKUMO] =
    {
        invaderXim.item.AMANOMURAKUMO_75,
        invaderXim.item.AMANOMURAKUMO_80,
        invaderXim.item.AMANOMURAKUMO_85,
        invaderXim.item.AMANOMURAKUMO_90,
        invaderXim.item.AMANOMURAKUMO_95,
        invaderXim.item.AMANOMURAKUMO_99,
        invaderXim.item.AMANOMURAKUMO_99_II,
        invaderXim.item.AMANOMURAKUMO_119,
        invaderXim.item.AMANOMURAKUMO_119_II,
        invaderXim.item.AMANOMURAKUMO_119_III,
    },

    [invaderXim.equipment.relic.MJOLLNIR] =
    {
        invaderXim.item.MJOLLNIR_75,
        invaderXim.item.MJOLLNIR_80,
        invaderXim.item.MJOLLNIR_85,
        invaderXim.item.MJOLLNIR_90,
        invaderXim.item.MJOLLNIR_95,
        invaderXim.item.MJOLLNIR_99,
        invaderXim.item.MJOLLNIR_99_II,
        invaderXim.item.MJOLLNIR_119,
        invaderXim.item.MJOLLNIR_119_II,
        invaderXim.item.MJOLLNIR_119_III,
    },

    [invaderXim.equipment.relic.CLAUSTRUM] =
    {
        invaderXim.item.CLAUSTRUM_75,
        invaderXim.item.CLAUSTRUM_80,
        invaderXim.item.CLAUSTRUM_85,
        invaderXim.item.CLAUSTRUM_90,
        invaderXim.item.CLAUSTRUM_95,
        invaderXim.item.CLAUSTRUM_99,
        invaderXim.item.CLAUSTRUM_99_II,
        invaderXim.item.CLAUSTRUM_119,
        invaderXim.item.CLAUSTRUM_119_II,
        invaderXim.item.CLAUSTRUM_119_III,
    },

    [invaderXim.equipment.relic.YOICHINOYUMI] =
    {
        invaderXim.item.YOICHINOYUMI_75,
        invaderXim.item.YOICHINOYUMI_80,
        invaderXim.item.YOICHINOYUMI_85,
        invaderXim.item.YOICHINOYUMI_90,
        invaderXim.item.YOICHINOYUMI_95,
        invaderXim.item.YOICHINOYUMI_99,
        invaderXim.item.YOICHINOYUMI_99_II,
        invaderXim.item.YOICHINOYUMI_119,
        invaderXim.item.YOICHINOYUMI_119_II,
        invaderXim.item.YOICHINOYUMI_119_III,
        invaderXim.item.YOICHINOYUMI_119_III_NO_QUIVER,
    },

    [invaderXim.equipment.relic.ANNIHILATOR] =
    {
        invaderXim.item.ANNIHILATOR_75,
        invaderXim.item.ANNIHILATOR_80,
        invaderXim.item.ANNIHILATOR_85,
        invaderXim.item.ANNIHILATOR_90,
        invaderXim.item.ANNIHILATOR_95,
        invaderXim.item.ANNIHILATOR_99,
        invaderXim.item.ANNIHILATOR_99_II,
        invaderXim.item.ANNIHILATOR_119,
        invaderXim.item.ANNIHILATOR_119_II,
        invaderXim.item.ANNIHILATOR_119_III,
        invaderXim.item.ANNIHILATOR_119_III_NO_QUIVER,
    },

    [invaderXim.equipment.relic.GJALLARHORN] =
    {
        invaderXim.item.GJALLARHORN_75,
        invaderXim.item.GJALLARHORN_80,
        invaderXim.item.GJALLARHORN_85,
        invaderXim.item.GJALLARHORN_90,
        invaderXim.item.GJALLARHORN_95,
        invaderXim.item.GJALLARHORN_99,
        invaderXim.item.GJALLARHORN_99_II,
    },

    [invaderXim.equipment.relic.AEGIS] =
    {
        invaderXim.item.AEGIS_75,
        invaderXim.item.AEGIS_80,
        invaderXim.item.AEGIS_85,
        invaderXim.item.AEGIS_90,
        invaderXim.item.AEGIS_95,
        invaderXim.item.AEGIS_99,
        invaderXim.item.AEGIS_99_II,
    },
}

-----------------------------------
-- Place convenience functions
-- related to equipment here
-----------------------------------
-- TODO: Should Adoulin exist here as well?
local artifactArmorRanges =
{
--      Min,   Max
    { invaderXim.item.FIGHTERS_MASK,       invaderXim.item.EVOKERS_HORN         }, -- Original Head
    { invaderXim.item.HEALERS_CAP,         invaderXim.item.CHORAL_ROUNDLET      },
    { invaderXim.item.MYOCHIN_KABUTO,      invaderXim.item.NINJA_HATSUBURI      },
    { invaderXim.item.FIGHTERS_LORICA,     invaderXim.item.EVOKERS_DOUBLET      }, -- Original Body
    { invaderXim.item.MYOCHIN_DOMARU,      invaderXim.item.NINJA_CHAINMAIL      },
    { invaderXim.item.FIGHTERS_MUFFLERS,   invaderXim.item.EVOKERS_BRACERS      }, -- Original Hand
    { invaderXim.item.FIGHTERS_CALLIGAE,   invaderXim.item.EVOKERS_PIGACHES     }, -- Original Feet
    { invaderXim.item.FIGHTERS_CUISSES,    invaderXim.item.EVOKERS_SPATS        }, -- Original Legs
    { invaderXim.item.MAGUS_KEFFIYEH,      invaderXim.item.PUPPETRY_TAJ         }, -- ToAU Head
    { invaderXim.item.MAGUS_JUBBAH,        invaderXim.item.PUPPETRY_TOBE        }, -- ToAU Body
    { invaderXim.item.MAGUS_BAZUBANDS,     invaderXim.item.PUPPETRY_DASTANAS    }, -- ToAU Hand
    { invaderXim.item.MAGUS_CHARUQS,       invaderXim.item.PUPPETRY_BABOUCHES   }, -- ToAU Feet
    { invaderXim.item.MAGUS_SHALWAR,       invaderXim.item.PUPPETRY_CHURIDARS   }, -- ToAU Legs
    { invaderXim.item.DANCERS_TIARA_M,     invaderXim.item.SCHOLARS_MORTARBOARD }, -- WotG Head
    { invaderXim.item.DANCERS_CASAQUE_M,   invaderXim.item.SCHOLARS_GOWN        }, -- WotG Body
    { invaderXim.item.DANCERS_BANGLES_M,   invaderXim.item.SCHOLARS_BRACERS     }, -- WotG Hand
    { invaderXim.item.DANCERS_TOE_SHOES_M, invaderXim.item.SCHOLARS_LOAFERS     }, -- WotG Feet
    { invaderXim.item.DANCERS_TIGHTS_M,    invaderXim.item.HOMAM_GAMBIERAS      }, -- WotG Legs "TODO / BUG?": SCHOLARS_PANTS = 16311
}

invaderXim.equipment.isArtifactArmor = function(itemId)
    for _, v in ipairs(artifactArmorRanges) do
        if itemId >= v[1] and itemId <= v[2] then
            return true
        end
    end

    return false
end

invaderXim.equipment.isBaseNyzulWeapon = function(itemId)
    for i, wepId in pairs(invaderXim.equipment.baseNyzulWeapons) do
        if itemId == wepId then
            return true
        end
    end

    return false
end

-----------------------------------
-- Returns true if player has any tier of given relic,
--  if tier is specified, returns true only if player
--  has that tier
-- Tier:
-- 1  = 75
-- 2  = 80
-- 3  = 85
-- 4  = 90
-- 5  = 95
-- 6  = 99 I
-- 7  = 99 II
-- 8  = 119 I
-- 9  = 119 II
-- 10 = 119 III
-- 11 = 119 III (ranged only)
-----------------------------------
invaderXim.equipment.hasRelic = function(player, relic, tier)
    if tier ~= nil then
        return player:hasItem(invaderXim.equipment.relicIDs[relic][tier])
    end

    for i, itemID in pairs(invaderXim.equipment.relicIDs[relic]) do
        if player:hasItem(itemID) then
            return true
        end
    end

    return false
end

invaderXim.equip = invaderXim.equipment
