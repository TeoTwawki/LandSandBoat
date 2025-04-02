-----------------------------------
-- Area: Temenos
--  Mob: Pee Qoho the Python
-----------------------------------
mixins = { require('scripts/mixins/job_special') }
local ID = zones[invaderXim.zone.TEMENOS]
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobEngage = function(mob, target)
    if
        GetMobByID(ID.mob.TEMENOS_C_MOB[3] + 18):isDead() and GetMobByID(ID.mob.TEMENOS_C_MOB[3] + 19):isDead() and
        GetMobByID(ID.mob.TEMENOS_C_MOB[3] + 20):isDead() and GetMobByID(ID.mob.TEMENOS_C_MOB[3] + 21):isDead() and
        GetMobByID(ID.mob.TEMENOS_C_MOB[3] + 22):isDead() and GetMobByID(ID.mob.TEMENOS_C_MOB[3] + 23):isDead()
    then
        mob:setMod(invaderXim.mod.SLASH_SDT, 4000)
        mob:setMod(invaderXim.mod.PIERCE_SDT, 4000)
        mob:setMod(invaderXim.mod.IMPACT_SDT, 4000)
        mob:setMod(invaderXim.mod.HTH_SDT, 4000)
    else
        mob:setMod(invaderXim.mod.SLASH_SDT, -7000)
        mob:setMod(invaderXim.mod.PIERCE_SDT, -7000)
        mob:setMod(invaderXim.mod.IMPACT_SDT, -7000)
        mob:setMod(invaderXim.mod.HTH_SDT, -7000)
    end

    GetMobByID(ID.mob.TEMENOS_C_MOB[3]):updateEnmity(target)
    GetMobByID(ID.mob.TEMENOS_C_MOB[3] + 1):updateEnmity(target)
end

entity.onMobDeath = function(mob, player, optParams)
    if optParams.isKiller or optParams.noKiller then
        if
            GetMobByID(ID.mob.TEMENOS_C_MOB[3]):isDead() and
            GetMobByID(ID.mob.TEMENOS_C_MOB[3] + 1):isDead() and
            GetMobByID(ID.mob.TEMENOS_C_MOB[3] + 2):isDead()
        then
            GetNPCByID(ID.npc.TEMENOS_C_CRATE[3]):setStatus(invaderXim.status.NORMAL)
        end
    end
end

return entity
