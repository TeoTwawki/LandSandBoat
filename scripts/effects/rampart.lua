-----------------------------------
-- invaderXim.effect.RAMPART
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    local power = effect:getPower()

    -- Regular effect
    effect:addMod(invaderXim.mod.SLASH_SDT, -power)
    effect:addMod(invaderXim.mod.PIERCE_SDT, -power)
    effect:addMod(invaderXim.mod.IMPACT_SDT, -power)
    effect:addMod(invaderXim.mod.HTH_SDT, -power)
    effect:addMod(invaderXim.mod.FIRE_SDT, -power)
    effect:addMod(invaderXim.mod.ICE_SDT, -power)
    effect:addMod(invaderXim.mod.WIND_SDT, -power)
    effect:addMod(invaderXim.mod.EARTH_SDT, -power)
    effect:addMod(invaderXim.mod.THUNDER_SDT, -power)
    effect:addMod(invaderXim.mod.WATER_SDT, -power)
    effect:addMod(invaderXim.mod.LIGHT_SDT, -power)
    effect:addMod(invaderXim.mod.DARK_SDT, -power)

    -- Iron will trait and augment. TODO: Why player only?
    if target:isPC() and target:hasTrait(invaderXim.trait.IRON_WILL) then
        effect:addMod(invaderXim.mod.SPELLINTERRUPT, target:getMerit(invaderXim.merit.IRON_WILL))

        if target:getMod(invaderXim.mod.ENHANCES_IRON_WILL) > 0 then
            local subPower = target:getMod(invaderXim.mod.ENHANCES_IRON_WILL) * target:getMerit(invaderXim.merit.IRON_WILL) / 19

            effect:addMod(invaderXim.mod.FASTCAST, subPower)
            effect:setSubPower(subPower)
        end
    end
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
end

return effectObject
