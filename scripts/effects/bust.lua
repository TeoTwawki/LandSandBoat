-----------------------------------
-- invaderXim.effect.BUST
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    if effect:getSubType() == invaderXim.mod.DMG then
        target:addMod(invaderXim.mod.DMG, effect:getPower())
    else
        if effect:getSubType() == invaderXim.mod.ACC then
            target:addMod(invaderXim.mod.RACC, -effect:getPower())
        elseif effect:getSubType() == invaderXim.mod.ATTP then
            target:addMod(invaderXim.mod.RATTP, -effect:getPower())
        -- Pets do not and should not get separate mod IDs. we use same mod as the player,
        -- but using the pet as the base entity instead.
        -- elseif effect:getSubType() == MOD_PET_MACC then
        --     target:getPet():addMod(MOD_MATT, -effect:getPower())
        end

        target:addMod(effect:getSubType(), -effect:getPower())
    end
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    if effect:getSubType() == invaderXim.mod.DMG then
        target:delMod(invaderXim.mod.DMG, effect:getPower())
    else
        if effect:getSubType() == invaderXim.mod.ACC then
            target:delMod(invaderXim.mod.RACC, -effect:getPower())
        elseif effect:getSubType() == invaderXim.mod.ATTP then
            target:delMod(invaderXim.mod.RATTP, -effect:getPower())
        -- Pets do not and should not get separate mod IDs. we use same mod as the player,
        -- but using the pet as the base entity instead.
        -- elseif effect:getSubType() == MOD_PET_MACC then
        --     target:getPet():delMod(MOD_MATT, -effect:getPower())
        end

        target:delMod(effect:getSubType(), -effect:getPower())
    end
end

return effectObject
