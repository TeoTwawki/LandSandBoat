-----------------------------------
-- NPC: Door
-- Area: Bhaflau Remnants
-- 1st Floor East Exit Door
-- !pos 360 2 -220
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

        if instance and invaderXim.salvage.onDoorOpen(npc, nil, 3) then
            invaderXim.salvage.unsealDoors(instance, { ID.npc.DOOR_1_CENTER_1, ID.npc.DOOR_1_CENTER_2 })
            local mobs =
            {
                utils.slice(ID.mob.TROLL_IRONWORKER, 1, 2),
                utils.slice(ID.mob.SULFUR_SCORPION, 1, 3),
            }
            invaderXim.salvage.spawnGroup(instance, mobs)
        else
            player:messageSpecial(ID.text.DOOR_IS_SEALED)
        end
    end
end

return entity
