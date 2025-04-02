-----------------------------------
-- Area: Konschtat Highlands
--   NM: Steelfleece Baldarich
-----------------------------------
mixins =
{
    require('scripts/mixins/job_special'),
    require('scripts/mixins/draw_in'),
}
require('scripts/quests/tutorial')
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.ALWAYS_AGGRO, 1)
end

entity.onMobSpawn = function(mob)
    invaderXim.mix.jobSpecial.config(mob, {
        specials =
        {
            { id = invaderXim.jsa.MIGHTY_STRIKES, hpp = math.random(90, 95), cooldown = 120 } -- "Uses ... Mighty Strikes, which can be used multiple times."
        }
    })
end

entity.onMobDeath = function(mob, player, optParams)
    player:addTitle(invaderXim.title.THE_HORNSPLITTER)
    invaderXim.tutorial.onMobDeath(player)
end

return entity
