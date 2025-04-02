-----------------------------------
-- Area: Lebros Cavern
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local instance = npc:getInstance()

    if instance and instance:completed() then
        player:startEvent(100, 2)
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.assault.instanceOnEventFinish(player, csid, invaderXim.zone.MOUNT_ZHAYOLM)
    invaderXim.assault.runeReleaseFinish(player, csid, option, npc)
end

return entity
