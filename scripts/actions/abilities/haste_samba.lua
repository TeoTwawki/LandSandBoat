-----------------------------------
-- Ability: Haste Samba
-- Inflicts the next target you strike with Haste daze, increasing the attack speed of all those engaged in battle with it.
-- Obtained: Dancer Level 45
-- TP Cost: 35%
-- Recast Time: 1:00
-- Duration: 1:30
-----------------------------------
---@type TAbility
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    if player:hasStatusEffect(invaderXim.effect.FAN_DANCE) then
        return invaderXim.msg.basic.UNABLE_TO_USE_JA2, 0
    elseif player:getTP() < 350 then
        return invaderXim.msg.basic.NOT_ENOUGH_TP, 0
    end

    return 0, 0
end

abilityObject.onUseAbility = function(player, target, ability)
    -- Only remove TP if the player doesn't have Trance.
    if not player:hasStatusEffect(invaderXim.effect.TRANCE) then
        player:delTP(350)
    end

    local duration = 120 + player:getMod(invaderXim.mod.SAMBA_DURATION) + (player:getJobPointLevel(invaderXim.jp.SAMBA_DURATION) * 2)
    duration       = duration * (100 + player:getMod(invaderXim.mod.SAMBA_PDURATION)) / 100
    player:delStatusEffect(invaderXim.effect.DRAIN_SAMBA)
    player:delStatusEffect(invaderXim.effect.ASPIR_SAMBA)
    player:addStatusEffect(invaderXim.effect.HASTE_SAMBA, 500 + player:getMerit(invaderXim.merit.HASTE_SAMBA_EFFECT), 0, duration)
end

return abilityObject
