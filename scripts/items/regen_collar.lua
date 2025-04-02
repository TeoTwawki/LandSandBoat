-----------------------------------
-- ID: 15526
-- Item: Regen Collar
-- Item Effect: Restores 40 HP over 120 seconds
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    if target:hasEquipped(invaderXim.item.REGEN_COLLAR) then
        if not target:hasStatusEffect(invaderXim.effect.REGEN) then
            target:addStatusEffect(invaderXim.effect.REGEN, 1, 3, 120, 0, 0, 0, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.REGEN_COLLAR)
        else
            target:messageBasic(invaderXim.msg.basic.NO_EFFECT)
        end
    end
end

return itemObject
