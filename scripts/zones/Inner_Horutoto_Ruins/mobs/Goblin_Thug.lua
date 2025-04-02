-----------------------------------
-- Area: Inner Horutoto Ruins
--  Mob: Goblin Thug
-----------------------------------
local ID = zones[invaderXim.zone.INNER_HORUTOTO_RUINS]
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 647, 2, invaderXim.regime.type.GROUNDS)
end

entity.onMobDespawn = function(mob)
    -- This is a work around until "spawn slots" are a thing
    local params = {}
    params.nightOnly = true
    invaderXim.mob.phOnDespawn(mob, { [ID.mob.MAGICKED_BONES - 2] = ID.mob.MAGICKED_BONES }, 50, 1, params) -- { [Goblin Thug] = Club_Magicked_Bones }
end

return entity
