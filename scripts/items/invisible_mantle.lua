-----------------------------------
-- ID: 13685
-- Item: Invisible Mantle
-- Item Effect: gives invisible
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    if target:hasEquipped(invaderXim.item.INVISIBLE_MANTLE) then
        if target:hasStatusEffect(invaderXim.effect.INVISIBLE) then
            target:messageBasic(invaderXim.msg.basic.NO_EFFECT)
        else
            target:addStatusEffect(invaderXim.effect.INVISIBLE, 0, 10, math.floor(180 * invaderXim.settings.main.SNEAK_INVIS_DURATION_MULTIPLIER), 0, 0, 0, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.INVISIBLE_MANTLE)
        end
    end
end

return itemObject
