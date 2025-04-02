-----------------------------------
-- ID: 14541
-- Item: taikyoku_kenpogi
-- Item Effect: Eva +3
-- Duration: 30 Minutes
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    if target:getStatusEffectBySource(invaderXim.effect.EVASION_BOOST, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.TAIKYOKU_KENPOGI) ~= nil then
        target:delStatusEffect(invaderXim.effect.EVASION_BOOST, nil, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.TAIKYOKU_KENPOGI)
    end

    return 0
end

itemObject.onItemUse = function(target)
    if target:hasEquipped(invaderXim.item.TAIKYOKU_KENPOGI) then
        target:addStatusEffect(invaderXim.effect.EVASION_BOOST, 3, 0, 1800, 0, 0, 0, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.TAIKYOKU_KENPOGI)
    end
end

return itemObject
