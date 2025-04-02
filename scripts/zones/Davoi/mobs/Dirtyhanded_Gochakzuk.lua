-----------------------------------
-- Area: Davoi
--   NM: Dirtyhanded Gochakzuk
-----------------------------------
mixins = { require('scripts/mixins/job_special') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:addMod(invaderXim.mod.FASTCAST, 70)
    mob:setMod(invaderXim.mod.SILENCE_MEVA, 75)
    mob:setMod(invaderXim.mod.SLEEP_MEVA, 75)
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
