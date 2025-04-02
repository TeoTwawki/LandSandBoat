-----------------------------------
-- Area: The Garden of Ru'Hmet
-- NM: Ix'aern DRK
-- !pos -240 5.00 440 35
-- !pos -280 5.00 240 35
-- !pos -560 5.00 239 35
-- !pos -600 5.00 440 35
-----------------------------------
mixins = { require('scripts/mixins/job_special') }
-----------------------------------
---@type TMobEntity
local entity = {}

-- TODO: Resistances need verifying: Light_Sleep, Poison, Requiem, Terror, Dispel, Petrify

entity.onMobInitialize = function(IxAernDrkMob)
    IxAernDrkMob:setMobMod(invaderXim.mobMod.IDLE_DESPAWN, 300)

    IxAernDrkMob:addListener('DEATH', 'AERN_DEATH', function(mob, killer)
        local timesReraised = mob:getLocalVar('AERN_RERAISES')
        if math.random (1, 10) < 10 then
            -- reraise
            local target = mob:getTarget()
            if
                target:isPet() and
                not target:isAlive()
            then
                target = target:getMaster()
            end

            mob:setMobMod(invaderXim.mobMod.NO_DROPS, 1)
            mob:timer(9000, function(mobArg)
                mobArg:setHP(mob:getMaxHP())
                mobArg:setMP(mob:getMaxMP())
                mobArg:setAnimationSub(3)
                mobArg:resetAI()
                mobArg:stun(3000)
                if
                    mobArg:checkDistance(target) < 25 and
                    target:isAlive()
                then
                    mobArg:updateClaim(target)
                    mobArg:updateEnmity(target)
                else
                    local partySize = killer:getPartySize() -- Check for other available valid aggro targets
                    local i = 1
                    if killer ~= nil then
                        for _, partyMember in pairs(killer:getAlliance()) do --TODO add enmity list check when binding avail
                            if partyMember:isAlive() and mobArg:checkDistance(partyMember) < 25 then
                                mobArg:updateClaim(partyMember)
                                mobArg:updateEnmity(partyMember)
                                break
                            elseif i == partySize then --if all checks fail just disengage
                                mobArg:disengage()
                            end

                            i = i + 1
                        end
                    else
                        mobArg:disengage()
                    end
                end

                mobArg:triggerListener('AERN_RERAISE', mobArg, timesReraised)
            end)
        else
            -- death
            mob:setMobMod(invaderXim.mobMod.NO_DROPS, 0)
            -- DespawnMob(QnAernA)
            -- DespawnMob(QnAernB)
        end
    end)

    IxAernDrkMob:addListener('AERN_RERAISE', 'IX_DRK_RERAISE', function(mob, timesReraised)
        mob:setLocalVar('AERN_RERAISES', timesReraised + 1)
        mob:timer(5000, function(mobArg)
            mobArg:setAnimationSub(1)
        end)
    end)
end

entity.onMobSpawn = function(mob)
    mob:setAnimationSub(1)

    -- Not immune to: Drain, Aspir
    -- Resistances Confirmed
    mob:addImmunity(invaderXim.immunity.ELEGY)
    mob:addImmunity(invaderXim.immunity.STUN)
    mob:addImmunity(invaderXim.immunity.BIND)
    mob:addImmunity(invaderXim.immunity.SLOW)
    mob:addImmunity(invaderXim.immunity.PARALYZE)
    mob:addImmunity(invaderXim.immunity.DARK_SLEEP)
    mob:addImmunity(invaderXim.immunity.GRAVITY)
    mob:addImmunity(invaderXim.immunity.SILENCE)
    mob:addImmunity(invaderXim.immunity.BLIND)

    invaderXim.mix.jobSpecial.config(mob, {
        specials =
        {
            {
                id = invaderXim.jsa.BLOOD_WEAPON_IXDRK,
                hpp = math.random(90, 95),
                cooldown = 120,
                endCode = function(mobArg)
                    mobArg:setMagicCastingEnabled(false)
                    mobArg:timer(30000, function(mobTimerArg)
                        mobTimerArg:setMagicCastingEnabled(true)
                    end)
                end,
            }
        }
    })
end

entity.onMobDeath = function(mob, player, optParams)
end

entity.onMobDespawn = function(mob)
    mob:setLocalVar('AERN_RERAISES', 0)
end

return entity
