-----------------------------------
-- Ability: Healing Waltz
-- Removes one detrimental status effect from target party member.
-- Obtained: Dancer Level 35
-- TP Required: 20%
-- Recast Time: 00:15
-----------------------------------
---@type TAbility
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    local waltzCost = 200 - player:getMod(invaderXim.mod.WALTZ_COST) * 10
    if target:getHP() == 0 then
        return invaderXim.msg.basic.CANNOT_ON_THAT_TARG, 0
    elseif player:hasStatusEffect(invaderXim.effect.SABER_DANCE) then
        return invaderXim.msg.basic.UNABLE_TO_USE_JA2, 0
    elseif player:hasStatusEffect(invaderXim.effect.TRANCE) then
        return 0, 0
    elseif player:getTP() < waltzCost then
        return invaderXim.msg.basic.NOT_ENOUGH_TP, 0
    else
        --[[ Apply "Waltz Ability Delay" reduction
            1 modifier = 1 second]]
        local recastMod = player:getMod(invaderXim.mod.WALTZ_DELAY)
        if recastMod ~= 0 then
            local newRecast = ability:getRecast() + recastMod
            ability:setRecast(utils.clamp(newRecast, 0, newRecast))
        end

        -- Apply "Fan Dance" Waltz recast reduction
        if player:hasStatusEffect(invaderXim.effect.FAN_DANCE) then
            local fanDanceMerits = target:getMerit(invaderXim.merit.FAN_DANCE)
            -- Every tier beyond the 1st is -5% recast time
            if fanDanceMerits > 5 then
                ability:setRecast(ability:getRecast() * ((fanDanceMerits - 5) / 100))
            end
        end

        -- Inform core we want to cleanup Contradance if it's active after the ability is done
        ability:setPostActionCleanupEffect(invaderXim.effect.CONTRADANCE)

        return 0, 0
    end
end

abilityObject.onUseAbility = function(player, target, ability)
    local waltzCost = 200 - player:getMod(invaderXim.mod.WALTZ_COST) * 10
    -- Only remove TP if the player doesn't have Trance.
    if not player:hasStatusEffect(invaderXim.effect.TRANCE) then
        player:delTP(waltzCost)
    end

    local effect = target:healingWaltz()

    if effect == invaderXim.effect.NONE then
        ability:setMsg(invaderXim.msg.basic.NO_EFFECT) -- no effect
    else
        ability:setMsg(invaderXim.msg.basic.JA_REMOVE_EFFECT)
    end

    return effect
end

return abilityObject
