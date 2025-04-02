-----------------------------------
-- ID: 4166
-- Deodorizer
-- When applied, this powerful deodorant neutralizes even the strongest of odors!!.
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    if  not target:hasStatusEffect(invaderXim.effect.DEODORIZE) then
        target:addStatusEffect(invaderXim.effect.DEODORIZE, 1, 10, 600)
    else
        target:messageBasic(invaderXim.msg.basic.NO_EFFECT)
    end
end

return itemObject
