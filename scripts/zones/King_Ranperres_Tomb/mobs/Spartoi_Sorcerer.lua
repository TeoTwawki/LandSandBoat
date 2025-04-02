-----------------------------------
-- Area: King Ranperres Tomb
--  Mob: Spartoi Sorcerer
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 638, 1, invaderXim.regime.type.GROUNDS)
end

return entity
