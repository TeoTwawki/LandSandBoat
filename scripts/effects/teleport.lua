-----------------------------------
-- invaderXim.effect.TELEPORT
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    local destination = effect:getPower()

    if target:isMob() then
        DespawnMob(target:getID())
    elseif destination == invaderXim.teleport.id.WARP then
        target:warp()
    elseif destination == invaderXim.teleport.id.ESCAPE then
        invaderXim.teleport.escape(target)
    elseif destination == invaderXim.teleport.id.OUTPOST then
        local region = effect:getSubPower()
        invaderXim.teleport.toOutpost(target, region)
    elseif destination == invaderXim.teleport.id.LEADER then
        invaderXim.teleport.toLeader(target)
    elseif destination == invaderXim.teleport.id.HOME_NATION then
        invaderXim.teleport.toHomeNation(target)
    elseif destination == invaderXim.teleport.id.RETRACE then
        invaderXim.teleport.toAlliedNation(target)
    elseif destination == invaderXim.teleport.id.TIDAL_TALISMAN then
        invaderXim.teleport.tidalTeleport(target)
    else
        invaderXim.teleport.to(target, destination)
    end
end

return effectObject
