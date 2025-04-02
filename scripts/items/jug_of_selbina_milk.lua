-----------------------------------
-- ID: 4378
-- Item: Jug of Selbina Milk
-- Item Effect: regen: 1 HP/tick x 120sec, x 150sec w/ dream robe +1
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    if not target:hasStatusEffect(invaderXim.effect.REGEN) then
        if target:getEquipID(invaderXim.slot.BODY) == 14520 then -- Dream Robe +1
            target:addStatusEffect(invaderXim.effect.REGEN, 1, 3, 150)
        else
            target:addStatusEffect(invaderXim.effect.REGEN, 1, 3, 120)
        end
    else
        target:messageBasic(invaderXim.msg.basic.NO_EFFECT)
    end
end

return itemObject
