-----------------------------------
-- Area: West Sarutabaruta
--  Mob: Mandragora
-- Note: PH for Tom Tit Tat
-----------------------------------
local ID = zones[invaderXim.zone.WEST_SARUTABARUTA]
-----------------------------------
---@type TMobEntity
local entity = {}

local tomTitTatPHTable =
{
    [ID.mob.TOM_TIT_TAT - 2] = ID.mob.TOM_TIT_TAT, -- 77.509 -20.719 434.757
    [ID.mob.TOM_TIT_TAT - 1] = ID.mob.TOM_TIT_TAT, -- 31.149 -20.045 358.265
}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 26, 1, invaderXim.regime.type.FIELDS)
end

entity.onMobDespawn = function(mob)
    invaderXim.mob.phOnDespawn(mob, tomTitTatPHTable, 10, math.random(3600, 7200)) -- 1 to 2 hours
end

return entity
