-----------------------------------
-- ID: 18379
-- Item: Vulcan Claymore
-- Item Effect: Enfire
-- Duration: 3 minutes
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target)
    if target:getStatusEffectBySource(invaderXim.effect.ENFIRE, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.VULCAN_CLAYMORE) ~= nil then
        target:delStatusEffect(invaderXim.effect.ENFIRE, nil, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.VULCAN_CLAYMORE)
    end

    return 0
end

itemObject.onItemUse = function(target)
    if target:hasEquipped(invaderXim.item.VULCAN_CLAYMORE) then
        local effect = invaderXim.effect.ENFIRE
        local magicskill = target:getSkillLevel(invaderXim.skill.ENHANCING_MAGIC)
        local potency = 0

        if magicskill <= 200 then
            potency = 3 + math.floor(6 * magicskill / 100)
        elseif magicskill > 200 then
            potency = 5 + math.floor(5 * magicskill / 100)
        end

        potency = utils.clamp(potency, 3, 25)

        target:addStatusEffect(effect, potency, 0, 180, 0, 0, 0, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.VULCAN_CLAYMORE)
    end
end

return itemObject
