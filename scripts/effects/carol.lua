-----------------------------------
-- invaderXim.effect.CAROL
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    local subPower = effect:getSubPower()
    local buff     = 0

    if subPower > invaderXim.element.DARK then -- unpack and apply stat buff if present
        if subPower >= 400 then
            subPower = subPower - 400
            buff     = 4
        elseif subPower >= 300 then
            subPower = subPower - 300
            buff     = 3
        elseif subPower >= 200 then
            subPower = subPower - 200
            buff     = 2
        else
            subPower = subPower - 100
            buff     = 1
        end
    end

    effect:addMod(invaderXim.combat.element.getElementalMEVAModifier(subPower), effect:getPower())

    if subPower == invaderXim.element.FIRE then -- fire add STR
        effect:addMod(invaderXim.mod.STR, buff)
    elseif subPower == invaderXim.element.ICE then -- ice add INT
        effect:addMod(invaderXim.mod.INT, buff)
    elseif subPower == invaderXim.element.WIND then -- wind add AGI
        effect:addMod(invaderXim.mod.AGI, buff)
    elseif subPower == invaderXim.element.EARTH then -- earth add VIT
        effect:addMod(invaderXim.mod.VIT, buff)
    elseif subPower == invaderXim.element.THUNDER then -- thunder add DEX
        effect:addMod(invaderXim.mod.DEX, buff)
    elseif subPower == invaderXim.element.WATER then -- water add MND
        effect:addMod(invaderXim.mod.MND, buff)
    elseif subPower == invaderXim.element.LIGHT then -- light add CHR
        effect:addMod(invaderXim.mod.CHR, buff)
    elseif subPower == invaderXim.element.DARK then -- dark add MP
        effect:addMod(invaderXim.mod.MP, buff * 10)
    end
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
end

return effectObject
