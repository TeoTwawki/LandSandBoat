-----------------------------------
-- Area: Dynamis - Xarcabard
--   NM: Dynamis Lord
-- Note: Mega Boss
-- Spawned by trading a Shrouded Bijou to the ??? in front of Castle Zvahl.
-----------------------------------
local ID = zones[invaderXim.zone.DYNAMIS_XARCABARD]
mixins = { require('scripts/mixins/job_special') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    invaderXim.mix.jobSpecial.config(mob, {
        between = 60,
        specials =
        {
            { id = invaderXim.jsa.HUNDRED_FISTS,  hpp = 95 },
            { id = invaderXim.jsa.MIGHTY_STRIKES, hpp = 95 },
            { id = invaderXim.jsa.BLOOD_WEAPON,   hpp = 95 },
            { id = invaderXim.jsa.CHAINSPELL,     hpp = 95 },
        },
    })
end

entity.onMobFight = function(mob, target)
    local battleTime = mob:getBattleTime()

    for i = 0, 1 do
        local petId = ID.mob.YING + i
        local pet = GetMobByID(petId)

        if pet then
            if
                battleTime % 90 == 0 and
                battleTime >= 90 and
                not pet:isSpawned()
            then
                pet:setSpawn(-414.282, -44, 20.427)
                pet:spawn()
                pet:updateEnmity(target)
            end

            if pet:getCurrentAction() == invaderXim.act.ROAMING then
                pet:updateEnmity(target)
            end
        end
    end
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.dynamis.megaBossOnDeath(mob, player, optParams)
    player:addTitle(invaderXim.title.LIFTER_OF_SHADOWS)
    if optParams.isKiller then
        DespawnMob(ID.mob.YING)
        DespawnMob(ID.mob.YING + 1)
    end
end

return entity
