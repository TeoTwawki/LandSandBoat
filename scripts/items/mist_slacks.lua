-----------------------------------
-- ID: 14324
-- Item: Mist Slacks
-- Item Effect: Evasion Boost
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    if target:hasEquipped(invaderXim.item.MIST_SLACKS) then
        if not target:hasStatusEffect(invaderXim.effect.EVASION_BOOST) then
            target:addStatusEffect(invaderXim.effect.EVASION_BOOST, 15, 0, 180, 0, 0, 0, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.MIST_SLACKS)
        else
            target:messageBasic(invaderXim.msg.basic.NO_EFFECT)
        end
    end
end

return itemObject
