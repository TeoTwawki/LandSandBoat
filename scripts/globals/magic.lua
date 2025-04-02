require('scripts/globals/combat/magic_hit_rate')
require('scripts/globals/jobpoints')
require('scripts/globals/magicburst')
require('scripts/globals/spells/damage_spell')
require('scripts/globals/utils')
-----------------------------------
xi = xi or {}
invaderXim.magic = invaderXim.magic or {}

-- USED FOR DAMAGING MAGICAL SPELLS (Stages 1 and 2 in Calculating Magic Damage on wiki)
local softCap = 60 --guesstimated
local hardCap = 120 --guesstimated

-----------------------------------
-- Returns the staff bonus for the caster and spell.
-----------------------------------

local function calculateMagicBurst(caster, spell, target, params)
    local burst           = 1
    local skillchainburst = 1
    local modburst        = 1

    if
        spell and
        spell:getSpellGroup() == invaderXim.magic.spellGroup.BLUE
    then
        if
            not (caster:hasStatusEffect(invaderXim.effect.BURST_AFFINITY) or
            caster:hasStatusEffect(invaderXim.effect.AZURE_LORE))
        then
            return burst
        end

        caster:delStatusEffectSilent(invaderXim.effect.BURST_AFFINITY)
    end

    -- Obtain first multiplier from gear, atma and job traits
    modburst = modburst + params.AMIIburstBonus + caster:getMod(invaderXim.mod.MAGIC_BURST_BONUS_CAPPED) / 100

    if caster:isBehind(target) and caster:hasStatusEffect(invaderXim.effect.INNIN) then
        modburst = modburst + caster:getMerit(invaderXim.merit.INNIN_EFFECT) / 100
    end

    -- Cap bonuses from first multiplier at 40% or 1.4
    if modburst > 1.4 then
        modburst = 1.4
    end

    -- JP gifts
    modburst = modburst + caster:getMod(invaderXim.mod.MAGIC_BURST_BONUS_UNCAPPED) / 100

    -- BLM Job Point: Magic Burst Damage
    modburst = modburst + caster:getJobPointLevel(invaderXim.jp.MAGIC_BURST_DMG_BONUS) / 100

    -- Obtain second multiplier from skillchain
    -- Starts at 35% damage bonus, increases by 10% for every additional weaponskill in the chain
    local skillchainTier, skillchainCount = invaderXim.magicburst.formMagicBurst(spell:getElement(), target)

    if skillchainTier > 0 then
        if skillchainCount == 1 then -- two weaponskills
            skillchainburst = 1.35
        elseif skillchainCount == 2 then -- three weaponskills
            skillchainburst = 1.45
        elseif skillchainCount == 3 then -- four weaponskills
            skillchainburst = 1.55
        elseif skillchainCount == 4 then -- five weaponskills
            skillchainburst = 1.65
        elseif skillchainCount == 5 then -- six weaponskills
            skillchainburst = 1.75
        else
            -- Something strange is going on if this occurs.
            skillchainburst = 1
        end
    else
        modburst = 1
    end

    -- Multiply
    burst = modburst * skillchainburst

    return burst
end

function calculateMagicDamage(caster, target, spell, params)
    local dINT = caster:getStat(params.attribute) - target:getStat(params.attribute)
    local dmg = params.dmg

    if dINT <= 0 then --if dINT penalises, it's always M=1
        dmg = dmg + dINT
        if dmg <= 0 then --dINT penalty cannot result in negative damage (target absorption)
            return 0
        end
    elseif dINT > 0 and dINT <= softCap then --The standard calc, most spells hit this
        dmg = dmg + (dINT * params.multiplier)
    elseif dINT > 0 and dINT > softCap and dINT < hardCap then --After softCap, INT is only half effective
        dmg = dmg + softCap * params.multiplier + ((dINT - softCap) * params.multiplier) / 2
    elseif dINT > 0 and dINT > softCap and dINT >= hardCap then --After hardCap, INT has no invaderXim.effect.
        dmg = dmg + hardCap * params.multiplier
    end

    if params.skillType == invaderXim.skill.DIVINE_MAGIC and target:isUndead() then
        -- 150% bonus damage
        dmg = dmg * 1.5
    end

    return dmg
end

function doEnspell(caster, target, spell, effect)
    local duration = calculateDuration(180, spell:getSkillType(), spell:getSpellGroup(), caster, target)

    --calculate potency
    local magicskill = caster:getSkillLevel(invaderXim.skill.ENHANCING_MAGIC)

    local potency = 3 + math.floor(6 * magicskill / 100)
    if magicskill > 200 then
        potency = 5 + math.floor(5 * magicskill / 100)
    end

    if target:addStatusEffect(effect, potency, 0, duration) then
        spell:setMsg(invaderXim.msg.basic.MAGIC_GAIN_EFFECT)
    else
        spell:setMsg(invaderXim.msg.basic.MAGIC_NO_EFFECT)
    end
end

-----------------------------------
--   getCurePower returns the caster's cure power
--   getCureFinal returns the final cure amount
--   Source: http://members.shaw.ca/pizza_steve/cure/Cure_Calculator.html
-----------------------------------
function getCurePower(caster, isBlueMagic)
    local mnd = caster:getStat(invaderXim.mod.MND)
    local vit = caster:getStat(invaderXim.mod.VIT)
    local skill = caster:getSkillLevel(invaderXim.skill.HEALING_MAGIC)
    local power = math.floor(mnd / 2) + math.floor(vit / 4) + skill
    return power
end

function getCurePowerOld(caster)
    local mnd = caster:getStat(invaderXim.mod.MND)
    local vit = caster:getStat(invaderXim.mod.VIT)
    local skill = caster:getSkillLevel(invaderXim.skill.HEALING_MAGIC) -- it's healing magic skill for the BLU cures as well
    local power = (3 * mnd) + vit + (3 * math.floor(skill / 5))
    return power
end

function getBaseCure(power, divisor, constant, basepower)
    return ((power - basepower) / divisor) + constant
end

function getBaseCureOld(power, divisor, constant)
    return (power / 2) / divisor + constant
end

function getCureFinal(caster, spell, basecure, minCure, isBlueMagic)
    if basecure < minCure then
        basecure = minCure
    end

    local curePot         = math.min(caster:getMod(invaderXim.mod.CURE_POTENCY), 50) / 100 -- caps at 50%
    local curePotII       = math.min(caster:getMod(invaderXim.mod.CURE_POTENCY_II), 30) / 100 -- caps at 30%
    local potency         = 1 + curePot + curePotII
    local dayWeatherBonus = invaderXim.spells.damage.calculateDayAndWeather(caster, spell:getElement(), false)
    local dSeal           = 1

    if caster:hasStatusEffect(invaderXim.effect.DIVINE_SEAL) then
        dSeal = 2
    end

    local rapture = 1
    if not isBlueMagic then --rapture doesn't affect BLU cures as they're not white magic
        if caster:hasStatusEffect(invaderXim.effect.RAPTURE) then
            rapture = 1.5 + caster:getMod(invaderXim.mod.RAPTURE_AMOUNT) / 100
            caster:delStatusEffectSilent(invaderXim.effect.RAPTURE)
        end
    end

    -- Floor and return.
    local final = math.floor(basecure)
    final       = math.floor(final * potency)
    final       = math.floor(final * dayWeatherBonus)
    final       = math.floor(final * rapture)
    final       = math.floor(final * dSeal)

    return final
end

function isValidHealTarget(caster, target)
    return target:getAllegiance() == caster:getAllegiance() and
            (target:getObjType() == invaderXim.objType.PC or
            target:getObjType() == invaderXim.objType.MOB or
            target:getObjType() == invaderXim.objType.TRUST or
            target:getObjType() == invaderXim.objType.FELLOW)
end

-- TODO: This must be destroyed
function applyResistanceEffect(actor, target, spell, params)
    local spellFamily = spell:getSpellFamily() or 0
    local skillType   = params.skillType or 0
    local element     = spell:getElement() or 0
    local statUsed    = params.attribute or 0
    local effectId    = params.effect or 0
    local bonusMacc   = params.bonus or 0

    -- GUESS stat if it isnt fed with params.
    if statUsed == 0 then
        if skillType == invaderXim.skill.SINGING then
            statUsed = invaderXim.mod.CHR
        else
            statUsed = invaderXim.mod.INT
        end
    end

    return invaderXim.combat.magicHitRate.calculateResistRate(actor, target, spellFamily, skillType, 0, element, statUsed, effectId, bonusMacc)
end

-- Applies resistance for things that may not be spells - ie. Quick Draw
function applyResistanceAbility(actor, target, element, skillType, bonusMacc)
    return invaderXim.combat.magicHitRate.calculateResistRate(actor, target, 0, skillType, 0, element, 0, 0, bonusMacc)
end

-- Applies resistance for additional effects
function applyResistanceAddEffect(actor, target, element, bonusMacc)
    return invaderXim.combat.magicHitRate.calculateResistRate(actor, target, 0, invaderXim.skill.NONE, 0, element, 0, 0, bonusMacc)
end

function finalMagicAdjustments(caster, target, spell, dmg)
    --Handles target's HP adjustment and returns UNSIGNED dmg (absorb message is set in this function)

    -- handle multiple targets
    if caster:isSpellAoE(spell:getID()) then
        local total = spell:getTotalTargets()

        if total > 9 then
            -- ga spells on 10+ targets = 0.4
            dmg = dmg * 0.4
        elseif total > 1 then
            -- -ga spells on 2 to 9 targets = 0.9 - 0.05T where T = number of targets
            dmg = dmg * (0.9 - 0.05 * total)
        end

        -- kill shadows
        -- target:delStatusEffect(invaderXim.effect.COPY_IMAGE)
        -- target:delStatusEffect(invaderXim.effect.BLINK)
    else
        -- this logic will eventually be moved here
        -- dmg = utils.takeShadows(target, dmg, 1)

        -- if (dmg == 0) then
            -- spell:setMsg(invaderXim.msg.basic.SHADOW_ABSORB)
            -- return 1
        -- end
    end

    local skill = spell:getSkillType()
    if skill == invaderXim.skill.ELEMENTAL_MAGIC then
        dmg = dmg * invaderXim.settings.main.ELEMENTAL_POWER
    elseif skill == invaderXim.skill.DARK_MAGIC then
        dmg = dmg * invaderXim.settings.main.DARK_POWER
    elseif skill == invaderXim.skill.NINJUTSU then
        dmg = dmg * invaderXim.settings.main.NINJUTSU_POWER
    elseif skill == invaderXim.skill.DIVINE_MAGIC then
        dmg = dmg * invaderXim.settings.main.DIVINE_POWER
    end

    dmg = target:magicDmgTaken(dmg)

    if dmg > 0 then
        dmg = dmg - target:getMod(invaderXim.mod.PHALANX)
        dmg = utils.clamp(dmg, 0, 99999)
    end

    -- handle one for all
    dmg = utils.oneforall(target, dmg)

    --handling stoneskin
    dmg = utils.stoneskin(target, dmg)
    dmg = utils.clamp(dmg, -99999, 99999)

    if dmg < 0 then
        dmg = target:addHP(-dmg)
        spell:setMsg(invaderXim.msg.basic.MAGIC_RECOVERS_HP)
    else
        -- Check if the mob has a damage cap
        dmg = target:checkDamageCap(dmg)

        -- Handle Bind break and TP?
        target:takeSpellDamage(caster, spell, dmg, invaderXim.attackType.MAGICAL, invaderXim.damageType.ELEMENTAL + spell:getElement())

        -- Handle Afflatus Misery.
        target:handleAfflatusMiseryDamage(dmg)

        -- Handle Enmity.
        target:updateEnmityFromDamage(caster, dmg)
    end

    return dmg
end

function finalMagicNonSpellAdjustments(caster, target, ele, dmg)
    -- Handles target's HP adjustment and returns SIGNED dmg (negative values on absorb)

    dmg = target:magicDmgTaken(dmg)

    if dmg > 0 then
        dmg = dmg - target:getMod(invaderXim.mod.PHALANX)
        dmg = utils.clamp(dmg, 0, 99999)
    end

    -- handle one for all
    dmg = utils.oneforall(target, dmg)

    -- handling stoneskin
    dmg = utils.stoneskin(target, dmg)

    dmg = utils.clamp(dmg, -99999, 99999)

    if dmg < 0 then
        dmg = -(target:addHP(-dmg))
    else
        target:takeDamage(dmg, caster, invaderXim.attackType.MAGICAL, invaderXim.damageType.ELEMENTAL + ele)
    end

    -- Not updating enmity from damage, as this is primarily used for additional effects (which don't generate emnity)
    --  in the case that updating enmity is needed, do it manually after calling this
    -- target:updateEnmityFromDamage(caster, dmg)

    return dmg
end

function addBonuses(caster, spell, target, dmg, params)
    local ele             = spell:getElement()
    local affinityBonus   = invaderXim.spells.damage.calculateElementalStaffBonus(caster, ele)
    local magicDefense    = invaderXim.spells.damage.calculateSDT(target, ele)
    local dayWeatherBonus = invaderXim.spells.damage.calculateDayAndWeather(caster, ele, false)
    local casterJob       = caster:getMainJob()

    params = params or {}
    params.bonusmab = params.bonusmab or 0
    params.AMIIburstBonus = params.AMIIburstBonus or 0

    dmg = math.floor(dmg * affinityBonus)
    dmg = math.floor(dmg * magicDefense)
    dmg = math.floor(dmg * dayWeatherBonus)

    local burst = calculateMagicBurst(caster, spell, target, params)

    if burst > 1.0 then
        spell:setMsg(spell:getMagicBurstMessage()) -- "Magic Burst!"

        caster:triggerRoeEvent(invaderXim.roeTrigger.MAGIC_BURST)
    end

    dmg = math.floor(dmg * burst)
    local mabbonus
    local spellId = spell:getID()

    if spellId >= 245 and spellId <= 248 then -- Drain/Aspir (II)
        mabbonus = 1 + caster:getMod(invaderXim.mod.ENH_DRAIN_ASPIR) / 100

        if spellId == 247 or spellId == 248 then
            mabbonus = mabbonus + caster:getMerit(invaderXim.merit.ASPIR_ABSORPTION_AMOUNT) / 100
        end
    else
        local mab = caster:getMod(invaderXim.mod.MATT) + params.bonusmab

        if spell:getSkillType() == invaderXim.skill.NINJUTSU then
            mab = mab + caster:getMerit(invaderXim.merit.NIN_MAGIC_BONUS)
        end

        if math.random(1, 100) < caster:getMod(invaderXim.mod.MAGIC_CRITHITRATE) then
            mab = mab + (10 + caster:getMod(invaderXim.mod.MAGIC_CRIT_DMG_INCREASE))
        end

        local mdefBarBonus = 0
        if ele >= invaderXim.element.FIRE and ele <= invaderXim.element.WATER then
            mab = mab + caster:getMerit(invaderXim.combat.element.getElementalPotencyMerit(ele))
            if target:hasStatusEffect(invaderXim.combat.element.getAssociatedBarspellEffect(ele)) then -- bar- spell magic defense bonus
                mdefBarBonus = target:getStatusEffect(invaderXim.combat.element.getAssociatedBarspellEffect(ele)):getSubPower()
            end
        end

        if casterJob == invaderXim.job.RDM then
            mab = mab + caster:getJobPointLevel(invaderXim.jp.RDM_MAGIC_ATK_BONUS)
        elseif casterJob == invaderXim.job.GEO then
            mab = mab + caster:getJobPointLevel(invaderXim.jp.GEO_MAGIC_ATK_BONUS)
        end

        mabbonus = (100 + mab) / (100 + target:getMod(invaderXim.mod.MDEF) + mdefBarBonus)
    end

    mabbonus = math.max(0, mabbonus)
    dmg = math.floor(dmg * mabbonus)

    if caster:hasStatusEffect(invaderXim.effect.EBULLIENCE) then
        dmg = dmg * (1.2 + caster:getMod(invaderXim.mod.EBULLIENCE_AMOUNT) / 100)
        caster:delStatusEffectSilent(invaderXim.effect.EBULLIENCE)
    end

    dmg = math.floor(dmg)

    return dmg
end

function addBonusesAbility(caster, ele, target, dmg, params)
    local affinityBonus = invaderXim.spells.damage.calculateElementalStaffBonus(caster, ele)
    dmg = math.floor(dmg * affinityBonus)

    local magicDefense = invaderXim.spells.damage.calculateSDT(target, ele)
    dmg = math.floor(dmg * magicDefense)

    local dayWeatherBonus = invaderXim.spells.damage.calculateDayAndWeather(caster, ele, false)
    dmg = math.floor(dmg * dayWeatherBonus)

    local mab = 1
    local mdefBarBonus = 0
    if
        ele >= invaderXim.element.FIRE and
        ele <= invaderXim.element.WATER and
        target:hasStatusEffect(invaderXim.combat.element.getAssociatedBarspellEffect(ele))
    then -- bar- spell magic defense bonus
        mdefBarBonus = target:getStatusEffect(invaderXim.combat.element.getAssociatedBarspellEffect(ele)):getSubPower()
    end

    if params ~= nil and params.bonusmab ~= nil and params.includemab then
        mab = (100 + caster:getMod(invaderXim.mod.MATT) + params.bonusmab) / (100 + target:getMod(invaderXim.mod.MDEF) + mdefBarBonus)
    elseif params == nil or (params ~= nil and params.includemab) then
        mab = (100 + caster:getMod(invaderXim.mod.MATT)) / (100 + target:getMod(invaderXim.mod.MDEF) + mdefBarBonus)
    end

    if mab < 0 then
        mab = 0
    end

    dmg = math.floor(dmg * mab)

    return dmg
end

function calculateDuration(duration, magicSkill, spellGroup, caster, target, useComposure)
    local casterJob = caster:getMainJob()

    if magicSkill == invaderXim.skill.ENHANCING_MAGIC then -- Enhancing Magic
        -- Gear mods
        duration = duration + duration * caster:getMod(invaderXim.mod.ENH_MAGIC_DURATION) / 100

        -- prior according to bg-wiki
        if casterJob == invaderXim.job.RDM then
            duration = duration + caster:getMerit(invaderXim.merit.ENHANCING_MAGIC_DURATION) + caster:getJobPointLevel(invaderXim.jp.ENHANCING_DURATION)
        end

        -- Default is true
        useComposure = useComposure or (useComposure == nil and true)

        -- Composure
        if
            useComposure and
            caster:hasStatusEffect(invaderXim.effect.COMPOSURE) and
            caster:getID() == target:getID()
        then
            duration = duration * 3
        end

        -- Perpetuance
        if
            caster:hasStatusEffect(invaderXim.effect.PERPETUANCE) and
            spellGroup == invaderXim.magic.spellGroup.WHITE
        then
            duration  = duration * 2
        end
    elseif magicSkill == invaderXim.skill.ENFEEBLING_MAGIC then -- Enfeebling Magic
        if caster:hasStatusEffect(invaderXim.effect.SABOTEUR) then
            if target:isNM() then
                duration = duration * 1.25
            else
                duration = duration * 2
            end
        end

        -- After Saboteur according to bg-wiki
        if casterJob == invaderXim.job.RDM then
            -- RDM Merit: Enfeebling Magic Duration
            duration = duration + caster:getMerit(invaderXim.merit.ENFEEBLING_MAGIC_DURATION)

            -- RDM Job Point: Enfeebling Magic Duration
            duration = duration + caster:getJobPointLevel(invaderXim.jp.ENFEEBLE_DURATION)

            -- RDM Job Point: Stymie effect
            if caster:hasStatusEffect(invaderXim.effect.STYMIE) then
                duration = duration + caster:getJobPointLevel(invaderXim.jp.STYMIE_EFFECT)
            end
        end
    elseif magicSkill == invaderXim.skill.DARK_MAGIC then
        duration = duration * (1 + (caster:getMod(invaderXim.mod.DARK_MAGIC_DURATION) / 100))
    end

    return math.floor(duration)
end
