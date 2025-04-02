-----------------------------------
-- Enfeebling Spell Utilities
-- Used for spells that deal negative status effects upon targets.
-----------------------------------
require('scripts/globals/combat/element_tables')
require('scripts/globals/combat/magic_hit_rate')
require('scripts/globals/combat/status_effect_tables')
require('scripts/globals/jobpoints')
require('scripts/globals/magicburst')
require('scripts/globals/utils')
-----------------------------------
xi = xi or {}
invaderXim.spells = invaderXim.spells or {}
invaderXim.spells.enfeebling = invaderXim.spells.enfeebling or {}
-----------------------------------
local column =
{
    EFFECT_ID      = 1,
    STAT_USED      = 2,
    BASE_POTENCY   = 3,
    BASE_TICK      = 4,
    BASE_DURATION  = 5,
    RESIST_STAGES  = 6,
    MESSAGE_OFFSET = 7,
    SABOTEUR       = 8,
    BONUS_MACC     = 9,
}

local pTable =
{   --                                  1                             2          3      4    5         6       7    8          9
    --                  [Spell ID ] = { Effect,                       Stat-Used, pBase, DoT, Duration, Resist, msg, pSaboteur, mAcc },
    -- Black Magic
    [invaderXim.magic.spell.BIND          ] = { invaderXim.effect.BIND,               invaderXim.mod.INT,    0,   0,       60,      2,   0, false,       0 },
    [invaderXim.magic.spell.BINDGA        ] = { invaderXim.effect.BIND,               invaderXim.mod.INT,    0,   0,       60,      2,   0, false,       0 },
    [invaderXim.magic.spell.BLIND         ] = { invaderXim.effect.BLINDNESS,          invaderXim.mod.INT,    0,   0,      180,      2,   0, true,        0 },
    [invaderXim.magic.spell.BLIND_II      ] = { invaderXim.effect.BLINDNESS,          invaderXim.mod.INT,    0,   0,      180,      2,   0, true,        0 },
    [invaderXim.magic.spell.BLINDGA       ] = { invaderXim.effect.BLINDNESS,          invaderXim.mod.INT,    0,   0,      180,      2,   0, true,        0 },
    [invaderXim.magic.spell.BREAK         ] = { invaderXim.effect.PETRIFICATION,      invaderXim.mod.INT,    1,   0,       30,      2,   0, false,       0 },
    [invaderXim.magic.spell.BREAKGA       ] = { invaderXim.effect.PETRIFICATION,      invaderXim.mod.INT,    1,   0,       30,      2,   0, false,       0 },
    [invaderXim.magic.spell.BURN          ] = { invaderXim.effect.BURN,               invaderXim.mod.INT,    0,   3,       90,      3,   1, true,        0 },
    [invaderXim.magic.spell.CHOKE         ] = { invaderXim.effect.CHOKE,              invaderXim.mod.INT,    0,   3,       90,      3,   1, true,        0 },
    [invaderXim.magic.spell.CURSE         ] = { invaderXim.effect.CURSE_I,            invaderXim.mod.INT,   50,   0,      300,      2,   0, false,       0 },
    [invaderXim.magic.spell.DISPEL        ] = { invaderXim.effect.NONE,               invaderXim.mod.INT,    0,   0,        0,      4,   0, false,     175 },
    [invaderXim.magic.spell.DISPELGA      ] = { invaderXim.effect.NONE,               invaderXim.mod.INT,    0,   0,        0,      4,   0, false,       0 },
    [invaderXim.magic.spell.DISTRACT      ] = { invaderXim.effect.EVASION_DOWN,       invaderXim.mod.MND,    0,   0,      120,      2,   0, true,      150 },
    [invaderXim.magic.spell.DISTRACT_II   ] = { invaderXim.effect.EVASION_DOWN,       invaderXim.mod.MND,    0,   0,      120,      2,   0, true,      150 },
    [invaderXim.magic.spell.DISTRACT_III  ] = { invaderXim.effect.EVASION_DOWN,       invaderXim.mod.MND,    0,   0,      120,      2,   0, true,      150 },
    [invaderXim.magic.spell.DROWN         ] = { invaderXim.effect.DROWN,              invaderXim.mod.INT,    0,   3,       90,      3,   1, true,        0 },
    [invaderXim.magic.spell.FRAZZLE       ] = { invaderXim.effect.MAGIC_EVASION_DOWN, invaderXim.mod.MND,    0,   0,      120,      2,   0, true,      150 },
    [invaderXim.magic.spell.FRAZZLE_II    ] = { invaderXim.effect.MAGIC_EVASION_DOWN, invaderXim.mod.MND,    0,   0,      120,      2,   0, true,      150 },
    [invaderXim.magic.spell.FRAZZLE_III   ] = { invaderXim.effect.MAGIC_EVASION_DOWN, invaderXim.mod.MND,    0,   0,      120,      2,   0, true,      150 },
    [invaderXim.magic.spell.FROST         ] = { invaderXim.effect.FROST,              invaderXim.mod.INT,    0,   3,       90,      3,   1, true,        0 },
    [invaderXim.magic.spell.GRAVITY       ] = { invaderXim.effect.WEIGHT,             invaderXim.mod.INT,   26,   0,      120,      2,   0, true,        0 },
    [invaderXim.magic.spell.GRAVITY_II    ] = { invaderXim.effect.WEIGHT,             invaderXim.mod.INT,   32,   0,      180,      2,   0, true,        0 },
    [invaderXim.magic.spell.GRAVIGA       ] = { invaderXim.effect.WEIGHT,             invaderXim.mod.INT,   50,   0,      120,      2,   0, true,        0 },
    [invaderXim.magic.spell.POISON        ] = { invaderXim.effect.POISON,             invaderXim.mod.INT,    0,   3,       90,      2,   0, true,        0 },
    [invaderXim.magic.spell.POISON_II     ] = { invaderXim.effect.POISON,             invaderXim.mod.INT,    0,   3,      120,      2,   0, true,       30 },
    [invaderXim.magic.spell.POISON_III    ] = { invaderXim.effect.POISON,             invaderXim.mod.INT,    0,   3,      150,      2,   0, true,        0 },
    [invaderXim.magic.spell.POISONGA      ] = { invaderXim.effect.POISON,             invaderXim.mod.INT,    0,   3,       90,      2,   0, true,        0 },
    [invaderXim.magic.spell.POISONGA_II   ] = { invaderXim.effect.POISON,             invaderXim.mod.INT,    0,   3,      120,      2,   0, true,        0 },
    [invaderXim.magic.spell.POISONGA_III  ] = { invaderXim.effect.POISON,             invaderXim.mod.INT,    0,   3,      150,      2,   0, true,        0 },
    [invaderXim.magic.spell.RASP          ] = { invaderXim.effect.RASP,               invaderXim.mod.INT,    0,   3,       90,      3,   1, true,        0 },
    [invaderXim.magic.spell.SHOCK         ] = { invaderXim.effect.SHOCK,              invaderXim.mod.INT,    0,   3,       90,      3,   1, true,        0 },
    [invaderXim.magic.spell.SLEEP         ] = { invaderXim.effect.SLEEP_I,            invaderXim.mod.INT,    1,   0,       60,      2,   0, false,       0 },
    [invaderXim.magic.spell.SLEEP_II      ] = { invaderXim.effect.SLEEP_I,            invaderXim.mod.INT,    2,   0,       90,      2,   0, false,       0 },
    [invaderXim.magic.spell.SLEEPGA       ] = { invaderXim.effect.SLEEP_I,            invaderXim.mod.INT,    1,   0,       60,      2,   0, false,       0 },
    [invaderXim.magic.spell.SLEEPGA_II    ] = { invaderXim.effect.SLEEP_I,            invaderXim.mod.INT,    2,   0,       90,      2,   0, false,       0 },
    [invaderXim.magic.spell.STUN          ] = { invaderXim.effect.STUN,               invaderXim.mod.INT,    1,   0,        5,      4,   0, false,     200 },
    [invaderXim.magic.spell.VIRUS         ] = { invaderXim.effect.PLAGUE,             invaderXim.mod.INT,    5,   3,       60,      2,   0, false,       0 },

    -- Black magic Helixes
    [invaderXim.magic.spell.GEOHELIX      ] = { invaderXim.effect.HELIX,              invaderXim.mod.INT,    0,  10,       30,      0,   0, false,       0 },
    [invaderXim.magic.spell.GEOHELIX_II   ] = { invaderXim.effect.HELIX,              invaderXim.mod.INT,    0,  10,       30,      0,   0, false,       0 },
    [invaderXim.magic.spell.HYDROHELIX    ] = { invaderXim.effect.HELIX,              invaderXim.mod.INT,    0,  10,       30,      0,   0, false,       0 },
    [invaderXim.magic.spell.HYDROHELIX_II ] = { invaderXim.effect.HELIX,              invaderXim.mod.INT,    0,  10,       30,      0,   0, false,       0 },
    [invaderXim.magic.spell.ANEMOHELIX    ] = { invaderXim.effect.HELIX,              invaderXim.mod.INT,    0,  10,       30,      0,   0, false,       0 },
    [invaderXim.magic.spell.ANEMOHELIX_II ] = { invaderXim.effect.HELIX,              invaderXim.mod.INT,    0,  10,       30,      0,   0, false,       0 },
    [invaderXim.magic.spell.PYROHELIX     ] = { invaderXim.effect.HELIX,              invaderXim.mod.INT,    0,  10,       30,      0,   0, false,       0 },
    [invaderXim.magic.spell.PYROHELIX_II  ] = { invaderXim.effect.HELIX,              invaderXim.mod.INT,    0,  10,       30,      0,   0, false,       0 },
    [invaderXim.magic.spell.CRYOHELIX     ] = { invaderXim.effect.HELIX,              invaderXim.mod.INT,    0,  10,       30,      0,   0, false,       0 },
    [invaderXim.magic.spell.CRYOHELIX_II  ] = { invaderXim.effect.HELIX,              invaderXim.mod.INT,    0,  10,       30,      0,   0, false,       0 },
    [invaderXim.magic.spell.IONOHELIX     ] = { invaderXim.effect.HELIX,              invaderXim.mod.INT,    0,  10,       30,      0,   0, false,       0 },
    [invaderXim.magic.spell.IONOHELIX_II  ] = { invaderXim.effect.HELIX,              invaderXim.mod.INT,    0,  10,       30,      0,   0, false,       0 },
    [invaderXim.magic.spell.NOCTOHELIX    ] = { invaderXim.effect.HELIX,              invaderXim.mod.INT,    0,  10,       30,      0,   0, false,       0 },
    [invaderXim.magic.spell.NOCTOHELIX_II ] = { invaderXim.effect.HELIX,              invaderXim.mod.INT,    0,  10,       30,      0,   0, false,       0 },
    [invaderXim.magic.spell.LUMINOHELIX   ] = { invaderXim.effect.HELIX,              invaderXim.mod.INT,    0,  10,       30,      0,   0, false,       0 },
    [invaderXim.magic.spell.LUMINOHELIX_II] = { invaderXim.effect.HELIX,              invaderXim.mod.INT,    0,  10,       30,      0,   0, false,       0 },

    -- White Magic
    [invaderXim.magic.spell.ADDLE         ] = { invaderXim.effect.ADDLE,              invaderXim.mod.MND,   30,   0,      180,      2,   0, true,        0 },
    [invaderXim.magic.spell.FLASH         ] = { invaderXim.effect.FLASH,              invaderXim.mod.MND,  300,   0,       12,      4,   0, true,      200 },
    [invaderXim.magic.spell.INUNDATION    ] = { invaderXim.effect.INUNDATION,         invaderXim.mod.MND,    1,   0,      300,      5,   0, false,       0 },
    [invaderXim.magic.spell.PARALYZE      ] = { invaderXim.effect.PARALYSIS,          invaderXim.mod.MND,    0,   0,      120,      2,   0, true,      -10 },
    [invaderXim.magic.spell.PARALYZE_II   ] = { invaderXim.effect.PARALYSIS,          invaderXim.mod.MND,    0,   0,      120,      2,   0, true,        0 },
    [invaderXim.magic.spell.PARALYGA      ] = { invaderXim.effect.PARALYSIS,          invaderXim.mod.MND,    0,   0,      120,      2,   0, true,        0 },
    [invaderXim.magic.spell.REPOSE        ] = { invaderXim.effect.SLEEP_I,            invaderXim.mod.MND,    2,   0,       90,      2,   1, false,       0 },
    [invaderXim.magic.spell.SILENCE       ] = { invaderXim.effect.SILENCE,            invaderXim.mod.MND,    1,   0,      120,      2,   0, false,       0 },
    [invaderXim.magic.spell.SILENCEGA     ] = { invaderXim.effect.SILENCE,            invaderXim.mod.MND,    1,   0,      120,      2,   0, false,       0 },
    [invaderXim.magic.spell.SLOW          ] = { invaderXim.effect.SLOW,               invaderXim.mod.MND,    0,   0,      180,      2,   0, true,       10 },
    [invaderXim.magic.spell.SLOW_II       ] = { invaderXim.effect.SLOW,               invaderXim.mod.MND,    0,   0,      180,      2,   0, true,       10 },
    [invaderXim.magic.spell.SLOWGA        ] = { invaderXim.effect.SLOW,               invaderXim.mod.MND,    0,   0,      180,      2,   0, true,        0 },

    -- Ninjutsu
    [invaderXim.magic.spell.AISHA_ICHI    ] = { invaderXim.effect.ATTACK_DOWN,        invaderXim.mod.INT,   15,   0,      120,      4,   1, false,       0 },
    [invaderXim.magic.spell.DOKUMORI_ICHI ] = { invaderXim.effect.POISON,             invaderXim.mod.INT,    3,   3,       60,      2,   0, false,       0 },
    [invaderXim.magic.spell.DOKUMORI_NI   ] = { invaderXim.effect.POISON,             invaderXim.mod.INT,   10,   3,      120,      2,   0, false,       0 },
    [invaderXim.magic.spell.DOKUMORI_SAN  ] = { invaderXim.effect.POISON,             invaderXim.mod.INT,   20,   3,      360,      2,   0, false,       0 },
    [invaderXim.magic.spell.HOJO_ICHI     ] = { invaderXim.effect.SLOW,               invaderXim.mod.INT, 1465,   0,      180,      2,   0, false,       0 },
    [invaderXim.magic.spell.HOJO_NI       ] = { invaderXim.effect.SLOW,               invaderXim.mod.INT, 1953,   0,      300,      2,   0, false,       0 },
    [invaderXim.magic.spell.HOJO_SAN      ] = { invaderXim.effect.SLOW,               invaderXim.mod.INT, 2930,   0,      420,      2,   0, false,       0 },
    [invaderXim.magic.spell.JUBAKU_ICHI   ] = { invaderXim.effect.PARALYSIS,          invaderXim.mod.INT,   20,   0,      180,      2,   1, false,       0 },
    [invaderXim.magic.spell.JUBAKU_NI     ] = { invaderXim.effect.PARALYSIS,          invaderXim.mod.INT,   30,   0,      300,      2,   1, false,       0 },
    [invaderXim.magic.spell.JUBAKU_SAN    ] = { invaderXim.effect.PARALYSIS,          invaderXim.mod.INT,   35,   0,      420,      2,   1, false,       0 },
    [invaderXim.magic.spell.KURAYAMI_ICHI ] = { invaderXim.effect.BLINDNESS,          invaderXim.mod.INT,   20,   0,      180,      2,   0, false,       0 },
    [invaderXim.magic.spell.KURAYAMI_NI   ] = { invaderXim.effect.BLINDNESS,          invaderXim.mod.INT,   30,   0,      300,      2,   0, false,       0 },
    [invaderXim.magic.spell.KURAYAMI_SAN  ] = { invaderXim.effect.BLINDNESS,          invaderXim.mod.INT,   40,   0,      420,      2,   0, false,       0 },
    [invaderXim.magic.spell.YURIN_ICHI    ] = { invaderXim.effect.INHIBIT_TP,         invaderXim.mod.INT,   10,   0,      180,      3,   1, false,       0 },
}

local function getElementalDebuffPotency(caster, statUsed)
    local potency    = 1
    local casterStat = caster:getStat(statUsed)

    if casterStat > 150 then
        potency = potency + 4
    elseif casterStat > 100 then
        potency = potency + 3
    elseif casterStat > 70 then
        potency = potency + 2
    elseif casterStat > 40 then
        potency = potency + 1
    end

    potency = potency + caster:getMerit(invaderXim.merit.ELEMENTAL_DEBUFF_EFFECT) -- TODO: Add BLM Toban gear effect (potency) here.

    return potency
end

-- Calculate potency.
invaderXim.spells.enfeebling.calculatePotency = function(caster, target, spellId, spellEffect, skillType, statUsed)
    local potency    = pTable[spellId][column.BASE_POTENCY]
    local statDiff   = caster:getStat(statUsed) - target:getStat(statUsed)
    local skillLevel = caster:getSkillLevel(skillType)

    -- Calculate base potency for spells.
    switch (spellEffect) : caseof
    {
        [invaderXim.effect.BLINDNESS] = function()
            statDiff = caster:getStat(statUsed) - target:getStat(invaderXim.mod.MND)

            if spellId == invaderXim.magic.spell.BLIND_II then
                potency = utils.clamp(statDiff * 0.375 + 49, 19, 94) -- Values from JP wiki: http://wiki.ffo.jp/html/3449.html
            else
                potency = utils.clamp(statDiff * 0.225 + 23, 5, 50)  -- Values from JP wiki: http://wiki.ffo.jp/html/834.html
            end
        end,

        [invaderXim.effect.EVASION_DOWN] = function()
            if spellId == invaderXim.magic.spell.DISTRACT then
                potency = utils.clamp(skillLevel / 5, 0, 25) + utils.clamp(statDiff / 5, 0, 10)
            elseif spellId == invaderXim.magic.spell.DISTRACT_II then
                potency = utils.clamp(skillLevel * 4 / 35, 0, 40) + utils.clamp(statDiff / 5, 0, 10)
            else
                potency = utils.clamp(skillLevel / 5, 0, 120) + utils.clamp(statDiff / 5, 0, 10)
            end
        end,

        [invaderXim.effect.MAGIC_EVASION_DOWN] = function()
            if spellId == invaderXim.magic.spell.FRAZZLE then
                potency = utils.clamp(skillLevel / 5, 0, 25) + utils.clamp(statDiff / 5, 0, 10)
            elseif spellId == invaderXim.magic.spell.FRAZZLE_II then
                potency = utils.clamp(skillLevel * 4 / 35, 0, 40) + utils.clamp(statDiff / 5, 0, 10)
            else
                potency = utils.clamp(skillLevel / 5, 0, 120) + utils.clamp(statDiff / 5, 0, 10)
            end
        end,

        [invaderXim.effect.PARALYSIS] = function()
            if spellId == invaderXim.magic.spell.PARALYZE_II then
                potency = utils.clamp(statDiff / 4 + 24, 14, 34) -- Values from JP wiki: https://wiki.ffo.jp/html/3453.html
            else
                potency = utils.clamp(statDiff / 4 + 15, 5, 25)
            end
        end,

        [invaderXim.effect.POISON] = function()
            if
                spellId == invaderXim.magic.spell.POISON or
                spellId == invaderXim.magic.spell.POISONGA
            then
                potency = math.max(skillLevel / 25, 1)
                if skillLevel > 400 then
                    potency = math.min((skillLevel - 225) / 5, 55) -- Cap is 55 hp/tick.
                end
            elseif
                spellId == invaderXim.magic.spell.POISON_II or
                spellId == invaderXim.magic.spell.POISONGA_II
            then
                potency = math.max(skillLevel / 20, 4)
                if skillLevel > 400 then
                    potency = skillLevel * 49 / 183 - 55 -- No cap can be reached yet
                end
            else
                potency = skillLevel / 10 + 1
            end
        end,

        [invaderXim.effect.SLOW] = function()
            if spellId == invaderXim.magic.spell.SLOW_II then
                potency = utils.clamp(statDiff * 226 / 15 + 2780, 1650, 3910) -- https://wiki.ffo.jp/html/3454.html
            else
                potency = utils.clamp(statDiff * 73 / 5 + 1825, 730, 2920)
            end
        end,

        [invaderXim.effect.BURN] = function()
            potency = getElementalDebuffPotency(caster, statUsed)
        end,

        [invaderXim.effect.CHOKE] = function()
            potency = getElementalDebuffPotency(caster, statUsed)
        end,

        [invaderXim.effect.DROWN] = function()
            potency = getElementalDebuffPotency(caster, statUsed)
        end,

        [invaderXim.effect.FROST] = function()
            potency = getElementalDebuffPotency(caster, statUsed)
        end,

        [invaderXim.effect.RASP] = function()
            potency = getElementalDebuffPotency(caster, statUsed)
        end,

        [invaderXim.effect.SHOCK] = function()
            potency = getElementalDebuffPotency(caster, statUsed)
        end,
    }

    ---@cast potency integer
    potency = math.floor(potency)

    -- Apply Saboteur Effect when applicable.
    local applySaboteur = pTable[spellId][column.SABOTEUR]

    if
        applySaboteur and
        caster:hasStatusEffect(invaderXim.effect.SABOTEUR) and
        skillType == invaderXim.skill.ENFEEBLING_MAGIC
    then
        if target:isNM() then
            potency = math.floor(potency * (1.3 + caster:getMod(invaderXim.mod.ENHANCES_SABOTEUR)))
        else
            potency = math.floor(potency * (2 + caster:getMod(invaderXim.mod.ENHANCES_SABOTEUR)))
        end
    end

    -- General Enfeebling potency modifier.
    potency = math.floor(potency * (1 + caster:getMod(invaderXim.mod.ENF_MAG_POTENCY) / 100))

    return potency
end

-- Calculate duration before resist
invaderXim.spells.enfeebling.calculateDuration = function(caster, target, spellId, spellEffect, skillType)
    local duration = pTable[spellId][column.BASE_DURATION] -- Get base duration.

    -- BIND spells have a special random duration the follows a normal distribution with mean=30 and std=12
    if spellEffect == invaderXim.effect.BIND then
        -- Use the Box-Muller transform to change uniform dist sample to the normal dist sample
        local z0 = math.sqrt(-2 * math.log(math.random())) * math.cos(2 * math.pi * math.random())

        ---@cast duration integer
        duration = utils.clamp(math.floor(30 + z0 * 12), 1, duration)
    end

    -- Additions to base duration.
    if
        spellEffect == invaderXim.effect.BURN or
        spellEffect == invaderXim.effect.CHOKE or
        spellEffect == invaderXim.effect.DROWN or
        spellEffect == invaderXim.effect.FROST or
        spellEffect == invaderXim.effect.RASP or
        spellEffect == invaderXim.effect.SHOCK
    then
        duration = duration + caster:getMerit(invaderXim.merit.ELEMENTAL_DEBUFF_DURATION) -- TODO: Add BLM Toban gear effect (duration) here.

    elseif spellEffect == invaderXim.effect.HELIX then
        local casterLevel = caster:getMainLvl()

        if casterLevel >= 60 then
            duration = duration + 60
        elseif casterLevel >= 40 then
            duration = duration + 30
        end

        if caster:hasStatusEffect(invaderXim.effect.DARK_ARTS) then
            duration = duration + 3 * caster:getJobPointLevel(invaderXim.jp.DARK_ARTS_EFFECT)
        end

        duration = duration + caster:getMod(invaderXim.mod.HELIX_DURATION)
    end

    if skillType == invaderXim.skill.ENFEEBLING_MAGIC then
        if caster:hasStatusEffect(invaderXim.effect.SABOTEUR) then
            if target:isNM() then
                duration = duration * 1.25
            else
                duration = duration * 2
            end
        end

        -- After Saboteur according to bg-wiki
        if caster:getMainJob() == invaderXim.job.RDM then
            -- RDM Merit: Enfeebling Magic Duration
            duration = duration + caster:getMerit(invaderXim.merit.ENFEEBLING_MAGIC_DURATION)

            -- RDM Job Point: Enfeebling Magic Duration
            duration = duration + caster:getJobPointLevel(invaderXim.jp.ENFEEBLE_DURATION)

            -- RDM Job Point: Stymie effect
            if caster:hasStatusEffect(invaderXim.effect.STYMIE) then
                duration = duration + caster:getJobPointLevel(invaderXim.jp.STYMIE_EFFECT)
            end
        end
    end

    ---@cast duration integer
    return math.floor(duration)
end

-- Main function, called by spell scripts
invaderXim.spells.enfeebling.useEnfeeblingSpell = function(caster, target, spell)
    local spellId      = spell:getID()
    local spellElement = spell:getElement()
    local spellEffect  = pTable[spellId][column.EFFECT_ID]

    ------------------------------
    -- STEP 1: Check spell nullification.
    ------------------------------
    if invaderXim.combat.statusEffect.isTargetImmune(target, spellEffect, spellElement) then
        spell:setMsg(invaderXim.msg.basic.MAGIC_COMPLETE_RESIST)
        return spellEffect
    end

    -- Check trait nullification trigger.
    if invaderXim.combat.statusEffect.isTargetResistant(caster, target, spellEffect) then
        spell:setModifier(invaderXim.msg.actionModifier.RESIST)
        spell:setMsg(invaderXim.msg.basic.MAGIC_RESIST)
        return spellEffect
    end

    -- Target already has an status effect that nullifies current.
    if invaderXim.combat.statusEffect.isEffectNullified(target, spellEffect) then
        spell:setMsg(invaderXim.msg.basic.MAGIC_NO_EFFECT)
        return spellEffect
    end

    ------------------------------
    -- STEP 2: Calculate resist tiers.
    ------------------------------
    local skillType    = spell:getSkillType()
    local spellGroup   = spell:getSpellGroup()
    local statUsed     = pTable[spellId][column.STAT_USED]
    local resistStages = pTable[spellId][column.RESIST_STAGES]
    local message      = pTable[spellId][column.MESSAGE_OFFSET]
    local bonusMacc    = pTable[spellId][column.BONUS_MACC]
    local resistRate   = invaderXim.combat.magicHitRate.calculateResistRate(caster, target, spellGroup, skillType, 0, spellElement, statUsed, spellEffect, bonusMacc)

    if spellEffect ~= invaderXim.effect.NONE then
        -- Stymie
        if
            skillType == invaderXim.skill.ENFEEBLING_MAGIC and
            caster:hasStatusEffect(invaderXim.effect.STYMIE)
        then
            resistRate = 1

        -- Fealty
        elseif target:hasStatusEffect(invaderXim.effect.FEALTY) then
            resistRate = 0
        end
    end

    ------------------------------
    -- STEP 3: Check if spell resists and Immunobreak.
    ------------------------------
    if resistRate <= 1 / (2 ^ resistStages) then
        -- Attempt immunobreak. Fetch resistance rank modifier.
        local resistRank          = 0
        local immunobreakModifier = invaderXim.combat.statusEffect.getAssociatedImmunobreakModifier(spellEffect)
        local rankModifier        = target:getMod(immunobreakModifier)

        if spellElement ~= invaderXim.element.NONE then
            resistRank = target:getMod(invaderXim.combat.element.getElementalResistanceRankModifier(spellElement))
        end

        if
            invaderXim.settings.main.ENABLE_IMMUNOBREAK and
            caster:isPC() and
            target:isMob() and
            immunobreakModifier > 0 and                -- Only certain effects can be immunobroken.
            skillType == invaderXim.skill.ENFEEBLING_MAGIC and -- Only Enfeebling magic can immunobreak.
            (resistRank - rankModifier) > 4            -- Only mobs with a resistance rank of 5+ (50% EEM) can be immunobroken.
        then
            local immunobreakRandom = math.random(1, 100)
            local immunobreakChance = 16 / (1 + rankModifier) + caster:getMerit(invaderXim.merit.IMMUNOBREAK_CHANCE)

            -- We successfully trigger Immunobreak. Change target modifier and set correct message.
            if immunobreakRandom <= immunobreakChance then
                target:setMod(immunobreakModifier, rankModifier + 1) -- TODO: Add equipment modifier (x2) here.

                spell:setModifier(invaderXim.msg.actionModifier.IMMUNOBREAK)
            end
        end

        -- We still resited.
        spell:setMsg(invaderXim.msg.basic.MAGIC_RESIST)

        return spellEffect
    end

    ------------------------------
    -- STEP 4: Calculate Duration, Potency, Tick and Sub-Potency (additional effects)
    ------------------------------
    local potency    = invaderXim.spells.enfeebling.calculatePotency(caster, target, spellId, spellEffect, skillType, statUsed)
    local subpotency = 0
    local duration   = math.floor(invaderXim.spells.enfeebling.calculateDuration(caster, target, spellId, spellEffect, skillType) * resistRate)
    local tick       = pTable[spellId][column.BASE_TICK]

    ------------------------------
    -- STEP 5: Exceptions.
    ------------------------------
    -- Bind: Dependant on target speed.
    -- Bind: Duration floor of 5 seconds.
    if spellEffect == invaderXim.effect.BIND then
        potency = target:getSpeed()
        duration = utils.clamp(duration, 5, 60)

    -- TODO: This is unnecesary, but, for now, we will comply with core.
    elseif spellEffect == invaderXim.effect.SLEEP_I then
        subpotency = spellElement

    -- Addle: Has sub-effect.
    elseif spellEffect == invaderXim.effect.ADDLE then
        subpotency = 20 + utils.clamp(math.floor((caster:getStat(statUsed) - target:getStat(statUsed)) / 5), 0, 20)

    -- Break: Player petrification sucks.
    elseif spellEffect == invaderXim.effect.PETRIFICATION then
        if caster:isPC() then
            subpotency = 1
        end

    -- Dispel: It's special in that it has no real effect.
    elseif spellEffect == invaderXim.effect.NONE then
        spellEffect = target:dispelStatusEffect()

        if spellEffect == invaderXim.effect.NONE then
            spell:setMsg(invaderXim.msg.basic.MAGIC_NO_EFFECT)
        else
            spell:setMsg(invaderXim.msg.basic.MAGIC_ERASE)
        end

        return spellEffect
    end

    ------------------------------
    -- STEP 6: Final Operations.
    ------------------------------
    if target:addStatusEffect(spellEffect, potency, tick, duration, 0, subpotency) then
        -- Delete Stymie effect
        if
            skillType == invaderXim.skill.ENFEEBLING_MAGIC and
            caster:hasStatusEffect(invaderXim.effect.STYMIE)
        then
            caster:delStatusEffect(invaderXim.effect.STYMIE)
        end

        -- Add "Magic Burst!" message
        local _, skillchainCount = invaderXim.magicburst.formMagicBurst(spellElement, target) -- External function. Not present in magic.lua.

        if skillchainCount > 0 then
            spell:setMsg(invaderXim.msg.basic.MAGIC_BURST_ENFEEB_IS - message * 3)
            caster:triggerRoeEvent(invaderXim.roeTrigger.MAGIC_BURST)
        else
            spell:setMsg(invaderXim.msg.basic.MAGIC_ENFEEB_IS + message)
        end
    else
        spell:setMsg(invaderXim.msg.basic.MAGIC_NO_EFFECT)
    end

    return spellEffect
end
