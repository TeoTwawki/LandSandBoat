-----------------------------------
-- Area: South Gustaberg
--  Mob: Goblin Fisher
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 79, 1, invaderXim.regime.type.FIELDS)
end

return entity
