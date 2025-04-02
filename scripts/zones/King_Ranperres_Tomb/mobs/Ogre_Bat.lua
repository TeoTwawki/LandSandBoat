-----------------------------------
-- Area: King Ranperres Tomb
--  Mob: Ogre Bat
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 638, 2, invaderXim.regime.type.GROUNDS)
end

return entity
