-----------------------------------
-- ID: 15170
-- Item: regen cuirass
-- Item Effect: gives regen
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    if target:hasEquipped(invaderXim.item.REGEN_CUIRASS) then
        if target:hasStatusEffect(invaderXim.effect.REGEN) then
            target:messageBasic(invaderXim.msg.basic.NO_EFFECT)
        else
            target:addStatusEffect(invaderXim.effect.REGEN, 15, 3, 180, 0, 0, 0, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.REGEN_CUIRASS)
        end
    end
end

return itemObject
