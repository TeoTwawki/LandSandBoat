-----------------------------------
-- Area: Sea Serpent Grotto
--  Mob: Ironshell
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    mob:setMobMod(invaderXim.mobMod.CHARMABLE, 1)
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 805, 1, invaderXim.regime.type.GROUNDS)
end

return entity
