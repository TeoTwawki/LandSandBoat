-----------------------------------
-- Area: Dragons Aery
--  HNM: Fafnir
-----------------------------------
local ID = zones[invaderXim.zone.DRAGONS_AERY]
mixins = { require('scripts/mixins/rage') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    mob:setLocalVar('[rage]timer', 3600) -- 60 minutes
    mob:setMobMod(invaderXim.mobMod.NO_MOVE, 0)
    mob:setMobMod(invaderXim.mobMod.WEAPON_BONUS, 48) -- 140 total weapon damage
    mob:setMod(invaderXim.mod.ATT, 435)

    -- Despawn the ???
    GetNPCByID(ID.npc.FAFNIR_QM):setStatus(invaderXim.status.DISAPPEAR)
end

entity.onMobFight = function(mob, target)
    local drawInTable =
    {
        conditions =
        {
            target:getXPos() > 95 and target:getZPos() > 56,
            target:getXPos() < 60 and target:getZPos() < 23,
        },
        position = mob:getPos(),
        wait = 3,
    }

    for _, condition in ipairs(drawInTable.conditions) do
        if condition then
            mob:setMobMod(invaderXim.mobMod.NO_MOVE, 1)
            utils.drawIn(target, drawInTable)
            break
        else
            mob:setMobMod(invaderXim.mobMod.NO_MOVE, 0)
        end
    end
end

entity.onMobDeath = function(mob, player, optParams)
    player:addTitle(invaderXim.title.FAFNIR_SLAYER)
end

entity.onMobDespawn = function(mob)
    -- Respawn the ???
    GetNPCByID(ID.npc.FAFNIR_QM):updateNPCHideTime(invaderXim.settings.main.FORCE_SPAWN_QM_RESET_TIME)
end

return entity
