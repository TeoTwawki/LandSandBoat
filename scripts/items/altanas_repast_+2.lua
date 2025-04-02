-----------------------------------
-- ID: 6540
-- Item: Altanas Repast +2
-- Food Effect: 3 Hrs, All Races
-----------------------------------
-- AoE:
-- STR+20
-- DEX+20
-- VIT+20
-- AGI+20
-- INT+20
-- MND+20
-- CHR+20
-- Accuracy+90
-- Attack+90
-- R. Accuracy+90
-- R. Attack+90
-- M. Accuracy+90
-- "M. Atk. Bonus"+20
-- "M. Def. Bonus"+5
-- Evasion+90
-- DEF+90
-- M. Evasion+90
-- "Store TP"+8
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:forMembersInRange(30, function(member)
        if not member:hasStatusEffect(invaderXim.effect.FOOD) then
            member:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 10800, 6540)
        end
    end)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.STR, 20)
    target:addMod(invaderXim.mod.DEX, 20)
    target:addMod(invaderXim.mod.VIT, 20)
    target:addMod(invaderXim.mod.AGI, 20)
    target:addMod(invaderXim.mod.INT, 20)
    target:addMod(invaderXim.mod.MND, 20)
    target:addMod(invaderXim.mod.CHR, 20)
    target:addMod(invaderXim.mod.ACC, 90)
    target:addMod(invaderXim.mod.ATT, 90)
    target:addMod(invaderXim.mod.RACC, 90)
    target:addMod(invaderXim.mod.RATT, 90)
    target:addMod(invaderXim.mod.MACC, 90)
    target:addMod(invaderXim.mod.MATT, 20)
    target:addMod(invaderXim.mod.MDEF, 5)
    target:addMod(invaderXim.mod.EVA, 90)
    target:addMod(invaderXim.mod.DEF, 90)
    target:addMod(invaderXim.mod.MEVA, 90)
    target:addMod(invaderXim.mod.STORETP, 8)
    target:addPetMod(invaderXim.mod.STR, 20)
    target:addPetMod(invaderXim.mod.DEX, 20)
    target:addPetMod(invaderXim.mod.VIT, 20)
    target:addPetMod(invaderXim.mod.AGI, 20)
    target:addPetMod(invaderXim.mod.INT, 20)
    target:addPetMod(invaderXim.mod.MND, 20)
    target:addPetMod(invaderXim.mod.CHR, 20)
    target:addPetMod(invaderXim.mod.ACC, 90)
    target:addPetMod(invaderXim.mod.ATT, 90)
    target:addPetMod(invaderXim.mod.RACC, 90)
    target:addPetMod(invaderXim.mod.RATT, 90)
    target:addPetMod(invaderXim.mod.MACC, 90)
    target:addPetMod(invaderXim.mod.MATT, 20)
    target:addPetMod(invaderXim.mod.MDEF, 5)
    target:addPetMod(invaderXim.mod.EVA, 90)
    target:addPetMod(invaderXim.mod.DEF, 90)
    target:addPetMod(invaderXim.mod.MEVA, 90)
    target:addPetMod(invaderXim.mod.STORETP, 8)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.STR, 20)
    target:delMod(invaderXim.mod.DEX, 20)
    target:delMod(invaderXim.mod.VIT, 20)
    target:delMod(invaderXim.mod.AGI, 20)
    target:delMod(invaderXim.mod.INT, 20)
    target:delMod(invaderXim.mod.MND, 20)
    target:delMod(invaderXim.mod.CHR, 20)
    target:delMod(invaderXim.mod.ACC, 90)
    target:delMod(invaderXim.mod.ATT, 90)
    target:delMod(invaderXim.mod.RACC, 90)
    target:delMod(invaderXim.mod.RATT, 90)
    target:delMod(invaderXim.mod.MACC, 90)
    target:delMod(invaderXim.mod.MATT, 20)
    target:delMod(invaderXim.mod.MDEF, 5)
    target:delMod(invaderXim.mod.EVA, 90)
    target:delMod(invaderXim.mod.DEF, 90)
    target:delMod(invaderXim.mod.MEVA, 90)
    target:delMod(invaderXim.mod.STORETP, 8)
    target:delPetMod(invaderXim.mod.STR, 20)
    target:delPetMod(invaderXim.mod.DEX, 20)
    target:delPetMod(invaderXim.mod.VIT, 20)
    target:delPetMod(invaderXim.mod.AGI, 20)
    target:delPetMod(invaderXim.mod.INT, 20)
    target:delPetMod(invaderXim.mod.MND, 20)
    target:delPetMod(invaderXim.mod.CHR, 20)
    target:delPetMod(invaderXim.mod.ACC, 90)
    target:delPetMod(invaderXim.mod.ATT, 90)
    target:delPetMod(invaderXim.mod.RACC, 90)
    target:delPetMod(invaderXim.mod.RATT, 90)
    target:delPetMod(invaderXim.mod.MACC, 90)
    target:delPetMod(invaderXim.mod.MATT, 20)
    target:delPetMod(invaderXim.mod.MDEF, 5)
    target:delPetMod(invaderXim.mod.EVA, 90)
    target:delPetMod(invaderXim.mod.DEF, 90)
    target:delPetMod(invaderXim.mod.MEVA, 90)
    target:delPetMod(invaderXim.mod.STORETP, 8)
end

return itemObject
