-----------------------------------
-- invaderXim.effect.FOOD
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    -- Food from items will always have a SubType, food from FoV/GoV will be zero
    if effect:getSubType() == 0 then
        -- Todo: table this
        if effect:getPower() == 1 then -- Dried Meat
            target:addMod(invaderXim.mod.STR, 4)
            target:addMod(invaderXim.mod.FOOD_ATTP, 22)
            target:addMod(invaderXim.mod.FOOD_ATT_CAP, 63)
        elseif effect:getPower() == 2 then -- Salted Fish
            target:addMod(invaderXim.mod.VIT, 2)
            target:addMod(invaderXim.mod.FOOD_DEFP, 30)
            target:addMod(invaderXim.mod.FOOD_DEF_CAP, 86)
        elseif effect:getPower() == 3 then -- Hard Cookie
            target:addMod(invaderXim.mod.INT, 4)
            target:addMod(invaderXim.mod.MP, 30)
        elseif effect:getPower() == 4 then -- Instant Noodles
            target:addMod(invaderXim.mod.VIT, 1)
            target:addMod(invaderXim.mod.FOOD_HPP, 27)
            target:addMod(invaderXim.mod.FOOD_HP_CAP, 75)
            target:addMod(invaderXim.mod.STORETP, 5)
        elseif effect:getPower() == 5 then -- Dried Agaricus
            target:addMod(invaderXim.mod.MND, 4)
        elseif effect:getPower() == 6 then -- Instant Rice
            target:addMod(invaderXim.mod.CHR, 6)
        elseif effect:getPower() == 255 then -- ACP Seed Goblin Saucepan Attack
            -- Based on info from http://www.bg-wiki.com/bg/Seed_Goblin
            target:addMod(invaderXim.mod.STR, -10)
            target:addMod(invaderXim.mod.DEX, -10)
            target:addMod(invaderXim.mod.VIT, -10)
            target:addMod(invaderXim.mod.AGI, -10)
            target:addMod(invaderXim.mod.INT, -10)
            target:addMod(invaderXim.mod.MND, -10)
            target:addMod(invaderXim.mod.CHR, -10)
        end
    end
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    -- Food from items will always have a SubType, food from FoV/GoV will be zero
    if effect:getSubType() == 0 then
        -- Todo: table this
        if effect:getPower() == 1 then -- Dried Meat
            target:delMod(invaderXim.mod.STR, 4)
            target:delMod(invaderXim.mod.FOOD_ATTP, 22)
            target:delMod(invaderXim.mod.FOOD_ATT_CAP, 63)
        elseif effect:getPower() == 2 then -- Salted Fish
            target:delMod(invaderXim.mod.VIT, 2)
            target:delMod(invaderXim.mod.FOOD_DEFP, 30)
            target:delMod(invaderXim.mod.FOOD_DEF_CAP, 86)
        elseif effect:getPower() == 3 then -- Hard Cookie
            target:delMod(invaderXim.mod.INT, 4)
            target:delMod(invaderXim.mod.MP, 30)
        elseif effect:getPower() == 4 then -- Instant Noodles
            target:delMod(invaderXim.mod.VIT, 1)
            target:delMod(invaderXim.mod.FOOD_HPP, 27)
            target:delMod(invaderXim.mod.FOOD_HP_CAP, 75)
            target:delMod(invaderXim.mod.STORETP, 5)
        elseif effect:getPower() == 5 then -- Dried Agaricus
            target:delMod(invaderXim.mod.MND, 4)
        elseif effect:getPower() == 6 then -- Instant Rice
            target:delMod(invaderXim.mod.CHR, 6)
        elseif effect:getPower() == 255 then -- ACP Seed Goblin Saucepan Attack
            -- Based on info from http://www.bg-wiki.com/bg/Seed_Goblin
            target:delMod(invaderXim.mod.STR, -10)
            target:delMod(invaderXim.mod.DEX, -10)
            target:delMod(invaderXim.mod.VIT, -10)
            target:delMod(invaderXim.mod.AGI, -10)
            target:delMod(invaderXim.mod.INT, -10)
            target:delMod(invaderXim.mod.MND, -10)
            target:delMod(invaderXim.mod.CHR, -10)
        end
    end
end

return effectObject
