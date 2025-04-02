-----------------------------------
-- Area: RoMaeve
--  Mob: Cursed Puppet
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 121, 1, invaderXim.regime.type.FIELDS)
end

return entity
