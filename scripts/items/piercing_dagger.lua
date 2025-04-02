-----------------------------------
-- ID: 18029
-- Item: piercing_dagger
-- Item Effect: Attack +3
-- Duration: 30 Minutes
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    if target:getStatusEffectBySource(invaderXim.effect.ATTACK_BOOST, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.PIERCING_DAGGER) ~= nil then
        target:delStatusEffect(invaderXim.effect.ATTACK_BOOST, nil, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.PIERCING_DAGGER)
    end

    return 0
end

itemObject.onItemUse = function(target)
    if target:hasEquipped(invaderXim.item.PIERCING_DAGGER) then
        target:addStatusEffect(invaderXim.effect.ATTACK_BOOST, 3, 0, 1800, 0, 0, 0, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.PIERCING_DAGGER)
    end
end

return itemObject
