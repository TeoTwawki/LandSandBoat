-----------------------------------
-- Area: Labyrinth of Onzozo
--  Mob: Labyrinth Manticore
-- Note: Place holder Narasimha
-----------------------------------
local ID = zones[invaderXim.zone.LABYRINTH_OF_ONZOZO]
-----------------------------------
---@type TMobEntity
local entity = {}

local narasimhaPHTable =
{
    [ID.mob.NARASIMHA - 1] = ID.mob.NARASIMHA, -- -119.897 0.275 127.060
}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 775, 2, invaderXim.regime.type.GROUNDS)
end

entity.onMobDespawn = function(mob)
    invaderXim.mob.phOnDespawn(mob, narasimhaPHTable, 10, 21600) -- 6 hours
end

return entity
