-----------------------------------
-- ID: 17683
-- Item: Sacred Degen
-- Enchantment: Enlight
-- Duration: 3 minutes
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target)
    if target:getStatusEffectBySource(invaderXim.effect.ENLIGHT, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.SACRED_DEGEN) ~= nil then
        target:delStatusEffect(invaderXim.effect.ENLIGHT, nil, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.SACRED_DEGEN)
    end

    return 0
end

itemObject.onItemUse = function(target)
    if target:hasEquipped(invaderXim.item.SACRED_DEGEN) then
        local effect = invaderXim.effect.ENLIGHT
        local magicskill = target:getSkillLevel(invaderXim.skill.ENHANCING_MAGIC)
        local potency = 0

        if magicskill <= 200 then
            potency = 3 + math.floor(6 * magicskill / 100)
        elseif magicskill > 200 then
            potency = 5 + math.floor(5 * magicskill / 100)
        end

        potency = utils.clamp(potency, 3, 25)

        target:addStatusEffect(effect, potency, 0, 180, 0, 0, 0, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.SACRED_DEGEN)
    end
end

return itemObject
