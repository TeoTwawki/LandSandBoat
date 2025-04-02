-----------------------------------
-- Area: Lower Delkfutt's Tower
--  Mob: Giant Gatekeeper
-- Note: PH for Epialtes and Hippolytos
-----------------------------------
local ID = zones[invaderXim.zone.LOWER_DELKFUTTS_TOWER]
-----------------------------------
---@type TMobEntity
local entity = {}

local hippolytosPHTable =
{
    [ID.mob.HIPPOLYTOS + 1] = ID.mob.HIPPOLYTOS, -- 337.079 -16.1 17.386
}

local epialtesPHTable =
{
    [ID.mob.EPIALTES + 1] = ID.mob.EPIALTES, -- 432.952 -0.350 -3.719
    [ID.mob.EPIALTES + 6] = ID.mob.EPIALTES, -- 484.735 0.046 23.048
}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 778, 2, invaderXim.regime.type.GROUNDS)
end

entity.onMobDespawn = function(mob)
    invaderXim.mob.phOnDespawn(mob, epialtesPHTable, 5, 1) -- no cooldown
    invaderXim.mob.phOnDespawn(mob, hippolytosPHTable, 5, 1) -- no cooldown
end

return entity
