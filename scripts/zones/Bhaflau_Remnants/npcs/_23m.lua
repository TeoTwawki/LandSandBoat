-----------------------------------
-- NPC: Door
-- Area: Bhaflau Remnants
-- 3rd Floor Central West Door to Portal
-- !pos -460 -6 -480
-----------------------------------
local ID = zones[invaderXim.zone.BHAFLAU_REMNANTS]
-----------------------------------

---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    if npc:getLocalVar('unSealed') == 1 then
        player:startEvent(300)
    else
        player:messageSpecial(ID.text.DOOR_IS_SEALED)
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 300 and option == 1 then
        local instance = npc:getInstance()

        if instance and invaderXim.salvage.onDoorOpen(npc) then
            invaderXim.salvage.sealDoors(instance, ID.npc.DOOR_3_EAST_IXIMT)
            instance:setLocalVar('stageComplete', 3)
        else
            player:messageSpecial(ID.text.DOOR_IS_SEALED)
        end
    end
end

return entity
