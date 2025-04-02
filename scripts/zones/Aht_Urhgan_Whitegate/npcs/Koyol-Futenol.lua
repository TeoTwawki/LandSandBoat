-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: Koyol-Futenol
-- Title Change NPC
-- !pos -129 2 -20 50
-----------------------------------
---@type TNpcEntity
local entity = {}

local eventId = 644
local titleInfo =
{
    {
        cost = 200,
        title =
        {
            invaderXim.title.DARK_RESISTANT,
            invaderXim.title.BEARER_OF_THE_MARK_OF_ZAHAK,
            invaderXim.title.SEAGULL_PHRATRIE_CREW_MEMBER,
            invaderXim.title.PROUD_AUTOMATON_OWNER,
            invaderXim.title.WILDCAT_PUBLICIST,
            invaderXim.title.SCENIC_SNAPSHOTTER,
            invaderXim.title.BRANDED_BY_THE_FIVE_SERPENTS,
            invaderXim.title.IMMORTAL_LION,
            invaderXim.title.PARAGON_OF_BLUE_MAGE_EXCELLENCE,
            invaderXim.title.PARAGON_OF_CORSAIR_EXCELLENCE,
            invaderXim.title.PARAGON_OF_PUPPETMASTER_EXCELLENCE,
            invaderXim.title.MASTER_OF_AMBITION,
            invaderXim.title.MASTER_OF_CHANCE,
            invaderXim.title.SKYSERPENT_AGGRANDIZER,
            invaderXim.title.GALESERPENT_GUARDIAN,
            invaderXim.title.STONESERPENT_SHOCKTROOPER,
            invaderXim.title.PHOTOPTICATOR_OPERATOR,
            invaderXim.title.SPRINGSERPENT_SENTRY,
            invaderXim.title.FLAMESERPENT_FACILITATOR,
        },
    },
    {
        cost = 300,
        title =
        {
            invaderXim.title.PRIVATE_SECOND_CLASS,
            invaderXim.title.PRIVATE_FIRST_CLASS,
            invaderXim.title.SUPERIOR_PRIVATE,
            invaderXim.title.LANCE_CORPORAL,
            invaderXim.title.CORPORAL,
            invaderXim.title.SERGEANT,
            invaderXim.title.SERGEANT_MAJOR,
            invaderXim.title.CHIEF_SERGEANT,
            invaderXim.title.SECOND_LIEUTENANT,
            invaderXim.title.FIRST_LIEUTENANT,
            invaderXim.title.AGENT_OF_THE_ALLIED_FORCES,
            invaderXim.title.OVJANGS_ERRAND_RUNNER,
            invaderXim.title.KARABABAS_TOUR_GUIDE,
            invaderXim.title.KARABABAS_BODYGUARD,
            invaderXim.title.KARABABAS_SECRET_AGENT,
            invaderXim.title.APHMAUS_MERCENARY,
            invaderXim.title.NASHMEIRAS_MERCENARY,
            invaderXim.title.SALAHEEMS_RISK_ASSESSOR,
            invaderXim.title.TREASURE_TROVE_TENDER,
            invaderXim.title.GESSHOS_MERCY,
            invaderXim.title.EMISSARY_OF_THE_EMPRESS,
            invaderXim.title.ENDYMION_PARATROOPER,
            invaderXim.title.NAJAS_COMRADE_IN_ARMS,
            invaderXim.title.NASHMEIRAS_LOYALIST,
            invaderXim.title.PREVENTER_OF_RAGNAROK,
            invaderXim.title.CHAMPION_OF_AHT_URHGAN,
            invaderXim.title.ETERNAL_MERCENARY,
            invaderXim.title.CAPTAIN
        },
    },
    {
        cost = 400,
        title =
        {
            invaderXim.title.SUBDUER_OF_THE_MAMOOL_JA,
            invaderXim.title.SUBDUER_OF_THE_TROLLS,
            invaderXim.title.SUBDUER_OF_THE_UNDEAD_SWARM,
            invaderXim.title.CERBERUS_MUZZLER,
            invaderXim.title.HYDRA_HEADHUNTER,
            invaderXim.title.SHINING_SCALE_RIFLER,
            invaderXim.title.TROLL_SUBJUGATOR,
            invaderXim.title.GORGONSTONE_SUNDERER,
            invaderXim.title.KHIMAIRA_CARVER,
            invaderXim.title.ELITE_EINHERJAR,
            invaderXim.title.STAR_CHARIOTEER,
            invaderXim.title.SUN_CHARIOTEER,
            invaderXim.title.COMET_CHARIOTEER,
            invaderXim.title.MOON_CHARIOTEER,
            invaderXim.title.BLOODY_BERSERKER,
            invaderXim.title.THE_SIXTH_SERPENT,
            invaderXim.title.PANDEMONIUM_QUELLER,
            invaderXim.title.OUPIRE_IMPALER,
            invaderXim.title.HEIR_OF_THE_BLESSED_RADIANCE,
            invaderXim.title.HEIR_OF_THE_BLIGHTED_GLOOM,
            invaderXim.title.SWORN_TO_THE_DARK_DIVINITY,
        },
    },
    {
        cost = 500,
        title =
        {
            invaderXim.title.SUPERNAL_SAVANT,
            invaderXim.title.SOLAR_SAGE,
            invaderXim.title.BOLIDE_BARON,
            invaderXim.title.MOON_MAVEN,
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
