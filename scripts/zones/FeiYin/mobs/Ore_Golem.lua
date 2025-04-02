-----------------------------------
-- Area: FeiYin
--  Mob: Ore Golem
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 712, 2, invaderXim.regime.type.GROUNDS)
end

return entity
