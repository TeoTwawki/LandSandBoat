-----------------------------------
-- Area: LaLoff Amphitheater
--  Mob: Ark Angel TT
-----------------------------------
mixins = { require('scripts/mixins/job_special') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:addMod(invaderXim.mod.UFASTCAST, 30)
end

entity.onMobSpawn = function(mob)
    invaderXim.mix.jobSpecial.config(mob, {
        between = 30,
        specials =
        {
            { id = invaderXim.jsa.BLOOD_WEAPON },
            {
                id = invaderXim.jsa.MANAFONT,
                endCode = function(mobArg) -- "Uses Manafont and ... Will cast Sleepga followed by Meteor."
                    mobArg:castSpell(273) -- sleepga
                    mobArg:castSpell(218) -- meteor
                end,
            },
        },
    })
end

entity.onMobEngage = function(mob, target)
    local mobid = mob:getID()

    for member = mobid-5, mobid + 2 do
        local m = GetMobByID(member)
        if m and m:getCurrentAction() == invaderXim.act.ROAMING then
            m:updateEnmity(target)
        end
    end
end

entity.onMobFight = function(mob, target)
    if
        mob:hasStatusEffect(invaderXim.effect.BLOOD_WEAPON) and
        bit.band(mob:getBehavior(), invaderXim.behavior.STANDBACK) > 0
    then
        mob:setBehavior(bit.band(mob:getBehavior(), bit.bnot(invaderXim.behavior.STANDBACK)))
        mob:setMobMod(invaderXim.mobMod.TELEPORT_TYPE, 0)
        mob:setMobMod(invaderXim.mobMod.SPAWN_LEASH, 0)
        mob:setSpellList(0)
    end

    if
        not mob:hasStatusEffect(invaderXim.effect.BLOOD_WEAPON) and
        bit.band(mob:getBehavior(), invaderXim.behavior.STANDBACK) == 0
    then
        mob:setBehavior(bit.bor(mob:getBehavior(), invaderXim.behavior.STANDBACK))
        mob:setMobMod(invaderXim.mobMod.TELEPORT_TYPE, 1)
        mob:setMobMod(invaderXim.mobMod.SPAWN_LEASH, 22)
        mob:setSpellList(39)
    end
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
