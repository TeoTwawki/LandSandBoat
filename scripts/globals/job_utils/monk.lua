-----------------------------------
-- Monk Job Utilities
-----------------------------------
xi = xi or {}
invaderXim.job_utils = invaderXim.job_utils or {}
invaderXim.job_utils.monk = invaderXim.job_utils.monk or {}

local chakraStatusEffects =
{
    POISON       = 0, -- Removed by default
    BLINDNESS    = 0, -- Removed by default
    PARALYSIS    = 1,
    DISEASE      = 2,
    PLAGUE       = 4,
}

-----------------------------------
-- Ability Check Functions
-----------------------------------
invaderXim.job_utils.monk.checkHundredFists = function(player, target, ability)
    ability:setRecast(math.max(0, ability:getRecast() - player:getMod(invaderXim.mod.ONE_HOUR_RECAST) * 60))
    return 0, 0
end

invaderXim.job_utils.monk.checkInnerStrength = function(player, target, ability)
    ability:setRecast(math.max(0, ability:getRecast() - player:getMod(invaderXim.mod.ONE_HOUR_RECAST) * 60))
    return 0, 0
end

-----------------------------------
-- Ability Use Functions
-----------------------------------
invaderXim.job_utils.monk.useBoost = function(player, target, ability)
    local power = 12.5 + (0.10 * player:getMod(invaderXim.mod.BOOST_EFFECT))

    if player:hasStatusEffect(invaderXim.effect.BOOST) then
        local effect = player:getStatusEffect(invaderXim.effect.BOOST)
        effect:setPower(effect:getPower() + power)
        player:addMod(invaderXim.mod.ATTP, power)
    else
        player:addStatusEffect(invaderXim.effect.BOOST, power, 0, 180)
    end
end

-- TODO: add Melee Gloves +2 aug
invaderXim.job_utils.monk.useChakra = function(player, target, ability)
    local chakraRemoval = player:getMod(invaderXim.mod.CHAKRA_REMOVAL)

    for k, v in pairs(chakraStatusEffects) do
        if bit.band(chakraRemoval, v) == v then
            player:delStatusEffect(invaderXim.effect[k])
        end
    end

    -- see https://www.bg-wiki.com/ffxi/Chakra
    local monkLevel         = utils.getActiveJobLevel(player, invaderXim.job.MNK)
    local jpModifier        = target:getJobPointLevel(invaderXim.jp.CHAKRA_EFFECT) -- NOTE: Level is the modified value, so 10 per point spent
    local hpModifier        = ((monkLevel + 1) * 0.2 / 100) * player:getMaxHP()
    local chakraMultiplier  = 1 + player:getMod(invaderXim.mod.CHAKRA_MULT) / 100
    local maxRecoveryAmount = (player:getStat(invaderXim.mod.VIT) * 2 + hpModifier) * chakraMultiplier + jpModifier
    local recoveryAmount    = math.min(player:getMaxHP() - player:getHP(), maxRecoveryAmount)

    player:setHP(player:getHP() + recoveryAmount)

    local merits = player:getMerit(invaderXim.merit.INVIGORATE)
    if merits > 0 then
        if player:hasStatusEffect(invaderXim.effect.REGEN) then
            player:delStatusEffect(invaderXim.effect.REGEN)
        end

        player:addStatusEffect(invaderXim.effect.REGEN, 10, 0, merits, 0, 0, 1)
    end

    return recoveryAmount
end

invaderXim.job_utils.monk.useChiBlast = function(player, target, ability)
    local boost = player:getStatusEffect(invaderXim.effect.BOOST)
    local multiplier = 1.0
    if boost ~= nil then
        multiplier = (boost:getPower() / 100) * 4 -- power is the raw % atk boost
    end

    local dmg = math.floor(player:getStat(invaderXim.mod.MND) * (0.5 + (math.random() / 2))) * multiplier

    dmg = invaderXim.ability.adjustDamage(dmg, player, ability, target, invaderXim.attackType.BREATH, nil, invaderXim.mobskills.shadowBehavior.IGNORE_SHADOWS)
    target:takeDamage(dmg, player, invaderXim.attackType.BREATH, invaderXim.damageType.ELEMENTAL)
    target:updateClaim(player)
    player:delStatusEffect(invaderXim.effect.BOOST)

    return dmg
end

invaderXim.job_utils.monk.useCounterstance = function(player, target, ability)
    local power = 45 + player:getMod(invaderXim.mod.COUNTERSTANCE_EFFECT)

    target:delStatusEffect(invaderXim.effect.COUNTERSTANCE) --if not found this will do nothing
    target:addStatusEffect(invaderXim.effect.COUNTERSTANCE, power, 0, 300)
end

invaderXim.job_utils.monk.useDodge = function(player, target, ability)
    player:addStatusEffect(invaderXim.effect.DODGE, 0, 0, 30)
end

invaderXim.job_utils.monk.useFocus = function(player, target, ability)
    player:addStatusEffect(invaderXim.effect.FOCUS, 0, 0, 30)
end

invaderXim.job_utils.monk.useFootwork = function(player, target, ability)
    local kickDmg = 20 + player:getWeaponDmg()
    local kickAttPercent = 25 + player:getMod(invaderXim.mod.FOOTWORK_ATT_BONUS)

    player:addStatusEffect(invaderXim.effect.FOOTWORK, kickDmg, 0, 60, 0, kickAttPercent)
end

invaderXim.job_utils.monk.useFormlessStrikes = function(player, target, ability)
    player:addStatusEffect(invaderXim.effect.FORMLESS_STRIKES, 1, 0, 180)
end

invaderXim.job_utils.monk.useHundredFists = function(player, target, ability)
    player:addStatusEffect(invaderXim.effect.HUNDRED_FISTS, 1, 0, 45)
end

-- TODO: Support Tantra Cyclas + 1 (does not give critical hit damage)
-- Probably will be exceptionally jank, very low priority
invaderXim.job_utils.monk.impetusMissListener = function(attacker, victim, attack)
    local effect = attacker:getStatusEffect(invaderXim.effect.IMPETUS)

    if effect then
        local mainPower = effect:getPower()    -- Stores Attack & Critical Hit Rate bonuses
        local subPower  = effect:getSubPower() -- Stores Critical Hit Damage & Accuracy bonuses

        if mainPower > 0 then
            attacker:delMod(invaderXim.mod.ATT, mainPower * 2)
            attacker:delMod(invaderXim.mod.CRITHITRATE, mainPower)

            effect:setPower(0)
        end

        if subPower > 0 then
            attacker:delMod(invaderXim.mod.ACC, subPower * 2)
            attacker:delMod(invaderXim.mod.CRIT_DMG_INCREASE, subPower)

            effect:setSubPower(0)
        end
    end
end

-- TODO: Support Tantra Cyclas + 1 (does not give critical hit damage)
-- Probably will be exceptionally jank, very low priority
invaderXim.job_utils.monk.impetusHitListener = function(attacker, victim, attack)
    local effect = attacker:getStatusEffect(invaderXim.effect.IMPETUS)

    if effect then
        local mainPower = effect:getPower()    -- Stores Attack & Critical Hit Rate bonuses
        local subPower  = effect:getSubPower() -- Stores Critical Hit Damage & Accuracy bonuses

        if mainPower < 50 then
            attacker:addMod(invaderXim.mod.ATT, 2)
            attacker:addMod(invaderXim.mod.CRITHITRATE, 1)

            effect:setPower(mainPower + 1)
        end

        if attacker:getMod(invaderXim.mod.AUGMENTS_IMPETUS) > 0 and subPower < 50 then
            attacker:addMod(invaderXim.mod.ACC, 2)
            attacker:addMod(invaderXim.mod.CRIT_DMG_INCREASE, 1)

            effect:setSubPower(subPower + 1)
        end
    end
end

invaderXim.job_utils.monk.useImpetus = function(player, target, ability)
    player:addStatusEffect(invaderXim.effect.IMPETUS, 0, 0, 180)
end

invaderXim.job_utils.monk.useInnerStrength = function(player, target, ability)
    player:addStatusEffect(invaderXim.effect.INNER_STRENGTH, 2, 0, 30)
end

invaderXim.job_utils.monk.useMantra = function(player, target, ability)
    local merits = player:getMerit(invaderXim.merit.MANTRA)

    target:delStatusEffect(invaderXim.effect.MAX_HP_BOOST) -- TODO: confirm which versions of HP boost mantra can overwrite
    target:addStatusEffect(invaderXim.effect.MAX_HP_BOOST, merits, 0, 180)

    return 0 -- invaderXim.effect.MANTRA -- TODO: implement invaderXim.effect.MANTRA
end

invaderXim.job_utils.monk.usePerfectCounter = function(player, target, ability)
    player:addStatusEffect(invaderXim.effect.PERFECT_COUNTER, 2, 0, 30)
end
