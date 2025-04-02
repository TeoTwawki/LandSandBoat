-----------------------------------
-- invaderXim.effect.TRANSCENDENCY
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.HP, 9000)
    target:addMod(invaderXim.mod.MP, 9000)
    target:addMod(invaderXim.mod.REGEN, 300)
    target:addMod(invaderXim.mod.REFRESH, 300)
    target:addMod(invaderXim.mod.REGAIN, 500)
    target:addMod(invaderXim.mod.STR, 900)
    target:addMod(invaderXim.mod.DEX, 900)
    target:addMod(invaderXim.mod.VIT, 900)
    target:addMod(invaderXim.mod.AGI, 900)
    target:addMod(invaderXim.mod.INT, 900)
    target:addMod(invaderXim.mod.MND, 900)
    target:addMod(invaderXim.mod.CHR, 900)
    target:addMod(invaderXim.mod.ATT, 9000)
    target:addMod(invaderXim.mod.DEF, 9000)
    target:addMod(invaderXim.mod.ACC, 1000)
    target:addMod(invaderXim.mod.EVA, 1000)
    target:addMod(invaderXim.mod.MATT, 900)
    target:addMod(invaderXim.mod.RACC, 1000)
    target:addMod(invaderXim.mod.RATT, 9000)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.HP, 9000)
    target:delMod(invaderXim.mod.MP, 9000)
    target:delMod(invaderXim.mod.REGEN, 300)
    target:delMod(invaderXim.mod.REFRESH, 300)
    target:delMod(invaderXim.mod.REGAIN, 500)
    target:delMod(invaderXim.mod.STR, 900)
    target:delMod(invaderXim.mod.DEX, 900)
    target:delMod(invaderXim.mod.VIT, 900)
    target:delMod(invaderXim.mod.AGI, 900)
    target:delMod(invaderXim.mod.INT, 900)
    target:delMod(invaderXim.mod.MND, 900)
    target:delMod(invaderXim.mod.CHR, 900)
    target:delMod(invaderXim.mod.ATT, 9000)
    target:delMod(invaderXim.mod.DEF, 9000)
    target:delMod(invaderXim.mod.ACC, 1000)
    target:delMod(invaderXim.mod.EVA, 1000)
    target:delMod(invaderXim.mod.MATT, 900)
    target:delMod(invaderXim.mod.RACC, 1000)
    target:delMod(invaderXim.mod.RATT, 9000)
end

return effectObject
