-----------------------------------
-- ID: 15290
-- Item: Haste Belt
-- Item Effect: 10% haste
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    if target:hasEquipped(invaderXim.item.HASTE_BELT) then
        if not target:hasStatusEffect(invaderXim.effect.HASTE) then
            target:addStatusEffect(invaderXim.effect.HASTE, 1000, 0, 180, 0, 0, 0, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.HASTE_BELT)
        else
            target:messageBasic(invaderXim.msg.basic.NO_EFFECT)
        end
    end
end

return itemObject
