-----------------------------------
-- ID: 28563
-- Item: vocation ring
-- Capacity point bonus
-----------------------------------
-- Bonus: +100%
-- Duration: 720 min
-- Max bonus: 12000 exp
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    local result = 0
    if target:hasStatusEffect(invaderXim.effect.COMMITMENT) then
        result = invaderXim.msg.basic.ITEM_UNABLE_TO_USE_2
    end

    return result
end

itemObject.onItemUse = function(target)
    local effect    = invaderXim.effect.COMMITMENT
    local power     = 100
    local duration  = 43200
    local subpower  = 12000

    invaderXim.itemUtils.addItemExpEffect(target, effect, power, duration, subpower)
end

return itemObject
