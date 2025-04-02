-----------------------------------
-- Area: Yuhtunga Jungle
--  Mob: Goblin Furrier
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 125, 2, invaderXim.regime.type.FIELDS)
end

return entity
