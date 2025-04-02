-----------------------------------
-- Enhancing Spell Utilities
-----------------------------------
require('scripts/globals/jobpoints')
require('scripts/globals/utils')
-----------------------------------
xi = xi or {}
invaderXim.spells = invaderXim.spells or {}
invaderXim.spells.enhancing = invaderXim.spells.enhancing or {}
-----------------------------------
-- File structure:
-- 2 Basic Functions to calculate final potency. Called by the main function.
-- 1 Basic Function to calculate final duration. Called by the main function.
-- 1 Main function, called by spell scripts.

local column =
{
    EFFECT_TIER           = 1,
    EFFECT_ID             = 2,
    EFFECT_LEVEL          = 3,
    EFFECT_POWER          = 4,
    EFFECT_DURATION       = 5,
    EFFECT_COMPOSURE      = 6,
    EFFECT_WILL_OVERWRITE = 7,
    EFFECT_TICK_RATE      = 8,
}

-- Table variables.
local pTable =
{
--                                     1     2            3            4           5              6          7                 8
-- Structure:            [spellId] = { Tier, Main_Effect, Spell_Level, Base_Power, Base_Duration, Composure, Always_Overwrite, Tick_Seconds },

    -- Aquaveil
    [invaderXim.magic.spell.AQUAVEIL     ] = { 1, invaderXim.effect.AQUAVEIL,       1,    1,  600, true,  true,  0 },

    -- Auspice
    [invaderXim.magic.spell.AUSPICE      ] = { 1, invaderXim.effect.AUSPICE,       55,    0,  180, true,  false, 0 },

    -- Bar-Element
    [invaderXim.magic.spell.BARAERO      ] = { 1, invaderXim.effect.BARAERO,        1,    0,  480, true,  true,  0 },
    [invaderXim.magic.spell.BARBLIZZARD  ] = { 1, invaderXim.effect.BARBLIZZARD,    1,    0,  480, true,  true,  0 },
    [invaderXim.magic.spell.BARFIRE      ] = { 1, invaderXim.effect.BARFIRE,        1,    0,  480, true,  true,  0 },
    [invaderXim.magic.spell.BARSTONE     ] = { 1, invaderXim.effect.BARSTONE,       1,    0,  480, true,  true,  0 },
    [invaderXim.magic.spell.BARTHUNDER   ] = { 1, invaderXim.effect.BARTHUNDER,     1,    0,  480, true,  true,  0 },
    [invaderXim.magic.spell.BARWATER     ] = { 1, invaderXim.effect.BARWATER,       1,    0,  480, true,  true,  0 },
    [invaderXim.magic.spell.BARAERA      ] = { 2, invaderXim.effect.BARAERO,        1,    0,  480, true,  true,  0 },
    [invaderXim.magic.spell.BARBLIZZARA  ] = { 2, invaderXim.effect.BARBLIZZARD,    1,    0,  480, true,  true,  0 },
    [invaderXim.magic.spell.BARFIRA      ] = { 2, invaderXim.effect.BARFIRE,        1,    0,  480, true,  true,  0 },
    [invaderXim.magic.spell.BARSTONRA    ] = { 2, invaderXim.effect.BARSTONE,       1,    0,  480, true,  true,  0 },
    [invaderXim.magic.spell.BARTHUNDRA   ] = { 2, invaderXim.effect.BARTHUNDER,     1,    0,  480, true,  true,  0 },
    [invaderXim.magic.spell.BARWATERA    ] = { 2, invaderXim.effect.BARWATER,       1,    0,  480, true,  true,  0 },

    -- Bar-Effect
    [invaderXim.magic.spell.BARAMNESIA   ] = { 1, invaderXim.effect.BARAMNESIA,     1,   20,  480, true,  true,  0 },
    [invaderXim.magic.spell.BARBLIND     ] = { 1, invaderXim.effect.BARBLIND,       1,   20,  480, true,  true,  0 },
    [invaderXim.magic.spell.BARPARALYZE  ] = { 1, invaderXim.effect.BARPARALYZE,    1,   20,  480, true,  true,  0 },
    [invaderXim.magic.spell.BARPETRIFY   ] = { 1, invaderXim.effect.BARPETRIFY,     1,   20,  480, true,  true,  0 },
    [invaderXim.magic.spell.BARPOISON    ] = { 1, invaderXim.effect.BARPOISON,      1,   20,  480, true,  true,  0 },
    [invaderXim.magic.spell.BARSILENCE   ] = { 1, invaderXim.effect.BARSILENCE,     1,   20,  480, true,  true,  0 },
    [invaderXim.magic.spell.BARSLEEP     ] = { 1, invaderXim.effect.BARSLEEP,       1,   20,  480, true,  true,  0 },
    [invaderXim.magic.spell.BARVIRUS     ] = { 1, invaderXim.effect.BARVIRUS,       1,   20,  480, true,  true,  0 },
    [invaderXim.magic.spell.BARAMNESRA   ] = { 2, invaderXim.effect.BARAMNESIA,     1,   20,  480, true,  true,  0 },
    [invaderXim.magic.spell.BARBLINDRA   ] = { 2, invaderXim.effect.BARBLIND,       1,   20,  480, true,  true,  0 },
    [invaderXim.magic.spell.BARPARALYZRA ] = { 2, invaderXim.effect.BARPARALYZE,    1,   20,  480, true,  true,  0 },
    [invaderXim.magic.spell.BARPETRA     ] = { 2, invaderXim.effect.BARPETRIFY,     1,   20,  480, true,  true,  0 },
    [invaderXim.magic.spell.BARPOISONRA  ] = { 2, invaderXim.effect.BARPOISON,      1,   20,  480, true,  true,  0 },
    [invaderXim.magic.spell.BARSILENCERA ] = { 2, invaderXim.effect.BARSILENCE,     1,   20,  480, true,  true,  0 },
    [invaderXim.magic.spell.BARSLEEPRA   ] = { 2, invaderXim.effect.BARSLEEP,       1,   20,  480, true,  true,  0 },
    [invaderXim.magic.spell.BARVIRA      ] = { 2, invaderXim.effect.BARVIRUS,       1,   20,  480, true,  true,  0 },

    -- Blink
    [invaderXim.magic.spell.BLINK        ] = { 1, invaderXim.effect.BLINK,          1,    2,  300, true,  false, 0 },

    -- Boost-Stat
    [invaderXim.magic.spell.BOOST_STR    ] = { 1, invaderXim.effect.STR_BOOST,      1,    5,  300, true,  false, 0 },
    [invaderXim.magic.spell.BOOST_DEX    ] = { 1, invaderXim.effect.DEX_BOOST,      1,    5,  300, true,  false, 0 },
    [invaderXim.magic.spell.BOOST_VIT    ] = { 1, invaderXim.effect.VIT_BOOST,      1,    5,  300, true,  false, 0 },
    [invaderXim.magic.spell.BOOST_AGI    ] = { 1, invaderXim.effect.AGI_BOOST,      1,    5,  300, true,  false, 0 },
    [invaderXim.magic.spell.BOOST_INT    ] = { 1, invaderXim.effect.INT_BOOST,      1,    5,  300, true,  false, 0 },
    [invaderXim.magic.spell.BOOST_MND    ] = { 1, invaderXim.effect.MND_BOOST,      1,    5,  300, true,  false, 0 },
    [invaderXim.magic.spell.BOOST_CHR    ] = { 1, invaderXim.effect.CHR_BOOST,      1,    5,  300, true,  false, 0 },

    -- Crusade
    [invaderXim.magic.spell.CRUSADE      ] = { 1, invaderXim.effect.ENMITY_BOOST,  88,   30,  300, true,  false, 0 },

    -- Deodorize / Invisible / Sneak
    [invaderXim.magic.spell.DEODORIZE    ] = { 1, invaderXim.effect.DEODORIZE,     15,    0,  420, true,  false, 10 },
    [invaderXim.magic.spell.INVISIBLE    ] = { 1, invaderXim.effect.INVISIBLE,     20,    0,  420, true,  false, 10 },
    [invaderXim.magic.spell.SNEAK        ] = { 1, invaderXim.effect.SNEAK,         20,    0,  420, true,  false, 10 },

    -- Embrava
    [invaderXim.magic.spell.EMBRAVA      ] = { 1, invaderXim.effect.EMBRAVA,        5,    0,   90, true,  true,  0 },

    -- En-Spell
    [invaderXim.magic.spell.ENAERO       ] = { 1, invaderXim.effect.ENAERO,        20,    0,  180, true,  false, 0 },
    [invaderXim.magic.spell.ENBLIZZARD   ] = { 1, invaderXim.effect.ENBLIZZARD,    22,    0,  180, true,  false, 0 },
    [invaderXim.magic.spell.ENFIRE       ] = { 1, invaderXim.effect.ENFIRE,        24,    0,  180, true,  false, 0 },
    [invaderXim.magic.spell.ENSTONE      ] = { 1, invaderXim.effect.ENSTONE,       18,    0,  180, true,  false, 0 },
    [invaderXim.magic.spell.ENTHUNDER    ] = { 1, invaderXim.effect.ENTHUNDER,     16,    0,  180, true,  false, 0 },
    [invaderXim.magic.spell.ENWATER      ] = { 1, invaderXim.effect.ENWATER,       27,    0,  180, true,  false, 0 },
    [invaderXim.magic.spell.ENAERO_II    ] = { 2, invaderXim.effect.ENAERO_II,     54,    0,  180, true,  false, 0 },
    [invaderXim.magic.spell.ENBLIZZARD_II] = { 2, invaderXim.effect.ENBLIZZARD_II, 56,    0,  180, true,  false, 0 },
    [invaderXim.magic.spell.ENFIRE_II    ] = { 2, invaderXim.effect.ENFIRE_II,     58,    0,  180, true,  false, 0 },
    [invaderXim.magic.spell.ENSTONE_II   ] = { 2, invaderXim.effect.ENSTONE_II,    52,    0,  180, true,  false, 0 },
    [invaderXim.magic.spell.ENTHUNDER_II ] = { 2, invaderXim.effect.ENTHUNDER_II,  50,    0,  180, true,  false, 0 },
    [invaderXim.magic.spell.ENWATER_II   ] = { 2, invaderXim.effect.ENWATER_II,    60,    0,  180, true,  false, 0 },

    -- Flurry
    [invaderXim.magic.spell.FLURRY       ] = { 1, invaderXim.effect.FLURRY_II,     48,   15,  180, true,  false, 0 }, -- Thats the actual effect. Not a typo.
    [invaderXim.magic.spell.FLURRY_II    ] = { 2, invaderXim.effect.FLURRY_II,     96,   30,  180, true,  false, 0 }, -- Thats the actual effect. Not a typo.

    -- Foil
    [invaderXim.magic.spell.FOIL         ] = { 1, invaderXim.effect.FOIL,          58,  150,   30, true,  false, 3 },

    -- Gain-Stat
    [invaderXim.magic.spell.GAIN_STR     ] = { 1, invaderXim.effect.STR_BOOST,      1,    5,  300, true,  false, 0 },
    [invaderXim.magic.spell.GAIN_DEX     ] = { 1, invaderXim.effect.DEX_BOOST,      1,    5,  300, true,  false, 0 },
    [invaderXim.magic.spell.GAIN_VIT     ] = { 1, invaderXim.effect.VIT_BOOST,      1,    5,  300, true,  false, 0 },
    [invaderXim.magic.spell.GAIN_AGI     ] = { 1, invaderXim.effect.AGI_BOOST,      1,    5,  300, true,  false, 0 },
    [invaderXim.magic.spell.GAIN_INT     ] = { 1, invaderXim.effect.INT_BOOST,      1,    5,  300, true,  false, 0 },
    [invaderXim.magic.spell.GAIN_MND     ] = { 1, invaderXim.effect.MND_BOOST,      1,    5,  300, true,  false, 0 },
    [invaderXim.magic.spell.GAIN_CHR     ] = { 1, invaderXim.effect.CHR_BOOST,      1,    5,  300, true,  false, 0 },

    -- Haste
    [invaderXim.magic.spell.HASTE        ] = { 1, invaderXim.effect.HASTE,         48, 1465,  180, true,  false, 0 },
    [invaderXim.magic.spell.HASTE_II     ] = { 2, invaderXim.effect.HASTE,         96, 2998,  180, true,  false, 0 },
    [invaderXim.magic.spell.HASTEGA      ] = { 1, invaderXim.effect.HASTE,         48, 1494,  180, false, false, 0 },
    -- [invaderXim.magic.spell.HASTEGA_II   ] = { 2, invaderXim.effect.HASTE,         99, 2998,  180, false, false, 0 },

    -- Phalanx
    [invaderXim.magic.spell.PHALANX      ] = { 1, invaderXim.effect.PHALANX,       33,    0,  180, true,  false, 0 },
    [invaderXim.magic.spell.PHALANX_II   ] = { 2, invaderXim.effect.PHALANX,       75,    0,  240, true,  false, 0 },

    -- Protect / Protectra
    [invaderXim.magic.spell.PROTECT      ] = { 1, invaderXim.effect.PROTECT,        7,   20, 1800, false, false, 0 },
    [invaderXim.magic.spell.PROTECT_II   ] = { 2, invaderXim.effect.PROTECT,       27,   50, 1800, false, false, 0 },
    [invaderXim.magic.spell.PROTECT_III  ] = { 3, invaderXim.effect.PROTECT,       47,   90, 1800, false, false, 0 },
    [invaderXim.magic.spell.PROTECT_IV   ] = { 4, invaderXim.effect.PROTECT,       63,  140, 1800, false, false, 0 },
    [invaderXim.magic.spell.PROTECT_V    ] = { 5, invaderXim.effect.PROTECT,       76,  220, 1800, false, false, 0 },
    [invaderXim.magic.spell.PROTECTRA    ] = { 1, invaderXim.effect.PROTECT,        7,   20, 1800, false, false, 0 },
    [invaderXim.magic.spell.PROTECTRA_II ] = { 2, invaderXim.effect.PROTECT,       27,   50, 1800, false, false, 0 },
    [invaderXim.magic.spell.PROTECTRA_III] = { 3, invaderXim.effect.PROTECT,       47,   90, 1800, false, false, 0 },
    [invaderXim.magic.spell.PROTECTRA_IV ] = { 4, invaderXim.effect.PROTECT,       63,  140, 1800, false, false, 0 },
    [invaderXim.magic.spell.PROTECTRA_V  ] = { 5, invaderXim.effect.PROTECT,       75,  220, 1800, false, false, 0 },

    -- Refresh
    [invaderXim.magic.spell.REFRESH      ] = { 1, invaderXim.effect.REFRESH,       41,    3,  150, true,  true,  0 },
    [invaderXim.magic.spell.REFRESH_II   ] = { 2, invaderXim.effect.REFRESH,       82,    6,  150, true,  true,  0 },
    [invaderXim.magic.spell.REFRESH_III  ] = { 3, invaderXim.effect.REFRESH,       99,    9,  150, true,  true,  0 },

    -- Regen
    [invaderXim.magic.spell.REGEN        ] = { 1, invaderXim.effect.REGEN,         21,    5,   75, true,  false, 0 },
    [invaderXim.magic.spell.REGEN_II     ] = { 2, invaderXim.effect.REGEN,         44,   12,   60, true,  false, 0 },
    [invaderXim.magic.spell.REGEN_III    ] = { 3, invaderXim.effect.REGEN,         66,   20,   60, true,  false, 0 },
    [invaderXim.magic.spell.REGEN_IV     ] = { 4, invaderXim.effect.REGEN,         86,   30,   60, true,  false, 0 },
    [invaderXim.magic.spell.REGEN_V      ] = { 5, invaderXim.effect.REGEN,         99,   40,   60, true,  false, 0 },

    -- Shell / Shellra
    [invaderXim.magic.spell.SHELL        ] = { 1, invaderXim.effect.SHELL,         18, 1055, 1800, false, false, 0 },
    [invaderXim.magic.spell.SHELL_II     ] = { 2, invaderXim.effect.SHELL,         37, 1641, 1800, false, false, 0 },
    [invaderXim.magic.spell.SHELL_III    ] = { 3, invaderXim.effect.SHELL,         57, 2188, 1800, false, false, 0 },
    [invaderXim.magic.spell.SHELL_IV     ] = { 4, invaderXim.effect.SHELL,         68, 2617, 1800, false, false, 0 },
    [invaderXim.magic.spell.SHELL_V      ] = { 5, invaderXim.effect.SHELL,         76, 2930, 1800, false, false, 0 },
    [invaderXim.magic.spell.SHELLRA      ] = { 1, invaderXim.effect.SHELL,         18, 1055, 1800, false, false, 0 },
    [invaderXim.magic.spell.SHELLRA_II   ] = { 2, invaderXim.effect.SHELL,         37, 1641, 1800, false, false, 0 },
    [invaderXim.magic.spell.SHELLRA_III  ] = { 3, invaderXim.effect.SHELL,         57, 2188, 1800, false, false, 0 },
    [invaderXim.magic.spell.SHELLRA_IV   ] = { 4, invaderXim.effect.SHELL,         68, 2617, 1800, false, false, 0 },
    [invaderXim.magic.spell.SHELLRA_V    ] = { 5, invaderXim.effect.SHELL,         75, 2930, 1800, false, false, 0 },

    -- Stoneskin
    [invaderXim.magic.spell.STONESKIN    ] = { 1, invaderXim.effect.STONESKIN,     28,    0,  300, true,  false, 0 },

    -- -Spikes
    [invaderXim.magic.spell.BLAZE_SPIKES ] = { 1, invaderXim.effect.BLAZE_SPIKES,   1,    0,  180, true,  false, 0 },
    [invaderXim.magic.spell.ICE_SPIKES   ] = { 1, invaderXim.effect.ICE_SPIKES,     1,    0,  180, true,  false, 0 },
    [invaderXim.magic.spell.SHOCK_SPIKES ] = { 1, invaderXim.effect.SHOCK_SPIKES,   1,    0,  180, true,  false, 0 },

    -- -storm
    [invaderXim.magic.spell.AURORASTORM  ] = { 1, invaderXim.effect.AURORASTORM,   48,    2,  180, true,  true, 0 },
    [invaderXim.magic.spell.FIRESTORM    ] = { 1, invaderXim.effect.FIRESTORM,     44,    2,  180, true,  true, 0 },
    [invaderXim.magic.spell.HAILSTORM    ] = { 1, invaderXim.effect.HAILSTORM,     45,    2,  180, true,  true, 0 },
    [invaderXim.magic.spell.RAINSTORM    ] = { 1, invaderXim.effect.RAINSTORM,     42,    2,  180, true,  true, 0 },
    [invaderXim.magic.spell.SANDSTORM    ] = { 1, invaderXim.effect.SANDSTORM,     41,    2,  180, true,  true, 0 },
    [invaderXim.magic.spell.THUNDERSTORM ] = { 1, invaderXim.effect.THUNDERSTORM,  46,    2,  180, true,  true, 0 },
    [invaderXim.magic.spell.VOIDSTORM    ] = { 1, invaderXim.effect.VOIDSTORM,     47,    2,  180, true,  true, 0 },
    [invaderXim.magic.spell.WINDSTORM    ] = { 1, invaderXim.effect.WINDSTORM,     43,    2,  180, true,  true, 0 },

    -- Temper
    [invaderXim.magic.spell.TEMPER       ] = { 1, invaderXim.effect.MULTI_STRIKES, 95,    5,  180, true,  false, 0 },
    [invaderXim.magic.spell.TEMPER_II    ] = { 2, invaderXim.effect.MULTI_STRIKES, 99,    5,  180, true,  false, 0 },
}

-- Enhancing Spell Base Potency function.
invaderXim.spells.enhancing.calculateEnhancingBasePower = function(caster, target, spell, spellId, spellEffect)
    local basePower  = pTable[spellId][column.EFFECT_POWER]
    local skillLevel = caster:getSkillLevel(spell:getSkillType())
    ------------------------------------------------------------
    -- Spell specific equations for potency. (Skill and stat)
    ------------------------------------------------------------

    -- Aquaveil
    if spellEffect == invaderXim.effect.AQUAVEIL then -- Skill Breakpoints per BG Wiki (2024-06-27): https://www.bg-wiki.com/bg/Aquaveil
        if skillLevel > 500 then -- 501+ Skill = 3 Interruptions
            basePower = basePower + 2
        elseif skillLevel > 300 then -- 301+ Skill = 2 Interruptions
            basePower = basePower + 1
        end

    -- Bar-Element
    elseif spellEffect >= invaderXim.effect.BARFIRE and spellEffect <= invaderXim.effect.BARWATER then
        if skillLevel > 300 then
            basePower = 25 + math.floor(skillLevel / 4) -- 150 at 500
        else
            basePower = 40 + math.floor(skillLevel / 5) -- 100 at 300
        end

        basePower = utils.clamp(basePower, 40, 150) -- Max is 150 and min is 40 at skill 0.

    -- Boost-Stat / Gain-Stat
    elseif
        spellEffect >= invaderXim.effect.STR_BOOST and
        spellEffect <= invaderXim.effect.CHR_BOOST
    then
        basePower = basePower + utils.clamp(math.floor((skillLevel - 300) / 10), 0, 20)

    -- Embrava
    elseif spellEffect == invaderXim.effect.EMBRAVA then
        basePower = math.min(skillLevel, 500)

    -- En-Spells (Info from from BG-Wiki) and Auspice
    elseif
        (spellEffect >= invaderXim.effect.ENFIRE and spellEffect <= invaderXim.effect.ENWATER) or
        (spellEffect >= invaderXim.effect.ENFIRE_II and spellEffect <= invaderXim.effect.ENWATER_II) or
        spellEffect == invaderXim.effect.AUSPICE
    then
        if skillLevel > 500 then
            basePower = math.floor(3 * (skillLevel + 50) / 25)
        elseif skillLevel > 400 then
            basePower = math.floor((skillLevel + 20) / 8)
        elseif skillLevel > 150 then
            basePower = math.floor(skillLevel / 20) + 5
        else
            basePower = math.max(math.floor(math.sqrt(skillLevel)) - 1, 0)
        end

    -- Phalanx
    elseif spellEffect == invaderXim.effect.PHALANX then
        if skillLevel > 300 then -- Phalanx I and II over 300 skill
            basePower = utils.clamp(math.floor((skillLevel - 300.5) / 28.5) + 28, 28, 35)
        else
            if spellId == invaderXim.magic.spell.PHALANX then -- Phalanx
                basePower = utils.clamp(math.floor(skillLevel / 10) - 2, 0, 35)
            else -- Phalanx II
                basePower = utils.clamp(math.floor(skillLevel / 25) + 16, 16, 35)
            end
        end

    -- Blaze Spikes (Info from from BG-Wiki)
    elseif spellEffect == invaderXim.effect.BLAZE_SPIKES then
        basePower = utils.clamp(math.floor(math.floor((caster:getStat(invaderXim.mod.INT) + 50) / 12) * (1 + caster:getMod(invaderXim.mod.MATT) / 100)), 1, 25)

    -- Ice Spikes, Shock Spikes (Info from from BG-Wiki)
    elseif
        spellEffect == invaderXim.effect.ICE_SPIKES or
        spellEffect == invaderXim.effect.SHOCK_SPIKES
    then
        basePower = utils.clamp(math.floor(math.floor((caster:getStat(invaderXim.mod.INT) + 50) / 20) * (1 + caster:getMod(invaderXim.mod.MATT) / 100)), 1, 15)

    -- Stoneskin
    elseif spellEffect == invaderXim.effect.STONESKIN then
        local threshold = skillLevel / 3 + caster:getStat(invaderXim.mod.MND)

        if threshold < 80 then
            basePower = threshold
        elseif threshold <= 130 then
            basePower = 2 * threshold - 60
        elseif threshold > 130 then
            basePower = 3 * threshold - 190
        end

        ---@cast basePower integer
        basePower = utils.clamp(math.floor(basePower), 1, invaderXim.settings.main.STONESKIN_CAP)

    -- Temper
    elseif spellEffect == invaderXim.effect.MULTI_STRIKES then
        if skillLevel >= 360 then
            basePower = math.floor((skillLevel - 300) / 10)
        end
    end

    return basePower
end

-- Enhancing Spell Final Potency function.
invaderXim.spells.enhancing.calculateEnhancingFinalPower = function(caster, target, spell, basePower, spellGroup, tier, spellEffect)
    local finalPower = basePower

    --------------------
    -- Enboden effect.
    --------------------
    --  Applied before other bonuses, pet buffs seem to not work.
    if
        not caster:isPet() and
        target:hasStatusEffect(invaderXim.effect.EMBOLDEN) and
        spellGroup == invaderXim.magic.spellGroup.WHITE
    then

        local emboldenPower = 1.5 + target:getJobPointLevel(invaderXim.jp.EMBOLDEN_EFFECT) / 100 -- 1 point in job point category = 1%

        finalPower = math.floor(finalPower * emboldenPower)
    end

    ----------------------------------------
    -- Spell specific modifiers for potency.
    ----------------------------------------

    -- TODO: Find a way to replace big if/else chain and still make it look good.

    -- Aquaveil
    if spellEffect == invaderXim.effect.AQUAVEIL then
        finalPower = finalPower + caster:getMod(invaderXim.mod.AQUAVEIL_COUNT) -- Aquaveil+ from gear applies during accession (https://www.bg-wiki.com/ffxi/Aquaveil)

    -- Bar-Element
    elseif spellEffect >= invaderXim.effect.BARFIRE and spellEffect <= invaderXim.effect.BARWATER then
        finalPower = finalPower + caster:getMerit(invaderXim.merit.BAR_SPELL_EFFECT) + caster:getMod(invaderXim.mod.BARSPELL_AMOUNT) + caster:getJobPointLevel(invaderXim.jp.BAR_SPELL_EFFECT) * 2

    -- Bar-Status
    elseif
        spellEffect == invaderXim.effect.BARAMNESIA or
        (spellEffect >= invaderXim.effect.BARSLEEP and spellEffect <= invaderXim.effect.BARVIRUS)
    then
        finalPower = finalPower + caster:getMerit(invaderXim.merit.BAR_SPELL_EFFECT)

    -- Protect/Protectra
    elseif spellEffect == invaderXim.effect.PROTECT then
        if target:getMod(invaderXim.mod.ENHANCES_PROT_SHELL_RCVD) > 0 then
            finalPower = finalPower + (tier * 2)
        end

        -- Handle "Shield Barrier" Job Trait.
        if
            caster:isPC() and
            caster:getMod(invaderXim.mod.SHIELD_BARRIER) > 0
        then
            finalPower = finalPower + caster:getShieldDefense()
        end

    -- Refresh
    elseif spellEffect == invaderXim.effect.REFRESH then
        finalPower = finalPower + caster:getMod(invaderXim.mod.ENHANCES_REFRESH)

    -- Regen
    elseif spellEffect == invaderXim.effect.REGEN then
        finalPower = math.ceil(finalPower * (1 + caster:getMod(invaderXim.mod.REGEN_MULTIPLIER) / 100)) -- Bonus HP from Gear.
        finalPower = finalPower + caster:getMerit(invaderXim.merit.REGEN_EFFECT) -- Bonus HP from Merits.
        finalPower = finalPower + caster:getMod(invaderXim.mod.LIGHT_ARTS_REGEN) -- Bonus HP from Light Arts.
        finalPower = finalPower + caster:getMod(invaderXim.mod.REGEN_BONUS)      -- Bonus HP from Job Point Gift.

    -- Shell/Shellra
    elseif spellEffect == invaderXim.effect.SHELL then
        if target:getMod(invaderXim.mod.ENHANCES_PROT_SHELL_RCVD) > 0 then
            finalPower = finalPower + (tier * 39)
        end

    -- Stoneskin
    elseif spellEffect == invaderXim.effect.STONESKIN then
        if caster == target then
            finalPower = utils.clamp(finalPower + caster:getMod(invaderXim.mod.STONESKIN_BONUS_HP), 1, invaderXim.settings.main.STONESKIN_CAP * 1.5)
        end

    -- -storm
    elseif
        spellEffect >= invaderXim.effect.FIRESTORM and
        spellEffect <= invaderXim.effect.VOIDSTORM
    then
        finalPower = finalPower + caster:getMerit(invaderXim.merit.STORMSURGE) + caster:getMod(invaderXim.mod.STORMSURGE_EFFECT)
    end

    return finalPower
end

-- Enhancing Spell Duration function.
invaderXim.spells.enhancing.calculateEnhancingDuration = function(caster, target, spell, spellId, spellGroup, spellEffect)
    local spellLevel   = pTable[spellId][column.EFFECT_LEVEL]
    local duration     = pTable[spellId][column.EFFECT_DURATION]
    local useComposure = pTable[spellId][column.EFFECT_COMPOSURE]
    local targetLevel  = target:getMainLvl()

    -- Deodorize, Invisible and Sneak have a random factor to base duration.
    if
        spellEffect == invaderXim.effect.DEODORIZE or
        spellEffect == invaderXim.effect.INVISIBLE or
        spellEffect == invaderXim.effect.SNEAK
    then
        duration = duration + 60 * math.random(0, 2)
    end

    --------------------
    -- Embolden, buffs cast by pet do not work.
    --------------------
    if
        not caster:isPet() and
        target:hasStatusEffect(invaderXim.effect.EMBOLDEN) and
        spellGroup == invaderXim.magic.spellGroup.WHITE
    then
        local emboldenDurationModifier = 0.5 + target:getMod(invaderXim.mod.EMBOLDEN_DURATION) / 100 -- 1 point = 1%
        duration = duration * emboldenDurationModifier
    end

    --------------------
    -- Gear mods
    --------------------
    duration = duration + duration * caster:getMod(invaderXim.mod.ENH_MAGIC_DURATION) / 100

    ------------------------------
    -- Merits and Job Points. (Applicable to all enhancing spells. Prior to multipliers, according to bg-wiki.)
    ------------------------------
    if caster:getMainJob() == invaderXim.job.RDM then
        duration = duration + caster:getMerit(invaderXim.merit.ENHANCING_MAGIC_DURATION) + caster:getJobPointLevel(invaderXim.jp.ENHANCING_DURATION)
    end

    --------------------------------------------------
    -- Spell specific modifiers for duration.
    --------------------------------------------------
    -- Regen
    if spellEffect == invaderXim.effect.REGEN then
        duration = duration + caster:getMod(invaderXim.mod.REGEN_DURATION)
        duration = duration + caster:getJobPointLevel(invaderXim.jp.REGEN_DURATION) * 3

    -- Invisible
    elseif spellEffect == invaderXim.effect.INVISIBLE then
        duration = duration + target:getMod(invaderXim.mod.INVISIBLE_DURATION)

    -- Sneak
    elseif spellEffect == invaderXim.effect.SNEAK then
        duration = duration + target:getMod(invaderXim.mod.SNEAK_DURATION)
    end

    --------------------
    -- Status Effects
    --------------------
    -- Composure
    if
        useComposure and
        caster:hasStatusEffect(invaderXim.effect.COMPOSURE) and
        caster:getID() == target:getID()
    then
        duration = duration * 3
    end

    -- Perpetuance (Doesnt affect spikes and other Black magic enhancements)
    if
        caster:hasStatusEffect(invaderXim.effect.PERPETUANCE) and
        spellGroup == invaderXim.magic.spellGroup.WHITE
    then
        duration  = duration * 2
    end

    ------------------------------
    -- Level penalty to duration.
    ------------------------------
    if targetLevel < spellLevel then
        duration = duration * targetLevel / spellLevel
    end

    return duration
end

-- Main function for Enhancing Spells.
invaderXim.spells.enhancing.useEnhancingSpell = function(caster, target, spell)
    local spellId           = spell:getID()
    local spellGroup        = spell:getSpellGroup()
    local magicDefenseBonus = 0

    -- Get Variables from Parameters Table.
    local tier            = pTable[spellId][column.EFFECT_TIER]
    local spellEffect     = pTable[spellId][column.EFFECT_ID]
    local alwaysOverwrite = pTable[spellId][column.EFFECT_WILL_OVERWRITE]
    local tickTime        = pTable[spellId][column.EFFECT_TICK_RATE]

    ------------------------------------------------------------
    -- Handle exceptions and weird behavior here, before calculating anything.
    ------------------------------------------------------------
    -- Bar-Element (They use addStatusEffect argument 6. Bar-Status current implementation doesn't.)
    if spellEffect >= invaderXim.effect.BARFIRE and spellEffect <= invaderXim.effect.BARWATER then
        magicDefenseBonus = caster:getMerit(invaderXim.merit.BAR_SPELL_EFFECT) + caster:getMod(invaderXim.mod.BARSPELL_MDEF_BONUS)

    -- Embrava
    elseif spellEffect == invaderXim.effect.EMBRAVA then
        -- If Tabula Rasa wears before spell goes off, no Embrava for you!
        if not caster:hasStatusEffect(invaderXim.effect.TABULA_RASA) then
            spell:setMsg(invaderXim.msg.basic.MAGIC_CANNOT_CAST)
            return 0
        end

    -- Refresh
    elseif spellEffect == invaderXim.effect.REFRESH then
        if
            target:hasStatusEffect(invaderXim.effect.SUBLIMATION_ACTIVATED) or
            target:hasStatusEffect(invaderXim.effect.SUBLIMATION_COMPLETE)
        then
            spell:setMsg(invaderXim.msg.basic.MAGIC_NO_EFFECT)
            return 0
        end

    -- Boost-Stat / Gain-Stat
    elseif
        spellEffect >= invaderXim.effect.STR_BOOST and
        spellEffect <= invaderXim.effect.CHR_BOOST
    then
        -- Only one Boost Effect can be active at once, so if the player has any we have to cancel & overwrite
        local effectOverwrite =
        {
            invaderXim.effect.STR_BOOST,
            invaderXim.effect.DEX_BOOST,
            invaderXim.effect.VIT_BOOST,
            invaderXim.effect.AGI_BOOST,
            invaderXim.effect.INT_BOOST,
            invaderXim.effect.MND_BOOST,
            invaderXim.effect.CHR_BOOST
        }

        for i, effectValue in ipairs(effectOverwrite) do
            if target:hasStatusEffect(effectValue) then
                target:delStatusEffect(effectValue)
            end
        end

    -- -storm spells
    elseif
        spellEffect >= invaderXim.effect.FIRESTORM and
        spellEffect <= invaderXim.effect.VOIDSTORM
    then
        -- Only one storm effect can be active at once, so if the player has any we have to cancel & overwrite
        local effectOverwrite =
        {
            invaderXim.effect.FIRESTORM,
            invaderXim.effect.SANDSTORM,
            invaderXim.effect.RAINSTORM,
            invaderXim.effect.WINDSTORM,
            invaderXim.effect.HAILSTORM,
            invaderXim.effect.THUNDERSTORM,
            invaderXim.effect.AURORASTORM,
            invaderXim.effect.VOIDSTORM
        }

        for i, effectValue in ipairs(effectOverwrite) do
            if target:hasStatusEffect(effectValue) then
                target:delStatusEffect(effectValue)
            end
        end
    end

    --------------------------------------------------
    -- Calculate Spell Pottency and Duration.
    --------------------------------------------------
    local basePower  = invaderXim.spells.enhancing.calculateEnhancingBasePower(caster, target, spell, spellId, spellEffect)
    local finalPower = invaderXim.spells.enhancing.calculateEnhancingFinalPower(caster, target, spell, basePower, spellGroup, tier, spellEffect)
    local duration   = invaderXim.spells.enhancing.calculateEnhancingDuration(caster, target, spell, spellId, spellGroup, spellEffect)

    ------------------------------
    -- Handle Status Effects, Embolden buffs can only be applied by player, so do not remove embolden..
    ------------------------------
    if
        not caster:isPet() and
        target:hasStatusEffect(invaderXim.effect.EMBOLDEN) and
        spellGroup == invaderXim.magic.spellGroup.WHITE
    then
        target:delStatusEffectSilent(invaderXim.effect.EMBOLDEN)
    end

    ------------------------------------------------------------
    -- Change message when higher effect or "Always overwrite".
    ------------------------------------------------------------
    if alwaysOverwrite then
        target:delStatusEffect(spellEffect)
        target:addStatusEffect(spellEffect, finalPower, tickTime, duration, 0, magicDefenseBonus, tier)
    else
        if target:addStatusEffect(spellEffect, finalPower, tickTime, duration, 0, magicDefenseBonus, tier) then
            spell:setMsg(invaderXim.msg.basic.MAGIC_GAIN_EFFECT)
        else
            spell:setMsg(invaderXim.msg.basic.MAGIC_NO_EFFECT) -- No effect.
        end
    end

    return spellEffect
end
