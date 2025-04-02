-----------------------------------
-- Area: Tavnazian Safehold
--  NPC: Aligi-Kufongi
-- Title Change NPC
-- !pos -23 -21 15 26
-----------------------------------
---@type TNpcEntity
local entity = {}

local eventId = 342
local titleInfo =
{
    {
        cost = 200,
        title =
        {
            invaderXim.title.TAVNAZIAN_SQUIRE,
            invaderXim.title.PUTRID_PURVEYOR_OF_PUNGENT_PETALS,
            invaderXim.title.MONARCH_LINN_PATROL_GUARD,
            invaderXim.title.SIN_HUNTER_HUNTER,
            invaderXim.title.DISCIPLE_OF_JUSTICE,
            invaderXim.title.DYNAMIS_TAVNAZIA_INTERLOPER,
            invaderXim.title.CONFRONTER_OF_NIGHTMARES,
        },
    },
    {
        cost = 300,
        title =
        {
            invaderXim.title.DEAD_BODY,
            invaderXim.title.FROZEN_DEAD_BODY,
            invaderXim.title.DREAMBREAKER,
            invaderXim.title.MIST_MELTER,
            invaderXim.title.DELTA_ENFORCER,
            invaderXim.title.OMEGA_OSTRACIZER,
            invaderXim.title.ULTIMA_UNDERTAKER,
            invaderXim.title.ULMIAS_SOULMATE,
            invaderXim.title.TENZENS_ALLY,
            invaderXim.title.COMPANION_OF_LOUVERANCE,
            invaderXim.title.TRUE_COMPANION_OF_LOUVERANCE,
            invaderXim.title.PRISHES_BUDDY,
            invaderXim.title.NAGMOLADAS_UNDERLING,
            invaderXim.title.ESHANTARLS_COMRADE_IN_ARMS,
            invaderXim.title.THE_CHEBUKKIS_WORST_NIGHTMARE,
            invaderXim.title.UNQUENCHABLE_LIGHT,
            invaderXim.title.WARRIOR_OF_THE_CRYSTAL,
        },
    },
    {
        cost = 400,
        title =
        {
            invaderXim.title.ANCIENT_FLAME_FOLLOWER,
            invaderXim.title.TAVNAZIAN_TRAVELER,
            invaderXim.title.TRANSIENT_DREAMER,
            invaderXim.title.THE_LOST_ONE,
            invaderXim.title.TREADER_OF_AN_ICY_PAST,
            invaderXim.title.BRANDED_BY_LIGHTNING,
            invaderXim.title.SEEKER_OF_THE_LIGHT,
            invaderXim.title.AVERTER_OF_THE_APOCALYPSE,
            invaderXim.title.BANISHER_OF_EMPTINESS,
            invaderXim.title.BREAKER_OF_THE_CHAINS,
        },
    },
}

entity.onTrigger = function(player, npc)
    invaderXim.titleChanger.onTrigger(player, eventId, titleInfo)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.titleChanger.onEventFinish(player, csid, option, eventId, titleInfo)
end

return entity
