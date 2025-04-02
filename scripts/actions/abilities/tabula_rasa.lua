-----------------------------------
-- Ability: Tabula Rasa
-- Optimizes both white and black magic capabilities while allowing charge-free stratagem use.
-- Obtained: Scholar Level 1
-- Recast Time: 1:00:00
-- Duration: 0:03:00
-----------------------------------
---@type TAbility
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    ability:setRecast(math.max(0, ability:getRecast() - player:getMod(invaderXim.mod.ONE_HOUR_RECAST) * 60))

    return 0, 0
end

abilityObject.onUseAbility = function(player, target, ability)
    local regenbonus = 0

    if player:getMainJob() == invaderXim.job.SCH and player:getMainLvl() >= 20 then
        regenbonus = 3 * math.floor((player:getMainLvl() - 10) / 10)
    end

    local helixbonus = 0

    if player:getMainJob() == invaderXim.job.SCH and player:getMainLvl() >= 20 then
        helixbonus = math.floor(player:getMainLvl() / 4)
    end

    local jpValue = player:getJobPointLevel(invaderXim.jp.TABULA_RASA_EFFECT)

    if jpValue > 0 then
        player:addMP(player:getMaxMP() * 0.02 * jpValue)
    end

    player:resetRecast(invaderXim.recast.ABILITY, 228)
    player:resetRecast(invaderXim.recast.ABILITY, 231)
    player:resetRecast(invaderXim.recast.ABILITY, 232)
    player:addStatusEffect(invaderXim.effect.TABULA_RASA, math.floor(helixbonus * 1.5), 0, 180, 0, math.floor(regenbonus * 1.5))

    return invaderXim.effect.TABULA_RASA
end

return abilityObject
