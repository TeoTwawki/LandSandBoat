-----------------------------------
-- Nyzul Isle Global
-----------------------------------
local ID = zones[invaderXim.zone.NYZUL_ISLE]
require('scripts/globals/utils')
-----------------------------------
xi = xi or {}
invaderXim.nyzul = invaderXim.nyzul or {}

invaderXim.nyzul.baseWeapons =
{
    [invaderXim.job.WAR] = invaderXim.item.STURDY_AXE,
    [invaderXim.job.MNK] = invaderXim.item.BURNING_FISTS,
    [invaderXim.job.WHM] = invaderXim.item.WEREBUSTER,
    [invaderXim.job.BLM] = invaderXim.item.MAGES_STAFF,
    [invaderXim.job.RDM] = invaderXim.item.VORPAL_SWORD,
    [invaderXim.job.THF] = invaderXim.item.SWORDBREAKER,
    [invaderXim.job.PLD] = invaderXim.item.BRAVE_BLADE,
    [invaderXim.job.DRK] = invaderXim.item.DEATH_SICKLE,
    [invaderXim.job.BST] = invaderXim.item.DOUBLE_AXE,
    [invaderXim.job.BRD] = invaderXim.item.DANCING_DAGGER,
    [invaderXim.job.RNG] = invaderXim.item.KILLER_BOW,
    [invaderXim.job.SAM] = invaderXim.item.WINDSLICER,
    [invaderXim.job.NIN] = invaderXim.item.SASUKE_KATANA,
    [invaderXim.job.DRG] = invaderXim.item.RADIANT_LANCE,
    [invaderXim.job.SMN] = invaderXim.item.SCEPTER_STAFF,
    [invaderXim.job.BLU] = invaderXim.item.WIGHTSLAYER,
    [invaderXim.job.COR] = invaderXim.item.QUICKSILVER,
    [invaderXim.job.PUP] = invaderXim.item.INFERNO_CLAWS,
    [invaderXim.job.DNC] = invaderXim.item.MAIN_GAUCHE,
    [invaderXim.job.SCH] = invaderXim.item.ELDER_STAFF,
}

invaderXim.nyzul.objective =
{
    ELIMINATE_ENEMY_LEADER      = 1,
    ELIMINATE_SPECIFIED_ENEMIES = 2,
    ACTIVATE_ALL_LAMPS          = 3,
    ELIMINATE_SPECIFIED_ENEMY   = 4,
    ELIMINATE_ALL_ENEMIES       = 5,
    FREE_FLOOR                  = 6,
}

invaderXim.nyzul.lampsObjective =
{
    REGISTER     = 1,
    ACTIVATE_ALL = 2,
    ORDER        = 3,
}

invaderXim.nyzul.gearObjective =
{
    AVOID_AGRO     = 1,
    DO_NOT_DESTROY = 2,
}

invaderXim.nyzul.penalty =
{
    TIME   = 1,
    TOKENS = 2,
    PATHOS = 3,
}

invaderXim.nyzul.FloorLayout =
{
    [ 0] = {   -20, -0.5, -380 }, -- boss floors 20, 40, 60, 80
--  [ ?] = {  -491, -4.0, -500 }, -- boss floor 20 confirmed
    [ 1] = {   380, -0.5, -500 },
    [ 2] = {   500, -0.5,  -20 },
    [ 3] = {   500, -0.5,   60 },
    [ 4] = {   500, -0.5, -100 },
    [ 5] = {   540, -0.5, -140 },
    [ 6] = {   460, -0.5, -219 },
    [ 7] = {   420, -0.5,  500 },
    [ 8] = {    60, -0.5, -335 },
    [ 9] = {    20, -0.5, -500 },
    [10] = {   -95, -0.5,   60 },
    [11] = {   100, -0.5,  100 },
    [12] = {  -460, -4.0, -180 },
    [13] = {  -304, -0.5, -380 },
    [14] = {  -380, -0.5, -500 },
    [15] = {  -459, -4.0, -540 },
    [16] = {  -465, -4.0, -340 },
    [17] = { 504.5,  0.0,  -60 },
--  [18] = {   580,  0.0,  340 },
--  [19] = {   455,  0.0, -140 },
--  [20] = {   500,  0.0,   20 },
--  [21] = {   500,    0,  380 },
--  [22] = {   460,    0,  100 },
--  [23] = {   100,    0, -380 },
--  [24] = { -64.5,    0,   60 },
}

invaderXim.nyzul.floorCost =
{
    [ 1] = { level =  1, cost =    0 },
    [ 2] = { level =  6, cost =  500 },
    [ 3] = { level = 11, cost =  550 },
    [ 4] = { level = 16, cost =  600 },
    [ 5] = { level = 21, cost =  650 },
    [ 6] = { level = 26, cost =  700 },
    [ 7] = { level = 31, cost =  750 },
    [ 8] = { level = 36, cost =  800 },
    [ 9] = { level = 41, cost =  850 },
    [10] = { level = 46, cost =  900 },
    [11] = { level = 51, cost = 1000 },
    [12] = { level = 56, cost = 1100 },
    [13] = { level = 61, cost = 1200 },
    [14] = { level = 66, cost = 1300 },
    [15] = { level = 71, cost = 1400 },
    [16] = { level = 76, cost = 1500 },
    [17] = { level = 81, cost = 1600 },
    [18] = { level = 86, cost = 1700 },
    [19] = { level = 91, cost = 1800 },
    [20] = { level = 96, cost = 1900 },
}

-- Local functions
local function getTokenRate(instance)
    local partySize = instance:getLocalVar('partySize')
    local rate      = 1

    if partySize > 3 then
        rate = rate - (partySize - 3) * 0.1
    end

    return rate
end

local function calculateTokens(instance)
    local relativeFloor   = invaderXim.nyzul.getRelativeFloor(instance)
    local rate            = getTokenRate(instance)
    local potentialTokens = instance:getLocalVar('potential_tokens')
    local floorBonus      = 0

    if relativeFloor > 1 then
        floorBonus = 10 * math.floor((relativeFloor - 1) / 5)
    end

    potentialTokens = math.floor(potentialTokens + (200 + floorBonus) * rate)

    return potentialTokens
end

-- Global functions
invaderXim.nyzul.getRelativeFloor = function(instance)
    local currentFloor  = instance:getLocalVar('Nyzul_Current_Floor')
    local startingFloor = instance:getLocalVar('Nyzul_Isle_StartingFloor')

    if currentFloor < startingFloor then
        return currentFloor + 100
    end

    return currentFloor
end

invaderXim.nyzul.clearChests = function(instance)
    for cofferID = ID.npc.TREASURE_COFFER_OFFSET, ID.npc.TREASURE_COFFER_OFFSET + 2 do
        local coffer = GetNPCByID(cofferID, instance)

        if coffer and coffer:getStatus() ~= invaderXim.status.DISAPPEAR then
            coffer:setStatus(invaderXim.status.DISAPPEAR)
            coffer:setAnimationSub(0)
            coffer:resetLocalVars()
        end
    end

    if invaderXim.settings.main.ENABLE_NYZUL_CASKETS then
        for casketID = ID.npc.TREASURE_CASKET_OFFSET, ID.npc.TREASURE_CASKET_OFFSET + 3 do
            local casket = GetNPCByID(casketID, instance)

            if casket and casket:getStatus() ~= invaderXim.status.DISAPPEAR then
                casket:setStatus(invaderXim.status.DISAPPEAR)
                casket:setAnimationSub(0)
                casket:resetLocalVars()
            end
        end
    end
end

invaderXim.nyzul.handleRunicKey = function(mob)
    local instance = mob:getInstance()

    if instance:getLocalVar('Nyzul_Current_Floor') == 100 then
        local chars      = instance:getChars()
        local startFloor = instance:getLocalVar('Nyzul_Isle_StartingFloor')

        for _, entity in pairs(chars) do
            -- Does players Runic Disk have data saved to a floor of entering or higher
            if
                entity:getVar('NyzulFloorProgress') + 1 >= startFloor and
                not entity:hasKeyItem(invaderXim.ki.RUNIC_KEY)
            then
                -- On early version only initiator of floor got progress saves and key credit
                if not invaderXim.settings.main.RUNIC_DISK_SAVE then
                    if entity:getID() == instance:getLocalVar('diskHolder') then
                        if npcUtil.giveKeyItem(entity, invaderXim.ki.RUNIC_KEY) then
                            entity:setVar('NyzulFloorProgress', 0)
                        end
                    end

                -- Anyone can get a key on 100 win if disk passed check
                else
                    npcUtil.giveKeyItem(entity, invaderXim.ki.RUNIC_KEY)
                end
            end
        end
    end
end

invaderXim.nyzul.handleProgress = function(instance, progress)
    local stage      = instance:getStage()
    local isComplete = false

    if
        ((stage == invaderXim.nyzul.objective.FREE_FLOOR or
        stage == invaderXim.nyzul.objective.ELIMINATE_ENEMY_LEADER or
        stage == invaderXim.nyzul.objective.ACTIVATE_ALL_LAMPS or
        stage == invaderXim.nyzul.objective.ELIMINATE_SPECIFIED_ENEMY) and
        progress == 15)
        or
        ((stage == invaderXim.nyzul.objective.ELIMINATE_ALL_ENEMIES or stage == invaderXim.nyzul.objective.ELIMINATE_SPECIFIED_ENEMIES) and
        progress >= instance:getLocalVar('Eliminate'))
    then
        local chars        = instance:getChars()
        local currentFloor = instance:getLocalVar('Nyzul_Current_Floor')

        instance:setProgress(0)
        instance:setLocalVar('Eliminate', 0)
        instance:setLocalVar('potential_tokens', calculateTokens(instance))

        for _, players in ipairs(chars) do
            players:messageSpecial(ID.text.OBJECTIVE_COMPLETE, currentFloor)
        end

        isComplete = true
    end

    return isComplete
end

invaderXim.nyzul.enemyLeaderKill = function(mob)
    local instance = mob:getInstance()
    instance:setProgress(15)
end

invaderXim.nyzul.specifiedGroupKill = function(mob)
    local instance = mob:getInstance()

    if instance:getStage() == invaderXim.nyzul.objective.ELIMINATE_SPECIFIED_ENEMIES then
        instance:setProgress(instance:getProgress() + 1)
    end
end

invaderXim.nyzul.specifiedEnemySet = function(mob)
    local instance = mob:getInstance()

    if instance:getStage() == invaderXim.nyzul.objective.ELIMINATE_SPECIFIED_ENEMY then
        if instance:getLocalVar('Nyzul_Specified_Enemy') == 0 then
            mob:setMobMod(invaderXim.mobMod.CHECK_AS_NM, 1)
        end
    end
end

invaderXim.nyzul.specifiedEnemyKill = function(mob)
    local instance = mob:getInstance()
    local stage    = instance:getStage()

    -- Eliminate specified enemy
    if stage == invaderXim.nyzul.objective.ELIMINATE_SPECIFIED_ENEMY then
        if instance:getLocalVar('Nyzul_Specified_Enemy') == mob:getID() then
            instance:setProgress(15)
            instance:setLocalVar('Nyzul_Specified_Enemy', 0)
        end

    -- Eliminiate all enemies
    elseif stage == invaderXim.nyzul.objective.ELIMINATE_ALL_ENEMIES then
        instance:setProgress(instance:getProgress() + 1)
    end
end

invaderXim.nyzul.eliminateAllKill = function(mob)
    local instance = mob:getInstance()

    if instance:getStage() == invaderXim.nyzul.objective.ELIMINATE_ALL_ENEMIES then
        instance:setProgress(instance:getProgress() + 1)
    end
end

invaderXim.nyzul.activateRuneOfTransfer = function(instance)
    for runeID = ID.npc.RUNE_OF_TRANSFER_OFFSET, ID.npc.RUNE_OF_TRANSFER_OFFSET + 1 do
        if GetNPCByID(runeID, instance):getStatus() == invaderXim.status.NORMAL then
            GetNPCByID(runeID, instance):setAnimationSub(1)

            break
        end
    end
end

invaderXim.nyzul.vigilWeaponDrop = function(player, mob)
    local instance = mob:getInstance()

    -- Only floor 100 Bosses to drop 1 random weapon guarenteed and 1 of the disk holders job
    -- will not drop diskholder's weapon if anyone already has it.
    if instance:getLocalVar('Nyzul_Current_Floor') == 100 then
        local diskHolder = GetPlayerByID(instance:getLocalVar('diskHolder'))
        local chars      = instance:getChars()

        if diskHolder ~= nil then
            for _, entity in pairs(chars) do
                if not entity:hasItem(invaderXim.nyzul.baseWeapons[diskHolder:getMainJob()]) then
                    player:addTreasure(invaderXim.nyzul.baseWeapons[diskHolder:getMainJob()], mob)

                    break
                end
            end
        end

        player:addTreasure(invaderXim.nyzul.baseWeapons[math.random(1, #invaderXim.nyzul.baseWeapons)], mob)

    -- Every NM can randomly drop a vigil weapon
    elseif math.random(1, 100) <= 20 and invaderXim.settings.main.ENABLE_VIGIL_DROPS then
        player:addTreasure(invaderXim.nyzul.baseWeapons[math.random(1, #invaderXim.nyzul.baseWeapons)], mob)
    end
end

invaderXim.nyzul.spawnChest = function(mob, player)
    local instance = mob:getInstance()
    local mobID    = mob:getID()

    -- NM chest spawn.
    if
        mobID >= ID.mob.NM_OFFSET and
        mobID <= ID.mob.TAISAIJIN
    then
        invaderXim.nyzul.vigilWeaponDrop(player, mob)

    for cofferID = ID.npc.TREASURE_COFFER_OFFSET, ID.npc.TREASURE_COFFER_OFFSET + 2 do
            local coffer = GetNPCByID(cofferID, instance)

            if coffer and coffer:getStatus() == invaderXim.status.DISAPPEAR then
                local pos = mob:getPos()
                coffer:setUntargetable(false)
                coffer:setPos(pos.x, pos.y, pos.z, pos.rot)
                coffer:setLocalVar('appraisalItem', mobID)
                coffer:setStatus(invaderXim.status.NORMAL)

                break
            end
        end

    -- NM casket spawn.
    elseif
        mobID < ID.mob.BOSS_OFFSET and
        invaderXim.settings.main.ENABLE_NYZUL_CASKETS
    then
        if math.random(1, 100) <= 6 then
            for casketID = ID.npc.TREASURE_CASKET_OFFSET, ID.npc.TREASURE_CASKET_OFFSET + 3 do
                local casket = GetNPCByID(casketID, instance)

                if casket and casket:getStatus() == invaderXim.status.DISAPPEAR then
                    local pos = mob:getPos()
                    casket:setPos(pos.x, pos.y, pos.z, pos.rot)
                    casket:setStatus(invaderXim.status.NORMAL)

                    break
                end
            end
        end
    end
end

invaderXim.nyzul.getTokenPenalty = function(instance)
    local floorPenalities = instance:getLocalVar('tokenPenalty')
    local rate            = getTokenRate(instance)

    return math.floor(117 * rate * floorPenalities)
end
