-----------------------------------
-- Cirrocumulus Cell
-- ID 5370
-- Unlocks back and waist equipment
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    local encumbrance = target:getStatusEffect(invaderXim.effect.ENCUMBRANCE_I)
    if encumbrance then
        local power = encumbrance:getPower()
        if bit.band(power, 0x8400) > 0 then
            return 0
        end
    end

    return -1
end

itemObject.onItemUse = function(target)
    local encumbrance = target:getStatusEffect(invaderXim.effect.ENCUMBRANCE_I)
    if not encumbrance then
        return
    end

    local power = encumbrance:getPower()
    local newpower = bit.band(power, bit.bnot(0x8400))
    target:delStatusEffectSilent(invaderXim.effect.ENCUMBRANCE_I)
    if newpower > 0 then
        target:addStatusEffectEx(invaderXim.effect.ENCUMBRANCE_I, invaderXim.effect.ENCUMBRANCE_I, newpower, 0, 0)
    end

    target:messageText(target, zones[target:getZoneID()].text.CELL_OFFSET + 5)
end

return itemObject
