-----------------------------------
-- Area: King Ranperres Tomb
--  Mob: Mouse Bat
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 631, 1, invaderXim.regime.type.GROUNDS)
end

return entity
