-----------------------------------
-- Area: Western Altepa Desert
--  Mob: Desert Beetle
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 136, 1, invaderXim.regime.type.FIELDS)
end

return entity
