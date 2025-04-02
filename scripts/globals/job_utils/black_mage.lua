-----------------------------------
-- Black Mage Job Utilities
-----------------------------------
require('scripts/globals/utils')
-----------------------------------
xi = xi or {}
invaderXim.job_utils = invaderXim.job_utils or {}
invaderXim.job_utils.black_mage = invaderXim.job_utils.black_mage or {}

-----------------------------------
-- Ability Check Functions
-----------------------------------
invaderXim.job_utils.black_mage.checkManafont = function(player, target, ability)
    ability:setRecast(math.max(0, ability:getRecast() - player:getMod(invaderXim.mod.ONE_HOUR_RECAST) * 60))
    return 0, 0
end

invaderXim.job_utils.black_mage.checkSubtleSorcery = function(player, target, ability)
    ability:setRecast(math.max(0, ability:getRecast() - player:getMod(invaderXim.mod.ONE_HOUR_RECAST) * 60))
    return 0, 0
end

-----------------------------------
-- Ability Use Functions
-----------------------------------
invaderXim.job_utils.black_mage.useCascade = function(player, target, ability)
    player:addStatusEffect(invaderXim.effect.CASCADE, 1, 0, 60)
end

invaderXim.job_utils.black_mage.useElementalSeal = function(player, target, ability)
    player:addStatusEffect(invaderXim.effect.ELEMENTAL_SEAL, 1, 0, 60)
end

invaderXim.job_utils.black_mage.useEnmityDouse = function(player, target, ability)
    if target:isMob() then
        target:setCE(player, 1)
        target:setVE(player, 0)
    end
end

invaderXim.job_utils.black_mage.useManafont = function(player, target, ability)
    player:addStatusEffect(invaderXim.effect.MANAFONT, 1, 0, 60)
end

invaderXim.job_utils.black_mage.useManaWall = function(player, target, ability)
    player:addStatusEffect(invaderXim.effect.MANA_WALL, 1, 0, 300)
end

invaderXim.job_utils.black_mage.useManawell = function(player, target, ability)
    target:addStatusEffect(invaderXim.effect.MANAWELL, 1, 0, 60)
end

invaderXim.job_utils.black_mage.useSubtleSorcery = function(player, target, ability)
    player:addStatusEffect(invaderXim.effect.SUBTLE_SORCERY, 1, 0, 60)
end
