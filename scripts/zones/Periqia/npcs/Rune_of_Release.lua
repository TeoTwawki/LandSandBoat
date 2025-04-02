-----------------------------------
-- Area: Ilrusi Atoll
--  NPC: Rune of Release
-- !pos 412 -9 54 55
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local instance = npc:getInstance()

    if instance and instance:completed() then
        player:startEvent(100, 3)
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.assault.instanceOnEventFinish(player, csid, invaderXim.zone.CAEDARVA_MIRE)
    invaderXim.assault.runeReleaseFinish(player, csid, option, npc)
end

return entity
