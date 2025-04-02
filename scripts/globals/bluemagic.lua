-----------------------------------
-- Blue Magic utilities
-- Used for Blue Magic spells.
-----------------------------------
require('scripts/globals/magic')
require('scripts/globals/mobskills')
require('scripts/globals/combat/physical_utilities')
-----------------------------------
xi = xi or {}
invaderXim.spells = invaderXim.spells or {}
invaderXim.spells.blue = invaderXim.spells.blue or {}
-----------------------------------

-- The TP modifier (currently unused)
invaderXim.spells.blue.tpMod =
{
    NONE          = 0,
    CRITICAL      = 1,
    DAMAGE        = 2,
    ACC           = 3,
    ATTACK        = 4,
    DURATION      = 5,
    EFFECT_CHANCE = 6,
}

-----------------------------------
-- Local functions
-----------------------------------

-- Get alpha (level-dependent multiplier on WSC)
local function calculateAlpha(level)
    if level <= 60 then
        return math.ceil(100 - level / 6) / 100
    elseif level <= 75 then
        return math.ceil(100 - (level - 40) / 2) / 100
    else
        return 0.83
    end
end

-- Get WSC
local function calculateWSC(attacker, params)
    local wsc = calculateAlpha(attacker:getMainLvl()) *
    (attacker:getStat(invaderXim.mod.STR) * params.str_wsc +
    attacker:getStat(invaderXim.mod.DEX) * params.dex_wsc +
    attacker:getStat(invaderXim.mod.VIT) * params.vit_wsc +
    attacker:getStat(invaderXim.mod.AGI) * params.agi_wsc +
    attacker:getStat(invaderXim.mod.INT) * params.int_wsc +
    attacker:getStat(invaderXim.mod.MND) * params.mnd_wsc +
    attacker:getStat(invaderXim.mod.CHR) * params.chr_wsc)

    return wsc
end

-- Get cRatio
local function calculatecRatio(ratio, atk_lvl, def_lvl)
    -- Get ratio with level penalty
    local levelcor = 0
    if atk_lvl < def_lvl then
        levelcor = 0.05 * (def_lvl - atk_lvl)
    end

    ratio = ratio - levelcor
    ratio = utils.clamp(ratio, 0, 2)

    -- Get cRatiomin
    local cratiomin = 0
    if ratio < 1.25 then
        cratiomin = 1.2 * ratio - 0.5
    elseif ratio >= 1.25 and ratio <= 1.5 then
        cratiomin = 1
    elseif ratio > 1.5 and ratio <= 2 then
        cratiomin = 1.2 * ratio - 0.8
    end

    -- Get cRatiomax
    local cratiomax = 0
    if ratio < 0.5 then
        cratiomax = 0.4 + 1.2 * ratio
    elseif ratio <= 0.833 and ratio >= 0.5 then
        cratiomax = 1
    elseif ratio <= 2 and ratio > 0.833 then
        cratiomax = 1.2 * ratio
    end

    -- Return data
    local cratio = {}
    if cratiomin < 0 then
        cratiomin = 0
    end

    cratio[1] = cratiomin
    cratio[2] = cratiomax

    return cratio
end

-- Get the fTP multiplier (by applying 2 straight lines between ftp0-ftp1500 and ftp1500-ftp3000)
local function calculatefTP(tp, ftp0, ftp1500, ftp3000)
    tp = utils.clamp(tp, 0, 3000)

    if tp >= 1500 then
        return ftp1500 + (ftp3000 - ftp1500) * (tp - 1500) / 1500
    else
        return ftp0 + (ftp1500 - ftp0) * tp / 1500
    end
end

-- Get fSTR
local function calculatefSTR(dSTR)
    local fSTR2 = 0

    if dSTR >= 12 then
        fSTR2 = dSTR + 4
    elseif dSTR >= 6 then
        fSTR2 = dSTR + 6
    elseif dSTR >= 1 then
        fSTR2 = dSTR + 7
    elseif dSTR >= -2 then
        fSTR2 = dSTR + 8
    elseif dSTR >= -7 then
        fSTR2 = dSTR + 9
    elseif dSTR >= -15 then
        fSTR2 = dSTR + 10
    elseif dSTR >= -21 then
        fSTR2 = dSTR + 12
    else
        fSTR2 = dSTR + 13
    end

    return fSTR2 / 2
end

-- Get hitrate
local function calculateHitrate(attacker, target, bonusacc)
    local acc     = attacker:getACC() + attacker:getMerit(invaderXim.merit.PHYSICAL_POTENCY) * 2 + (attacker:getMainLvl() - target:getMainLvl()) * 4 + bonusacc
    local eva     = target:getEVA()
    local hitrate = (75 + (acc - eva) / 2) / 100

    hitrate = utils.clamp(hitrate, 0.2, 0.95)

    return hitrate
end

-- Get the effect of ecosystem correlation
local function calculateCorrelation(spellEcosystem, monsterEcosystem, merits)
    local effect = utils.getEcosystemStrengthBonus(spellEcosystem, monsterEcosystem) * 0.25

    if effect > 0 then -- merits don't impose a penalty, only a benefit in case of strength
        effect = effect + 0.001 * merits
    end

    return effect
end

-----------------------------------
-- Global functions
-----------------------------------

-- Get the damage for a physical Blue Magic spell
invaderXim.spells.blue.usePhysicalSpell = function(caster, target, spell, params)
    -----------------------
    -- Get final D value --
    -----------------------

    -- Initial D value
    local initialD = math.floor(caster:getSkillLevel(invaderXim.skill.BLUE_MAGIC) * 0.11) * 2 + 3
    initialD       = utils.clamp(initialD, 0, params.duppercap)

    -- fSTR
    local fStr = calculatefSTR(caster:getStat(invaderXim.mod.STR) - target:getStat(invaderXim.mod.VIT))
    if fStr > 22 then
        if params.ignorefstrcap == nil then -- Smite of Rage / Grand Slam don't have this cap applied
            fStr = 22
        end
    end

    -- Multiplier, bonus WSC
    local multiplier = params.multiplier or 1
    local bonusWSC   = 0

    -- BLU AF3 bonus (triples the base WSC when it procs)
    if caster:getMod(invaderXim.mod.AUGMENT_BLU_MAGIC) > math.random(0, 99) then
        bonusWSC = 2
    end

    -- Chain Affinity -- TODO: add 'Damage/Accuracy/Critical Hit Chance varies with TP'
    if caster:getStatusEffect(invaderXim.effect.CHAIN_AFFINITY) then
        local tp   = caster:getTP() + caster:getMerit(invaderXim.merit.ENCHAINMENT) -- Total TP available
        tp         = utils.clamp(tp, 0, 3000)
        multiplier = calculatefTP(tp, params.multiplier, params.tp150, params.tp300)
        bonusWSC   = bonusWSC + 1 -- Chain Affinity doubles base WSC
    end

    -- WSC
    local wsc = calculateWSC(caster, params)
    wsc       = wsc + wsc * bonusWSC -- Bonus WSC from AF3/CA

    -- Monster correlation
    local correlationMultiplier = calculateCorrelation(params.ecosystem, target:getEcosystem(), caster:getMerit(invaderXim.merit.MONSTER_CORRELATION))

    -- Azure Lore
    if caster:getStatusEffect(invaderXim.effect.AZURE_LORE) then
        multiplier = params.azuretp
    end

    -- Final D
    local finalD = math.floor(initialD + fStr + wsc)

    ----------------------------------------------
    -- Get the possible pDIF range and hit rate --
    ----------------------------------------------

    if params.offcratiomod == nil then -- For all spells except Cannonball, which uses a DEF mod
        params.offcratiomod = caster:getStat(invaderXim.mod.ATT)
    end

    params.offcratiomod = params.offcratiomod * (caster:getMerit(invaderXim.merit.PHYSICAL_POTENCY) + 100) / 100
    params.bonusacc     = params.bonusacc == nil and 0 or params.bonusacc
    params.tphitslanded = 0

    -- params.critchance will only be non-nil if base critchance is passed from spell lua
    local nativecrit  = invaderXim.combat.physical.calculateSwingCriticalRate(caster, target, 0, false)
    params.critchance = params.critchance == nil and 0 or utils.clamp(params.critchance / 100 + nativecrit, 0.05, 0.95)

    local cratio  = calculatecRatio(params.offcratiomod / target:getStat(invaderXim.mod.DEF), caster:getMainLvl(), target:getMainLvl())
    local hitrate = calculateHitrate(caster, target, params.bonusacc)

    -------------------------
    -- Perform the attacks --
    -------------------------

    local hitsdone          = 0
    local hitslanded        = 0
    local finaldmg          = 0
    local sneakIsApplicable = false
    local trickAttackTarget = nil

    if spell:isAoE() == 0 and params.attackType ~= invaderXim.attackType.RANGED then
        if
            caster:hasStatusEffect(invaderXim.effect.SNEAK_ATTACK) and
            (caster:isBehind(target) or caster:hasStatusEffect(invaderXim.effect.HIDE))
        then
            sneakIsApplicable = true
        end

        if caster:hasStatusEffect(invaderXim.effect.TRICK_ATTACK) then
            trickAttackTarget = caster:getTrickAttackChar(target)
        end
    end

    while hitsdone < params.numhits do
        local chance = math.random()

        if
            sneakIsApplicable or
            chance <= hitrate
        then
            -- TODO: Check for shadow absorbs. Right now the whole spell will be absorbed by one shadow before it even gets here.

            -- Generate a random pDIF between min and max
            local pdif = math.random(cratio[1] * 1000, cratio[2] * 1000)
            pdif       = pdif / 1000

            if
                sneakIsApplicable or
                math.random() < params.critchance
            then
                pdif = pdif + 1
            end

            -- Add it to our final damage
            if hitsdone == 0 then
                finaldmg = finaldmg + finalD * (multiplier + correlationMultiplier) * pdif -- first hit gets full multiplier
            else
                finaldmg = finaldmg + finalD * (1 + correlationMultiplier) * pdif
            end

            hitslanded        = hitslanded + 1
            sneakIsApplicable = false

            -- Store number of hits that did > 0 damage
            if finaldmg > 0 then
                params.tphitslanded = params.tphitslanded + 1
            end
        end

        if params.attackType ~= invaderXim.attackType.RANGED then
            caster:delStatusEffect(invaderXim.effect.SNEAK_ATTACK)
            caster:delStatusEffect(invaderXim.effect.TRICK_ATTACK)
        end

        hitsdone = hitsdone + 1
    end

    if finaldmg <= 0 then
        spell:setMsg(invaderXim.msg.basic.MAGIC_NO_EFFECT)
    end

    return invaderXim.spells.blue.applySpellDamage(caster, target, spell, finaldmg, params, trickAttackTarget)
end

-- Get the damage for a magical Blue Magic spell
invaderXim.spells.blue.useMagicalSpell = function(caster, target, spell, params)
    -- In individual magical spells, don't use params.effect for the added effect
    -- This would affect the resistance check for damage here
    -- We just want that to affect the resistance check for the added effect
    -- Use params.addedEffect instead

    -- Initial values
    local initialD   = utils.clamp(caster:getMainLvl() + 2, 0, params.duppercap)
    params.skillType = invaderXim.skill.BLUE_MAGIC

    -- WSC
    local wsc = calculateWSC(caster, params)
    if caster:hasStatusEffect(invaderXim.effect.BURST_AFFINITY) then
        wsc = wsc * 2
    end

    -- INT/MND/CHR dmg bonuses
    params.diff     = caster:getStat(params.attribute) - target:getStat(params.attribute)
    local statBonus = params.diff * params.tMultiplier

    -- Azure Lore
    local azureBonus = 0
    if caster:getStatusEffect(invaderXim.effect.AZURE_LORE) then
        azureBonus = params.azureBonus or 0
    end

    -- Monster correlation
    local correlationMultiplier = calculateCorrelation(params.ecosystem, target:getEcosystem(), caster:getMerit(invaderXim.merit.MONSTER_CORRELATION))

    -- Final D value
    local finalD = (initialD + wsc) * (params.multiplier + azureBonus + correlationMultiplier) + statBonus

    -- Multitarget damage reduction
    local finaldmg = math.floor(finalD * invaderXim.spells.damage.calculateMTDR(spell))

    -- Resistance
    finaldmg = math.floor(finaldmg * applyResistanceEffect(caster, target, spell, params))

    -- MAB/MDB/weather/day/affinity/burst effect on damage
    finaldmg = math.floor(addBonuses(caster, spell, target, finaldmg))

    return invaderXim.spells.blue.applySpellDamage(caster, target, spell, finaldmg, params, nil)
end

-- Spell script Helper function.
invaderXim.spells.blue.useDrainSpell = function(caster, target, spell, params, damageCap, mpDrain)
    local finalDamage = 0

    -- Early returns
    if
        target:isUndead() or
        invaderXim.spells.damage.calculateNukeAbsorbOrNullify(target, spell:getElement()) == 0 -- Drain spells cannot be absorbed, but they can be nullified.
    then
        spell:setMsg(invaderXim.msg.basic.MAGIC_NO_EFFECT)

        return 0
    end

    -- Base damage
    finalDamage = math.floor(caster:getSkillLevel(invaderXim.skill.BLUE_MAGIC) * 0.11)
    finalDamage = math.floor(finalDamage * params.dmgMultiplier)
    if damageCap > 0 then
        finalDamage = utils.clamp(finalDamage, 0, damageCap)
    end

    -- Multipliers
    finalDamage = math.floor(finalDamage * applyResistanceEffect(caster, target, spell, params))
    finalDamage = math.floor(addBonuses(caster, spell, target, finalDamage))
    finalDamage = math.floor(finalDamage * invaderXim.spells.damage.calculateTMDA(target, spell:getElement()))
    finalDamage = math.floor(finalDamage * invaderXim.settings.main.BLUE_POWER)

    -- MP drain
    if mpDrain then
        finalDamage = utils.clamp(finalDamage, 0, target:getMP())

        target:delMP(finalDamage)
        caster:addMP(finalDamage)

        return finalDamage
    end

    -- Handle Phalanx, One for All, Stoneskin and target HP (Cant be higher than current HP)
    finalDamage = utils.clamp(finalDamage - target:getMod(invaderXim.mod.PHALANX), 0, 99999)
    finalDamage = utils.clamp(utils.oneforall(target, finalDamage), 0, 99999)
    finalDamage = utils.clamp(utils.stoneskin(target, finalDamage), -99999, 99999)
    finalDamage = utils.clamp(finalDamage, 0, target:getHP())

    -- Check if the mob has a damage cap
    finalDamage = target:checkDamageCap(finalDamage)

    target:takeSpellDamage(caster, spell, finalDamage, invaderXim.attackType.MAGICAL, invaderXim.damageType.ELEMENTAL + spell:getElement())

    if not target:isPC() then
        target:updateEnmityFromDamage(caster, finalDamage)
    end

    target:handleAfflatusMiseryDamage(finalDamage)
    caster:addHP(finalDamage)

    return finalDamage
end

-- Get the damage and resistance for a breath Blue Magic spell
invaderXim.spells.blue.useBreathSpell = function(caster, target, spell, params, isConal)
    local results = {}
    results[1] = 0 -- damage
    results[2] = 0 -- resistance (used in spell to determine added effect resistance)

    -- Initial damage
    local dmg = caster:getHP() / params.hpMod
    if params.lvlMod > 0 then
        dmg = dmg + caster:getMainLvl() / params.lvlMod
    end

    -- Conal breath spells
    if isConal then
        -- Conal check (45° cone)
        local isInCone = 0
        if target:isInfront(caster, 32) then
            isInCone = 1
        end

        dmg = dmg * isInCone
    end

    -- Monster correlation
    local correlationMultiplier = calculateCorrelation(params.ecosystem, target:getEcosystem(), caster:getMerit(invaderXim.merit.MONSTER_CORRELATION))
    dmg = math.floor(dmg * (1 + correlationMultiplier))

    -- Monster elemental adjustments
    local mobEleAdjustments = invaderXim.spells.damage.calculateSDT(target, spell:getElement())
    dmg = math.floor(dmg * mobEleAdjustments)

    -- Modifiers
    dmg = math.floor(dmg * (1 + caster:getMod(invaderXim.mod.BREATH_DMG_DEALT) / 100))

    -- Resistance
    local resistance = applyResistanceEffect(caster, target, spell, params)
    dmg = math.floor(dmg * resistance)

    -- Final damage
    dmg = target:breathDmgTaken(dmg)

    results[1] = invaderXim.spells.blue.applySpellDamage(caster, target, spell, dmg, params, nil)
    results[2] = resistance

    return results
end

-- Apply spell damage
invaderXim.spells.blue.applySpellDamage = function(caster, target, spell, dmg, params, trickAttackTarget)
    dmg                 = math.floor(dmg * invaderXim.settings.main.BLUE_POWER)
    local attackType    = params.attackType or invaderXim.attackType.NONE
    local damageType    = params.damageType or invaderXim.damageType.NONE
    local tpHits        = params.tphitslanded or 0
    local extraTPGained = invaderXim.combat.tp.calculateTPGainOnMagicalDamage(dmg, caster, target) * math.max(tpHits - 1, 0) -- Calculate extra TP gained from multihits. takeSpellDamage accounts for one already.

    -- handle MDT, One For All, Liement
    if attackType == invaderXim.attackType.MAGICAL then
        local absorbOrNullify = invaderXim.spells.damage.calculateNukeAbsorbOrNullify(target, spell:getElement())
        dmg                   = math.floor(dmg * absorbOrNullify)

        if dmg < 0 then
            target:takeSpellDamage(caster, spell, dmg, attackType, damageType)
            target:addTP(extraTPGained)
            -- TODO: verify Afflatus/enmity from absorb?
            return dmg
        end

        local targetMagicDamageAdjustment = invaderXim.spells.damage.calculateTMDA(target, spell:getElement())
        dmg                               = math.floor(dmg * targetMagicDamageAdjustment)

        dmg = utils.oneforall(target, dmg)
    end

    -- handle Phalanx
    if dmg > 0 then
        dmg = utils.clamp(dmg - target:getMod(invaderXim.mod.PHALANX), 0, 99999)
    end

    -- handle stoneskin
    dmg = utils.stoneskin(target, dmg)

    -- Check if the mob has a damage cap
    dmg = target:checkDamageCap(dmg)

    target:takeSpellDamage(caster, spell, dmg, attackType, damageType)
    target:addTP(extraTPGained)

    if not target:isPC() then
        if trickAttackTarget then
            target:updateEnmityFromDamage(trickAttackTarget, dmg)
        else
            target:updateEnmityFromDamage(caster, dmg)
        end
    end

    target:handleAfflatusMiseryDamage(dmg)

    return dmg
end

-- Get the duration of an enhancing Blue Magic spell
invaderXim.spells.blue.calculateDurationWithDiffusion = function(caster, duration)
    if caster:hasStatusEffect(invaderXim.effect.DIFFUSION) then
        local merits = caster:getMerit(invaderXim.merit.DIFFUSION)

        if merits > 0 then -- each merit after the first increases duration by 5%
            duration = duration + (merits - 5) * duration / 100
        end

        caster:delStatusEffect(invaderXim.effect.DIFFUSION)
    end

    return duration
end

-- Perform an enfeebling Blue Magic spell
invaderXim.spells.blue.useEnfeeblingSpell = function(caster, target, spell, params, power, tick, duration, resistThreshold, isGaze, isConal)
    -- INT and Blue Magic skill are the default resistance modifiers
    params.diff      = caster:getStat(invaderXim.mod.INT) - target:getStat(invaderXim.mod.INT)
    params.skillType = invaderXim.skill.BLUE_MAGIC
    local resist     = applyResistanceEffect(caster, target, spell, params)

    -- If unresisted
    if resist >= resistThreshold then
        spell:setMsg(invaderXim.msg.basic.MAGIC_NO_EFFECT)

        -- If this is a conal move, target needs to be in front of caster
        if
            not isConal or
            (isConal and target:isInfront(caster, 64))
        then

            -- If this is a gaze move, entities need to face each other
            if
                not isGaze or
                (isGaze and target:isFacing(caster) and caster:isFacing(target))
            then

                -- If status effect was inflicted
                if target:addStatusEffect(params.effect, power, tick, duration * resist) then
                    spell:setMsg(invaderXim.msg.basic.MAGIC_ENFEEB_IS)
                end
            end
        end
    else
        spell:setMsg(invaderXim.msg.basic.MAGIC_RESIST)
    end

    return params.effect
end

-- Perform a curative Blue Magic spell
invaderXim.spells.blue.useCuringSpell = function(caster, target, spell, params)
    local power    = getCurePowerOld(caster)
    local divisor  = params.divisor0
    local constant = params.constant0

    if power > params.powerThreshold2 then
        divisor  = params.divisor2
        constant = params.constant2
    elseif power > params.powerThreshold1 then
        divisor  = params.divisor1
        constant = params.constant1
    end

    local final = getCureFinal(caster, spell, getBaseCureOld(power, divisor, constant), params.minCure, true)
    final       = final + final * target:getMod(invaderXim.mod.CURE_POTENCY_RCVD) / 100
    final       = final * invaderXim.settings.main.CURE_POWER
    final       = utils.clamp(final, 0, target:getMaxHP() - target:getHP())

    target:addHP(final)
    target:wakeUp()
    caster:updateEnmityFromCure(target, final)

    if target:getID() == spell:getPrimaryTargetID() then
        spell:setMsg(invaderXim.msg.basic.MAGIC_RECOVERS_HP)
    else
        spell:setMsg(invaderXim.msg.basic.SELF_HEAL_SECONDARY)
    end

    return final
end

-- Inflict an added enfeebling effect (after a physical spell)
invaderXim.spells.blue.usePhysicalSpellAddedEffect = function(caster, target, spell, params, damage, power, tick, duration)
    -- Physical spell needs to do damage before added effect can hit
    if damage > 0 then
        -- INT and Blue Magic skill are the default resistance modifiers
        params.diff      = caster:getStat(invaderXim.mod.INT) - target:getStat(invaderXim.mod.INT)
        params.skillType = invaderXim.skill.BLUE_MAGIC
        local resist     = applyResistanceEffect(caster, target, spell, params)

        if resist >= 0.5 then
            target:addStatusEffect(params.effect, power, tick, duration * resist)
        end
    end
end

-- Inflict an added enfeebling effect (after a magical spell)
invaderXim.spells.blue.useMagicalSpellAddedEffect = function(caster, target, spell, params, power, tick, duration)
    -- Blue Magic skill + whichever attribute the spell uses will be used as resistance modifiers
    params.diff      = caster:getStat(params.attribute) - target:getStat(params.attribute)
    params.skillType = invaderXim.skill.BLUE_MAGIC
    params.effect    = params.addedEffect -- renamed to avoid magical spells' dmg resistance check being influenced by this
    local resist     = applyResistanceEffect(caster, target, spell, params)

    if resist >= 0.5 then
        target:addStatusEffect(params.effect, power, tick, duration * resist)
    end
end

--[[
+-------+
| NOTES |
+-------+
- Spell values (multiplier, TP, D, WSC, TP etc) from:
    - https://www.bg-wiki.com/ffxi/Calculating_Blue_Magic_Damage
    - https://ffxiclopedia.fandom.com/wiki/Calculating_Blue_Magic_Damage
    - BG-wiki spell pages
    - Blue Gartr threads with data, such as
        https://www.bluegartr.com/threads/37619-Blue-Mage-Best-thread-ever?p=5832112&viewfull=1#post5832112
        https://www.bluegartr.com/threads/37619-Blue-Mage-Best-thread-ever?p=5437135&viewfull=1#post5437135
        https://www.bluegartr.com/threads/107650-Random-Question-Thread-XXIV-Occupy-the-RQT?p=4906565&viewfull=1#post4906565
    - When values were absent, spell values were decided based on Blue Gartr threads and Wiki page discussions.
    - Assumed INT as the main magic accuracy modifier for physical spells' additional effects (when no data was found).
]]--
