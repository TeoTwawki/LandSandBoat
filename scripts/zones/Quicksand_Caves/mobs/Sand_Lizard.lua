-----------------------------------
-- Area: Quicksand Caves
--  Mob: Sand Lizard
-- Note: PH for Nussknacker
-----------------------------------
local ID = zones[invaderXim.zone.QUICKSAND_CAVES]
-----------------------------------
---@type TMobEntity
local entity = {}

local nussknackerPHTable =
{
    [ID.mob.NUSSKNACKER - 7] = ID.mob.NUSSKNACKER, -- 189 2 4
    [ID.mob.NUSSKNACKER - 6] = ID.mob.NUSSKNACKER, -- 200 2 -4
}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 817, 1, invaderXim.regime.type.GROUNDS)
end

entity.onMobDespawn = function(mob)
    invaderXim.mob.phOnDespawn(mob, nussknackerPHTable, 5, 3600) -- 1 hour
end

return entity
