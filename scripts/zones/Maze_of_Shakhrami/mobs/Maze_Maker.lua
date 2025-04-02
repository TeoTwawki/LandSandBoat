-----------------------------------
-- Area: Maze of Shakhrami
--  Mob: Maze Maker
-- Note: PH for Trembler Tabitha
-----------------------------------
local ID = zones[invaderXim.zone.MAZE_OF_SHAKHRAMI]
-----------------------------------
---@type TMobEntity
local entity = {}

local tremblerPHTable =
{
    [ID.mob.TREMBLER_TABITHA - 2] = ID.mob.TREMBLER_TABITHA,
    [ID.mob.TREMBLER_TABITHA - 1] = ID.mob.TREMBLER_TABITHA,
}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 696, 1, invaderXim.regime.type.GROUNDS)
end

entity.onMobDespawn = function(mob)
    invaderXim.mob.phOnDespawn(mob, tremblerPHTable, 10, 3600) -- 1 hour
end

return entity
