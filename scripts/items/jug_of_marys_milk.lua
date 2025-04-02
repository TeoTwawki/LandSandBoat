-----------------------------------
-- ID: 4527
-- Item: Jug of marys milk
-- Item Effect: This potion induces sleep.
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    if
        not target:hasStatusEffect(invaderXim.effect.SLEEP_I) and
        not target:hasStatusEffect(invaderXim.effect.SLEEP_II) and
        not target:hasStatusEffect(invaderXim.effect.LULLABY)
    then
        target:addStatusEffect(invaderXim.effect.SLEEP_I, 1, 0, 60)
    else
        target:messageBasic(invaderXim.msg.basic.NO_EFFECT)
    end
end

return itemObject
