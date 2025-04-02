-----------------------------------
-- Area: Al'Taieu
--   NM: Jailer of Love
-- !pos 431.522 -0.912 -603.503 33
-----------------------------------
local ID = zones[invaderXim.zone.ALTAIEU]
-----------------------------------
---@type TMobEntity
local entity = {}

invaderXim.jol = invaderXim.jol or {}
invaderXim.jol.lastEnmityList = {}

-- TODO: capture the following
-- Actual draw in distance & behavior
-- Actual standback distance
-- Bio 3 DoT power
-- better MP estimation and/or does it have refresh
-- MAB if any
-- is it only sharks that can be used with Astral Flow? If not, what TP moves do they use?

local minionGroup =
{
    [0] = 10, -- Qnxzomit
    [1] = 19, -- Qnhpemde
    [2] =  1, -- Ruphuabo
    [3] = 13, -- Qnxzomit
    [4] = 22, -- Qnhpemde
    [5] =  4, -- Ruphuabo
    [6] = 16, -- Qnxzomit
    [7] = 25, -- Qnhpemde
}

local spellLists =
{
    [invaderXim.element.FIRE]    = 513, -- Fire List
    [invaderXim.element.ICE]     = 514, -- Ice List
    [invaderXim.element.WIND]    = 515, -- Wind List
    [invaderXim.element.EARTH]   = 516, -- Earth List
    [invaderXim.element.THUNDER] = 517, -- Thunder List
    [invaderXim.element.WATER]   = 518, -- Water List
    [invaderXim.element.LIGHT]   = 519, -- Light List
    [invaderXim.element.DARK]    = 520, -- Dark List
}

-- Animations, action IDs and elemental absorb mods are directly mapped to eachother per retail caps
-- in the 'standard' order, Fire Ice Wind Earth Thunder Water Holy Dark
local eleAbsorbActionID   = { 603, 604, 624, 404, 625, 626, 627, 307 }
local eleAbsorbAnimations = { 432, 433, 434, 435, 436, 437, 438, 439 }

local astralFlowPets = function()
    for i = ID.mob.JAILER_OF_LOVE + 1, ID.mob.JAILER_OF_LOVE + 27 do
        local pet = GetMobByID(i)
        if pet and pet:isAlive() then

            -- Not sure there's any proof of what xzomit/hpmede do here.
            -- There is confirmation of aerial collision
            -- Picking annoying abilities for now...
            pet:timer(1500, function(petArg)
                if petArg:getFamily() == 269 then -- xzomit
                    petArg:useMobAbility(invaderXim.mobskill.MANTLE_PIERCE)
                elseif petArg:getFamily() == 144 then -- hpemde
                    petArg:useMobAbility(invaderXim.mobskill.SINUATE_RUSH)
                elseif petArg:getFamily() == 194 then -- shark
                    petArg:useMobAbility(invaderXim.mobskill.AERIAL_COLLISION)
                end
            end)
        end
    end
end

local spawnPets = function(mob, minionOffset)
    mob:entityAnimationPacket('casm')
    mob:setAutoAttackEnabled(false)
    mob:setMagicCastingEnabled(false)
    mob:setMobAbilityEnabled(false)
    mob:timer(3000, function(mobArg)
        if mobArg:isAlive() then
            mobArg:entityAnimationPacket('shsm')
            mobArg:setAutoAttackEnabled(true)
            mobArg:setMagicCastingEnabled(true)
            mobArg:setMobAbilityEnabled(true)
            GetMobByID(minionOffset + 0):setSpawn(mobArg:getXPos() + 4, mobArg:getYPos(), mobArg:getZPos())
            GetMobByID(minionOffset + 1):setSpawn(mobArg:getXPos(), mobArg:getYPos(), mobArg:getZPos() + 4)
            GetMobByID(minionOffset + 2):setSpawn(mobArg:getXPos(), mobArg:getYPos(), mobArg:getZPos() - 4)
            SpawnMob(minionOffset + 0):setMobMod(invaderXim.mobMod.SUPERLINK, mobArg:getTargID())
            SpawnMob(minionOffset + 1):setMobMod(invaderXim.mobMod.SUPERLINK, mobArg:getTargID())
            SpawnMob(minionOffset + 2):setMobMod(invaderXim.mobMod.SUPERLINK, mobArg:getTargID())
            GetMobByID(minionOffset + 0):updateEnmity(mobArg:getTarget())
            GetMobByID(minionOffset + 1):updateEnmity(mobArg:getTarget())
            GetMobByID(minionOffset + 2):updateEnmity(mobArg:getTarget())
        end
    end)
end

local spawnSharks = function(mob)
    -- determine which sharks are currently spawned
    local phuaboUp = {}
    local phuaboDn = {}
    for i = ID.mob.JAILER_OF_LOVE + 1, ID.mob.JAILER_OF_LOVE + 9 do
        local phuabo = GetMobByID(i)

        if phuabo then
            if phuabo:isAlive() then
                table.insert(phuaboUp, i)
            elseif not phuabo:isSpawned() then
                table.insert(phuaboDn, i)
            end
        end
    end

    -- how many sharks spawn depends on number currently alive
    -- https://www.bg-wiki.com/bg/Jailer_of_Love
    local numToSpawn = 0
    if #phuaboUp == 2 then
        numToSpawn = 1
    elseif #phuaboUp == 0 or #phuaboUp == 3 then
        numToSpawn = 3
    elseif #phuaboUp == 1 then
        numToSpawn = math.random(3)
    end

    -- spawn sharks
    for i = 1, math.min(numToSpawn, #phuaboDn) do
        -- spawnSharks(mob, phuaboDn)
        local target = mob:getTarget()
        local phuabo = GetMobByID(phuaboDn[i])

        if phuabo then
            phuabo:setSpawn(target:getXPos() + math.random(-2, 2), target:getYPos(), target:getZPos())
            SpawnMob(phuaboDn[i])
            phuabo:setMobMod(invaderXim.mobMod.SUPERLINK, mob:getTargID())
            phuabo:updateEnmity(target)
        end
    end
end

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.IDLE_DESPAWN, 180)
end

local function getAbsorbMod(element)
    local absorbMod = invaderXim.combat.element.getElementalAbsorptionModifier(element)

    return absorbMod
end

entity.onMobSpawn = function(mob)
    mob:setBehavior(invaderXim.behavior.STANDBACK)
    mob:setMobMod(invaderXim.mobMod.STANDBACK_RANGE, 13) -- Guessed, seems approximate based on era videos
    mob:setMobMod(invaderXim.mobMod.MAGIC_COOL, 20)      -- Seems to be 20~22 depending if a TP move is in the way

    mob:addMod(invaderXim.mod.REGEN, 260)
    mob:setMod(invaderXim.mod.DMGMAGIC, -5000) -- starts the fight with -50% magic damage taken, reduced to 25% after regen is taken off.
    mob:setMod(invaderXim.mod.ATT, 452)
    mob:setMod(invaderXim.mod.DEF, 620)
    mob:setMod(invaderXim.mod.EVA, 328)

    -- TODO - used to be catch all for SLEEP immunity, but I assume it's immune to both
    mob:addImmunity(invaderXim.immunity.LIGHT_SLEEP)
    mob:addImmunity(invaderXim.immunity.DARK_SLEEP)
    mob:addImmunity(invaderXim.immunity.GRAVITY)
    mob:addImmunity(invaderXim.immunity.BIND)
    mob:addImmunity(invaderXim.immunity.STUN)
    mob:addImmunity(invaderXim.immunity.SILENCE)
    mob:addImmunity(invaderXim.immunity.PARALYZE)
    mob:addImmunity(invaderXim.immunity.BLIND)
    mob:addImmunity(invaderXim.immunity.SLOW)
    mob:addImmunity(invaderXim.immunity.POISON)
    mob:addImmunity(invaderXim.immunity.ELEGY)
    mob:addImmunity(invaderXim.immunity.REQUIEM)
    mob:addImmunity(invaderXim.immunity.TERROR)

    local currentAbsorb = math.random(1, 8) -- pick a random element to absorb after engaging

    mob:setLocalVar('currentAbsorb', currentAbsorb)
    mob:setSpellList(spellLists[currentAbsorb])
    mob:setMod(getAbsorbMod(currentAbsorb), 100)

    invaderXim.mix.jobSpecial.config(mob, {
        specials =
        {
            { id = invaderXim.jsa.ASTRAL_FLOW, hpp = math.random(45, 55) },
        },
    })
end

entity.onMobEngage = function(mob, target)
    mob:hideName(false)
    mob:setUntargetable(false)
    mob:setMagicCastingEnabled(true)
    mob:setAnimationSub(2)
    mob:setLocalVar('elementAbsorb', os.time() + 120)
    mob:setLocalVar('pop_pets', os.time() + 150) -- wait 2.5 minutes until spawning initial mobs
end

entity.onMobFight = function(mob, target)
    -- mob:setAnimationSub(2) -- TODO: this was from ASB. necessary?

    local distance = mob:checkDistance(target)
    local drawInTable =
    {
        conditions =
        {
            distance >= mob:getMeleeRange() and distance >= 20,
        },
        position = mob:getPos(), -- Guessed
    }

    utils.drawIn(target, drawInTable)

    -- reduce regen after nine Xzomits and Hpemdes (total of both) groups are killed
    if
        mob:getLocalVar('JoL_Regen_Reduction') == 0 and
        mob:getLocalVar('JoL_Qn_xzomit_Killed') >= 9 and
        mob:getLocalVar('JoL_Qn_hpemde_Killed') >= 9
    then
        mob:setLocalVar('JoL_Regen_Reduction', 1)
        mob:delMod(invaderXim.mod.REGEN, 260)
        mob:setMod(invaderXim.mod.DMGMAGIC, -2500) -- magic damage taken reduced from 50% to 25% after killing nine xzomits and hpemdes
    end

    -- every 2 minutes JoL will change the element it absorbs/casts spells this change happens after a two hour animation
    if os.time() > mob:getLocalVar('elementAbsorb') then

        local previousAbsorb = mob:getLocalVar('currentAbsorb')
        mob:setLocalVar('elementAbsorb', os.time() + 60)
        mob:setLocalVar('twohour_tp', mob:getTP())

        -- remove previous absorb mod, if set
        if previousAbsorb > 0 then
            mob:setMod(getAbsorbMod(previousAbsorb), 0)
        end

        -- add new absorb mod
        local currentAbsorb = math.random(1, 8)
        mob:setLocalVar('currentAbsorb', currentAbsorb)

        -- Inject 2hr animation based on element, this shows in the captures.
        mob:injectActionPacket(mob:getID(), 11, eleAbsorbAnimations[currentAbsorb], 0x18, 0, 0, eleAbsorbActionID[currentAbsorb], 0)
        mob:setSpellList(spellLists[mob:getLocalVar('currentAbsorb')])

        mob:setMod(getAbsorbMod(currentAbsorb), 100)
        mob:addTP(mob:getLocalVar('twohour_tp'))
        mob:setLocalVar('twohour_tp', 0)
    end

    -- spawn minions in 2.5 minute intervals
    if
        os.time() > mob:getLocalVar('pop_pets') and
        mob:canUseAbilities()
    then
        mob:setLocalVar('pop_pets', os.time() + 150)

        local spawns = mob:getLocalVar('SPAWNS')
        if spawns < 8 then
            local minionOffset = ID.mob.JAILER_OF_LOVE + minionGroup[spawns]
            spawnPets(mob, minionOffset)
        elseif spawns > 8 then
            mob:entityAnimationPacket('casm')
            mob:setAutoAttackEnabled(false)
            mob:setMagicCastingEnabled(false)
            mob:setMobAbilityEnabled(false)
            mob:timer(3000, function(mobArg)
                if mobArg:isAlive() then
                    mobArg:entityAnimationPacket('shsm')
                    mobArg:setAutoAttackEnabled(true)
                    mobArg:setMagicCastingEnabled(true)
                    mobArg:setMobAbilityEnabled(true)
                    spawnSharks(mobArg)
                end
            end)
        end

        mob:setLocalVar('SPAWNS', spawns + 1)
    end

    -- empty table
    for key in pairs(invaderXim.jol.lastEnmityList) do
        invaderXim.jol.lastEnmityList[key] = nil
    end

    local enmityList = mob:getEnmityList()
    for index in ipairs(enmityList) do

        invaderXim.jol.lastEnmityList[index] = {}
        local tempEntity = enmityList[index]['entity']
        local ce         = enmityList[index]['ce']
        local ve         = enmityList[index]['ve']

        invaderXim.jol.lastEnmityList[index]['id'] = tempEntity:getID()
        invaderXim.jol.lastEnmityList[index]['ce'] = ce
        invaderXim.jol.lastEnmityList[index]['ve'] = ve
    end
end

entity.onMobWeaponSkill = function(target, mob, skill)
    local skillId = skill:getID()

    if skillId == 734 then
        astralFlowPets()
    end
end

entity.onMobDeath = function(mob, player, optParams)
    for i = ID.mob.JAILER_OF_LOVE + 1, ID.mob.JAILER_OF_LOVE + 27 do
        local pet = GetMobByID(i)
        if pet and pet:isSpawned() then
            DespawnMob(i)
        end
    end
end

entity.onMobDespawn = function(mob)
    if math.random(1, 100) <= 25 then -- 25% chance to spawn Absolute Virtue
        local highestEnmityTarget = nil
        local highestEnmity = -1

        for index in ipairs(invaderXim.jol.lastEnmityList) do
            local id = invaderXim.jol.lastEnmityList[index]['id']
            local ce = invaderXim.jol.lastEnmityList[index]['ce']
            local ve = invaderXim.jol.lastEnmityList[index]['ve']

            local target = GetPlayerByID(id)
            if target == nil then
                -- try mob
                target = GetEntityByID(id, mob:getInstance(), true)
            end

            local enmity = ce + ve
            if target then
                if enmity > highestEnmity then
                    highestEnmityTarget = target
                    highestEnmity       = enmity
                end
            end
        end

        SpawnMob(ID.mob.ABSOLUTE_VIRTUE)
        if highestEnmityTarget then
            GetMobByID(ID.mob.ABSOLUTE_VIRTUE):updateEnmity(highestEnmityTarget)
        end
    end
end

return entity
