-----------------------------------
-- Area: Grand Palace of HuXzoi
--   NM: Qn'aern
-- Note: The RDM and WHM versions in Palace assist Ix'Aern (MNK)
--       All Qn'aerns can use their respective two-hour abilities multiple times
-----------------------------------
mixins = { require('scripts/mixins/job_special') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.IDLE_DESPAWN, 180)
end

entity.onMobSpawn = function(mob)
    mob:addImmunity(invaderXim.immunity.LIGHT_SLEEP)
    mob:addImmunity(invaderXim.immunity.DARK_SLEEP)
    mob:addImmunity(invaderXim.immunity.SILENCE)
    mob:addImmunity(invaderXim.immunity.BIND)
    mob:addImmunity(invaderXim.immunity.STUN)
    mob:addImmunity(invaderXim.immunity.TERROR)

    local mJob = mob:getMainJob()

    if mJob == invaderXim.job.RDM then
        mob:setMod(invaderXim.mod.FASTCAST, 15)
        -- captures show chainspell cooldowns of one min and four mins (select a random value between)
        invaderXim.mix.jobSpecial.config(mob, { specials = { { id = invaderXim.jsa.CHAINSPELL, hpp = math.random(90, 95), cooldown = math.random(60, 240) } } })
    elseif mJob == invaderXim.job.WHM then
        mob:setMod(invaderXim.mod.REGEN, 3)
        invaderXim.mix.jobSpecial.config(mob, { specials = { { id = invaderXim.jsa.BENEDICTION, hpp = math.random(20, 40), cooldown = 120 } } })
    end
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
