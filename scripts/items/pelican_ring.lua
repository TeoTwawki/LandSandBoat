-----------------------------------
-- ID: 15554
-- Item: Pelican Ring
-- Fishing Skillup Rate increase
-----------------------------------
-- Duration: 20:00 min
-----------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target)
    if target:getMod(invaderXim.mod.PELICAN_RING_EFFECT) >= 2 then -- Can stack effects of 2 rings
        return invaderXim.msg.basic.ITEM_UNABLE_TO_USE_2
    end

    return 0
end

itemObject.onItemUse = function(target, user, item)
    local effect   = invaderXim.effect.ENCHANTMENT
    local power    = 0
    local tick     = 0
    local duration = 1200
    local subtype  = invaderXim.item.PELICAN_RING
    local subpower = 0
    local tier     = 0
    local flag     = invaderXim.effectFlag.ON_ZONE

    -- Allow for duplicate enchantment effects, max 2
    if target:getMod(effect, subtype) < 2 then
        target:addStatusEffectEx(effect, effect, power, tick, duration, subtype, subpower, tier, flag)
    end
end

itemObject.onEffectGain = function(target, effect)
    if target:getMod(invaderXim.mod.PELICAN_RING_EFFECT) < 2 then
        target:addMod(invaderXim.mod.PELICAN_RING_EFFECT, 1)
    end
end

itemObject.onEffectLose = function(target, effect)
    if target:getMod(invaderXim.mod.PELICAN_RING_EFFECT) > 0 then
        -- Prevent underflows with the >0 check
        target:delMod(invaderXim.mod.PELICAN_RING_EFFECT, 1)
    end
end

return itemObject
