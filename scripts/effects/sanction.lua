-----------------------------------
-- invaderXim.effect.SANCTION
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    -- target:addLatent(invaderXim.latent.SANCTION_EXP, ?, invaderXim.mod.EXP_BONUS, ?)
    -- Possibly handle exp bonus in core instead

    local power = effect:getPower()
    if power == 1 then
        target:addLatent(invaderXim.latent.SANCTION_REGEN_BONUS, 95, invaderXim.mod.REGEN, 1)
    elseif power == 2 then
        target:addLatent(invaderXim.latent.SANCTION_REFRESH_BONUS, 75, invaderXim.mod.REFRESH, 1)
    elseif power == 3 then
        target:addMod(invaderXim.mod.FOOD_DURATION, 100)
    end
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    -- target:delLatent(invaderXim.latent.SANCTION_EXP, ?, invaderXim.mod.EXP_BONUS, ?)

    local power = effect:getPower()
    if power == 1 then
        target:delLatent(invaderXim.latent.SANCTION_REGEN_BONUS, 95, invaderXim.mod.REGEN, 1)
    elseif power == 2 then
        target:delLatent(invaderXim.latent.SANCTION_REFRESH_BONUS, 75, invaderXim.mod.REFRESH, 1)
    elseif power == 3 then
        target:delMod(invaderXim.mod.FOOD_DURATION, 100)
    end
end

return effectObject
