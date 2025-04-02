-----------------------------------
-- ID: 6538
-- Item: Altanas Repast
-- Food Effect: 3 Hrs, All Races
-----------------------------------
-- AoE:
-- STR+10
-- DEX+10
-- VIT+10
-- AGI+10
-- INT+10
-- MND+10
-- CHR+10
-- Accuracy+70
-- Attack+70
-- R. Accuracy+70
-- R. Attack+70
-- M. Accuracy+70
-- "M. Atk. Bonus"+10
-- "M. Def. Bonus"+3
-- Evasion+70
-- DEF+70
-- M. Evasion+70
-- "Store TP"+6
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:forMembersInRange(30, function(member)
        if not member:hasStatusEffect(invaderXim.effect.FOOD) then
            member:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 10800, 6538)
        end
    end)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.STR, 10)
    target:addMod(invaderXim.mod.DEX, 10)
    target:addMod(invaderXim.mod.VIT, 10)
    target:addMod(invaderXim.mod.AGI, 10)
    target:addMod(invaderXim.mod.INT, 10)
    target:addMod(invaderXim.mod.MND, 10)
    target:addMod(invaderXim.mod.CHR, 10)
    target:addMod(invaderXim.mod.ACC, 70)
    target:addMod(invaderXim.mod.ATT, 70)
    target:addMod(invaderXim.mod.RACC, 70)
    target:addMod(invaderXim.mod.RATT, 70)
    target:addMod(invaderXim.mod.MACC, 70)
    target:addMod(invaderXim.mod.MATT, 10)
    target:addMod(invaderXim.mod.MDEF, 3)
    target:addMod(invaderXim.mod.EVA, 70)
    target:addMod(invaderXim.mod.DEF, 70)
    target:addMod(invaderXim.mod.MEVA, 70)
    target:addMod(invaderXim.mod.STORETP, 6)
    target:addPetMod(invaderXim.mod.STR, 10)
    target:addPetMod(invaderXim.mod.DEX, 10)
    target:addPetMod(invaderXim.mod.VIT, 10)
    target:addPetMod(invaderXim.mod.AGI, 10)
    target:addPetMod(invaderXim.mod.INT, 10)
    target:addPetMod(invaderXim.mod.MND, 10)
    target:addPetMod(invaderXim.mod.CHR, 10)
    target:addPetMod(invaderXim.mod.ACC, 70)
    target:addPetMod(invaderXim.mod.ATT, 70)
    target:addPetMod(invaderXim.mod.RACC, 70)
    target:addPetMod(invaderXim.mod.RATT, 70)
    target:addPetMod(invaderXim.mod.MACC, 70)
    target:addPetMod(invaderXim.mod.MATT, 10)
    target:addPetMod(invaderXim.mod.MDEF, 3)
    target:addPetMod(invaderXim.mod.EVA, 70)
    target:addPetMod(invaderXim.mod.DEF, 70)
    target:addPetMod(invaderXim.mod.MEVA, 70)
    target:addPetMod(invaderXim.mod.STORETP, 6)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.STR, 10)
    target:delMod(invaderXim.mod.DEX, 10)
    target:delMod(invaderXim.mod.VIT, 10)
    target:delMod(invaderXim.mod.AGI, 10)
    target:delMod(invaderXim.mod.INT, 10)
    target:delMod(invaderXim.mod.MND, 10)
    target:delMod(invaderXim.mod.CHR, 10)
    target:delMod(invaderXim.mod.ACC, 70)
    target:delMod(invaderXim.mod.ATT, 70)
    target:delMod(invaderXim.mod.RACC, 70)
    target:delMod(invaderXim.mod.RATT, 70)
    target:delMod(invaderXim.mod.MACC, 70)
    target:delMod(invaderXim.mod.MATT, 10)
    target:delMod(invaderXim.mod.MDEF, 3)
    target:delMod(invaderXim.mod.EVA, 70)
    target:delMod(invaderXim.mod.DEF, 70)
    target:delMod(invaderXim.mod.MEVA, 70)
    target:delMod(invaderXim.mod.STORETP, 6)
    target:delPetMod(invaderXim.mod.STR, 10)
    target:delPetMod(invaderXim.mod.DEX, 10)
    target:delPetMod(invaderXim.mod.VIT, 10)
    target:delPetMod(invaderXim.mod.AGI, 10)
    target:delPetMod(invaderXim.mod.INT, 10)
    target:delPetMod(invaderXim.mod.MND, 10)
    target:delPetMod(invaderXim.mod.CHR, 10)
    target:delPetMod(invaderXim.mod.ACC, 70)
    target:delPetMod(invaderXim.mod.ATT, 70)
    target:delPetMod(invaderXim.mod.RACC, 70)
    target:delPetMod(invaderXim.mod.RATT, 70)
    target:delPetMod(invaderXim.mod.MACC, 70)
    target:delPetMod(invaderXim.mod.MATT, 10)
    target:delPetMod(invaderXim.mod.MDEF, 3)
    target:delPetMod(invaderXim.mod.EVA, 70)
    target:delPetMod(invaderXim.mod.DEF, 70)
    target:delPetMod(invaderXim.mod.MEVA, 70)
    target:delPetMod(invaderXim.mod.STORETP, 6)
end

return itemObject
