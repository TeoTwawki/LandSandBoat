-----------------------------------
-- Area: Western Altepa Desert
--  Mob: Cactuar
-- Note: Place holder for Cactuar_Cantautor
-----------------------------------
local ID = zones[invaderXim.zone.WESTERN_ALTEPA_DESERT]
-----------------------------------
---@type TMobEntity
local entity = {}

local cantautorPHTable =
{
    [ID.mob.CACTUAR_CANTAUTOR - 1] = ID.mob.CACTUAR_CANTAUTOR, -- -458.944 0.018 -557.266
}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 136, 2, invaderXim.regime.type.FIELDS)
end

entity.onMobDespawn = function(mob)
    invaderXim.mob.phOnDespawn(mob, cantautorPHTable, 5, 3600) -- 1 hour minimum
end

return entity
