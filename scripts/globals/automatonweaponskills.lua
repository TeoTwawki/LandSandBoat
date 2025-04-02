-- Uses a mixture of mob and player WS formulas
require('scripts/globals/weaponskills')
require('scripts/globals/magicburst')
require('scripts/globals/utils')
require('scripts/globals/magic')

-- TODO: Consolidate this with weaponskills
xi = xi or {}
invaderXim.autows = invaderXim.autows or {}

-- params contains: ftpMod, str_wsc, dex_wsc, vit_wsc, int_wsc, mnd_wsc, critVaries, accVaries, ignoredDefense, atkmulti, kick, accBonus, weaponType, weaponDamage
invaderXim.autows.doAutoPhysicalWeaponskill = function(attacker, target, wsID, tp, primaryMsg, action, taChar, wsParams, skill)
    -- Set up conditions and wsParams used for calculating weaponskill damage

    -- Handle Flame Holder attachment.
    -- Mod usage, and values returned by Flame Holder script, might not be correct.
    local flameHolderFTP = attacker:getMod(invaderXim.mod.WEAPONSKILL_DAMAGE_BASE) / 100

    local attack =
    {
        ['type'] = invaderXim.attackType.PHYSICAL,
        ['slot'] = invaderXim.slot.MAIN,
        ['weaponType'] = attacker:getWeaponSkillType(invaderXim.slot.MAIN),
        ['damageType'] = attacker:getWeaponDamageType(invaderXim.slot.MAIN)
    }

    local calcParams = {}
    calcParams.wsID = wsID
    calcParams.weaponDamage = invaderXim.weaponskills.getMeleeDmg(attacker, attack.weaponType, wsParams.kick)
    calcParams.attackInfo = attack
    calcParams.fSTR = utils.clamp(attacker:getStat(invaderXim.mod.STR) - target:getStat(invaderXim.mod.VIT), -10, 10)
    calcParams.accStat = attacker:getACC()
    calcParams.melee = true
    calcParams.mustMiss = target:hasStatusEffect(invaderXim.effect.PERFECT_DODGE) or
        (target:hasStatusEffect(invaderXim.effect.ALL_MISS) and not wsParams.hitsHigh)

    calcParams.sneakApplicable = false
    calcParams.taChar = taChar
    calcParams.trickApplicable = false
    calcParams.assassinApplicable = false
    calcParams.guaranteedHit = false
    calcParams.mightyStrikesApplicable = attacker:hasStatusEffect(invaderXim.effect.MIGHTY_STRIKES)
    calcParams.forcedFirstCrit = false
    calcParams.extraOffhandHit = false
    calcParams.hybridHit = false
    calcParams.flourishEffect = false
    calcParams.alpha = 1
    calcParams.bonusWSmods = math.max(attacker:getMainLvl() - target:getMainLvl(), 0)
    calcParams.bonusTP = wsParams.bonusTP or 0
    calcParams.bonusfTP = flameHolderFTP or 0
    calcParams.bonusAcc = 0 + attacker:getMod(invaderXim.mod.WSACC)
    calcParams.firstHitRate = invaderXim.weaponskills.getHitRate(attacker, target, calcParams.bonusAcc + 100) -- TODO: do automatons get first hit acc bonus?
    calcParams.hitRate      = invaderXim.weaponskills.getHitRate(attacker, target, calcParams.bonusAcc)
    calcParams.skillType = attack.weaponType
    calcParams.tpUsed = tp

    -- Send our wsParams off to calculate our raw WS damage, hits landed, and shadows absorbed
    calcParams = invaderXim.weaponskills.calculateRawWSDmg(attacker, target, wsID, tp, action, wsParams, calcParams)
    local finaldmg = calcParams.finalDmg

    -- Calculate reductions
    if not wsParams.formless then
        --finaldmg = target:physicalDmgTaken(finaldmg, attack.damageType)
        if attack.weaponType == invaderXim.skill.HAND_TO_HAND then
            finaldmg = finaldmg * (1 + target:getMod(invaderXim.mod.HTH_SDT) / 10000)
        elseif
            attack.weaponType == invaderXim.skill.DAGGER or
            attack.weaponType == invaderXim.skill.POLEARM
        then
            finaldmg = finaldmg * (1 + target:getMod(invaderXim.mod.PIERCE_SDT) / 10000)
        elseif
            attack.weaponType == invaderXim.skill.CLUB or
            attack.weaponType == invaderXim.skill.STAFF
        then
            finaldmg = finaldmg * (1 + target:getMod(invaderXim.mod.IMPACT_SDT) / 10000)
        else
            finaldmg = finaldmg * (1 + target:getMod(invaderXim.mod.SLASH_SDT) / 10000)
        end
    end

    finaldmg = finaldmg * invaderXim.settings.main.WEAPON_SKILL_POWER -- Add server bonus
    calcParams.finalDmg = finaldmg

    if calcParams.tpHitsLanded + calcParams.extraHitsLanded > 0 then
        finaldmg = invaderXim.weaponskills.takeWeaponskillDamage(target, attacker, wsParams, primaryMsg, attack, calcParams, action)
    else
        skill:setMsg(invaderXim.msg.basic.SKILL_MISS)
    end

    return finaldmg, calcParams.criticalHit, calcParams.tpHitsLanded, calcParams.extraHitsLanded, calcParams.shadowsAbsorbed
end

-- params contains: ftpMod, str_wsc, dex_wsc, vit_wsc, int_wsc, mnd_wsc, critVaries, accVaries, ignoredDefense, atkmulti, accBonus, weaponDamage
invaderXim.autows.doAutoRangedWeaponskill = function(attacker, target, wsID, wsParams, tp, primaryMsg, skill, action)
    -- Set up conditions and wsParams used for calculating weaponskill damage

    -- Handle Flame Holder attachment.
    -- Mod usage, and values returned by Flame Holder script, might not be correct.
    local flameHolderFTP = attacker:getMod(invaderXim.mod.WEAPONSKILL_DAMAGE_BASE) / 100

    local attack =
    {
        ['type'] = invaderXim.attackType.RANGED,
        ['slot'] = invaderXim.slot.RANGED,
        ['weaponType'] = attacker:getWeaponSkillType(invaderXim.slot.RANGED),
        ['damageType'] = attacker:getWeaponDamageType(invaderXim.slot.RANGED)
    }

    local rangedDamage = attacker:getRangedDmg() * (1 + attacker:getMod(invaderXim.mod.AUTO_RANGED_DAMAGEP) / 100)

    local calcParams =
    {
        wsID = wsID,
        weaponDamage = { wsParams.weaponDamage or rangedDamage },
        attackInfo = attack,
        fSTR = utils.clamp(attacker:getStat(invaderXim.mod.STR) - target:getStat(invaderXim.mod.VIT), -10, 10),
        accStat = attacker:getRACC(),
        melee = false,
        mustMiss = false,
        sneakApplicable = false,
        trickApplicable = false,
        assassinApplicable = false,
        mightyStrikesApplicable = false,
        forcedFirstCrit = false,
        extraOffhandHit = false,
        flourishEffect = false,
        alpha = 1,
        bonusWSmods = math.max(attacker:getMainLvl() - target:getMainLvl(), 0),
        bonusTP = wsParams.bonusTP or 0,
        bonusfTP = flameHolderFTP or 0,
        bonusAcc = 0 + attacker:getMod(invaderXim.mod.WSACC),
        tpUsed = tp,
    }
    calcParams.hitRate = invaderXim.weaponskills.getRangedHitRate(attacker, target, calcParams.bonusAcc)
    calcParams.skillType = attack.weaponType

    -- Send our params off to calculate our raw WS damage, hits landed, and shadows absorbed
    calcParams = invaderXim.weaponskills.calculateRawWSDmg(attacker, target, wsID, tp, action, wsParams, calcParams)
    local finaldmg = calcParams.finalDmg

    -- Calculate reductions
    finaldmg = target:rangedDmgTaken(finaldmg)
    finaldmg = finaldmg * (1 + target:getMod(invaderXim.mod.PIERCE_SDT) / 10000)

    finaldmg = finaldmg * invaderXim.settings.main.WEAPON_SKILL_POWER -- Add server bonus
    calcParams.finalDmg = finaldmg

    if calcParams.tpHitsLanded + calcParams.extraHitsLanded > 0 then
        finaldmg = invaderXim.weaponskills.takeWeaponskillDamage(target, attacker, wsParams, primaryMsg, attack, calcParams, action)
    else
        skill:setMsg(invaderXim.msg.basic.SKILL_MISS)
    end

    return finaldmg, calcParams.criticalHit, calcParams.tpHitsLanded, calcParams.extraHitsLanded, calcParams.shadowsAbsorbed
end
