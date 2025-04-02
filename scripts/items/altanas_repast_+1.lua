-----------------------------------
-- ID: 6539
-- Item: Altanas Repast +1
-- Food Effect: 3 Hrs, All Races
-----------------------------------
-- AoE:
-- STR+15
-- DEX+15
-- VIT+15
-- AGI+15
-- INT+15
-- MND+15
-- CHR+15
-- Accuracy+80
-- Attack+80
-- R. Accuracy+80
-- R. Attack+80
-- M. Accuracy+80
-- "M. Atk. Bonus"+15
-- "M. Def. Bonus"+4
-- Evasion+80
-- DEF+80
-- M. Evasion+80
-- "Store TP"+7
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:forMembersInRange(30, function(member)
        if not member:hasStatusEffect(invaderXim.effect.FOOD) then
            member:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 10800, 6539)
        end
    end)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.STR, 15)
    target:addMod(invaderXim.mod.DEX, 15)
    target:addMod(invaderXim.mod.VIT, 15)
    target:addMod(invaderXim.mod.AGI, 15)
    target:addMod(invaderXim.mod.INT, 15)
    target:addMod(invaderXim.mod.MND, 15)
    target:addMod(invaderXim.mod.CHR, 15)
    target:addMod(invaderXim.mod.ACC, 80)
    target:addMod(invaderXim.mod.ATT, 80)
    target:addMod(invaderXim.mod.RACC, 80)
    target:addMod(invaderXim.mod.RATT, 80)
    target:addMod(invaderXim.mod.MACC, 80)
    target:addMod(invaderXim.mod.MATT, 15)
    target:addMod(invaderXim.mod.MDEF, 4)
    target:addMod(invaderXim.mod.EVA, 80)
    target:addMod(invaderXim.mod.DEF, 80)
    target:addMod(invaderXim.mod.MEVA, 80)
    target:addMod(invaderXim.mod.STORETP, 7)
    target:addPetMod(invaderXim.mod.STR, 15)
    target:addPetMod(invaderXim.mod.DEX, 15)
    target:addPetMod(invaderXim.mod.VIT, 15)
    target:addPetMod(invaderXim.mod.AGI, 15)
    target:addPetMod(invaderXim.mod.INT, 15)
    target:addPetMod(invaderXim.mod.MND, 15)
    target:addPetMod(invaderXim.mod.CHR, 15)
    target:addPetMod(invaderXim.mod.ACC, 80)
    target:addPetMod(invaderXim.mod.ATT, 80)
    target:addPetMod(invaderXim.mod.RACC, 80)
    target:addPetMod(invaderXim.mod.RATT, 80)
    target:addPetMod(invaderXim.mod.MACC, 80)
    target:addPetMod(invaderXim.mod.MATT, 15)
    target:addPetMod(invaderXim.mod.MDEF, 4)
    target:addPetMod(invaderXim.mod.EVA, 80)
    target:addPetMod(invaderXim.mod.DEF, 80)
    target:addPetMod(invaderXim.mod.MEVA, 80)
    target:addPetMod(invaderXim.mod.STORETP, 7)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.STR, 15)
    target:delMod(invaderXim.mod.DEX, 15)
    target:delMod(invaderXim.mod.VIT, 15)
    target:delMod(invaderXim.mod.AGI, 15)
    target:delMod(invaderXim.mod.INT, 15)
    target:delMod(invaderXim.mod.MND, 15)
    target:delMod(invaderXim.mod.CHR, 15)
    target:delMod(invaderXim.mod.ACC, 80)
    target:delMod(invaderXim.mod.ATT, 80)
    target:delMod(invaderXim.mod.RACC, 80)
    target:delMod(invaderXim.mod.RATT, 80)
    target:delMod(invaderXim.mod.MACC, 80)
    target:delMod(invaderXim.mod.MATT, 15)
    target:delMod(invaderXim.mod.MDEF, 4)
    target:delMod(invaderXim.mod.EVA, 80)
    target:delMod(invaderXim.mod.DEF, 80)
    target:delMod(invaderXim.mod.MEVA, 80)
    target:delMod(invaderXim.mod.STORETP, 7)
    target:delPetMod(invaderXim.mod.STR, 15)
    target:delPetMod(invaderXim.mod.DEX, 15)
    target:delPetMod(invaderXim.mod.VIT, 15)
    target:delPetMod(invaderXim.mod.AGI, 15)
    target:delPetMod(invaderXim.mod.INT, 15)
    target:delPetMod(invaderXim.mod.MND, 15)
    target:delPetMod(invaderXim.mod.CHR, 15)
    target:delPetMod(invaderXim.mod.ACC, 80)
    target:delPetMod(invaderXim.mod.ATT, 80)
    target:delPetMod(invaderXim.mod.RACC, 80)
    target:delPetMod(invaderXim.mod.RATT, 80)
    target:delPetMod(invaderXim.mod.MACC, 80)
    target:delPetMod(invaderXim.mod.MATT, 15)
    target:delPetMod(invaderXim.mod.MDEF, 4)
    target:delPetMod(invaderXim.mod.EVA, 80)
    target:delPetMod(invaderXim.mod.DEF, 80)
    target:delPetMod(invaderXim.mod.MEVA, 80)
    target:delPetMod(invaderXim.mod.STORETP, 7)
end

return itemObject
