-----------------------------------
-- Corsair Job Utilities
-----------------------------------
require('scripts/globals/ability')
require('scripts/globals/jobpoints')
require('scripts/globals/utils')
-----------------------------------
xi = xi or {}
invaderXim.job_utils = invaderXim.job_utils or {}
invaderXim.job_utils.corsair = invaderXim.job_utils.corsair or {}
-----------------------------------

-- rollModifiers format: Effect Powers table, phantomBase, roll bonus increase, Effect, Mod, Optimal Job
-- NOTE: nil items below are nil values on purpose.  This might break if parameters are added to various bindings
-- TODO: replace 'nil' pet values with tables, handle multiple effects in case of pet roll. Will need core changes.
-- TODO: quantify Courser's Roll, no wiki seems to know what it is.
-- TODO: verify Corsair's Roll for subjob: see http://wiki.ffo.jp/html/6052.html
local corsairRollMods =
{
    [invaderXim.jobAbility.CORSAIRS_ROLL   ] = { {  10,  11,   11,  12,   20,   13,  15,   16,    8,   17,   24,   6 },   2,   0, invaderXim.effect.CORSAIRS_ROLL,    invaderXim.mod.EXP_BONUS,               invaderXim.job.COR  },
    [invaderXim.jobAbility.NINJA_ROLL      ] = { {   4,   5,    5,  14,    6,    7,   9,    2,   10,   11,   18,   6 },   2,   6, invaderXim.effect.NINJA_ROLL,       invaderXim.mod.EVA,                     invaderXim.job.NIN  },
    [invaderXim.jobAbility.HUNTERS_ROLL    ] = { {  10,  13,   15,  40,   18,   20,  25,    5,   27,   30,   50,   5 },   5,  15, invaderXim.effect.HUNTERS_ROLL,     invaderXim.mod.ACC,                     invaderXim.job.RNG  },
    [invaderXim.jobAbility.CHAOS_ROLL      ] = { {   6,   8,    9,  25,   11,   13,  16,    3,   17,   19,   31,  10 },   3,  10, invaderXim.effect.CHAOS_ROLL,       invaderXim.mod.ATTP,                    invaderXim.job.DRK  },
    [invaderXim.jobAbility.MAGUSS_ROLL     ] = { {   5,  20,    6,   8,    9,    3,  10,   13,   14,   15,   25,   5 },   2,   8, invaderXim.effect.MAGUSS_ROLL,      invaderXim.mod.MDEF,                    invaderXim.job.BLU  },
    [invaderXim.jobAbility.HEALERS_ROLL    ] = { {   3,   4,   12,   5,    6,    7,   1,    8,    9,   10,   16,   4 },   3,   4, invaderXim.effect.HEALERS_ROLL,     invaderXim.mod.CURE_POTENCY_RCVD,       invaderXim.job.WHM  },
    [invaderXim.jobAbility.DRACHEN_ROLL    ] = { {  10,  13,   15,  40,   18,   20,  25,    5,   28,   30,   50,  15 },   5,  15, invaderXim.effect.DRACHEN_ROLL,     nil,                            invaderXim.job.DRG  },
    [invaderXim.jobAbility.CHORAL_ROLL     ] = { {  13,  55,   17,  20,   25,    8,  30,   35,   40,   45,   65,  25 },   4,  25, invaderXim.effect.CHORAL_ROLL,      invaderXim.mod.SPELLINTERRUPT,          invaderXim.job.BRD  },
    [invaderXim.jobAbility.MONKS_ROLL      ] = { {   8,  10,   32,  12,   14,   16,   4,   20,   22,   24,   40,  11 },   4,  10, invaderXim.effect.MONKS_ROLL,       invaderXim.mod.SUBTLE_BLOW,             invaderXim.job.MNK  },
    [invaderXim.jobAbility.BEAST_ROLL      ] = { {   4,   5,    7,  19,    8,    9,  11,    2,   13,   14,   23,   7 },   3,  10, invaderXim.effect.BEAST_ROLL,       nil,                            invaderXim.job.BST  },
    [invaderXim.jobAbility.SAMURAI_ROLL    ] = { {   8,  32,   10,  12,   14,    4,  16,   20,   22,   24,   40,   5 },   4,  10, invaderXim.effect.SAMURAI_ROLL,     invaderXim.mod.STORETP,                 invaderXim.job.SAM  },
    [invaderXim.jobAbility.EVOKERS_ROLL    ] = { {   1,   1,    1,   1,    3,    2,   2,    2,    1,    3,    4,   1 },   1,   1, invaderXim.effect.EVOKERS_ROLL,     invaderXim.mod.REFRESH,                 invaderXim.job.SMN  },
    [invaderXim.jobAbility.ROGUES_ROLL     ] = { {   2,   2,    3,   4,   12,    5,   6,    6,    1,    8,   19,   6 },   1,   6, invaderXim.effect.ROGUES_ROLL,      invaderXim.mod.CRITHITRATE,             invaderXim.job.THF  },
    [invaderXim.jobAbility.WARLOCKS_ROLL   ] = { {   2,   3,    4,  12,    5,    6,   7,    1,    8,    9,   15,   5 },   1,   5, invaderXim.effect.WARLOCKS_ROLL,    invaderXim.mod.MACC,                    invaderXim.job.RDM  },
    [invaderXim.jobAbility.FIGHTERS_ROLL   ] = { {   2,   2,    3,   4,   12,    5,   6,    7,    1,    9,   18,   6 },   1,   6, invaderXim.effect.FIGHTERS_ROLL,    invaderXim.mod.DOUBLE_ATTACK,           invaderXim.job.WAR  },
    [invaderXim.jobAbility.PUPPET_ROLL     ] = { {   4,   5,   18,   7,    9,   10,   2,   11,   13,   15,   22,   8 },   3,   8, invaderXim.effect.PUPPET_ROLL,      nil,                            invaderXim.job.PUP  },
    [invaderXim.jobAbility.GALLANTS_ROLL   ] = { { 600, 800, 2400, 900, 1100, 1200, 300, 1500, 1700, 1800, 3000, 500 }, 234, 500, invaderXim.effect.GALLANTS_ROLL,    invaderXim.mod.DMG,                     invaderXim.job.PLD  },
    [invaderXim.jobAbility.WIZARDS_ROLL    ] = { {   4,   6,    8,  10,   25,   12,  14,   17,    2,   20,   30,  10 },   2,  10, invaderXim.effect.WIZARDS_ROLL,     invaderXim.mod.MATT,                    invaderXim.job.BLM  },
    [invaderXim.jobAbility.DANCERS_ROLL    ] = { {   3,   4,   12,   5,    6,    7,   1,    8,    9,   10,   16,   4 },   2,   4, invaderXim.effect.DANCERS_ROLL,     invaderXim.mod.REGEN,                   invaderXim.job.DNC  },
    [invaderXim.jobAbility.SCHOLARS_ROLL   ] = { {   2,   9,    3,   4,    5,    2,   6,    6,    7,    9,   14,   4 },   1,   4, invaderXim.effect.SCHOLARS_ROLL,    invaderXim.mod.CONSERVE_MP,             invaderXim.job.SCH  },
    [invaderXim.jobAbility.NATURALISTS_ROLL] = { {   6,   7,   15,   8,    9,   10,   5,   11,   12,   13,   20,  -5 },   1,   5, invaderXim.effect.NATURALISTS_ROLL, invaderXim.mod.ENH_MAGIC_DURATION,      invaderXim.job.GEO  },
    [invaderXim.jobAbility.RUNEISTS_ROLL   ] = { {   4,   6,    8,  25,   10,   12,  14,    2,   17,   20,   30, -10 },   2,   7, invaderXim.effect.RUNEISTS_ROLL,    invaderXim.mod.MEVA,                    invaderXim.job.RUN  },
    [invaderXim.jobAbility.BOLTERS_ROLL    ] = { {   6,   6,   16,   8,    8,   10,  10,   12,    4,   14,   20,   0 },   4,   0, invaderXim.effect.BOLTERS_ROLL,     invaderXim.mod.MOVE_SPEED_BOLTERS_ROLL, invaderXim.job.NONE },
    [invaderXim.jobAbility.CASTERS_ROLL    ] = { {   6,  15,    7,   8,    9,   10,   5,   11,   12,   13,   20, -10 },   3,  10, invaderXim.effect.CASTERS_ROLL,     invaderXim.mod.FASTCAST,                invaderXim.job.NONE },
    [invaderXim.jobAbility.COURSERS_ROLL   ] = { {   2,   3,   11,   4,    5,    6,   7,    8,    1,   10,   12,  -5 },   1,   3, invaderXim.effect.COURSERS_ROLL,    nil,                            invaderXim.job.NONE },
    [invaderXim.jobAbility.BLITZERS_ROLL   ] = { {  -2,  -3,   -4, -11,   -5,   -6,  -7,   -8,   -1,  -10,  -12,   3 },  -1,  -3, invaderXim.effect.BLITZERS_ROLL,    invaderXim.mod.DELAYP,                  invaderXim.job.NONE },
    [invaderXim.jobAbility.TACTICIANS_ROLL ] = { {  10,  10,   10,  10,   30,   10,  10,    0,   20,   20,   40, -10 },   2,  10, invaderXim.effect.TACTICIANS_ROLL,  invaderXim.mod.REGAIN,                  invaderXim.job.NONE },
    [invaderXim.jobAbility.ALLIES_ROLL     ] = { {   2,   3,   20,   5,    7,    9,  11,   13,   15,    1,   25,  -5 },   1,   5, invaderXim.effect.ALLIES_ROLL,      invaderXim.mod.SKILLCHAINBONUS,         invaderXim.job.NONE },
    [invaderXim.jobAbility.MISERS_ROLL     ] = { {  30,  50,   70,  90,  200,  110,  20,  130,  150,  170,  250,   0 },  15,   0, invaderXim.effect.MISERS_ROLL,      invaderXim.mod.SAVETP,                  invaderXim.job.NONE },
    [invaderXim.jobAbility.COMPANIONS_ROLL ] = { {   1,   2,    3,   4,    5,    6,   7,    8,    9,   10,   11,   0 },  10,   0, invaderXim.effect.COMPANIONS_ROLL,  nil,                            invaderXim.job.NONE },
    [invaderXim.jobAbility.AVENGERS_ROLL   ] = { {   2,   2,    3,  12,    4,    5,   6,    1,    7,    9,   18,   6 },   1,   0, invaderXim.effect.AVENGERS_ROLL,    invaderXim.mod.COUNTER,                 invaderXim.job.NONE },
}

-- Check for invaderXim.mod.PHANTOM_ROLL Value and apply non-stack logic.
local function phantombuffMultiple(caster)
    local phantomValue = caster:getMod(invaderXim.mod.PHANTOM_ROLL)
    local phantomBuffMultiplier = 0

    if phantomValue == 3 then
        phantomBuffMultiplier = 3
    elseif
        phantomValue == 5 or
        phantomValue == 8
    then
        phantomBuffMultiplier = 5
    elseif
        phantomValue == 7 or
        phantomValue == 10 or
        phantomValue == 12 or
        phantomValue == 15
    then
        phantomBuffMultiplier = 7
    end

    return phantomBuffMultiplier
end

-- Sets local var if party contains specified job
local function checkForJobBonus(caster, job)
    local jobBonus = 0

    if
        job ~= invaderXim.job.NONE and
        (
            caster:hasPartyJob(job) or
            math.random(0, 99) < caster:getMod(invaderXim.mod.JOB_BONUS_CHANCE)
        )
    then
        jobBonus = 1
    end

    caster:setLocalVar('corsairRollBonus', jobBonus)
end

-- The following functions determine enhancement based on random vs effects
local function getRandomEnhancementRoll(caster, abilityId)
    local modValue   = nil
    local randChance = math.random(0, 99)

    if abilityId == invaderXim.jobAbility.CASTERS_ROLL then
        modValue = caster:getMod(invaderXim.mod.ENHANCES_CASTERS_ROLL)
    elseif abilityId == invaderXim.jobAbility.COURSERS_ROLL then
        modValue = caster:getMod(invaderXim.mod.ENHANCES_COURSERS_ROLL)
    elseif abilityId == invaderXim.jobAbility.BLITZERS_ROLL then
        modValue = caster:getMod(invaderXim.mod.ENHANCES_BLITZERS_ROLL)
    elseif abilityId == invaderXim.jobAbility.TACTICIANS_ROLL then
        modValue = caster:getMod(invaderXim.mod.ENHANCES_TACTICIANS_ROLL)
    end

    return modValue ~= nil and randChance < modValue
end

local function checkForElevenRoll(caster)
    local effects = caster:getStatusEffects()

    for _, effect in pairs(effects) do
        if
            effect:getEffectType() >= invaderXim.effect.FIGHTERS_ROLL and
            effect:getEffectType() <= invaderXim.effect.NATURALISTS_ROLL and
            effect:getSubPower() == 11
        then
            return true
        end

        if
            effect:getEffectType() == invaderXim.effect.RUNEISTS_ROLL and
            effect:getSubPower() == 11
        then
            return true
        end
    end

    return false
end

local function atMaxCorsairBusts(caster)
    local numBusts = caster:numBustEffects()
    return (numBusts >= 2 and caster:getMainJob() == invaderXim.job.COR) or
        (numBusts >= 1 and caster:getMainJob() ~= invaderXim.job.COR)
end

local function corsairSetup(caster, ability, action, effect, job)
    local roll = math.random(1, 6)

    caster:delStatusEffectSilent(invaderXim.effect.DOUBLE_UP_CHANCE)
    caster:addStatusEffectEx(invaderXim.effect.DOUBLE_UP_CHANCE, invaderXim.effect.DOUBLE_UP_CHANCE, roll, 0, 45, ability:getID(), effect, job, true)
    caster:setLocalVar('corsairRollTotal', roll)
    caster:setLocalVar('corsairDuEffect', effect)
    action:speceffect(caster:getID(), roll)

    local recastReduction = utils.clamp(caster:getMerit(invaderXim.merit.PHANTOM_ROLL_RECAST) + caster:getMod(invaderXim.mod.PHANTOM_RECAST), 0, 45)
    local recastTime      = ability:getRecast()

    -- Halves phantom roll recast timer for all rolls while under the effects of an 11 without bust (upon first hitting 11, phantom roll cooldown is reset in double-up.lua)
    if checkForElevenRoll(caster) and caster:numBustEffects() == 0 then
        recastTime = math.floor(recastTime / 2)
    end

    -- https://wiki-ffo-jp.translate.goog/html/3347.html?_x_tr_sl=ja&_x_tr_tl=en&_x_tr_hl=en&_x_tr_pto=sc (Near the middle)
    -- In short, it seems the minimum recast time is 15 seconds.
    action:setRecast(utils.clamp(recastTime - recastReduction, 15, 300))

    checkForJobBonus(caster, job)
end

-- in_ability == current_ability if not using doubleup. current_ability is used to set the message whether you're using a doubleup or not.
local function applyRoll(caster, target, inAbility, action, total, isDoubleup, currentAbility)
    local abilityId    = inAbility:getID()
    local duration     = 300 + caster:getMerit(invaderXim.merit.WINNING_STREAK) + caster:getMod(invaderXim.mod.PHANTOM_DURATION) + caster:getJobPointLevel(invaderXim.jp.PHANTOM_ROLL_DURATION) * 2
    local effectpowers = corsairRollMods[abilityId][1]
    local effectpower  = effectpowers[total]
    local doBonus      = getRandomEnhancementRoll(caster, abilityId)
    local bonusJob     = corsairRollMods[abilityId][6]

    if bonusJob == invaderXim.job.NONE and doBonus then
        effectpower = effectpower + corsairRollMods[abilityId][3]
    end

    if caster:getLocalVar('corsairRollBonus') == 1 and total < 12 then
        effectpower = effectpower + corsairRollMods[abilityId][3]
    end

    -- Apply Additional Phantom Roll+ Buff
    local phantomBase = corsairRollMods[abilityId][2] -- Base increment buff
    effectpower       = effectpower + (phantomBase * phantombuffMultiple(caster))

    -- Effect Power varies depending on COR level (Main vs Sub)
    local actorLevel  = utils.getActiveJobLevel(caster, invaderXim.job.COR)
    local targetLevel = target:getMainLvl()

    if actorLevel < targetLevel then
        effectpower = effectpower * actorLevel / targetLevel
    end

    caster:setLocalVar('corsairApplyingRoll', 1)
    if not target:addCorsairRoll(caster:getMainJob(), caster:getMerit(invaderXim.merit.BUST_DURATION), corsairRollMods[abilityId][4], effectpower, 0, duration, caster:getID(), total, corsairRollMods[abilityId][5]) then
        -- no effect or otherwise prevented
        if caster:getID() == target:getID() then                  -- dead code? you can't roll if the same roll is already active. There is no known buff that would prevent a corsair roll.
            currentAbility:setMsg(invaderXim.msg.basic.ROLL_MAIN_FAIL)    -- no effect for the COR rolling if they had the buff already
        else
            currentAbility:setMsg(invaderXim.msg.basic.NO_EFFECT)         -- no effect for the target if they had the buff already. Testing in retail shows it's _not_ invaderXim.msg.basic.ROLL_SUB_FAIL if the roll is already active. There is no known buff that would prevent a corsair roll, so maybe this would be used there if there were one?
        end
    elseif total > 11 then
        -- bust
        if caster:getID() == target:getID() then
            currentAbility:setMsg(invaderXim.msg.basic.DOUBLEUP_BUST)     -- bust message for the COR rolling
        else
            currentAbility:setMsg(invaderXim.msg.basic.DOUBLEUP_BUST_SUB) -- bust message for the target getting the roll
        end
    else
        -- success
        if caster:getID() == target:getID() then
            if isDoubleup then
                currentAbility:setMsg(invaderXim.msg.basic.DOUBLEUP)      -- success on doubleup for COR has different message than from just using Phantom Roll
            else
                currentAbility:setMsg(invaderXim.msg.basic.ROLL_MAIN)     -- success message for the COR rolling the first time
            end
        else
            currentAbility:setMsg(invaderXim.msg.basic.ROLL_SUB)          -- message for the target getting the roll. Always the same, even if it's the COR's first roll.
        end
    end

    caster:setLocalVar('corsairApplyingRoll', 0)
    return total
end

-- TODO: Binding does not exist, implement this (old code remains)
invaderXim.job_utils.corsair.useCuttingCards = function(caster, target, ability, action)
    if caster:getID() == target:getID() then
        local roll = math.random(1, 6)

        caster:setLocalVar('corsairRollTotal', roll)
        action:speceffect(caster:getID(), roll)
    end

    local total = caster:getLocalVar('corsairRollTotal')

    -- TODO: Implement
    -- caster:doCuttingCards(target, total)
    print('WARNING: doCuttingCards is not implemented')

    ability:setMsg(435 + math.floor((total - 1) / 2) * 2)
    action:setAnimation(target:getID(), 132 + (total) - 1)

    return total
end

invaderXim.job_utils.corsair.useDoubleUp = function(caster, target, ability, action)
    if caster:getID() == target:getID() then -- the COR handles all the calculations
        local duEffect = caster:getStatusEffect(invaderXim.effect.DOUBLE_UP_CHANCE)
        local prevRoll = caster:getStatusEffect(duEffect:getSubPower())
        local roll     = prevRoll:getSubPower()
        local job      = duEffect:getTier()

        caster:setLocalVar('corsairActiveRoll', duEffect:getSubType())

        local snakeEye = caster:getStatusEffect(invaderXim.effect.SNAKE_EYE)

        if snakeEye then
            if roll >= 5 and math.random(1, 100) < snakeEye:getPower() then
                roll = 11
            else
                roll = roll + 1
            end

            caster:delStatusEffect(invaderXim.effect.SNAKE_EYE)
        else
            roll = roll + math.random(1, 6)
        end

        if roll >= 12 then -- bust
            roll = 12
            caster:delStatusEffectSilent(invaderXim.effect.DOUBLE_UP_CHANCE)
        end

        if roll == 11 then
            caster:resetRecast(invaderXim.recast.ABILITY, 193)
        end

        caster:setLocalVar('corsairRollTotal', roll)
        action:speceffect(caster:getID(), roll - prevRoll:getSubPower())
        checkForJobBonus(caster, job)
    end

    local total       = caster:getLocalVar('corsairRollTotal')
    local activeRoll  = caster:getLocalVar('corsairActiveRoll')
    local prevAbility = GetAbility(activeRoll)

    if prevAbility then -- Apply rolls to target(s), including the COR
        action:actionID(prevAbility:getID())

        total = applyRoll(caster, target, prevAbility, action, total, true, ability)

        if total > 11 then
            action:setAnimation(target:getID(), 98) -- 98 is bust anim for all rolls
        else
            action:setAnimation(target:getID(), prevAbility:getAnimation())
        end

        return total
    end
end

invaderXim.job_utils.corsair.useWildCard = function(caster, target, ability, action)
    if caster:getID() == target:getID() then
        local roll = math.random(1, 6)
        caster:setLocalVar('corsairRollTotal', roll)
        action:speceffect(caster:getID(), roll)
    end

    local total = caster:getLocalVar('corsairRollTotal')

    caster:doWildCard(target, total)
    ability:setMsg(435 + math.floor((total - 1) / 2) * 2)
    action:setAnimation(target:getID(), 132 + total - 1)

    return total
end

-- Called by Phantom Rolls' onAbilityCheck
invaderXim.job_utils.corsair.onRollAbilityCheck = function(player, target, ability)
    local abilityId = ability:getID()
    local effectId  = corsairRollMods[abilityId][4]

    ability:setRange(ability:getRange() + player:getMod(invaderXim.mod.ROLL_RANGE))

    if player:hasStatusEffect(effectId) then
        return invaderXim.msg.basic.ROLL_ALREADY_ACTIVE, 0
    elseif atMaxCorsairBusts(player) then
        return invaderXim.msg.basic.CANNOT_PERFORM, 0
    else
        return 0, 0
    end
end

-- Called by Phantom Rolls' onUseAbility
invaderXim.job_utils.corsair.onRollUseAbility = function(caster, target, ability, action)
    local abilityId = ability:getID()
    local effectId  = corsairRollMods[abilityId][4]
    local bonusJob  = corsairRollMods[abilityId][6]

    if caster:getID() == target:getID() then
        corsairSetup(caster, ability, action, effectId, bonusJob)
    end

    local total = caster:getLocalVar('corsairRollTotal')

    return applyRoll(caster, target, ability, action, total, false, ability)
end

-- Called by Double Up ability onAbilityCheck
invaderXim.job_utils.corsair.onDoubleUpAbilityCheck = function(player, target, ability)
    ability:setRange(ability:getRange() + player:getMod(invaderXim.mod.ROLL_RANGE))

    if not player:hasStatusEffect(invaderXim.effect.DOUBLE_UP_CHANCE) then
        return invaderXim.msg.basic.NO_ELIGIBLE_ROLL, 0
    else
        return 0, 0
    end
end

invaderXim.job_utils.corsair.onRollEffectLose = function(player, effect)
    -- Ignore effect loss if COR is doubling up
    if player:getLocalVar('corsairApplyingRoll') == 1 then
        return
    end

    if player:hasStatusEffect(invaderXim.effect.DOUBLE_UP_CHANCE) then
        if player:getLocalVar('corsairDuEffect') == effect:getEffectType() then
            player:delStatusEffectSilent(invaderXim.effect.DOUBLE_UP_CHANCE)
            player:setLocalVar('corsairDuEffect', 0)
        end
    end
end
