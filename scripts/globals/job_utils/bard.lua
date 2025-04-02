-----------------------------------
-- Bard Job Utilities
-----------------------------------
xi = xi or {}
invaderXim.job_utils = invaderXim.job_utils or {}
invaderXim.job_utils.bard = invaderXim.job_utils.bard or {}

-----------------------------------
-- Ability Check Functions
-----------------------------------
invaderXim.job_utils.bard.checkSoulVoice = function(player, target, ability)
    ability:setRecast(math.max(0, ability:getRecast() - player:getMod(invaderXim.mod.ONE_HOUR_RECAST) * 60))

    return 0, 0
end

invaderXim.job_utils.bard.checkClarionCall = function(player, target, ability)
    ability:setRecast(math.max(0, ability:getRecast() - player:getMod(invaderXim.mod.ONE_HOUR_RECAST) * 60))

    return 0, 0
end

-----------------------------------
-- Ability Use Functions
-----------------------------------
invaderXim.job_utils.bard.useSoulVoice = function(player, target, ability)
    player:addStatusEffect(invaderXim.effect.SOUL_VOICE, 1, 0, 180)
end

invaderXim.job_utils.bard.usePianissimo = function(player, target, ability)
    player:addStatusEffect(invaderXim.effect.PIANISSIMO, 0, 0, 60)
end

invaderXim.job_utils.bard.useNightingale = function(player, target, ability)
    player:addStatusEffect(invaderXim.effect.NIGHTINGALE, 0, 0, 60)
end

invaderXim.job_utils.bard.useTroubadour = function(player, target, ability)
    player:addStatusEffect(invaderXim.effect.TROUBADOUR, 0, 0, 60)
end

invaderXim.job_utils.bard.useTenuto = function(player, target, ability)
    -- TODO: Implement this ability
    player:addStatusEffect(invaderXim.effect.TENUTO, 0, 0, 60)
end

invaderXim.job_utils.bard.useMarcato = function(player, target, ability)
    player:addStatusEffect(invaderXim.effect.MARCATO, 0, 0, 60)
end

invaderXim.job_utils.bard.useClarionCall = function(player, target, ability)
    player:addStatusEffect(invaderXim.effect.CLARION_CALL, 10, 0, 180)
end
