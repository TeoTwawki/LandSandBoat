-----------------------------------
-- Area: Castle Oztroja
--  NPC: _47d
-- !pos 20.000 24.168 -25.000 151
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    if not player:hasKeyItem(invaderXim.ki.OLD_RING) then
        npcUtil.giveKeyItem(player, invaderXim.ki.OLD_RING)
    end

    if npc:getAnimation() == invaderXim.anim.CLOSE_DOOR then
        npc:openDoor()
    end
end

return entity
