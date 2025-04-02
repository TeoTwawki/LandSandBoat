-----------------------------------
-- Area: Giddeus (145)
--   NM: Hoo Mjuu the Torrent
-----------------------------------
mixins = { require('scripts/mixins/job_special') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    invaderXim.mix.jobSpecial.config(mob, {
        specials =
        {
            { id = invaderXim.jsa.BENEDICTION, hpp = math.random(10, 50) },
        },
    })
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 281)
    invaderXim.magian.onMobDeath(mob, player, optParams, set{ 364 })
end

return entity
