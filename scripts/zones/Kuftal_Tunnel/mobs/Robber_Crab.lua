-----------------------------------
-- Area: Kuftal Tunnel
--  Mob: Robber Crab
-----------------------------------
local ID = zones[invaderXim.zone.KUFTAL_TUNNEL]
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    if mob:getID() == ID.mob.CANCER + 1 then
        mob:setMobMod(invaderXim.mobMod.IDLE_DESPAWN, 180)
    end
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 735, 1, invaderXim.regime.type.GROUNDS)
    invaderXim.regime.checkRegime(player, mob, 736, 1, invaderXim.regime.type.GROUNDS)
    invaderXim.regime.checkRegime(player, mob, 738, 1, invaderXim.regime.type.GROUNDS)
end

return entity
