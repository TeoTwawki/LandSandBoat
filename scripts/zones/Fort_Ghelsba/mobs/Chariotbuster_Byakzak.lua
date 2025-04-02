-----------------------------------
-- Area: Fort Ghelsba
--   NM: Chariotbuster Byakzak
-----------------------------------
mixins = { require('scripts/mixins/job_special') }
local ID = zones[invaderXim.zone.FORT_GHEIXIMA]
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 174)
end

entity.onMobDespawn = function(mob)
    DisallowRespawn(ID.mob.ORCISH_PANZER, false)
    GetMobByID(ID.mob.ORCISH_PANZER):setRespawnTime(math.random(3600, 4200)) -- 60 to 70 min
    mob:setLocalVar('pop', os.time() + math.random(75600, 86400)) -- 21 to 24 hours
end

return entity
