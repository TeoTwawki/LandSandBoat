-----------------------------------
-- Area: Behemoth's Dominion
--  HNM: Behemoth
-----------------------------------
local ID = zones[invaderXim.zone.BEHEMOTHS_DOMINION]
mixins = { require('scripts/mixins/rage') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    mob:setLocalVar('[rage]timer', 1800) -- 30 minutes
    mob:setMobMod(invaderXim.mobMod.NO_MOVE, 0)
    mob:setMobMod(invaderXim.mobMod.WEAPON_BONUS, 37) -- 109 total weapon damage
    mob:setMod(invaderXim.mod.EVA, 301)
    mob:setMod(invaderXim.mod.ATT, 211)

    -- Despawn the ???
    GetNPCByID(ID.npc.BEHEMOTH_QM):setStatus(invaderXim.status.DISAPPEAR)
end

entity.onMobRoam = function(mob)
    mob:setMobMod(invaderXim.mobMod.NO_MOVE, 0)
end

entity.onMobFight = function(mob, target)
    local drawInTable =
    {
        conditions =
        {
            target:getXPos() > -180 and target:getZPos() > 53,
            target:getXPos() > -230 and target:getZPos() < 5,
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
    player:addTitle(invaderXim.title.BEHEMOTHS_BANE)
end

entity.onMobDespawn = function(mob)
    -- Respawn the ???
    GetNPCByID(ID.npc.BEHEMOTH_QM):updateNPCHideTime(invaderXim.settings.main.FORCE_SPAWN_QM_RESET_TIME)
end

return entity
