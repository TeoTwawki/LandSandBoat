-----------------------------------
-- ID: 18242
-- Item: Wyvern Feed
-- Item Effect: Pet Regen
-- Duration 3 Minutes
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    local pet    = target:getPet()

    if not pet then
        return invaderXim.msg.basic.REQUIRES_A_PET, 0
    elseif target:getStatusEffectBySource(invaderXim.effect.ENCHANTMENT, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.BAG_OF_WYVERN_FEED) ~= nil then
        target:delStatusEffect(invaderXim.effect.ENCHANTMENT, nil, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.BAG_OF_WYVERN_FEED)
    end

    return 0
end

itemObject.onItemUse = function(target)
    local pet = target:getPet()
    if target:hasEquipped(invaderXim.item.BAG_OF_WYVERN_FEED) and pet ~= nil then
        target:addStatusEffect(invaderXim.effect.ENCHANTMENT, 0, 0, 180, 0, 0, 0, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.BAG_OF_WYVERN_FEED)
    end
end

itemObject.onEffectGain = function(target, effect)
    local pet = target:getPet()
    if not pet then
        return
    end

    pet:addMod(invaderXim.mod.REGEN, 3)
end

itemObject.onEffectLose = function(target, effect)
    local pet = target:getPet()
    if pet ~= nil then
        pet:delMod(invaderXim.mod.REGEN, 3)
    end
end

return itemObject
