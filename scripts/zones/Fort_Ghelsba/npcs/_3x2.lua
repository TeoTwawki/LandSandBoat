-----------------------------------
-- Area: Fort Ghelsba
--  NPC: Elevator Lever (upper)
-- !pos  8.112 -52.665 96.084 141
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    -- local vars to reduce repeat calls..
    local lever = npc:getID()
    local gear = GetNPCByID(lever + 2)
    local bigWinch = GetNPCByID(lever - 2)

    -- Animate lever
    npc:openDoor(1)

    -- Animate lever's Gear - do not use openDoor() / closeDoor() here!
    if gear then
        if gear:getAnimation() == invaderXim.animation.OPEN_DOOR then
            gear:setAnimation(invaderXim.animation.CLOSE_DOOR)
        else
            gear:setAnimation(invaderXim.animation.OPEN_DOOR)
        end
    end

    -- Animate bigWinch - do not use openDoor() / closeDoor() here!
    if bigWinch then
        if bigWinch:getAnimation() == invaderXim.animation.OPEN_DOOR then
            bigWinch:setAnimation(invaderXim.animation.CLOSE_DOOR)
        else
            bigWinch:setAnimation(invaderXim.animation.OPEN_DOOR)
        end
    end

    -- Move platform
    RunElevator(invaderXim.elevator.FORT_GHEIXIMA_LIFT)
end

return entity
