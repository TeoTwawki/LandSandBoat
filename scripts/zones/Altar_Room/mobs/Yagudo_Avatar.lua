-----------------------------------
-- Area: Altar Room
-----------------------------------
local ID = zones[invaderXim.zone.ALTAR_ROOM]
mixins = { require('scripts/mixins/job_special') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
end

entity.onMobDeath = function(mob, player, optParams)
    if
        player:getQuestStatus(invaderXim.questLog.OTHER_AREAS, invaderXim.quest.id.otherAreas.A_MORAL_MANIFEST) == invaderXim.questStatus.QUEST_ACCEPTED and
        player:getCharVar('moral') == 5
    then
        player:setCharVar('moral', 6)
        player:delKeyItem(invaderXim.ki.VAULT_QUIPUS)
    end

    for i = ID.mob.YAGUDO_AVATAR + 1, ID.mob.YAGUDO_AVATAR + 8 do
        DespawnMob(i)
    end
end

entity.onMobDespawn = function(mob)
    for i = ID.mob.YAGUDO_AVATAR + 1, ID.mob.YAGUDO_AVATAR + 8 do
        DespawnMob(i)
    end
end

return entity
