-----------------------------------
-- invaderXim.effect.MAGIC_SHIELD
-- Blocks Magic damage and effects depending on power
-- Power Notes:
--  0 - 50%  DMGMAGIC (e.g. Fool's Tonic)
--  1 -100% UDMGMAGIC (e.g. Spiritual Incense, Polar Bulwark, Fool's Drink)
--  2 All Element Specific Absorb 100% (Arcane Stomp)
--  3 All Magic (incl. non-elemental) Absorb 100% (e.g. Mind Wall)
--
-- subPower Notes:
--  0 Standard Magic Shield (adds magic immunity)
--  1 Fake Magic Shield (does not resist non-damage spells)
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    local power = effect:getPower()
    if power == 3 then
        target:addMod(invaderXim.mod.MAGIC_ABSORB, 100)
    elseif power == 2 then
        target:addMod(invaderXim.mod.FIRE_ABSORB, 100)
        target:addMod(invaderXim.mod.EARTH_ABSORB, 100)
        target:addMod(invaderXim.mod.WATER_ABSORB, 100)
        target:addMod(invaderXim.mod.WIND_ABSORB, 100)
        target:addMod(invaderXim.mod.ICE_ABSORB, 100)
        target:addMod(invaderXim.mod.LTNG_ABSORB, 100)
        target:addMod(invaderXim.mod.LIGHT_ABSORB, 100)
        target:addMod(invaderXim.mod.DARK_ABSORB, 100)
    elseif power == 1 then
        target:addMod(invaderXim.mod.UDMGMAGIC, -10000)
    else
        target:addMod(invaderXim.mod.DMGMAGIC, -5000)
    end
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    local power = effect:getPower()
    if power == 3 then
        target:delMod(invaderXim.mod.MAGIC_ABSORB, 100)
    elseif power == 2 then
        target:delMod(invaderXim.mod.FIRE_ABSORB, 100)
        target:delMod(invaderXim.mod.EARTH_ABSORB, 100)
        target:delMod(invaderXim.mod.WATER_ABSORB, 100)
        target:delMod(invaderXim.mod.WIND_ABSORB, 100)
        target:delMod(invaderXim.mod.ICE_ABSORB, 100)
        target:delMod(invaderXim.mod.LTNG_ABSORB, 100)
        target:delMod(invaderXim.mod.LIGHT_ABSORB, 100)
        target:delMod(invaderXim.mod.DARK_ABSORB, 100)
    elseif power == 1 then
        target:delMod(invaderXim.mod.UDMGMAGIC, -10000)
    else
        target:delMod(invaderXim.mod.DMGMAGIC, -5000)
    end
end

return effectObject
