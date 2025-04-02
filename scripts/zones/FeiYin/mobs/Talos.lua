-----------------------------------
-- Area: FeiYin
--  Mob: Talos
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 713, 2, invaderXim.regime.type.GROUNDS)
end

return entity
