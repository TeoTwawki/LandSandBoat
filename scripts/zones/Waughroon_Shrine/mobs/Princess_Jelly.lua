-----------------------------------
-- Area: Waughroon Shrine
-- Mob: Princess Jelly
-- BCNM: Royal Jelly
-----------------------------------
local waughroonID = zones[invaderXim.zone.WAUGHROON_SHRINE]
-----------------------------------
---@type TMobEntity
local entity = {}

local elementalSpells =
{
    { invaderXim.magic.spell.BURN,  invaderXim.magic.spell.FIRE },
    { invaderXim.magic.spell.DROWN, invaderXim.magic.spell.WATER },
    { invaderXim.magic.spell.SHOCK, invaderXim.magic.spell.THUNDER },
    { invaderXim.magic.spell.RASP , invaderXim.magic.spell.STONE },
    { invaderXim.magic.spell.CHOKE, invaderXim.magic.spell.AERO },
    { invaderXim.magic.spell.FROST, invaderXim.magic.spell.BLIZZARD },
    { invaderXim.magic.spell.DIA,   invaderXim.magic.spell.BANISH },
    { invaderXim.magic.spell.BIO,   invaderXim.magic.spell.DRAIN },
}

local centers =
{
    { -177.5,  60, -142 },
    {   22.5,   0,   18 },
    {  222.5, -60,  138 },
}

local mevaList =
{
    { invaderXim.mod.WATER_MEVA,   invaderXim.mod.FIRE_ABSORB },
    { invaderXim.mod.THUNDER_MEVA, invaderXim.mod.WATER_ABSORB },
    { invaderXim.mod.EARTH_MEVA,   invaderXim.mod.LTNG_ABSORB },
    { invaderXim.mod.WIND_MEVA,    invaderXim.mod.EARTH_ABSORB },
    { invaderXim.mod.ICE_MEVA,     invaderXim.mod.WIND_ABSORB },
    { invaderXim.mod.FIRE_MEVA,    invaderXim.mod.ICE_ABSORB },
    { invaderXim.mod.DARK_MEVA,    invaderXim.mod.LIGHT_ABSORB },
    { invaderXim.mod.LIGHT_MEVA,   invaderXim.mod.DARK_ABSORB },
}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.MAGIC_COOL, 40)
end

entity.onMobSpawn = function(mob)
    mob:setBaseSpeed(invaderXim.settings.map.BASE_SPEED * 0.05) -- ~5% of normal movementspeed
    mob:setMod(invaderXim.mod.REGEN, 3)
    mob:setLocalVar('mobElement', math.random(1, 8))
    mob:addMod(mevaList[mob:getLocalVar('mobElement')][1], -250)
    mob:addMod(mevaList[mob:getLocalVar('mobElement')][2], 1000)
end

local function getQueenJellyID(bfNum)
    return waughroonID.mob.QUEEN_JELLY + (bfNum - 1) * 10
end

local function getDistanceFromCenter(bfNum, mob)
    local pos = mob:getPos()

    local difX = pos.x - centers[bfNum][1]
    local difY = pos.y - centers[bfNum][2]
    local difZ = pos.z - centers[bfNum][3]

    return math.sqrt(math.pow(difX, 2) + math.pow(difY, 2) + math.pow(difZ, 2))
end

local function allJellysInCenter(bfNum, zone)
    local totalMobsAlive = 0
    local totalInCenter = 0
    for i = 1, 8 do
        local princess = GetMobByID(getQueenJellyID(bfNum) + i)
        if getDistanceFromCenter(bfNum, princess) <= 0.5 then
            totalInCenter = totalInCenter + 1
        end

        if princess and princess:isAlive() then
            totalMobsAlive = totalMobsAlive + 1
        end
    end

    if totalMobsAlive == 0 then
        -- Win condition
        return false
    end

    return totalMobsAlive == totalInCenter
end

local function princessesTotalHP(bfNum, zone)
    local totalHP = 0

    for i = 1, 8 do
        local princess = GetMobByID(getQueenJellyID(bfNum) + i)
        if princess and princess:isAlive() then
            totalHP = totalHP + princess:getHP()
        end
    end

    return totalHP
end

local function spawnQueenJelly(bfNum, target, zone)
    local queen = GetMobByID(getQueenJellyID(bfNum))

    if queen and not queen:isSpawned() then
        SpawnMob(queen:getID())
        queen:setHP(princessesTotalHP(bfNum, zone))
        queen:setPos(centers[bfNum][1], centers[bfNum][2], centers[bfNum][3], 0)
        queen:setLocalVar('target', target:getID())

        queen:timer(3000, function(queenArg)
            local player = GetPlayerByID(queenArg:getLocalVar('target'))
            if player ~= nil and player:isAlive() then
                queen:updateClaim(player)
            end
        end)

        for i = 1, 8 do
            DespawnMob(queen:getID() + i)
        end
    end
end

entity.onMobMagicPrepare = function(mob, target, spellId)
    local element = mob:getLocalVar('mobElement')
    local spell   = math.random(1, 100)

    if spell > 60 then
        return elementalSpells[element][1] -- element's DoT
    elseif spell > 20 then
        return elementalSpells[element][2] -- element's nuke
    else
        return 258
    end
end

entity.onMobFight = function(mob, target)
    local bfNum = mob:getBattlefield():getArea()
    local queen = GetMobByID(getQueenJellyID(bfNum))
    local center = centers[bfNum]

    mob:pathThrough(center, invaderXim.path.flag.SCRIPT)

    if getDistanceFromCenter(bfNum, mob) <= 0.5 then
        if
            queen and
            not queen:isSpawned() and
            allJellysInCenter(bfNum, mob:getZone())
        then
            spawnQueenJelly(bfNum, target, mob:getZone())
        end
    end

    if mob:checkDistance(target) >= 20 then
        mob:setMagicCastingEnabled(false)
    else
        mob:setMagicCastingEnabled(true)
    end
end

entity.onMobEngage = function(mob, target)
    -- battlefield has superlink
end

entity.onMobDeath = function(mob, player, optParams)
    local bfNum = mob:getBattlefield():getArea()
    local queen = GetMobByID(getQueenJellyID(bfNum))

    if
        queen and
        not queen:isSpawned() and
        allJellysInCenter(bfNum, mob:getZone())
    then
        spawnQueenJelly(bfNum, player, mob:getZone())
    end
end

return entity
