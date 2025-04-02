-----------------------------------
-- Ninja Job Utilities
-----------------------------------
require('scripts/globals/utils')
-----------------------------------
xi = xi or {}
invaderXim.job_utils = invaderXim.job_utils or {}
invaderXim.job_utils.ninja = invaderXim.job_utils.ninja or {}

-----------------------------------
-- Ability Check Functions
-----------------------------------

invaderXim.job_utils.ninja.checkMijinGakure = function(player, target, ability)
    ability:setRecast(math.max(0, ability:getRecast() - player:getMod(invaderXim.mod.ONE_HOUR_RECAST) * 60))
    return 0, 0
end

invaderXim.job_utils.ninja.checkYonin = function(player, target, ability)
    return 0, 0
end

invaderXim.job_utils.ninja.checkInnin = function(player, target, ability)
    return 0, 0
end

invaderXim.job_utils.ninja.checkSange = function(player, target, ability)
    return 0, 0
end

invaderXim.job_utils.ninja.checkFutae = function(player, target, ability)
    return 0, 0
end

invaderXim.job_utils.ninja.checkIssekigan = function(player, target, ability)
    return 0, 0
end

invaderXim.job_utils.ninja.checkMikage = function(player, target, ability)
    ability:setRecast(math.max(0, ability:getRecast() - player:getMod(invaderXim.mod.ONE_HOUR_RECAST) * 60))
    return 0, 0
end

-----------------------------------
-- Ability Use Functions
-----------------------------------

invaderXim.job_utils.ninja.useMijinGakure = function(player, target, ability, action)
    local dmg    = player:getHP() * 0.8 + player:getMainLvl() / 0.5
    local resist = invaderXim.mobskills.applyPlayerResistance(player, nil, target, player:getStat(invaderXim.mod.INT)-target:getStat(invaderXim.mod.INT), 0, invaderXim.element.NONE)

    -- Job Point Bonus (3% per Level)
    dmg = dmg * (1 + (player:getJobPointLevel(invaderXim.jp.MIJIN_GAKURE_EFFECT) * 0.03))
    dmg = dmg * resist
    dmg = utils.stoneskin(target, dmg)

    target:takeDamage(dmg, player, invaderXim.attackType.SPECIAL, invaderXim.damageType.ELEMENTAL)
    player:setLocalVar('MijinGakure', 1)
    player:setHP(0)

    return dmg
end

invaderXim.job_utils.ninja.useYonin = function(player, target, ability, action)
    target:delStatusEffect(invaderXim.effect.INNIN)
    target:delStatusEffect(invaderXim.effect.YONIN)
    target:addStatusEffect(invaderXim.effect.YONIN, 30, 15, 300, 0, 0)
end

invaderXim.job_utils.ninja.useInnin = function(player, target, ability, action)
    target:delStatusEffect(invaderXim.effect.INNIN)
    target:delStatusEffect(invaderXim.effect.YONIN)
    target:addStatusEffect(invaderXim.effect.INNIN, 30, 15, 300, 0, 20)
end

invaderXim.job_utils.ninja.useSange = function(player, target, ability, action)
    local potency = player:getMerit(invaderXim.merit.SANGE)-1
    player:addStatusEffect(invaderXim.effect.SANGE, potency * 25, 0, 60)
end

invaderXim.job_utils.ninja.useFutae = function(player, target, ability, action)
    target:addStatusEffect(invaderXim.effect.FUTAE, 0, 0, 60)
end

invaderXim.job_utils.ninja.useIssekigan = function(player, target, ability, action)
    target:addStatusEffect(invaderXim.effect.ISSEKIGAN, 25, 0, 60)
end

invaderXim.job_utils.ninja.useMikage = function(player, target, ability, action)
    target:addStatusEffect(invaderXim.effect.MIKAGE, 0, 0, 45)
end
