-----------------------------------
-- Area: Carpenters' Landing
--   NM: Cryptonberry Assassin
-- !pos 120.615 -5.457 -390.133 2
-----------------------------------
local ID = zones[invaderXim.zone.CARPENTERS_LANDING]
-----------------------------------
---@type TMobEntity
local entity = {}

local cryptonberrySpecials =
{
    [invaderXim.job.SMN] = invaderXim.jsa.ASTRAL_FLOW,
    [invaderXim.job.BLM] = invaderXim.jsa.MANAFONT,
    [invaderXim.job.THF] = invaderXim.jsa.PERFECT_DODGE,
}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.IDLE_DESPAWN, 180) -- 3 minutes
end

entity.onMobSpawn = function(mob)
    mob:addImmunity(invaderXim.immunity.LIGHT_SLEEP)
    mob:setMod(invaderXim.mod.SLEEP_MEVA, 90)
    mob:addImmunity(invaderXim.immunity.SILENCE)
    -- assassins and executor have special 2hr logic thus use local vars to track
    mob:setLocalVar('twoHourThreshold', math.random(20, 75))
end

entity.onMobFight = function(mob, target)
    -- mob 2hr was triggered by executor death
    if
        mob:getLocalVar('triggerTwoHour') == 1 and
        mob:getLocalVar('usedTwoHour') == 0
    then
        mob:setLocalVar('usedTwoHour', 1)
        mob:messageText(mob, ID.text.CRYPTONBERRY_ASSASSIN_2HR)
        mob:useMobAbility(cryptonberrySpecials[mob:getMainJob()])
    -- mob 2hr was unlocked by executor death but still need to reach random threshold
    elseif
        mob:getLocalVar('unlockTwoHour') == 1 and
        mob:getLocalVar('usedTwoHour') == 0 and
        mob:getHPP() < mob:getLocalVar('twoHourThreshold')
    then
        mob:setLocalVar('usedTwoHour', 1)
        mob:messageText(mob, ID.text.CRYPTONBERRY_ASSASSIN_2HR)
        mob:useMobAbility(cryptonberrySpecials[mob:getMainJob()])
    end
end

entity.onMobDeath = function(mob, player, optParams)
    if mob:getLocalVar('firstOnMobDeathCall') == 0 then
        -- have the executor track how many assassins have been killed
        -- so executor can use 2hr after first one
        mob:setLocalVar('firstOnMobDeathCall', 1)
        local executor = GetMobByID(ID.mob.CRYPTONBERRY_EXECUTOR)
        if
            executor and
            executor:isAlive()
        then
            executor:setLocalVar('assassinsKilled', executor:getLocalVar('assassinsKilled') + 1)
        end
    end
end

return entity
