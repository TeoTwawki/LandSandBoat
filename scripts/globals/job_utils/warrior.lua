-----------------------------------
-- Warrior Job Utilities
-----------------------------------
xi = xi or {}
invaderXim.job_utils = invaderXim.job_utils or {}
invaderXim.job_utils.warrior = invaderXim.job_utils.warrior or {}

-----------------------------------
-- Ability Check Functions
-----------------------------------
invaderXim.job_utils.warrior.checkBrazenRush = function(player, target, ability)
    ability:setRecast(math.max(0, ability:getRecast() - player:getMod(invaderXim.mod.ONE_HOUR_RECAST) * 60))
    return 0, 0
end

invaderXim.job_utils.warrior.checkMightyStrikes = function(player, target, ability)
    ability:setRecast(math.max(0, ability:getRecast() - player:getMod(invaderXim.mod.ONE_HOUR_RECAST) * 60))
    return 0, 0
end

invaderXim.job_utils.warrior.checkTomahawk = function(player, target, ability)
    local ammoID = player:getEquipID(invaderXim.slot.AMMO)

    if ammoID == invaderXim.item.THROWING_TOMAHAWK then
        return 0, 0
    else
        return invaderXim.msg.basic.CANNOT_PERFORM, 0
    end
end

-----------------------------------
-- Ability Use Functions
-----------------------------------
invaderXim.job_utils.warrior.useAggressor = function(player, target, ability)
    local merits = player:getMerit(invaderXim.merit.AGGRESSIVE_AIM)

    player:addStatusEffect(invaderXim.effect.AGGRESSOR, merits, 0, 180 + player:getMod(invaderXim.mod.AGGRESSOR_DURATION))
end

invaderXim.job_utils.warrior.useBerserk = function(player, target, ability)
    player:addStatusEffect(invaderXim.effect.BERSERK, 25 + player:getMod(invaderXim.mod.BERSERK_POTENCY), 0, 180 + player:getMod(invaderXim.mod.BERSERK_DURATION))
end

invaderXim.job_utils.warrior.useBloodRage = function(player, target, ability)
    local power    = 20 + player:getJobPointLevel(invaderXim.jp.BLOOD_RAGE_EFFECT)
    local duration = 30 + player:getMod(invaderXim.mod.ENHANCES_BLOOD_RAGE)

    target:addStatusEffect(invaderXim.effect.BLOOD_RAGE, power, 0, duration)

    if player:getID() ~= target:getID() then
        ability:setMsg(invaderXim.msg.basic.JA_GAIN_EFFECT)
    end

    return invaderXim.effect.BLOOD_RAGE
end

invaderXim.job_utils.warrior.useBrazenRush = function(player, target, ability)
    player:addStatusEffect(invaderXim.effect.BRAZEN_RUSH, 100, 3, 30)
end

invaderXim.job_utils.warrior.useDefender = function(player, target, ability)
    player:addStatusEffect(invaderXim.effect.DEFENDER, 1, 0, 180 + player:getMod(invaderXim.mod.DEFENDER_DURATION))
end

invaderXim.job_utils.warrior.useMightyStrikes = function(player, target, ability)
    player:addStatusEffect(invaderXim.effect.MIGHTY_STRIKES, 1, 0, 45)
end

invaderXim.job_utils.warrior.useRestraint = function(player, target, ability)
    player:addStatusEffect(invaderXim.effect.RESTRAINT, 0, 0, 300)
end

invaderXim.job_utils.warrior.useRetaliation = function(player, target, ability)
    player:addStatusEffect(invaderXim.effect.RETALIATION, 1, 0, 180)
end

invaderXim.job_utils.warrior.useTomahawk = function(player, target, ability)
    local merits   = player:getMerit(invaderXim.merit.TOMAHAWK) - 15
    local duration = 30 + merits

    target:addStatusEffectEx(invaderXim.effect.TOMAHAWK, 0, 25, 3, duration, 0, 0, 0)
    player:removeAmmo()
end

invaderXim.job_utils.warrior.useWarcry = function(player, target, ability)
    local merit    = player:getMerit(invaderXim.merit.SAVAGERY)
    local warLevel = utils.getActiveJobLevel(player, invaderXim.job.WAR)
    local power    = (math.floor((warLevel / 4) + 4.75) / 256) * 100
    local duration = 30

    duration = duration + player:getMod(invaderXim.mod.WARCRY_DURATION)

    target:addStatusEffect(invaderXim.effect.WARCRY, power, 0, duration, 0, merit)

    if player:getID() ~= target:getID() then
        ability:setMsg(invaderXim.msg.basic.JA_ATK_ENHANCED)
    end

    return invaderXim.effect.WARCRY
end

invaderXim.job_utils.warrior.useWarriorsCharge = function(player, target, ability)
    local merits = player:getMerit(invaderXim.merit.WARRIORS_CHARGE)

    player:addStatusEffect(invaderXim.effect.WARRIORS_CHARGE, merits - 5, 0, 60)
end
