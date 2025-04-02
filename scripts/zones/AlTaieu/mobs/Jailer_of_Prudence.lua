-----------------------------------
-- Area: Al'Taieu
--   NM: Jailer of Prudence
-- AnimationSubs: 0 - Normal, 3 - Mouth Open
-----------------------------------
local ID = zones[invaderXim.zone.ALTAIEU]
mixins = { require('scripts/mixins/job_special') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.NO_DROPS, 1)
    mob:setMobMod(invaderXim.mobMod.IDLE_DESPAWN, 180)

    mob:addListener('WEAPONSKILL_BEFORE_USE', 'JOP_WS_MIRROR', function(mobArg, skillid)
        if mobArg:getLocalVar('mirrored_ws') == 1 then
            mobArg:setLocalVar('mirrored_ws', 0)
            return
        end

        local otherPrudence = mobArg:getID() == ID.mob.JAILER_OF_PRUDENCE and GetMobByID(ID.mob.JAILER_OF_PRUDENCE + 1) or GetMobByID(ID.mob.JAILER_OF_PRUDENCE)

        if
            otherPrudence and
            otherPrudence:isAlive() and
            otherPrudence:checkDistance(mob) <= 50
        then
            otherPrudence:setLocalVar('mirrored_ws', 1)
            otherPrudence:useMobAbility(skillid)
        end
    end)
end

entity.onMobSpawn = function(mob)
    invaderXim.mix.jobSpecial.config(mob, {
        specials =
        {
            {
                id = invaderXim.jsa.PERFECT_DODGE,
                cooldown = 120, -- "Both can use Perfect Dodge multiple times, and will do so almost incessantly." (guessing a 2 minute cooldown)
                hpp = 95,
                endCode = function(mobArg)
                    mobArg:addStatusEffectEx(invaderXim.effect.FLEE, 0, 10000, 0, 30) -- "Jailer of Prudence will however gain Flee speed during Perfect Dodge."
                end,
            },
        },
    })

    mob:setAnimationSub(0) -- Mouth closed
    mob:addStatusEffectEx(invaderXim.effect.FLEE, 0, 10000, 0, 60)
    mob:setMod(invaderXim.mod.TRIPLE_ATTACK, 20)
    mob:setMod(invaderXim.mod.REGEN, 10)
    mob:addMod(invaderXim.mod.BIND_MEVA, 30)
    mob:addMod(invaderXim.mod.SLOW_MEVA, 10)
    mob:addMod(invaderXim.mod.BLIND_MEVA, 10)
    mob:addMod(invaderXim.mod.SLEEP_MEVA, 30)
    mob:addMod(invaderXim.mod.PETRIFY_MEVA, 10)
    mob:addMod(invaderXim.mod.GRAVITY_MEVA, 10)
    mob:addMod(invaderXim.mod.LULLABY_MEVA, 30)
end

entity.onMobDisengage = function(mob)
end

entity.onMobDeath = function(mob, player, optParams)
    local count = player:getLocalVar('prudenceCount')
    local mobId = mob:getID()

    if
        mobId == ID.mob.JAILER_OF_PRUDENCE or
        mobId == ID.mob.JAILER_OF_PRUDENCE + 1
    then
        player:setLocalVar('prudenceCount', count + 1)
    end

    if count >= 2 and player:hasEminenceRecord(770) then
        invaderXim.roe.onRecordTrigger(player, 770)
        player:setLocalVar('prudenceCount', 0)
    end
end

entity.onMobDespawn = function(mob)
    if mob:getID() == ID.mob.JAILER_OF_PRUDENCE then
        local secondPrudence = GetMobByID(ID.mob.JAILER_OF_PRUDENCE + 1)

        if secondPrudence then
            secondPrudence:setMobMod(invaderXim.mobMod.NO_DROPS, 0)
            secondPrudence:setAnimationSub(3) -- Mouth Open
            secondPrudence:addMod(invaderXim.mod.ATTP, 100)
            secondPrudence:delMod(invaderXim.mod.DEFP, -50)
        end
    else
        local firstPrudence = GetMobByID(ID.mob.JAILER_OF_PRUDENCE)

        if firstPrudence then
            firstPrudence:setMobMod(invaderXim.mobMod.NO_DROPS, 0)
            firstPrudence:setAnimationSub(3) -- Mouth Open
            firstPrudence:addMod(invaderXim.mod.ATTP, 100)
            firstPrudence:delMod(invaderXim.mod.DEFP, -50)
        end
    end
end

return entity
