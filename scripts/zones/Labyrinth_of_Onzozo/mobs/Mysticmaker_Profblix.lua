-----------------------------------
-- Area: Labyrinth of Onzozo
--   NM: Mysticmaker Profblix
-----------------------------------
mixins = { require('scripts/mixins/job_special') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:addImmunity(invaderXim.immunity.STUN)
    mob:addMod(invaderXim.mod.SILENCE_MEVA, 80)
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 771, 2, invaderXim.regime.type.GROUNDS)
    invaderXim.regime.checkRegime(player, mob, 772, 2, invaderXim.regime.type.GROUNDS)
    invaderXim.regime.checkRegime(player, mob, 774, 2, invaderXim.regime.type.GROUNDS)
end

entity.onMobDespawn = function(mob)
    UpdateNMSpawnPoint(mob:getID())
    mob:setRespawnTime(math.random(24, 30) * 300) -- 2 to 2.5 hours in 5 minute windows
end

return entity
