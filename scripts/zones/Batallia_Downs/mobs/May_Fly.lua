-----------------------------------
-- Area: Batallia Downs
--  Mob: May Fly
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 15, 1, invaderXim.regime.type.FIELDS)
    invaderXim.regime.checkRegime(player, mob, 72, 2, invaderXim.regime.type.FIELDS)
end

return entity
