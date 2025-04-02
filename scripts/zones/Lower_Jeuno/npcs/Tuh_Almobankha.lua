-----------------------------------
-- Area: Lower Jeuno
--  NPC: Tuh Almobankha
-- Title Change NPC
-- !pos -14 0 -61 245
-----------------------------------
---@type TNpcEntity
local entity = {}

local eventId = 10014
local titleInfo =
{
    {
        cost = 200,
        title =
        {
            invaderXim.title.BROWN_MAGE_GUINEA_PIG,
            invaderXim.title.BROWN_MAGIC_BY_PRODUCT,
            invaderXim.title.RESEARCHER_OF_CLASSICS,
            invaderXim.title.TORCHBEARER,
            invaderXim.title.FORTUNE_TELLER_IN_TRAINING,
            invaderXim.title.CHOCOBO_TRAINER,
            invaderXim.title.CLOCK_TOWER_PRESERVATIONIST,
            invaderXim.title.LIFE_SAVER,
            invaderXim.title.CARD_COLLECTOR,
            invaderXim.title.TWOS_COMPANY,
            invaderXim.title.TRADER_OF_ANTIQUITIES,
            invaderXim.title.GOBLINS_EXCLUSIVE_FASHION_MANNEQUIN,
            invaderXim.title.TENSHODO_MEMBER,
        },
    },
    {
        cost = 300,
        title =
        {
            invaderXim.title.ACTIVIST_FOR_KINDNESS,
            invaderXim.title.ENVOY_TO_THE_NORTH,
            invaderXim.title.EXORCIST_IN_TRAINING,
            invaderXim.title.FOOLS_ERRAND_RUNNER,
            invaderXim.title.STREET_SWEEPER,
            invaderXim.title.MERCY_ERRAND_RUNNER,
            invaderXim.title.BELIEVER_OF_ALTANA,
            invaderXim.title.TRADER_OF_MYSTERIES,
            invaderXim.title.WANDERING_MINSTREL,
            invaderXim.title.ANIMAL_TRAINER,
            invaderXim.title.HAVE_WINGS_WILL_FLY,
            invaderXim.title.ROD_RETRIEVER,
            invaderXim.title.DESTINED_FELLOW,
            invaderXim.title.TROUPE_BRILIOTH_DANCER,
            invaderXim.title.PROMISING_DANCER,
            invaderXim.title.STARDUST_DANCER,
        },
    },
    {
        cost = 400,
        title =
        {
            invaderXim.title.TIMEKEEPER,
            invaderXim.title.BRINGER_OF_BLISS,
            invaderXim.title.PROFESSIONAL_LOAFER,
            invaderXim.title.TRADER_OF_RENOWN,
            invaderXim.title.HORIZON_BREAKER,
            invaderXim.title.SUMMIT_BREAKER,
            invaderXim.title.BROWN_BELT,
            invaderXim.title.DUCAL_DUPE,
            invaderXim.title.CHOCOBO_LOVE_GURU,
            invaderXim.title.PICK_UP_ARTIST,
            invaderXim.title.WORTHY_OF_TRUST,
            invaderXim.title.A_FRIEND_INDEED,
            invaderXim.title.CHOCOROOKIE,
            invaderXim.title.CRYSTAL_STAKES_CUPHOLDER,
            invaderXim.title.WINNING_OWNER,
            invaderXim.title.VICTORIOUS_OWNER,
            invaderXim.title.TRIUMPHANT_OWNER,
            invaderXim.title.HIGH_ROLLER,
            invaderXim.title.FORTUNES_FAVORITE,
            invaderXim.title.CHOCOCHAMPION,
        },
    },
    {
        cost = 500,
        title =
        {
            invaderXim.title.PARAGON_OF_BEASTMASTER_EXCELLENCE,
            invaderXim.title.PARAGON_OF_BARD_EXCELLENCE,
            invaderXim.title.SKY_BREAKER,
            invaderXim.title.BLACK_BELT,
            invaderXim.title.GREEDALOX,
            invaderXim.title.CLOUD_BREAKER,
            invaderXim.title.STAR_BREAKER,
            invaderXim.title.ULTIMATE_CHAMPION_OF_THE_WORLD,
            invaderXim.title.DYNAMIS_JEUNO_INTERLOPER,
            invaderXim.title.DYNAMIS_BEAUCEDINE_INTERLOPER,
            invaderXim.title.DYNAMIS_XARCABARD_INTERLOPER,
            invaderXim.title.DYNAMIS_QUFIM_INTERLOPER,
            invaderXim.title.CONQUEROR_OF_FATE,
            invaderXim.title.SUPERHERO,
            invaderXim.title.SUPERHEROINE,
            invaderXim.title.ELEGANT_DANCER,
            invaderXim.title.DAZZLING_DANCE_DIVA,
            invaderXim.title.GRIMOIRE_BEARER,
            invaderXim.title.FELLOW_FORTIFIER,
            invaderXim.title.BUSHIN_ASPIRANT,
            invaderXim.title.BUSHIN_RYU_INHERITOR,
        },
    },
    {
        cost = 600,
        title =
        {
            invaderXim.title.GRAND_GREEDALOX,
            invaderXim.title.SILENCER_OF_THE_ECHO,
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
