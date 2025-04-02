-----------------------------------
-- invaderXim.effect.SIGNET
--   Signet is a a beneficial Status Effect that allows the acquisition of Conquest Points and Crystals
--   from defeated enemies that grant Experience Points.

--   Increased Healing HP
--   No TP loss while resting
--   Bonus experience earned in smaller parties
--   Increased defense and evasion against attacks from your auto-attack target when even match or lower
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:addLatent(invaderXim.latent.SIGNET_BONUS, 0, invaderXim.mod.DEF, 15)
    target:addLatent(invaderXim.latent.SIGNET_BONUS, 0, invaderXim.mod.EVA, 15)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:delLatent(invaderXim.latent.SIGNET_BONUS, 0, invaderXim.mod.DEF, 15)
    target:delLatent(invaderXim.latent.SIGNET_BONUS, 0, invaderXim.mod.EVA, 15)
end

return effectObject
