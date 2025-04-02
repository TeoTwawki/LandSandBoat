-----------------------------------
-- Global version of onMobDeath
-----------------------------------
require('scripts/globals/missions')
require('scripts/globals/quests')
require('scripts/globals/magic')
require('scripts/globals/utils')
-----------------------------------
xi = xi or {}
invaderXim.mob = invaderXim.mob or {}

-- onMobDeathEx is called from the core
invaderXim.mob.onMobDeathEx = function(mob, player, isKiller, isWeaponSkillKill)
end

-----------------------------------
-- placeholder / lottery NMs
-----------------------------------

-- is a lottery NM already spawned or primed to pop?
local function lotteryPrimed(phList)
    local nm

    for k, v in pairs(phList) do
        nm = GetMobByID(v)
        if nm ~= nil and (nm:isSpawned() or nm:getRespawnTime() ~= 0) then
            return true
        end
    end

    return false
end

invaderXim.mob.updateNMSpawnPoint = function(mob, spawnPoints)
    -- This function is used to replace UpdateNMSpawnPoints() inside the Zone.lua files and the NM despawn scripts
    -- Once UpdateNMSpawnPoints() is no longer used, this note can be removed
    -- Spawnpoints is a table of {x = , y = , z = }
    if spawnPoints ~= nil and #spawnPoints > 0 then
        local chosenSpawn    = utils.randomEntry(spawnPoints)
        local randomRotation = math.random(0, 255) -- rotation does not matter

        -- Updates the mob's spawn point
        mob:setSpawn(chosenSpawn.x, chosenSpawn.y, chosenSpawn.z, randomRotation)
    else
        printf('No spawn points defined for mob %s (%u) in spawnPoints.', mob:getName(), mob:getID())
    end
end

-- potential lottery placeholder was killed
invaderXim.mob.phOnDespawn = function(ph, phList, chance, cooldown, params)
    params = params or {}
    --[[
        params.immediate   = true    pop NM without waiting for next PH pop time
        params.dayOnly     = true    spawn NM only at day time
        params.nightOnly   = true    spawn NM only at night time
        params.noPosUpdate = true    do not run UpdateNMSpawnPoint()
        params.spawnPoints = {x = , y = , z = } table of spawn points to choose from
    ]]

    if type(params.immediate) ~= 'boolean' then
        params.immediate = false
    end

    if type(params.dayOnly) ~= 'boolean' then
        params.dayOnly = false
    end

    if type(params.nightOnly) ~= 'boolean' then
        params.nightOnly = false
    end

    if type(params.noPosUpdate) ~= 'boolean' then
        params.noPosUpdate = false
    end

    if invaderXim.settings.main.NM_LOTTERY_CHANCE then
        chance = invaderXim.settings.main.NM_LOTTERY_CHANCE >= 0 and (chance * invaderXim.settings.main.NM_LOTTERY_CHANCE) or 100
    end

    if invaderXim.settings.main.NM_LOTTERY_COOLDOWN then
        cooldown = invaderXim.settings.main.NM_LOTTERY_COOLDOWN >= 0 and (cooldown * invaderXim.settings.main.NM_LOTTERY_COOLDOWN) or cooldown
    end

    local phId = ph:getID()
    local nmId = phList[phId]

    if nmId ~= nil then
        local nm = GetMobByID(nmId)
        if nm ~= nil then
            local pop = nm:getLocalVar('pop')

            chance = math.ceil(chance * 10) -- chance / 1000.

            if
                os.time() > pop and
                not lotteryPrimed(phList) and
                math.random(1, 1000) <= chance
            then
                local nextRepopTime = os.time() + GetMobRespawnTime(phId)
                -- That's earth time, subtract SE epoch to get Vanatime
                nextRepopTime = nextRepopTime - 1009810800
                -- The enum bakes in a multiplication of 2.4, gotta reverse that to get accurate hour
                local nextRepopDate = (nextRepopTime / 60 * 25) + 886 * (invaderXim.vanaTime.YEAR / 2.4)
                local nextRepopHour = (nextRepopDate % (invaderXim.vanaTime.DAY / 2.4)) / (invaderXim.vanaTime.HOUR / 2.4)
                -- If the NM is day only and spawn would happen during the night, bail out
                if
                    params.dayOnly and
                    nextRepopHour < 4 and
                    nextRepopHour >= 20
                then
                    return false
                -- If the NM is night only and spawn would happen during the day, bail out
                elseif
                    params.nightOnly and
                    nextRepopHour >= 4 and
                    nextRepopHour < 20
                then
                    return false
                end

                -- on PH death, replace PH repop with NM repop
                DisallowRespawn(phId, true)
                DisallowRespawn(nmId, false)

                -- This is a temporary solution until all NMs have been updated to use params.spawnPoints and moved out of sql
                if params.spawnPoints then
                    if params.spawnPoints[nmId] then -- Special check for NMs with multiple IDs
                        invaderXim.mob.updateNMSpawnPoint(nm, params.spawnPoints[nmId])
                    else
                        invaderXim.mob.updateNMSpawnPoint(nm, params.spawnPoints)
                    end

                    params.noPosUpdate = true -- If we have a table of spawn points, we don't need to run UpdateNMSpawnPoint()
                end

                if not params.noPosUpdate then
                    UpdateNMSpawnPoint(nmId) -- This needs to stay here until all NMs have been updated to use params.spawnPoints and moved out of sql
                end

                -- if params.immediate is true, spawn the nm params.immediately (1ms) else use placeholder's timer
                nm:setRespawnTime(params.immediate and 1 or GetMobRespawnTime(phId))

                nm:addListener('DESPAWN', 'DESPAWN_' .. nmId, function(m)
                    -- on NM death, replace NM repop with PH repop
                    DisallowRespawn(nmId, true)
                    DisallowRespawn(phId, false)
                    GetMobByID(phId):setRespawnTime(GetMobRespawnTime(phId))

                    if m:getLocalVar('doNotInvokeCooldown') == 0 then
                        m:setLocalVar('pop', os.time() + cooldown)
                    end

                    m:removeListener('DESPAWN_' .. nmId)
                end)

                return true
            end
        end
    end

    return false
end

-----------------------------------
-- Mob skills
-----------------------------------
invaderXim.mob.skills =
{
    RECOIL_DIVE = 641,
    CYTOKINESIS = 2514,
    DISSOLVE = 2550,
}

-----------------------------------
-- mob additional melee effects
-----------------------------------

invaderXim.mob.additionalEffect =
{
    BLIND      = 0,
    CURSE      = 1,
    ENAERO     = 2,
    ENBLIZZARD = 3,
    ENDARK     = 4,
    ENFIRE     = 5,
    ENLIGHT    = 6,
    ENSTONE    = 7,
    ENTHUNDER  = 8,
    ENWATER    = 9,
    EVA_DOWN   = 10,
    HP_DRAIN   = 11,
    MP_DRAIN   = 12,
    PARALYZE   = 13,
    PETRIFY    = 14,
    PLAGUE     = 15,
    POISON     = 16,
    SILENCE    = 17,
    SLOW       = 18,
    STUN       = 19,
    TERROR     = 20,
    TP_DRAIN   = 21,
    WEIGHT     = 22,
    ENAMNESIA  = 23,
}
invaderXim.mob.ae = invaderXim.mob.additionalEffect

local additionalEffects =
{
    [invaderXim.mob.ae.BLIND] =
    {
        chance = 25,
        ele         = invaderXim.element.DARK,
        sub         = invaderXim.subEffect.BLIND,
        msg         = invaderXim.msg.basic.ADD_EFFECT_STATUS,
        applyEffect = true,
        eff         = invaderXim.effect.BLINDNESS,
        power       = 20,
        duration    = 30,
        minDuration = 1,
        maxDuration = 45,
    },

    [invaderXim.mob.ae.CURSE] =
    {
        chance      = 20,
        ele         = invaderXim.element.DARK,
        sub         = invaderXim.subEffect.CURSE,
        msg         = invaderXim.msg.basic.ADD_EFFECT_STATUS,
        applyEffect = true,
        eff         = invaderXim.effect.CURSE_I,
        power       = 50,
        duration    = 300,
        minDuration = 1,
        maxDuration = 300,
    },

    [invaderXim.mob.ae.ENAERO] =
    {
        ele                = invaderXim.element.WIND,
        sub                = invaderXim.subEffect.WIND_DAMAGE,
        msg                = invaderXim.msg.basic.ADD_EFFECT_DMG,
        negMsg             = invaderXim.msg.basic.ADD_EFFECT_HEAL,
        mod                = invaderXim.mod.INT,
        bonusAbilityParams = { bonusmab = 0, includemab = false },
    },

    [invaderXim.mob.ae.ENBLIZZARD] =
    {
        ele                = invaderXim.element.ICE,
        sub                = invaderXim.subEffect.ICE_DAMAGE,
        msg                = invaderXim.msg.basic.ADD_EFFECT_DMG,
        negMsg             = invaderXim.msg.basic.ADD_EFFECT_HEAL,
        mod                = invaderXim.mod.INT,
        bonusAbilityParams = { bonusmab = 0, includemab = false },
    },

    [invaderXim.mob.ae.ENDARK] =
    {
        ele                = invaderXim.element.DARK,
        sub                = invaderXim.subEffect.DARKNESS_DAMAGE,
        msg                = invaderXim.msg.basic.ADD_EFFECT_DMG,
        negMsg             = invaderXim.msg.basic.ADD_EFFECT_HEAL,
        mod                = invaderXim.mod.INT,
        bonusAbilityParams = { bonusmab = 0, includemab = false },
    },

    [invaderXim.mob.ae.ENFIRE] =
    {
        ele                = invaderXim.element.FIRE,
        sub                = invaderXim.subEffect.FIRE_DAMAGE,
        msg                = invaderXim.msg.basic.ADD_EFFECT_DMG,
        negMsg             = invaderXim.msg.basic.ADD_EFFECT_HEAL,
        mod                = invaderXim.mod.INT,
        bonusAbilityParams = { bonusmab = 0, includemab = false },
    },

    [invaderXim.mob.ae.ENLIGHT] =
    {
        ele                = invaderXim.element.LIGHT,
        sub                = invaderXim.subEffect.LIGHT_DAMAGE,
        msg                = invaderXim.msg.basic.ADD_EFFECT_DMG,
        negMsg             = invaderXim.msg.basic.ADD_EFFECT_HEAL,
        mod                = invaderXim.mod.INT,
        bonusAbilityParams = { bonusmab = 0, includemab = false },
    },

    [invaderXim.mob.ae.ENSTONE] =
    {
        ele                = invaderXim.element.EARTH,
        sub                = invaderXim.subEffect.EARTH_DAMAGE,
        msg                = invaderXim.msg.basic.ADD_EFFECT_DMG,
        negMsg             = invaderXim.msg.basic.ADD_EFFECT_HEAL,
        mod                = invaderXim.mod.INT,
        bonusAbilityParams = { bonusmab = 0, includemab = false },
    },

    [invaderXim.mob.ae.ENTHUNDER] =
    {
        ele                = invaderXim.element.THUNDER,
        sub                = invaderXim.subEffect.LIGHTNING_DAMAGE,
        msg                = invaderXim.msg.basic.ADD_EFFECT_DMG,
        negMsg             = invaderXim.msg.basic.ADD_EFFECT_HEAL,
        mod                = invaderXim.mod.INT,
        bonusAbilityParams = { bonusmab = 0, includemab = false },
    },

    [invaderXim.mob.ae.ENWATER] =
    {
        ele                = invaderXim.element.WATER,
        sub                = invaderXim.subEffect.WATER_DAMAGE,
        msg                = invaderXim.msg.basic.ADD_EFFECT_DMG,
        negMsg             = invaderXim.msg.basic.ADD_EFFECT_HEAL,
        mod                = invaderXim.mod.INT,
        bonusAbilityParams = { bonusmab = 0, includemab = false },
    },

    [invaderXim.mob.ae.EVA_DOWN] =
    {
        chance      = 25,
        ele         = invaderXim.element.ICE,
        sub         = invaderXim.subEffect.EVASION_DOWN,
        msg         = invaderXim.msg.basic.ADD_EFFECT_STATUS,
        applyEffect = true,
        eff         = invaderXim.effect.EVASION_DOWN,
        power       = 25,
        duration    = 30,
        minDuration = 1,
        maxDuration = 60,
    },

    [invaderXim.mob.ae.HP_DRAIN] =
    {
        chance             = 10,
        ele                = invaderXim.element.DARK,
        sub                = invaderXim.subEffect.HP_DRAIN,
        msg                = invaderXim.msg.basic.ADD_EFFECT_HP_DRAIN,
        mod                = invaderXim.mod.INT,
        bonusAbilityParams = { bonusmab = 0, includemab = false },
        code               = function(mob, target, power)
            mob:addHP(power)
        end,
    },

    [invaderXim.mob.ae.MP_DRAIN] =
    {
        chance             = 10,
        ele                = invaderXim.element.DARK,
        sub                = invaderXim.subEffect.MP_DRAIN,
        msg                = invaderXim.msg.basic.ADD_EFFECT_MP_DRAIN,
        mod                = invaderXim.mod.INT,
        bonusAbilityParams = { bonusmab = 0, includemab = false },
        code               = function(mob, target, power)
            local mp = math.min(power, target:getMP())
            target:delMP(mp)
            mob:addMP(mp)
        end,
    },

    [invaderXim.mob.ae.PARALYZE] =
    {
        chance      = 25,
        ele         = invaderXim.element.ICE,
        sub         = invaderXim.subEffect.PARALYSIS,
        msg         = invaderXim.msg.basic.ADD_EFFECT_STATUS,
        applyEffect = true,
        eff         = invaderXim.effect.PARALYSIS,
        power       = 20,
        duration    = 30,
        minDuration = 1,
        maxDuration = 60,
    },

    [invaderXim.mob.ae.PETRIFY] =
    {
        chance      = 20,
        ele         = invaderXim.element.EARTH,
        sub         = invaderXim.subEffect.PETRIFY,
        msg         = invaderXim.msg.basic.ADD_EFFECT_STATUS,
        applyEffect = true,
        eff         = invaderXim.effect.PETRIFICATION,
        power       = 1,
        duration    = 30,
        minDuration = 1,
        maxDuration = 45,
    },

    [invaderXim.mob.ae.PLAGUE] =
    {
        chance      = 25,
        ele         = invaderXim.element.WATER,
        sub         = invaderXim.subEffect.PLAGUE,
        msg         = invaderXim.msg.basic.ADD_EFFECT_STATUS,
        applyEffect = true,
        eff         = invaderXim.effect.PLAGUE,
        power       = 1,
        duration    = 60,
        minDuration = 1,
        maxDuration = 60,
    },

    [invaderXim.mob.ae.POISON] =
    {
        chance      = 25,
        ele         = invaderXim.element.WATER,
        sub         = invaderXim.subEffect.POISON,
        msg         = invaderXim.msg.basic.ADD_EFFECT_STATUS,
        applyEffect = true,
        eff         = invaderXim.effect.POISON,
        power       = 1,
        duration    = 30,
        minDuration = 1,
        maxDuration = 30,
        tick        = 3,
    },

    [invaderXim.mob.ae.SILENCE] =
    {
        chance      = 25,
        ele         = invaderXim.element.WIND,
        sub         = invaderXim.subEffect.SILENCE,
        msg         = invaderXim.msg.basic.ADD_EFFECT_STATUS,
        applyEffect = true,
        eff         = invaderXim.effect.SILENCE,
        power       = 1,
        duration    = 30,
        minDuration = 1,
        maxDuration = 30,
    },

    [invaderXim.mob.ae.ENAMNESIA] =
    {
        chance      = 25,
        ele         = invaderXim.element.FIRE,
        sub         = invaderXim.subEffect.AMNESIA,
        msg         = invaderXim.msg.basic.ADD_EFFECT_STATUS,
        applyEffect = true,
        eff         = invaderXim.effect.AMNESIA,
        power       = 1,
        duration    = 30,
        minDuration = 1,
        maxDuration = 30,
    },

    [invaderXim.mob.ae.SLOW] =
    {
        chance      = 25,
        ele         = invaderXim.element.EARTH,
        sub         = invaderXim.subEffect.DEFENSE_DOWN,
        msg         = invaderXim.msg.basic.ADD_EFFECT_STATUS,
        applyEffect = true,
        eff         = invaderXim.effect.SLOW,
        power       = 1000,
        duration    = 30,
        minDuration = 1,
        maxDuration = 45,
    },

    [invaderXim.mob.ae.STUN] =
    {
        chance      = 20,
        ele         = invaderXim.element.THUNDER,
        sub         = invaderXim.subEffect.STUN,
        msg         = invaderXim.msg.basic.ADD_EFFECT_STATUS,
        applyEffect = true,
        eff         = invaderXim.effect.STUN,
        duration    = 5,
    },

    [invaderXim.mob.ae.TERROR] =
    {
        chance = 20,
        sub         = invaderXim.subEffect.PARALYSIS,
        msg         = invaderXim.msg.basic.ADD_EFFECT_STATUS,
        applyEffect = true,
        eff         = invaderXim.effect.TERROR,
        duration    = 5,
        code        = function(mob, target, power)
            mob:resetEnmity(target)
        end,
    },

    [invaderXim.mob.ae.TP_DRAIN] =
    {
        chance             = 25,
        ele                = invaderXim.element.DARK,
        sub                = invaderXim.subEffect.TP_DRAIN,
        msg                = invaderXim.msg.basic.ADD_EFFECT_TP_DRAIN,
        mod                = invaderXim.mod.INT,
        bonusAbilityParams = { bonusmab = 0, includemab = false },
        code               = function(mob, target, power)
            local tp = math.min(power, target:getTP())
            target:delTP(tp)
            mob:addTP(tp)
        end,
    },

    [invaderXim.mob.ae.WEIGHT] =
    {
        chance      = 25,
        ele         = invaderXim.element.WIND,
        sub         = invaderXim.subEffect.BLIND, -- TODO
        msg         = invaderXim.msg.basic.ADD_EFFECT_STATUS,
        applyEffect = true,
        eff         = invaderXim.effect.WEIGHT,
        power       = 1,
        duration    = 30,
        minDuration = 1,
        maxDuration = 45,
    },
}

--[[
    mob, target, and damage are passed from core into mob script's onAdditionalEffect
    effect should be of type invaderXim.mob.additionalEffect (see above)
    params is a table that can contain any of:
        chance: percent chance that effect procs on hit (default 20)
        power: power of effect
        duration: duration of effect, in seconds
        code: additional code that will run when effect procs, of form function(mob, target, power)
    params will override effect's default settings
--]]
invaderXim.mob.onAddEffect = function(mob, target, damage, effect, params)
    if type(params) ~= 'table' then
        params = {}
    end

    local ae = additionalEffects[effect]

    if ae then
        local chance = params.chance or ae.chance or 100
        local dLevel = target:getMainLvl() - mob:getMainLvl()

        if dLevel > 0 then
            chance = chance - 5 * dLevel
            chance = utils.clamp(chance, 5, 95)
        end

        -- target:printToPlayer(string.format('Chance: %i', chance)) -- DEBUG

        if math.random(1, 100) <= chance then

            -- STATUS EFFECT
            if ae.applyEffect then
                local resist = 1
                if ae.ele then
                    resist = applyResistanceAddEffect(mob, target, ae.ele, ae.eff)
                end

                if resist > 0.5 and not target:hasStatusEffect(ae.eff) then
                    local power    = params.power or ae.power or 0
                    local tick     = ae.tick or 0
                    local duration = params.duration or ae.duration

                    duration = utils.clamp(duration, ae.minDuration, ae.maxDuration) * resist

                    target:addStatusEffect(ae.eff, power, tick, duration)

                    if params.code then
                        params.code(mob, target, power)
                    elseif ae.code then
                        ae.code(mob, target, power)
                    end

                    return ae.sub, ae.msg, ae.eff
                end

            -- IMMEDIATE EFFECT
            else
                local power = 0

                if params.power then
                    power = params.power
                elseif ae.mod then
                    local dMod = mob:getStat(ae.mod) - target:getStat(ae.mod)

                    if dMod > 20 then
                        dMod = 20 + (dMod - 20) / 2
                    end

                    -- This is a bad assumption, but it prevents some negative damage (healing) when there otherwise shouldn't be
                    -- TODO: better understand damage add effects from mobs
                    if dMod < 0 then
                        dMod = 0
                    end

                    power = dMod + target:getMainLvl() - mob:getMainLvl() + damage / 2
                end

                -- target:printToPlayer(string.format('Initial Power: %f', power)) -- DEBUG

                power = addBonusesAbility(mob, ae.ele, target, power, ae.bonusAbilityParams)
                power = power * applyResistanceAddEffect(mob, target, ae.ele, 0)
                power = power * invaderXim.spells.damage.calculateNukeAbsorbOrNullify(target, ae.ele)

                if ae.sub ~= invaderXim.subEffect.TP_DRAIN and ae.sub ~= invaderXim.subEffect.MP_DRAIN then
                    power = finalMagicNonSpellAdjustments(mob, target, ae.ele, power)
                end

                -- target:printToPlayer(string.format('Adjusted Power: %f', power)) -- DEBUG

                local message = ae.msg
                if power < 0 then
                    if ae.negMsg then
                        message = ae.negMsg
                        power   = power * -1 -- outgoing action packets only support unsigned integers. The "negative message" will also handle healing automagically deep inside core somewhere.
                    else
                        power = 0
                    end
                end

                if power ~= 0 then
                    if params.code then
                        params.code(mob, target, power)
                    elseif ae.code then
                        ae.code(mob, target, power)
                    end

                    return ae.sub, message, power
                end
            end
        end
    else
        printf('invalid additional effect for mobId %i', mob:getID())
    end

    return 0, 0, 0
end

-----------------------------------
-- mob difficulty enums for checkDifficulty()
-----------------------------------

invaderXim.mob.difficulty =
{
    TOO_WEAK             = 0,
    INCREDIBLY_EASY_PREY = 1,
    EASY_PREY            = 2,
    DECENT_CHALLENGE     = 3,
    EVEN_MATCH           = 4,
    TOUGH                = 5,
    VERY_TOUGH           = 6,
    INCREDIBLY_TOUGH     = 7,
    MAX                  = 8,
}
invaderXim.mob.diff = invaderXim.mob.difficulty
