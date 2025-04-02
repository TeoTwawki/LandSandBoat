-----------------------------------
-- ID: 16071
-- Item: kawahori_kabuto
-- Effect: blindness
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    if not target:hasStatusEffect(invaderXim.effect.BLINDNESS) then
        target:addStatusEffect(invaderXim.effect.BLINDNESS, 25, 0, 180)
    else
        target:messageBasic(invaderXim.msg.basic.NO_EFFECT)
    end
end

return itemObject
