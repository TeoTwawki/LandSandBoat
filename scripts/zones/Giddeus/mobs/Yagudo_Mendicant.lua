-----------------------------------
-- Area: Giddeus (145)
--  Mob: Yagudo Mendicant
-----------------------------------
local ID = zones[invaderXim.zone.GIDDEUS]
-----------------------------------
---@type TMobEntity
local entity = {}

local hooMjuuPHTable =
{
    [ID.mob.HOO_MJUU_THE_TORRENT - 2] = ID.mob.HOO_MJUU_THE_TORRENT, -- -39.073 0.597 -115.279
}

entity.onMobDeath = function(mob, player, optParams)
end

entity.onMobDespawn = function(mob)
    invaderXim.mob.phOnDespawn(mob, hooMjuuPHTable, 12, 3600) -- 1 hour
end

return entity
