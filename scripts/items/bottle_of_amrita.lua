-----------------------------------
-- ID: 4513
-- Item: Amrita
-- Item Effect: Restores 500 HP and MP over 300 seconds.
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    local worked = false
    if not target:hasStatusEffect(invaderXim.effect.REGEN) then
        target:addStatusEffect(invaderXim.effect.REGEN, 5, 3, 300)
        worked = true
    end

    if not target:hasStatusEffect(invaderXim.effect.REFRESH) then
        target:addStatusEffect(invaderXim.effect.REFRESH, 5, 3, 300)
        worked = true
    end

    if not worked then
        target:messageBasic(invaderXim.msg.basic.NO_EFFECT)
    end
end

return itemObject
