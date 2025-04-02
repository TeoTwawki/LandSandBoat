-----------------------------------
-- Area: King Ranperres Tomb
--  Mob: Hati
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 637, 2, invaderXim.regime.type.GROUNDS)
end

return entity
