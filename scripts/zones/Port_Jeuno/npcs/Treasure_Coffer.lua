-----------------------------------
-- Area: Port Jeuno
--  NPC: Treasure Coffer
-- !pos -52 0 -11 246
-----------------------------------
local ID = zones[invaderXim.zone.PORT_JEUNO]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    if
        invaderXim.settings.main.ENABLE_ABYSSEA == 1 and
        not player:hasItem(invaderXim.item.PRISHE_STATUE)
    then
        player:startEvent(350, 0xFFFFFFFC)
    else
        player:messageSpecial(ID.text.CHEST_IS_EMPTY)
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 350 and option == 2 then
        npcUtil.giveItem(player, invaderXim.item.PRISHE_STATUE)
    end
end

return entity
