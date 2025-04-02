-----------------------------------
-- Area: Cape Teriggan
--  Mob: Goblin Bandit
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 105, 2, invaderXim.regime.type.FIELDS)
end

return entity
