-----------------------------------
-- Assault 51 : Nyzul Isle Investigation
-----------------------------------
local ID = zones[invaderXim.zone.NYZUL_ISLE]
-----------------------------------
local instanceObject = {}

local function pickSetPoint(instance)
    local chars        = instance:getChars()
    local currentFloor = instance:getLocalVar('Nyzul_Current_Floor')

    -- Random the floor layout
    instance:setLocalVar('Nyzul_Isle_FloorLayout', math.random(1, (#invaderXim.nyzul.FloorLayout - 1)))
    instance:setLocalVar('gearObjective', 0)

    -- Condition for floors
    -- hard set objective and floor to boss stage for every 20th floor
    if currentFloor % 20 == 0 then
        instance:setStage(invaderXim.nyzul.objective.ELIMINATE_ENEMY_LEADER)
        instance:setLocalVar('Nyzul_Isle_FloorLayout', 0)
    -- 3.33% for a free floor
    elseif math.random(1, 30) == 1 and instance:getLocalVar('freeFloor') == 0 then -- 3.33% for a free floor
        instance:setStage(invaderXim.nyzul.objective.FREE_FLOOR)
        instance:setLocalVar('freeFloor', 1)

        GetNPCByID(ID.npc.RUNE_OF_TRANSFER_ENTRANCE, instance):timer(9000,
        function(m)
            local currentInstance = m:getInstance()
            currentInstance:setProgress(15)
        end) -- Completes objective for free floor
    else
        -- Build the valid objectives list
        local objective = {}

        for i = invaderXim.nyzul.objective.ELIMINATE_ENEMY_LEADER, invaderXim.nyzul.objective.ELIMINATE_ALL_ENEMIES do
            table.insert(objective, i)
        end

        -- Only remove objectives if not the staging room or free floor
        if instance:getStage() ~= 0 and instance:getStage() ~= 6 then
            table.remove(objective, instance:getStage())
        end

        -- Randomly pick the objective from the generated list
        instance:setStage(utils.randomEntry(objective))

        if math.random(1, 30) <= 5 then
            instance:setLocalVar('gearObjective', math.random(invaderXim.nyzul.gearObjective.AVOID_AGRO, invaderXim.nyzul.gearObjective.DO_NOT_DESTROY))
        end
    end

    -- Setup points to travel to
    local layoutPoint = invaderXim.nyzul.FloorLayout[instance:getLocalVar('Nyzul_Isle_FloorLayout')]
    local posX        = layoutPoint[1] local posY = layoutPoint[2] local posZ = layoutPoint[3]

    -- Set Rune of Transfer to Point
    for npcID = ID.npc.RUNE_OF_TRANSFER_OFFSET, ID.npc.RUNE_OF_TRANSFER_OFFSET + 1 do
        local runeOfTransfer = GetNPCByID(npcID, instance)

        if
            runeOfTransfer and
            runeOfTransfer:getStatus() == invaderXim.status.DISAPPEAR
        then
            runeOfTransfer:setAnimationSub(0)
            runeOfTransfer:setPos(posX, posY, posZ)
            runeOfTransfer:setStatus(invaderXim.status.NORMAL)

            break
        end
    end

    -- Set players to Point and messaging
    for _, players in pairs(chars) do
        players:setPos(posX, posY, posZ)
        players:messageName(ID.text.WELCOME_TO_FLOOR, players, currentFloor, currentFloor)

        if instance:getStage() ~= invaderXim.nyzul.objective.FREE_FLOOR then
            players:messageName(ID.text.OBJECTIVE_TEXT_OFFSET + instance:getStage(), players)
            local gearObjective = instance:getLocalVar('gearObjective')

            if gearObjective > 0 then
                players:messageSpecial(ID.text.ELIMINATE_ALL_ENEMIES + gearObjective)
            end
        end
    end

    -- Set Rune of Transfer Menu
    instance:setLocalVar('menuChoice', math.random(1, 20))
end

-- Requirements for the first player registering the instance
instanceObject.registryRequirements = function(player)
    return player:hasKeyItem(invaderXim.ki.NYZUL_ISLE_ASSAULT_ORDERS)
end

-- Requirements for further players entering an already-registered instance
instanceObject.entryRequirements = function(player)
    return player:hasKeyItem(invaderXim.ki.NYZUL_ISLE_ASSAULT_ORDERS)
end

-- Called on the instance once it is created and ready
instanceObject.onInstanceCreated = function(instance)
end

-- Once the instance is ready inform the requester that it's ready
instanceObject.onInstanceCreatedCallback = function(player, instance)
    invaderXim.instance.onInstanceCreatedCallback(player, instance)

    -- Kill the Nyzul Isle update spam
    for _, v in ipairs(player:getParty()) do
        if v:getZoneID() == instance:getEntranceZoneID() then
            v:updateEvent(405, 3, 3, 3, 3, 3, 3, 3)
        end
    end
end

-- When the player zones into the instance
instanceObject.afterInstanceRegister = function(player)
    local instance = player:getInstance()

    player:messageName(ID.text.COMMENCE, player, 51)
    player:messageName(ID.text.TIME_TO_COMPLETE, player, instance:getTimeLimit())

    player:addTempItem(invaderXim.item.UNDERSEA_RUINS_FIREFLIES)
    player:setCharVar('assaultEntered', 1)
    player:delKeyItem(invaderXim.ki.NYZUL_ISLE_ASSAULT_ORDERS)
    player:messageSpecial(ID.text.KEYITEM_LOST, invaderXim.ki.NYZUL_ISLE_ASSAULT_ORDERS)
end

-- Instance 'tick'
instanceObject.onInstanceTimeUpdate = function(instance, elapsed)
    invaderXim.instance.updateInstanceTime(instance, elapsed, ID.text)
end

-- On fail
instanceObject.onInstanceFailure = function(instance)
    local chars = instance:getChars()

    for _, players in ipairs(chars) do
        players:messageSpecial(ID.text.MISSION_FAILED, 10, 10)
        players:startCutscene(1)
    end
end

-- When something in the instance calls: instance:setProgress(...)
instanceObject.onInstanceProgressUpdate = function(instance, progress)
    if progress > 0 then
        if invaderXim.nyzul.handleProgress(instance, progress) then
            invaderXim.nyzul.activateRuneOfTransfer(instance)
        end
    end
end

-- On win
instanceObject.onInstanceComplete = function(instance)
end

-- Standard event hooks, these will take priority over everything apart from m_event.Script
-- Omitting this will fallthrough to the same calls in the Zone.lua
instanceObject.onEventUpdate = function(player, csid, option, npc)
    if csid == 95 then
        local instance = player:getInstance()

        if instance:getLocalVar('runeHandler') == player:getID() then
            pickSetPoint(instance)
        end
    end
end

instanceObject.onEventFinish = function(player, csid, option, npc)
    local instance = player:getInstance()
    local chars    = instance:getChars()

    if csid == 1 then
        for _, players in ipairs(chars) do
            players:setPos(0, 0, 0, 0, invaderXim.zone.ALZADAAL_UNDERSEA_RUINS)
        end
    elseif csid == 95 then
        if instance:getLocalVar('runeHandler') == player:getID() then
            invaderXim.nyzul.prepareMobs(instance)
            invaderXim.nyzul.removePathos(instance)
            invaderXim.nyzul.addFloorPathos(instance)
            instance:setLocalVar('runeHandler', 0)
        end
    end
end

return instanceObject
