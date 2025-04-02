-----------------------------------
-- ID: 13144
-- Item: wing gorget
-- Item Effect: gives regain
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    if target:hasEquipped(invaderXim.item.WING_GORGET) then
        if target:hasStatusEffect(invaderXim.effect.REGAIN) then
            target:messageBasic(invaderXim.msg.basic.NO_EFFECT)
        else
            target:addStatusEffect(invaderXim.effect.REGAIN, 5, 3, 30, 0, 0, 0, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.WING_GORGET)
        end
    end
end

return itemObject
