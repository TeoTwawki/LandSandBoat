-----------------------------------
-- Ability: Sublimation
-- Gradually creates a storage of MP while reducing your HP. The effect ends once an MP limit is reached, or your HP has gone too low. The stored MP is then transferred to your MP pool by using the ability a second time.
-- Obtained: Scholar Level 35
-- Recast Time: 30 seconds after the ability is reactivated
-- Duration (Charging): Until MP stored is 25% of Max HP or until HP = 50%
-- Duration (Charged): 2 hours
-----------------------------------
---@type TAbility
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

abilityObject.onUseAbility = function(player, target, ability)
    local sublimationComplete = player:getStatusEffect(invaderXim.effect.SUBLIMATION_COMPLETE)
    local sublimationCharging = player:getStatusEffect(invaderXim.effect.SUBLIMATION_ACTIVATED)
    local mp                  = 0

    if sublimationComplete ~= nil then
        mp           = sublimationComplete:getPower()
        local maxmp  = player:getMaxMP()
        local currmp = player:getMP()

        if mp + currmp > maxmp then
            mp = maxmp - currmp
        end

        player:addMP(mp)
        player:delStatusEffectSilent(invaderXim.effect.SUBLIMATION_COMPLETE)
        ability:setMsg(invaderXim.msg.basic.JA_RECOVERS_MP)
    elseif sublimationCharging ~= nil then
        mp           = sublimationCharging:getPower()
        local maxmp  = player:getMaxMP()
        local currmp = player:getMP()

        if mp + currmp > maxmp then
            mp = maxmp - currmp
        end

        player:addMP(mp)
        player:delStatusEffectSilent(invaderXim.effect.SUBLIMATION_ACTIVATED)
        ability:setMsg(invaderXim.msg.basic.JA_RECOVERS_MP)
    else
        local refresh = player:getStatusEffect(invaderXim.effect.REFRESH)

        if refresh == nil or refresh:getSubPower() < 3 then
            player:delStatusEffect(invaderXim.effect.REFRESH)
            player:addStatusEffect(invaderXim.effect.SUBLIMATION_ACTIVATED, 0, 3, 7200)
        else
            ability:setMsg(invaderXim.msg.basic.JA_NO_EFFECT_2)
        end
    end

    return mp
end

return abilityObject
