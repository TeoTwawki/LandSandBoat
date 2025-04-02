-----------------------------------
-- ID: 18243
-- Item: Astral Pot
-- Item Effect: Pet Magical Attack +22
-- Duration 5 Minutes
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    local pet = target:getPet()
    if not pet then
        return invaderXim.msg.basic.REQUIRES_A_PET, 0
    elseif target:getStatusEffectBySource(invaderXim.effect.ENCHANTMENT, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.ASTRAL_POT) ~= nil then
        target:delStatusEffect(invaderXim.effect.ENCHANTMENT, nil, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.ASTRAL_POT)
    end

    return 0
end

itemObject.onItemUse = function(target)
    local pet = target:getPet()
    if target:hasEquipped(invaderXim.item.ASTRAL_POT) and pet ~= nil then
        target:addStatusEffect(invaderXim.effect.ENCHANTMENT, 0, 0, 300, 0, 0, 0, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.ASTRAL_POT)
    end
end

itemObject.onEffectGain = function(target, effect)
    local pet = target:getPet()
    if not pet then
        return
    end

    pet:addMod(invaderXim.mod.MATT, 22)
end

itemObject.onEffectLose = function(target, effect)
    local pet = target:getPet()
    if pet ~= nil then
        pet:delMod(invaderXim.mod.MATT, 22)
    end
end

return itemObject
