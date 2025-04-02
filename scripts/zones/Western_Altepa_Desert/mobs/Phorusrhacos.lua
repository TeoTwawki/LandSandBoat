-----------------------------------
-- Area: Western Altepa Desert
--  Mob: Phorusrhacos
-- Note: PH for Picolaton
-----------------------------------
local ID = zones[invaderXim.zone.WESTERN_ALTEPA_DESERT]
-----------------------------------
---@type TMobEntity
local entity = {}

local picolatonPHTable =
{
    [ID.mob.PICOLATON - 1] = ID.mob.PICOLATON, -- 50.014 0.256 7.088
}

entity.onMobDeath = function(mob, player, optParams)
end

entity.onMobDespawn = function(mob)
    -- Picolaton PH has a varied spawn location
    if mob:getID() == (ID.mob.PICOLATON - 1) then
        UpdateNMSpawnPoint(mob:getID())
    end

    invaderXim.mob.phOnDespawn(mob, picolatonPHTable, 10, 6400)
end

return entity
