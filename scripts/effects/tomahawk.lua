-----------------------------------
-- invaderXim.effect.TOMAHAWK
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    local physSDT = { invaderXim.mod.SLASH_SDT, invaderXim.mod.PIERCE_SDT, invaderXim.mod.IMPACT_SDT, invaderXim.mod.HTH_SDT }

    for i = 1, #physSDT do
        local physicalSDTModifier   = physSDT[i]
        local physicalSDTValue      = target:getMod(physicalSDTModifier)
        local physicalSDTAdjustment = math.floor(physicalSDTValue * 0.25)

        effect:addMod(physicalSDTModifier, -physicalSDTAdjustment)
    end

    for element = invaderXim.element.FIRE, invaderXim.element.DARK do
        local elementSDTModifier   = invaderXim.combat.element.getElementalSDTModifier(element)
        local elementSDTValue      = target:getMod(elementSDTModifier)
        local elementSDTAdjustment = math.floor(elementSDTValue * 0.25)

        effect:addMod(elementSDTModifier, -elementSDTAdjustment)
    end
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
end

return effectObject
