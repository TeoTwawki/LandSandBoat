-----------------------------------
-- Area: Sauromugue Champaign
--  Mob: Hill Lizard
-----------------------------------
local ID = zones[invaderXim.zone.SAUROMUGUE_CHAMPAIGN]
-----------------------------------
---@type TMobEntity
local entity = {}

local bashePHTable =
{
    [ID.mob.BASHE - 6] = ID.mob.BASHE, -- 537.188 6.167 -11.067
}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 40, 1, invaderXim.regime.type.FIELDS)
end

entity.onMobDespawn = function(mob)
    invaderXim.mob.phOnDespawn(mob, bashePHTable, 10, 3600) -- 1 hour
end

return entity
