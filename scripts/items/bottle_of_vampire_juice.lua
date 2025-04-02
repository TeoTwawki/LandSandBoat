-----------------------------------
-- ID: 4512
-- Item: Vampire Juice
-- Item Effect: Restores 60 HP and MP over 90 seconds.
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    local worked = false
    if not target:hasStatusEffect(invaderXim.effect.REGEN) then
        target:addStatusEffect(invaderXim.effect.REGEN, 2, 3, 90)
        worked = true
    end

    if not target:hasStatusEffect(invaderXim.effect.REFRESH) then
        target:addStatusEffect(invaderXim.effect.REFRESH, 2, 3, 90)
        worked = true
    end

    if not worked then
        target:messageBasic(invaderXim.msg.basic.NO_EFFECT)
    end
end

return itemObject
