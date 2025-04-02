-----------------------------------
-- Area: La Theine Plateau
--  Mob: Nihniknoovi
-----------------------------------
require('scripts/quests/tutorial')
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.IDLE_DESPAWN, 600)
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 153)
    invaderXim.tutorial.onMobDeath(player)
end

return entity
