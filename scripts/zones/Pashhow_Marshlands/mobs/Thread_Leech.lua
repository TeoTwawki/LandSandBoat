-----------------------------------
-- Area: Pashhow Marshlands
--  Mob: Thread Leech
-- Note: PH for Bloodpool Vorax
-----------------------------------
local ID = zones[invaderXim.zone.PASHHOW_MARSHLANDS]
-----------------------------------
---@type TMobEntity
local entity = {}

local bloodpoolPHTable =
{
    [ID.mob.BLOODPOOL_VORAX - 5] = ID.mob.BLOODPOOL_VORAX, -- -351.884 24.014 513.531
}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 22, 1, invaderXim.regime.type.FIELDS)
    invaderXim.regime.checkRegime(player, mob, 23, 2, invaderXim.regime.type.FIELDS)
end

entity.onMobDespawn = function(mob)
    invaderXim.mob.phOnDespawn(mob, bloodpoolPHTable, 5, 600) -- 10 minutes
end

return entity
