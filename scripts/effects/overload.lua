-----------------------------------
-- invaderXim.effect.OVERLOAD
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    local pet = target:getPet()
    if pet then
        pet:setLocalVar('overload', 1)
        pet:addMod(invaderXim.mod.HASTE_MAGIC, -5000)
        pet:addMod(invaderXim.mod.MOVE_SPEED_WEIGHT_PENALTY, 50)
        pet:addMod(invaderXim.mod.EVA, -10)
    end
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    local pet = target:getPet()
    if pet and pet:getLocalVar('overload') ~= 0 then
        pet:setLocalVar('overload', 0)
        pet:delMod(invaderXim.mod.HASTE_MAGIC, -5000)
        pet:delMod(invaderXim.mod.MOVE_SPEED_WEIGHT_PENALTY, 50)
        pet:delMod(invaderXim.mod.EVA, -10)
    end
end

return effectObject
