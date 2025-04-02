-----------------------------------
-- Song Utilities
-----------------------------------
require('scripts/globals/jobpoints')
require('scripts/globals/utils')
-----------------------------------
xi = xi or {}
invaderXim.spells = invaderXim.spells or {}
invaderXim.spells.enhancing = invaderXim.spells.enhancing or {}
-----------------------------------
-- File structure:
-- 2 Basic Functions called by the main function.

local column =
{
    EFFECT_TIER       =  1,
    EFFECT_MAIN       =  2,
    EFFECT_SUB        =  3,
    MODIFIER          =  4,
    MERIT_ID          =  5,
    JOB_POINT_ID      =  6,
    POWER_BASE        =  7,
    SKILL_REQUIREMENT =  8,
    POWER_CAP         =  9,
    MULTIPLIER        = 10,
    DIVISOR           = 11,
    SOUL_VOICE        = 12,
}

-- Table variables.
local pTable =
{
--                                          1     2                 3                         4                       5                         6                     7     8    9    10   11  12
-- Structure:                 [spellId] = { Tier, Main Effect,      subEffect,                Main Modifier,          Merit Effect,             Job-Point Effect,     power Sreq Pcap Mult Div SVP },
    -- Ballad
    [invaderXim.magic.spell.MAGES_BALLAD      ] = { 1, invaderXim.effect.BALLAD,    invaderXim.mod.AUGMENT_SONG_STAT, invaderXim.mod.BALLAD_EFFECT,   0,                        0,                    1,   0,   1,   1,  0, true  },
    [invaderXim.magic.spell.MAGES_BALLAD_II   ] = { 2, invaderXim.effect.BALLAD,    invaderXim.mod.AUGMENT_SONG_STAT, invaderXim.mod.BALLAD_EFFECT,   0,                        0,                    2,   0,   2,   1,  0, true  },
    [invaderXim.magic.spell.MAGES_BALLAD_III  ] = { 3, invaderXim.effect.BALLAD,    invaderXim.mod.AUGMENT_SONG_STAT, invaderXim.mod.BALLAD_EFFECT,   0,                        0,                    3,   0,   3,   1,  0, true  },
    -- Carol - NOTE: CAROL II Gives a fixed elemental evasion. However, it also gives a Elemental Nullification effect, that follows regular song rules concerning power.
    [invaderXim.magic.spell.FIRE_CAROL        ] = { 1, invaderXim.effect.CAROL,     invaderXim.element.FIRE,          invaderXim.mod.CAROL_EFFECT,    0,                        0,                   20, 200,  80,   8, 10, true  },
    [invaderXim.magic.spell.ICE_CAROL         ] = { 1, invaderXim.effect.CAROL,     invaderXim.element.ICE,           invaderXim.mod.CAROL_EFFECT,    0,                        0,                   20, 200,  80,   8, 10, true  },
    [invaderXim.magic.spell.WIND_CAROL        ] = { 1, invaderXim.effect.CAROL,     invaderXim.element.WIND,          invaderXim.mod.CAROL_EFFECT,    0,                        0,                   20, 200,  80,   8, 10, true  },
    [invaderXim.magic.spell.EARTH_CAROL       ] = { 1, invaderXim.effect.CAROL,     invaderXim.element.EARTH,         invaderXim.mod.CAROL_EFFECT,    0,                        0,                   20, 200,  80,   8, 10, true  },
    [invaderXim.magic.spell.LIGHTNING_CAROL   ] = { 1, invaderXim.effect.CAROL,     invaderXim.element.THUNDER,       invaderXim.mod.CAROL_EFFECT,    0,                        0,                   20, 200,  80,   8, 10, true  },
    [invaderXim.magic.spell.WATER_CAROL       ] = { 1, invaderXim.effect.CAROL,     invaderXim.element.WATER,         invaderXim.mod.CAROL_EFFECT,    0,                        0,                   20, 200,  80,   8, 10, true  },
    [invaderXim.magic.spell.LIGHT_CAROL       ] = { 1, invaderXim.effect.CAROL,     invaderXim.element.LIGHT,         invaderXim.mod.CAROL_EFFECT,    0,                        0,                   20, 200,  80,   8, 10, true  },
    [invaderXim.magic.spell.DARK_CAROL        ] = { 1, invaderXim.effect.CAROL,     invaderXim.element.DARK,          invaderXim.mod.CAROL_EFFECT,    0,                        0,                   20, 200,  80,   8, 10, true  },
    -- [invaderXim.magic.spell.FIRE_CAROL_II     ] = { 2, invaderXim.effect.CAROL_II,  invaderXim.element.FIRE,        invaderXim.mod.ETUDE_EFFECT,    0,                        0,                   10, 400,  15, 1.5, 10, true  },
    -- [invaderXim.magic.spell.ICE_CAROL_II      ] = { 2, invaderXim.effect.CAROL_II,  invaderXim.element.ICE,         invaderXim.mod.ETUDE_EFFECT,    0,                        0,                   10, 400,  15, 1.5, 10, true  },
    -- [invaderXim.magic.spell.WIND_CAROL_II     ] = { 2, invaderXim.effect.CAROL_II,  invaderXim.element.WIND,        invaderXim.mod.ETUDE_EFFECT,    0,                        0,                   10, 400,  15, 1.5, 10, true  },
    -- [invaderXim.magic.spell.EARTH_CAROL_II    ] = { 2, invaderXim.effect.CAROL_II,  invaderXim.element.EARTH,       invaderXim.mod.ETUDE_EFFECT,    0,                        0,                   10, 400,  15, 1.5, 10, true  },
    -- [invaderXim.magic.spell.LIGHTNING_CAROL_II] = { 2, invaderXim.effect.CAROL_II,  invaderXim.element.THUNDER,     invaderXim.mod.ETUDE_EFFECT,    0,                        0,                   10, 400,  15, 1.5, 10, true  },
    -- [invaderXim.magic.spell.WATER_CAROL_II    ] = { 2, invaderXim.effect.CAROL_II,  invaderXim.element.WATER,       invaderXim.mod.ETUDE_EFFECT,    0,                        0,                   10, 400,  15, 1.5, 10, true  },
    -- [invaderXim.magic.spell.LIGHT_CAROL_II    ] = { 2, invaderXim.effect.CAROL_II,  invaderXim.element.LIGHT,       invaderXim.mod.ETUDE_EFFECT,    0,                        0,                   10, 400,  15, 1.5, 10, true  },
    -- [invaderXim.magic.spell.DARK_CAROL_II     ] = { 2, invaderXim.effect.CAROL_II,  invaderXim.element.DARK,        invaderXim.mod.ETUDE_EFFECT,    0,                        0,                   10, 400,  15, 1.5, 10, true  },
    -- Etude
    [invaderXim.magic.spell.SINEWY_ETUDE      ] = { 1, invaderXim.effect.ETUDE,     invaderXim.mod.STR,               invaderXim.mod.ETUDE_EFFECT,    0,                        0,                    3,   0,   9,   1,  0, true  },
    [invaderXim.magic.spell.DEXTROUS_ETUDE    ] = { 1, invaderXim.effect.ETUDE,     invaderXim.mod.DEX,               invaderXim.mod.ETUDE_EFFECT,    0,                        0,                    3,   0,   9,   1,  0, true  },
    [invaderXim.magic.spell.VIVACIOUS_ETUDE   ] = { 1, invaderXim.effect.ETUDE,     invaderXim.mod.VIT,               invaderXim.mod.ETUDE_EFFECT,    0,                        0,                    3,   0,   9,   1,  0, true  },
    [invaderXim.magic.spell.QUICK_ETUDE       ] = { 1, invaderXim.effect.ETUDE,     invaderXim.mod.AGI,               invaderXim.mod.ETUDE_EFFECT,    0,                        0,                    3,   0,   9,   1,  0, true  },
    [invaderXim.magic.spell.LEARNED_ETUDE     ] = { 1, invaderXim.effect.ETUDE,     invaderXim.mod.INT,               invaderXim.mod.ETUDE_EFFECT,    0,                        0,                    3,   0,   9,   1,  0, true  },
    [invaderXim.magic.spell.SPIRITED_ETUDE    ] = { 1, invaderXim.effect.ETUDE,     invaderXim.mod.MND,               invaderXim.mod.ETUDE_EFFECT,    0,                        0,                    3,   0,   9,   1,  0, true  },
    [invaderXim.magic.spell.ENCHANTING_ETUDE  ] = { 1, invaderXim.effect.ETUDE,     invaderXim.mod.CHR,               invaderXim.mod.ETUDE_EFFECT,    0,                        0,                    3,   0,   9,   1,  0, true  },
    [invaderXim.magic.spell.HERCULEAN_ETUDE   ] = { 2, invaderXim.effect.ETUDE,     invaderXim.mod.STR,               invaderXim.mod.ETUDE_EFFECT,    0,                        0,                   12,   0,  15,   1,  0, true  },
    [invaderXim.magic.spell.UNCANNY_ETUDE     ] = { 2, invaderXim.effect.ETUDE,     invaderXim.mod.DEX,               invaderXim.mod.ETUDE_EFFECT,    0,                        0,                   12,   0,  15,   1,  0, true  },
    [invaderXim.magic.spell.VITAL_ETUDE       ] = { 2, invaderXim.effect.ETUDE,     invaderXim.mod.VIT,               invaderXim.mod.ETUDE_EFFECT,    0,                        0,                   12,   0,  15,   1,  0, true  },
    [invaderXim.magic.spell.SWIFT_ETUDE       ] = { 2, invaderXim.effect.ETUDE,     invaderXim.mod.AGI,               invaderXim.mod.ETUDE_EFFECT,    0,                        0,                   12,   0,  15,   1,  0, true  },
    [invaderXim.magic.spell.SAGE_ETUDE        ] = { 2, invaderXim.effect.ETUDE,     invaderXim.mod.INT,               invaderXim.mod.ETUDE_EFFECT,    0,                        0,                   12,   0,  15,   1,  0, true  },
    [invaderXim.magic.spell.LOGICAL_ETUDE     ] = { 2, invaderXim.effect.ETUDE,     invaderXim.mod.MND,               invaderXim.mod.ETUDE_EFFECT,    0,                        0,                   12,   0,  15,   1,  0, true  },
    [invaderXim.magic.spell.BEWITCHING_ETUDE  ] = { 2, invaderXim.effect.ETUDE,     invaderXim.mod.CHR,               invaderXim.mod.ETUDE_EFFECT,    0,                        0,                   12,   0,  15,   1,  0, true  },
    -- Madrigal: ADMITEDLY MADE UP IN ORIGINAL SCRIPT
    [invaderXim.magic.spell.SWORD_MADRIGAL    ] = { 1, invaderXim.effect.MADRIGAL,  invaderXim.mod.AUGMENT_SONG_STAT, invaderXim.mod.MADRIGAL_EFFECT, invaderXim.merit.MADRIGAL_EFFECT, 0,                    5,  85,  45, 4.5, 18, true  },
    [invaderXim.magic.spell.BLADE_MADRIGAL    ] = { 2, invaderXim.effect.MADRIGAL,  invaderXim.mod.AUGMENT_SONG_STAT, invaderXim.mod.MADRIGAL_EFFECT, invaderXim.merit.MADRIGAL_EFFECT, 0,                    9, 130,  60,   6, 18, true  },
    -- Mambo: ADMITEDLY MADE UP IN ORIGINAL SCRIPT
    [invaderXim.magic.spell.SHEEPFOE_MAMBO    ] = { 1, invaderXim.effect.MAMBO,     invaderXim.mod.AUGMENT_SONG_STAT, invaderXim.mod.MAMBO_EFFECT,    0,                        0,                    5,  85,  48,   5, 18, true  },
    [invaderXim.magic.spell.DRAGONFOE_MAMBO   ] = { 2, invaderXim.effect.MAMBO,     invaderXim.mod.AUGMENT_SONG_STAT, invaderXim.mod.MAMBO_EFFECT,    0,                        0,                    9, 130,  48,   7, 18, true  },
    -- March
    [invaderXim.magic.spell.ADVANCING_MARCH   ] = { 1, invaderXim.effect.MARCH,     invaderXim.mod.AUGMENT_SONG_STAT, invaderXim.mod.MARCH_EFFECT,    0,                        0,                   35, 200, 108,  11,  7, true  },
    [invaderXim.magic.spell.VICTORY_MARCH     ] = { 2, invaderXim.effect.MARCH,     invaderXim.mod.AUGMENT_SONG_STAT, invaderXim.mod.MARCH_EFFECT,    0,                        0,                   43, 300, 163,  16,  7, true  },
    [invaderXim.magic.spell.HONOR_MARCH       ] = { 3, invaderXim.effect.MARCH,     invaderXim.mod.AUGMENT_SONG_STAT, invaderXim.mod.MARCH_EFFECT,    0,                        0,                   24, 400, 126,  12,  7, true  }, -- Not an error. It is weaker.
    -- Minne: Skill Caps unknown?
    [invaderXim.magic.spell.KNIGHTS_MINNE     ] = { 1, invaderXim.effect.MINNE,     invaderXim.mod.AUGMENT_SONG_STAT, invaderXim.mod.MINNE_EFFECT,    invaderXim.merit.MINNE_EFFECT,    invaderXim.jp.MINNE_EFFECT,   8,   0,  30,   3, 10, true  },
    [invaderXim.magic.spell.KNIGHTS_MINNE_II  ] = { 2, invaderXim.effect.MINNE,     invaderXim.mod.AUGMENT_SONG_STAT, invaderXim.mod.MINNE_EFFECT,    invaderXim.merit.MINNE_EFFECT,    invaderXim.jp.MINNE_EFFECT,  12,   0,  69,   7, 10, true  },
    [invaderXim.magic.spell.KNIGHTS_MINNE_III ] = { 3, invaderXim.effect.MINNE,     invaderXim.mod.AUGMENT_SONG_STAT, invaderXim.mod.MINNE_EFFECT,    invaderXim.merit.MINNE_EFFECT,    invaderXim.jp.MINNE_EFFECT,  18,   0, 108,  11, 10, true  },
    [invaderXim.magic.spell.KNIGHTS_MINNE_IV  ] = { 4, invaderXim.effect.MINNE,     invaderXim.mod.AUGMENT_SONG_STAT, invaderXim.mod.MINNE_EFFECT,    invaderXim.merit.MINNE_EFFECT,    invaderXim.jp.MINNE_EFFECT,  30,   0, 164,  16, 10, true  },
    [invaderXim.magic.spell.KNIGHTS_MINNE_V   ] = { 5, invaderXim.effect.MINNE,     invaderXim.mod.AUGMENT_SONG_STAT, invaderXim.mod.MINNE_EFFECT,    invaderXim.merit.MINNE_EFFECT,    invaderXim.jp.MINNE_EFFECT,  50,   0, 204,  20, 10, true  },
    -- Minuet
    [invaderXim.magic.spell.VALOR_MINUET      ] = { 1, invaderXim.effect.MINUET,    invaderXim.mod.AUGMENT_SONG_STAT, invaderXim.mod.MINUET_EFFECT,   invaderXim.merit.MINUET_EFFECT,   invaderXim.jp.MINUET_EFFECT,  5,  50,  32,  3, 4.3, true  }, -- skill cap 163: (163 - 50)/4.3 + 5 ~31
    [invaderXim.magic.spell.VALOR_MINUET_II   ] = { 2, invaderXim.effect.MINUET,    invaderXim.mod.AUGMENT_SONG_STAT, invaderXim.mod.MINUET_EFFECT,   invaderXim.merit.MINUET_EFFECT,   invaderXim.jp.MINUET_EFFECT, 10, 100,  64,  6, 3.9, true  }, -- skill cap 310: (310 - 100)/3.9 + 10 ~64
    [invaderXim.magic.spell.VALOR_MINUET_III  ] = { 3, invaderXim.effect.MINUET,    invaderXim.mod.AUGMENT_SONG_STAT, invaderXim.mod.MINUET_EFFECT,   invaderXim.merit.MINUET_EFFECT,   invaderXim.jp.MINUET_EFFECT, 24, 200,  96,  9, 3.5, true  }, -- skill cap 455: (455 - 200)/3.5 + 24 ~96
    [invaderXim.magic.spell.VALOR_MINUET_IV   ] = { 4, invaderXim.effect.MINUET,    invaderXim.mod.AUGMENT_SONG_STAT, invaderXim.mod.MINUET_EFFECT,   invaderXim.merit.MINUET_EFFECT,   invaderXim.jp.MINUET_EFFECT, 31, 300, 112, 11, 3.3, true  }, -- skill cap 570: (570 - 300)/3.3 + 31 ~112
    [invaderXim.magic.spell.VALOR_MINUET_V    ] = { 5, invaderXim.effect.MINUET,    invaderXim.mod.AUGMENT_SONG_STAT, invaderXim.mod.MINUET_EFFECT,   invaderXim.merit.MINUET_EFFECT,   invaderXim.jp.MINUET_EFFECT, 32, 500, 124, 12,   4, true  }, -- skill cap 874: (874 - 500)/4 + 32 ~124
    -- Paeon
    [invaderXim.magic.spell.ARMYS_PAEON       ] = { 1, invaderXim.effect.PAEON,     invaderXim.mod.AUGMENT_SONG_STAT, invaderXim.mod.PAEON_EFFECT,    0,                        0,                    1, 100,   2,   1,  0, true  },
    [invaderXim.magic.spell.ARMYS_PAEON_II    ] = { 2, invaderXim.effect.PAEON,     invaderXim.mod.AUGMENT_SONG_STAT, invaderXim.mod.PAEON_EFFECT,    0,                        0,                    2, 150,   3,   1,  0, true  },
    [invaderXim.magic.spell.ARMYS_PAEON_III   ] = { 3, invaderXim.effect.PAEON,     invaderXim.mod.AUGMENT_SONG_STAT, invaderXim.mod.PAEON_EFFECT,    0,                        0,                    3, 200,   4,   1,  0, true  },
    [invaderXim.magic.spell.ARMYS_PAEON_IV    ] = { 4, invaderXim.effect.PAEON,     invaderXim.mod.AUGMENT_SONG_STAT, invaderXim.mod.PAEON_EFFECT,    0,                        0,                    4, 250,   5,   1,  0, true  },
    [invaderXim.magic.spell.ARMYS_PAEON_V     ] = { 5, invaderXim.effect.PAEON,     invaderXim.mod.AUGMENT_SONG_STAT, invaderXim.mod.PAEON_EFFECT,    0,                        0,                    5, 350,   7,   1,  0, true  },
    [invaderXim.magic.spell.ARMYS_PAEON_VI    ] = { 6, invaderXim.effect.PAEON,     invaderXim.mod.AUGMENT_SONG_STAT, invaderXim.mod.PAEON_EFFECT,    0,                        0,                    6, 450,   8,   1,  0, true  },
    -- Prelude
    [invaderXim.magic.spell.HUNTERS_PRELUDE   ] = { 1, invaderXim.effect.PRELUDE,   invaderXim.mod.AUGMENT_SONG_STAT, invaderXim.mod.PRELUDE_EFFECT,  0,                        0,                   10,  85,  45, 4.5, 18, true  },
    [invaderXim.magic.spell.ARCHERS_PRELUDE   ] = { 2, invaderXim.effect.PRELUDE,   invaderXim.mod.AUGMENT_SONG_STAT, invaderXim.mod.PRELUDE_EFFECT,  0,                        0,                   20, 130,  60,   6, 18, true  },
    -- Status effect resistance: Aubade, Capriccio, Gavotte, Operetta, Pastoral,
    [invaderXim.magic.spell.FOWL_AUBADE       ] = { 1, invaderXim.effect.AUBADE,    invaderXim.mod.AUGMENT_SONG_STAT, 0,                      0,                        0,                   20, 200,  80,   8, 10, true  },
    [invaderXim.magic.spell.GOLD_CAPRICCIO    ] = { 1, invaderXim.effect.CAPRICCIO, invaderXim.mod.AUGMENT_SONG_STAT, 0,                      0,                        0,                   20, 200,  80,   8, 10, true  },
    [invaderXim.magic.spell.GOBLIN_GAVOTTE    ] = { 1, invaderXim.effect.GAVOTTE,   invaderXim.mod.AUGMENT_SONG_STAT, 0,                      0,                        0,                   20, 200,  80,   8, 10, true  },
    [invaderXim.magic.spell.SCOPS_OPERETTA    ] = { 1, invaderXim.effect.OPERETTA,  invaderXim.mod.AUGMENT_SONG_STAT, 0,                      0,                        0,                   20, 200,  80,   8, 10, true  },
    [invaderXim.magic.spell.PUPPETS_OPERETTA  ] = { 2, invaderXim.effect.OPERETTA,  invaderXim.mod.AUGMENT_SONG_STAT, 0,                      0,                        0,                   40, 200, 120,   8, 10, true  },
    [invaderXim.magic.spell.HERB_PASTORAL     ] = { 1, invaderXim.effect.PASTORAL,  invaderXim.mod.AUGMENT_SONG_STAT, 0,                      0,                        0,                   20, 200,  80,   8, 10, true  },
    [invaderXim.magic.spell.SHINING_FANTASIA  ] = { 1, invaderXim.effect.FANTASIA,  invaderXim.mod.AUGMENT_SONG_STAT, 0,                      0,                        0,                   20, 200,  80,   8, 10, true  },
    [invaderXim.magic.spell.WARDING_ROUND     ] = { 1, invaderXim.effect.ROUND,     invaderXim.mod.AUGMENT_SONG_STAT, 0,                      0,                        0,                   20, 200,  80,   8, 10, true  },
    -- Misc.
    [invaderXim.magic.spell.GODDESSS_HYMNUS   ] = { 1, invaderXim.effect.HYMNUS,    invaderXim.mod.AUGMENT_SONG_STAT, 0,                      0,                        0,                    1,   0,   1,   0,  0, false },
    [invaderXim.magic.spell.SENTINELS_SCHERZO ] = { 1, invaderXim.effect.SCHERZO,   invaderXim.mod.AUGMENT_SONG_STAT, 0,                      0,                        0,                    1, 350,  45,   1, 10, false },
    [invaderXim.magic.spell.RAPTOR_MAZURKA    ] = { 1, invaderXim.effect.MAZURKA,   invaderXim.mod.AUGMENT_SONG_STAT, 0,                      0,                        0,                    5,   0,  12,   0,  0, false },
    [invaderXim.magic.spell.CHOCOBO_MAZURKA   ] = { 1, invaderXim.effect.MAZURKA,   invaderXim.mod.AUGMENT_SONG_STAT, 0,                      0,                        0,                   10,   0,  24,   0,  0, false },

    -- Emnity Songs
    [invaderXim.magic.spell.FOE_SIRVENTE      ] = { 1, invaderXim.effect.SIRVENTE,  invaderXim.mod.AUGMENT_SONG_STAT, 0,                      0,                        0,                   35,   0,  35,   1,  0, true  },
    [invaderXim.magic.spell.ADVENTURERS_DIRGE ] = { 1, invaderXim.effect.DIRGE,     invaderXim.mod.AUGMENT_SONG_STAT, 0,                      0,                        0,                   32,   0,  32,   0,  0, true  },
}

-- Enhancing Song Potency function. (1/2)
invaderXim.spells.enhancing.calculateSongPower = function(caster, target, spell, spellId, tier, songEffect, instrumentBoost, soulVoicePower)
    local power       = pTable[spellId][column.POWER_BASE] -- The variable we want to calculate.
    local meritEffect = pTable[spellId][column.MERIT_ID]
    local jpEffect    = pTable[spellId][column.JOB_POINT_ID]
    local skillNeeded = pTable[spellId][column.SKILL_REQUIREMENT]
    local potencyCap  = pTable[spellId][column.POWER_CAP]
    local multiplier  = pTable[spellId][column.MULTIPLIER]
    local divisor     = pTable[spellId][column.DIVISOR]
    local singingLvl  = caster:getSkillLevel(invaderXim.skill.SINGING)

    if caster:isPC() then
        -- Add ranged skill level ONLY if it's an instrument.
        local rangeType = caster:getWeaponSkillType(invaderXim.slot.RANGED)

        -- String instruments have half the skill effectiveness and amplify the AoE in exchange.
        if rangeType == invaderXim.skill.WIND_INSTRUMENT then
            singingLvl = singingLvl + caster:getSkillLevel(rangeType)
        elseif rangeType == invaderXim.skill.STRING_INSTRUMENT then
            singingLvl = singingLvl + math.floor(caster:getSkillLevel(rangeType) / 2)
        end
    else
        singingLvl = singingLvl * 2
    end

    -- Get Potency bonuses from Singing Skill and Instrument Skill. TODO: Investigate JP-Wiki. Most of this makes no sense.
    -- NOTE: Tier 1 Etudes.
    if songEffect == invaderXim.effect.ETUDE and tier == 1 then
        if singingLvl >= 450 then
            power = power + 6
        elseif singingLvl >= 397 then
            power = power + 5
        elseif singingLvl >= 343 then
            power = power + 4
        elseif singingLvl >= 289 then
            power = power + 3
        elseif singingLvl >= 236 then
            power = power + 2
        elseif singingLvl >= 182 then
            power = power + 1
        end
    -- NOTE: Tier 2 Etudes.
    elseif songEffect == invaderXim.effect.ETUDE and tier == 2 then
        if singingLvl >= 475 then
            power = power + 3
        elseif singingLvl >= 446 then
            power = power + 2
        elseif singingLvl >= 417 then
            power = power + 1
        end
    -- Other songs.
    else
        if singingLvl > skillNeeded then
            -- NOTE: Paeon
            if divisor == 0 then
                if skillNeeded > 0 then
                    power = power + 1
                end
            -- NOTE: Aubade, Capriccio, Gavotte, Madrigal, March, Minne, Minuet, Operetta, Pastoral, Prelude, Round.
            else
                power = math.floor(power + (singingLvl - skillNeeded) / divisor)
            end
        end

        -- NOTE: Ballad, Hymnus, Mazurka have constant base power.
    end

    -- Apply Cap to power. (Applied before Merits, Job-Points and Status-Effects)
    if power > potencyCap then
        power = potencyCap
    end

    -- Instrument song boost. (All Songs +X, SONG_NAME +X)
    power = math.floor(power + instrumentBoost * multiplier)

    -- Additional Potency from Merits.
    if meritEffect ~= 0 then
        power = math.floor(power + caster:getMerit(meritEffect))
    end

    -- Additional Potency from Job Points.
    if jpEffect ~= 0 then
        power = math.floor(power + caster:getJobPointLevel(jpEffect))
    end

    -- Additional Potency from Status Effects.
    if soulVoicePower then -- Soul Voice/Macarato affects Power.
        if caster:hasStatusEffect(invaderXim.effect.SOUL_VOICE) then
            power = math.floor(power * 2)
        elseif caster:hasStatusEffect(invaderXim.effect.MARCATO) then
            power = math.floor(power * 1.5)
        end
    end

    -- EXCEPTION: AUGMENT_SONG_STAT works differently for etudes, becouse they already boost an stat. And becouse we can't have anything be straightforward in this game.
    if songEffect == invaderXim.effect.ETUDE then
        power = power + caster:getMod(invaderXim.mod.AUGMENT_SONG_STAT)
    end

    -- Finish
    return power
end

-- Enhancing Song Duration function. (2/2)
invaderXim.spells.enhancing.calculateSongDuration = function(caster, target, spell, instrumentBoost, soulVoicePower)
    local duration = 120 -- The variable we want to calculate.

    -- Additional duration from "Song Bonus" (from instruments) and "Duration Bonus" Modifier
    duration = math.floor(duration * ((instrumentBoost * 0.1) + (caster:getMod(invaderXim.mod.SONG_DURATION_BONUS) / 100) + 1))

    -- Additional duration from Job points.
    if caster:hasStatusEffect(invaderXim.effect.CLARION_CALL) then
        duration = math.floor(duration + caster:getJobPointLevel(invaderXim.jp.CLARION_CALL_EFFECT) * 2)
    end

    if caster:hasStatusEffect(invaderXim.effect.MARCATO) then
        duration = math.floor(duration + caster:getJobPointLevel(invaderXim.jp.MARCATO_EFFECT))
        caster:delStatusEffect(invaderXim.effect.MARCATO)
    end

    if caster:hasStatusEffect(invaderXim.effect.TENUTO) then
        duration = math.floor(duration + caster:getJobPointLevel(invaderXim.jp.TENUTO_EFFECT) * 2)
    end

    -- Additional duration from Status Effects.
    if not soulVoicePower then -- Soul Voice/Macarato doesn't affect potency, so it affects Duration.
        if caster:hasStatusEffect(invaderXim.effect.SOUL_VOICE) then
            duration = math.floor(duration * 2)
        elseif caster:hasStatusEffect(invaderXim.effect.MARCATO) then
            duration = math.floor(duration * 1.5)
        end
    end

    if caster:hasStatusEffect(invaderXim.effect.TROUBADOUR) then
        duration = math.floor(duration * 2)
    end

    -- Finish
    return duration
end

-- Main function for Enhancing Songs.
invaderXim.spells.enhancing.useEnhancingSong = function(caster, target, spell)
    local spellId   = spell:getID()
    local paramFour = 0

    -- Get Variables from Parameters Table.
    local tier            = pTable[spellId][column.EFFECT_TIER]
    local songEffect      = pTable[spellId][column.EFFECT_MAIN]
    local subEffect       = 0
    local instrumentBoost = caster:getMod(pTable[spellId][column.MODIFIER]) + caster:getMod(invaderXim.mod.ALL_SONGS_EFFECT)
    local soulVoicePower  = pTable[spellId][column.SOUL_VOICE]

    -- Calculate Song Pottency, Duration and SubEffect.
    local power    = invaderXim.spells.enhancing.calculateSongPower(caster, target, spell, spellId, tier, songEffect, instrumentBoost, soulVoicePower)
    local duration = invaderXim.spells.enhancing.calculateSongDuration(caster, target, spell, instrumentBoost, soulVoicePower)

    -- Handle subEffect
    if songEffect == invaderXim.effect.CAROL then
        subEffect = pTable[spellId][column.EFFECT_SUB] + (caster:getMod(invaderXim.mod.AUGMENT_SONG_STAT) * 100)
    elseif songEffect == invaderXim.effect.ETUDE then
        subEffect = pTable[spellId][column.EFFECT_SUB]
    else
        subEffect = caster:getMod(pTable[spellId][column.EFFECT_SUB])
    end

    -- EXCEPTION: Tier 2 Ettudes Fourth Parameter.
    if songEffect == invaderXim.effect.ETUDE and tier == 2 then
        paramFour = 10
    end

    -- EXCEPTION: March Songs effect conversion.
    if songEffect == invaderXim.effect.MARCH then
        power = math.floor((power / 1024) * 10000)
    end

    -- Handle Status Effects.
    if caster:hasStatusEffect(invaderXim.effect.MARCATO) then
        caster:delStatusEffect(invaderXim.effect.MARCATO)
    end

    -- Change message when higher effect already in place.
    if not target:addBardSong(caster, songEffect, power, paramFour, duration, caster:getID(), subEffect, tier) then
        spell:setMsg(invaderXim.msg.basic.MAGIC_NO_EFFECT)
    end

    return songEffect
end
