-----------------------------------
-- Area: Dynamis - Jeuno
--  Mob: Goblin Golem
-- Note: Mega Boss
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.dynamis.megaBossOnDeath(mob, player, optParams)
    invaderXim.magian.onMobDeath(mob, player, optParams, set{ 2713 })
end

return entity
