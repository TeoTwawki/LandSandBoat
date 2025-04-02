-----------------------------------
-- White Mage Job Utilities
-----------------------------------
require('scripts/globals/utils')
-----------------------------------
xi = xi or {}
invaderXim.job_utils = invaderXim.job_utils or {}
invaderXim.job_utils.white_mage = invaderXim.job_utils.white_mage or {}

local removables =
{
    invaderXim.effect.FLASH,              invaderXim.effect.BLINDNESS,      invaderXim.effect.MAX_HP_DOWN,    invaderXim.effect.MAX_MP_DOWN,
    invaderXim.effect.PARALYSIS,          invaderXim.effect.POISON,         invaderXim.effect.CURSE_I,        invaderXim.effect.CURSE_II,
    invaderXim.effect.DISEASE,            invaderXim.effect.PLAGUE,         invaderXim.effect.WEIGHT,         invaderXim.effect.BIND,
    invaderXim.effect.BIO,                invaderXim.effect.DIA,            invaderXim.effect.BURN,           invaderXim.effect.FROST,
    invaderXim.effect.CHOKE,              invaderXim.effect.RASP,           invaderXim.effect.SHOCK,          invaderXim.effect.DROWN,
    invaderXim.effect.STR_DOWN,           invaderXim.effect.DEX_DOWN,       invaderXim.effect.VIT_DOWN,       invaderXim.effect.AGI_DOWN,
    invaderXim.effect.INT_DOWN,           invaderXim.effect.MND_DOWN,       invaderXim.effect.CHR_DOWN,       invaderXim.effect.ADDLE,
    invaderXim.effect.SLOW,               invaderXim.effect.HELIX,          invaderXim.effect.ACCURACY_DOWN,  invaderXim.effect.ATTACK_DOWN,
    invaderXim.effect.EVASION_DOWN,       invaderXim.effect.DEFENSE_DOWN,   invaderXim.effect.MAGIC_ACC_DOWN, invaderXim.effect.MAGIC_ATK_DOWN,
    invaderXim.effect.MAGIC_EVASION_DOWN, invaderXim.effect.MAGIC_DEF_DOWN, invaderXim.effect.MAX_TP_DOWN,    invaderXim.effect.SILENCE,
    invaderXim.effect.PETRIFICATION
}

-----------------------------------
-- Ability Check Functions
-----------------------------------
invaderXim.job_utils.white_mage.checkAsylum = function(player, target, ability)
    ability:setRecast(math.max(0, ability:getRecast() - player:getMod(invaderXim.mod.ONE_HOUR_RECAST) * 60))
    return 0, 0
end

invaderXim.job_utils.white_mage.checkBenediction = function(player, target, ability)
    ability:setRecast(math.max(0, ability:getRecast() - player:getMod(invaderXim.mod.ONE_HOUR_RECAST) * 60))
    return 0, 0
end

invaderXim.job_utils.white_mage.checkDevotion = function(player, target, ability)
    if player:getID() == target:getID() then
        return invaderXim.msg.basic.CANNOT_PERFORM_TARG, 0
    elseif player:getHP() < 4 then -- Fails if HP < 4
        return invaderXim.msg.basic.UNABLE_TO_USE_JA, 0
    else
        return 0, 0
    end
end

invaderXim.job_utils.white_mage.checkMartyr = function(player, target, ability)
    if player:getID() == target:getID() then
        return invaderXim.msg.basic.CANNOT_PERFORM_TARG, 0
    elseif player:getHP() < 4 then -- Fails if HP < 4
        return invaderXim.msg.basic.UNABLE_TO_USE_JA, 0
    else
        return 0, 0
    end
end

-----------------------------------
-- Ability Use Functions
-----------------------------------
invaderXim.job_utils.white_mage.useAfflatusMisery = function(player, target, ability)
    target:delStatusEffect(invaderXim.effect.AFFLATUS_SOLACE)
    target:delStatusEffect(invaderXim.effect.AFFLATUS_MISERY)
    target:addStatusEffect(invaderXim.effect.AFFLATUS_MISERY, 8, 0, 7200)
end

invaderXim.job_utils.white_mage.useAfflatusSolace = function(player, target, ability)
    target:delStatusEffect(invaderXim.effect.AFFLATUS_SOLACE)
    target:delStatusEffect(invaderXim.effect.AFFLATUS_MISERY)
    target:addStatusEffect(invaderXim.effect.AFFLATUS_SOLACE, 8, 0, 7200)
end

invaderXim.job_utils.white_mage.useAsylum = function(player, target, ability)
    target:addStatusEffect(invaderXim.effect.ASYLUM, 3, 0, 30)
end

invaderXim.job_utils.white_mage.useBenediction = function(player, target, ability)
    -- To Do: Benediction can remove Charm only while in Assault Mission Lamia No.13
    for i, effect in ipairs(removables) do
        if target:hasStatusEffect(effect) then
            target:delStatusEffect(effect)
        end
    end

    local heal = (target:getMaxHP() * player:getMainLvl()) / target:getMainLvl()

    local maxHeal = target:getMaxHP() - target:getHP()

    if heal > maxHeal then
        heal = maxHeal
    end

    local power = 33 --chance to remove Doom. Basing off of Holy Water?

    if target:hasStatusEffect(invaderXim.effect.DOOM) and power > math.random(1, 100) then
        target:delStatusEffect(invaderXim.effect.DOOM)
    end

    player:updateEnmityFromCure(target, heal)
    target:addHP(heal)
    target:wakeUp()

    return heal
end

invaderXim.job_utils.white_mage.useDevotion = function(player, target, ability)
    -- Plus 5 percent mp recovers per extra devotion merit
    local meritBonus = player:getMerit(invaderXim.merit.DEVOTION) - 5
    local mpPercent  = (25 + meritBonus) / 100
    local damageHP   = math.floor(player:getHP() * 0.25)

    -- If stoneskin is present, it should absorb damage
    damageHP = utils.stoneskin(player, damageHP)

    local healMP = player:getHP() * mpPercent
    healMP = utils.clamp(healMP, 0, target:getMaxMP() - target:getMP())

    damageHP = utils.stoneskin(player, damageHP)
    player:delHP(damageHP)
    target:addMP(healMP)

    return healMP
end

invaderXim.job_utils.white_mage.useDivineCaress = function(player, target, ability)
    player:addStatusEffect(invaderXim.effect.DIVINE_CARESS_I, 3, 0, 60)
end

invaderXim.job_utils.white_mage.useDivineSeal = function(player, target, ability)
    player:addStatusEffect(invaderXim.effect.DIVINE_SEAL, 1, 0, 60)
end

invaderXim.job_utils.white_mage.useMartyr = function(player, target, ability)
    -- Plus 5 percent hp recovers per extra martyr merit
    local meritBonus = player:getMerit(invaderXim.merit.MARTYR) - 5

    local hpPercent = (200 + meritBonus) / 100

    local damageHP = math.floor(player:getHP() * 0.25)

    --We need to capture this here because the base damage is the basis for the heal
    local healHP = damageHP * hpPercent
    healHP = utils.clamp(healHP, 0, target:getMaxHP() - target:getHP())

    -- If stoneskin is present, it should absorb damage
    damageHP = utils.stoneskin(player, damageHP)
    player:delHP(damageHP)
    target:addHP(healHP)

    return healHP
end

invaderXim.job_utils.white_mage.useSacrosanctity = function(player, target, ability)
    target:addStatusEffect(invaderXim.effect.SACROSANCTITY, 3, 0, 60)
end
