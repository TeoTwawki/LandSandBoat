-----------------------------------
-- ID: 4182
--  Scroll of Instant ReRaise
--  Brings you back from the dead~!
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    local power = 1
    local duration = 1800
    if target:hasStatusEffect(invaderXim.effect.RERAISE) then
        local effect = target:getStatusEffect(invaderXim.effect.RERAISE)
        if not effect then
            return
        end

        local oPower = effect:getPower()

        if oPower > power then
            target:messageBasic(invaderXim.msg.basic.NO_EFFECT)
        else
            target:delStatusEffect(invaderXim.effect.RERAISE)
            target:addStatusEffect(invaderXim.effect.RERAISE, power, 0, duration)
        end
    else
        target:addStatusEffect(invaderXim.effect.RERAISE, power, 0, duration)
    end
end

return itemObject
