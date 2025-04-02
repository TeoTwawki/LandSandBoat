-----------------------------------
-- invaderXim.effect.PROWESS
-- "Killer" effects bonus
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.VERMIN_KILLER, effect:getPower())
    target:addMod(invaderXim.mod.BIRD_KILLER, effect:getPower())
    target:addMod(invaderXim.mod.AMORPH_KILLER, effect:getPower())
    target:addMod(invaderXim.mod.LIZARD_KILLER, effect:getPower())
    target:addMod(invaderXim.mod.AQUAN_KILLER, effect:getPower())
    target:addMod(invaderXim.mod.PLANTOID_KILLER, effect:getPower())
    target:addMod(invaderXim.mod.BEAST_KILLER, effect:getPower())
    target:addMod(invaderXim.mod.UNDEAD_KILLER, effect:getPower())
    target:addMod(invaderXim.mod.ARCANA_KILLER, effect:getPower())
    target:addMod(invaderXim.mod.DRAGON_KILLER, effect:getPower())
    target:addMod(invaderXim.mod.DEMON_KILLER, effect:getPower())
    target:addMod(invaderXim.mod.EMPTY_KILLER, effect:getPower())
    -- target:addMod(invaderXim.mod.HUMANOID_KILLER, effect:getPower())
    target:addMod(invaderXim.mod.LUMINIAN_KILLER, effect:getPower())
    target:addMod(invaderXim.mod.LUMINION_KILLER, effect:getPower())
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.VERMIN_KILLER, effect:getPower())
    target:delMod(invaderXim.mod.BIRD_KILLER, effect:getPower())
    target:delMod(invaderXim.mod.AMORPH_KILLER, effect:getPower())
    target:delMod(invaderXim.mod.LIZARD_KILLER, effect:getPower())
    target:delMod(invaderXim.mod.AQUAN_KILLER, effect:getPower())
    target:delMod(invaderXim.mod.PLANTOID_KILLER, effect:getPower())
    target:delMod(invaderXim.mod.BEAST_KILLER, effect:getPower())
    target:delMod(invaderXim.mod.UNDEAD_KILLER, effect:getPower())
    target:delMod(invaderXim.mod.ARCANA_KILLER, effect:getPower())
    target:delMod(invaderXim.mod.DRAGON_KILLER, effect:getPower())
    target:delMod(invaderXim.mod.DEMON_KILLER, effect:getPower())
    target:delMod(invaderXim.mod.EMPTY_KILLER, effect:getPower())
    -- target:delMod(invaderXim.mod.HUMANOID_KILLER, effect:getPower())
    target:delMod(invaderXim.mod.LUMINIAN_KILLER, effect:getPower())
    target:delMod(invaderXim.mod.LUMINION_KILLER, effect:getPower())
end

return effectObject
