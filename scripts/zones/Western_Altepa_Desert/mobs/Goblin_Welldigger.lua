-----------------------------------
-- Area: Western Altepa Desert
--  Mob: Goblin Welldigger
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 137, 1, invaderXim.regime.type.FIELDS)
end

return entity
