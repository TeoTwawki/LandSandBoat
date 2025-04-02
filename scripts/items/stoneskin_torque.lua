-----------------------------------
-- ID: 13170
-- Item: Stoneskin Torque
-- Item Effect: Stoneskin
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    if target:hasEquipped(invaderXim.item.STONESKIN_TORQUE) then
        if target:addStatusEffect(invaderXim.effect.STONESKIN, 104, 0, 300, 0, 0, 4, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.STONESKIN_TORQUE) then
            target:messageBasic(invaderXim.msg.basic.GAINS_EFFECT_OF_STATUS, invaderXim.effect.STONESKIN)
        else
            target:messageBasic(invaderXim.msg.basic.NO_EFFECT)
        end
    end
end

return itemObject
