-----------------------------------
-- Area: Sea Serpent Grotto
--   NM: Yarr the Pearleyed
-----------------------------------
mixins = { require('scripts/mixins/job_special') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    invaderXim.mix.jobSpecial.config(mob, {
        specials =
        {
            { id = invaderXim.jsa.BENEDICTION, hpp = math.random(1, 50) } -- "Uses Benediction at around 50% or as low as 1%"
        }
    })
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 377)
end

return entity
