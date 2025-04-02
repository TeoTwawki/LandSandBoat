-----------------------------------
-- Area: Den of Rancor
--  Mob: Doom Toad
-- Note: PH for Ogama
-----------------------------------
local ID = zones[invaderXim.zone.DEN_OF_RANCOR]
-----------------------------------
---@type TMobEntity
local entity = {}

local ogamaPHTable =
{
    [ID.mob.OGAMA - 2] = ID.mob.OGAMA,
    [ID.mob.OGAMA + 4] = ID.mob.OGAMA,
    [ID.mob.OGAMA + 5] = ID.mob.OGAMA,
}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 801, 2, invaderXim.regime.type.GROUNDS)
end

entity.onMobDespawn = function(mob)
    invaderXim.mob.phOnDespawn(mob, ogamaPHTable, 5, 3600) -- 1 hour
end

return entity
