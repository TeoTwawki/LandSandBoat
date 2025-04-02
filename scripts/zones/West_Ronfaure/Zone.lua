-----------------------------------
-- Zone: West_Ronfaure (100)
-----------------------------------
require('scripts/quests/i_can_hear_a_rainbow')
-----------------------------------
---@type TZone
local zoneObject = {}

zoneObject.onInitialize = function(zone)
    -- A Chocobo Riding Game finish line
    zone:registerCylindricalTriggerArea(1, -135.60, 264.53, 8)

    invaderXim.conquest.setRegionalConquestOverseers(zone:getRegionID())
end

zoneObject.onZoneIn = function(player, prevZone)
    local cs = -1

    if
        player:getXPos() == 0 and
        player:getYPos() == 0 and
        player:getZPos() == 0
    then
        player:setPos(-126, -62, 273, 99)
    end

    if quests.rainbow.onZoneIn(player) then
        cs = 51
    end

    return cs
end

zoneObject.afterZoneIn = function(player)
    invaderXim.chocoboGame.handleMessage(player)
end

zoneObject.onConquestUpdate = function(zone, updatetype, influence, owner, ranking, isConquestAlliance)
    invaderXim.conquest.onConquestUpdate(zone, updatetype, influence, owner, ranking, isConquestAlliance)
end

zoneObject.onTriggerAreaEnter = function(player, triggerArea)
    local triggerAreaID = triggerArea:getTriggerAreaID()

    if triggerAreaID == 1 and player:hasStatusEffect(invaderXim.effect.MOUNTED) then
        invaderXim.chocoboGame.onTriggerAreaEnter(player)
    end
end

zoneObject.onEventUpdate = function(player, csid, option, npc)
    if csid == 51 then
        quests.rainbow.onEventUpdate(player)
    end
end

zoneObject.onEventFinish = function(player, csid, option, npc)
    invaderXim.chocoboGame.onEventFinish(player, csid)
end

return zoneObject
