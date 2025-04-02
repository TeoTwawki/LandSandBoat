-----------------------------------
-- Ability: Drain Samba III
-- Inflicts the next target you strike with Drain daze, allowing party members engaged in battle with it to drain its HP.
-- Obtained: Dancer Level 65
-- TP Required: 40%
-- Recast Time: 1:00
-- Duration: 1:30
-----------------------------------
---@type TAbility
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    if player:hasStatusEffect(invaderXim.effect.FAN_DANCE) then
        return invaderXim.msg.basic.UNABLE_TO_USE_JA2, 0
    elseif player:getTP() < 400 then
        return invaderXim.msg.basic.NOT_ENOUGH_TP, 0
    end

    return 0, 0
end

abilityObject.onUseAbility = function(player, target, ability)
    -- Only remove TP if the player doesn't have Trance.
    if not player:hasStatusEffect(invaderXim.effect.TRANCE) then
        player:delTP(400)
    end

    local duration = 120 + player:getMod(invaderXim.mod.SAMBA_DURATION) + (player:getJobPointLevel(invaderXim.jp.SAMBA_DURATION) * 2)
    duration       = duration * (100 + player:getMod(invaderXim.mod.SAMBA_PDURATION)) / 100
    player:delStatusEffect(invaderXim.effect.HASTE_SAMBA)
    player:delStatusEffect(invaderXim.effect.ASPIR_SAMBA)
    player:addStatusEffect(invaderXim.effect.DRAIN_SAMBA, 3, 0, duration)
end

return abilityObject
