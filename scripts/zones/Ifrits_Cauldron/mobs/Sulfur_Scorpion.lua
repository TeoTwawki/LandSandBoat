-----------------------------------
-- Area: Ifrit's Cauldron
--  Mob: Sulfur Scorpion
-- Note: PH for Tyrannic Turrok
-----------------------------------
local ID = zones[invaderXim.zone.IFRITS_CAULDRON]
-----------------------------------
---@type TMobEntity
local entity = {}

local tyrannicPHTable =
{
    [ID.mob.TYRANNIC_TUNNOK - 3] = ID.mob.TYRANNIC_TUNNOK,
    [ID.mob.TYRANNIC_TUNNOK + 1] = ID.mob.TYRANNIC_TUNNOK,
    [ID.mob.TYRANNIC_TUNNOK + 2] = ID.mob.TYRANNIC_TUNNOK,
}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 759, 2, invaderXim.regime.type.GROUNDS)
end

entity.onMobDespawn = function(mob)
    invaderXim.mob.phOnDespawn(mob, tyrannicPHTable, 5, 3600) -- 1 hour
end

return entity
