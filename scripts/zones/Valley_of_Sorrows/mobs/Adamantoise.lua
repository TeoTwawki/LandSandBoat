-----------------------------------
-- Area: Valley of Sorrows
--  HNM: Adamantoise
-----------------------------------
local ID = zones[invaderXim.zone.VALLEY_OF_SORROWS]
mixins =
{
    require('scripts/mixins/rage'),
    require('scripts/mixins/draw_in'),
}
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    mob:setLocalVar('[rage]timer', 1800) -- 30 minutes
    mob:addImmunity(invaderXim.immunity.LIGHT_SLEEP)
    mob:addImmunity(invaderXim.immunity.DARK_SLEEP)
    mob:setMod(invaderXim.mod.DMGMAGIC, -3500)
    mob:setMobMod(invaderXim.mobMod.WEAPON_BONUS, 36) -- 108 total weapon damage
    mob:setMod(invaderXim.mod.DEF, 4112)
    mob:setMod(invaderXim.mod.ATT, 450)

    -- Despawn the ???
    GetNPCByID(ID.npc.ADAMANTOISE_QM):setStatus(invaderXim.status.DISAPPEAR)
end

entity.onMobDeath = function(mob, player, optParams)
    player:addTitle(invaderXim.title.TORTOISE_TORTURER)
end

entity.onMobDespawn = function(mob)
    -- Respawn the ???
    GetNPCByID(ID.npc.ADAMANTOISE_QM):updateNPCHideTime(invaderXim.settings.main.FORCE_SPAWN_QM_RESET_TIME)
end

return entity
