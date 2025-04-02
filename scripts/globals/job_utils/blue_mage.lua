-----------------------------------
-- Blue Mage Job Utilities
-----------------------------------
require('scripts/globals/utils')
-----------------------------------
xi = xi or {}
invaderXim.job_utils = invaderXim.job_utils or {}
invaderXim.job_utils.blue_mage = invaderXim.job_utils.blue_mage or {}
-----------------------------------

-----------------------------------
-- Ability Check Functions
-----------------------------------

invaderXim.job_utils.blue_mage.checkAzureLore = function(player, target, ability)
    ability:setRecast(math.max(0, ability:getRecast() - player:getMod(invaderXim.mod.ONE_HOUR_RECAST) * 60))

    return 0, 0
end

invaderXim.job_utils.blue_mage.checkBurstAffinity = function(player, target, ability)
    return 0, 0
end

invaderXim.job_utils.blue_mage.checkChainAffinity = function(player, target, ability)
    return 0, 0
end

invaderXim.job_utils.blue_mage.checkDiffusion = function(player, target, ability)
    if player:hasStatusEffect(invaderXim.effect.DIFFUSION) then
        return invaderXim.msg.basic.EFFECT_ALREADY_ACTIVE, 0
    end

    return 0, 0
end

invaderXim.job_utils.blue_mage.checkEfflux = function(player, target, ability)
    return 0, 0
end

invaderXim.job_utils.blue_mage.checkUnbridledWisdom = function(player, target, ability)
    ability:setRecast(math.max(0, ability:getRecast() - player:getMod(invaderXim.mod.ONE_HOUR_RECAST) * 60))
    return 0, 0
end

invaderXim.job_utils.blue_mage.checkUnbridledLearning = function(player, target, ability)
    return 0, 0
end

-----------------------------------
-- Ability Use Functions
-----------------------------------

invaderXim.job_utils.blue_mage.useAzureLore = function(player, target, ability, action)
    player:addStatusEffect(invaderXim.effect.AZURE_LORE, 1, 0, 30)
end

invaderXim.job_utils.blue_mage.useBurstAffinity = function(player, target, ability, action)
    player:addStatusEffect(invaderXim.effect.BURST_AFFINITY, 1, 0, 30)
    return invaderXim.effect.BURST_AFFINITY
end

invaderXim.job_utils.blue_mage.useChainAffinity = function(player, target, ability, action)
    player:addStatusEffect(invaderXim.effect.CHAIN_AFFINITY, 1, 0, 30)
    return invaderXim.effect.CHAIN_AFFINITY
end

invaderXim.job_utils.blue_mage.useDiffusion = function(player, target, ability, action)
    player:addStatusEffect(invaderXim.effect.DIFFUSION, 1, 0, 60)
    return invaderXim.effect.DIFFUSION
end

invaderXim.job_utils.blue_mage.useEfflux = function(player, target, ability, action)
    player:addStatusEffect(invaderXim.effect.EFFLUX, 16, 1, 60)
end

invaderXim.job_utils.blue_mage.useUnbridledWisdom = function(player, target, ability, action)
    target:addStatusEffect(invaderXim.effect.UNBRIDLED_WISDOM, 16, 1, 30)
end

invaderXim.job_utils.blue_mage.useUnbridledLearning = function(player, target, ability, action)
    target:addStatusEffect(invaderXim.effect.UNBRIDLED_LEARNING, 16, 1, 60)
end
