-----------------------------------
-- Praecipitatio Cell
-- ID 5378
-- Unlocks magic
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    if target:hasStatusEffect(invaderXim.effect.OMERTA) then
        return 0
    end

    return -1
end

itemObject.onItemUse = function(target)
    target:delStatusEffectSilent(invaderXim.effect.OMERTA)
    target:messageText(target, zones[target:getZoneID()].text.CELL_OFFSET + 10)
    if target:hasPet() then
        target:getPet():delStatusEffectSilent(invaderXim.effect.OMERTA)
    end
end

return itemObject
