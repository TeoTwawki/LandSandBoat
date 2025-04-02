-----------------------------------
-- Area: Windurst Walls
--  NPC: Burute-Sorute
-- Type: Title Change NPC
-- !pos 0.080 -10.765 5.394 239
-----------------------------------
---@type TNpcEntity
local entity = {}

local eventId = 10004
local titleInfo =
{
    {
        cost = 200,
        title =
        {
            invaderXim.title.NEW_ADVENTURER,
            invaderXim.title.CAT_BURGLAR_GROUPIE,
            invaderXim.title.CRAWLER_CULLER,
            invaderXim.title.STAR_ONION_BRIGADE_MEMBER,
            invaderXim.title.SOB_SUPER_HERO,
            invaderXim.title.EDITORS_HATCHET_MAN,
            invaderXim.title.SUPER_MODEL,
            invaderXim.title.FAST_FOOD_DELIVERER,
            invaderXim.title.CARDIAN_TUTOR,
            invaderXim.title.KISSER_MAKE_UPPER,
            invaderXim.title.LOWER_THAN_THE_LOWEST_TUNNEL_WORM,
            invaderXim.title.FRESH_NORTH_WINDS_RECRUIT,
            invaderXim.title.HEAVENS_TOWER_GATEHOUSE_RECRUIT,
            invaderXim.title.NEW_BEST_OF_THE_WEST_RECRUIT,
            invaderXim.title.NEW_BUUMAS_BOOMERS_RECRUIT,
            invaderXim.title.MOGS_MASTER,
            invaderXim.title.EMERALD_EXTERMINATOR,
            invaderXim.title.DISCERNING_INDIVIDUAL,
            invaderXim.title.VERY_DISCERNING_INDIVIDUAL,
            invaderXim.title.EXTREMELY_DISCERNING_INDIVIDUAL,
            invaderXim.title.BABBANS_TRAVELING_COMPANION
        },
    },
    {
        cost = 300,
        title =
        {
            invaderXim.title.SAVIOR_OF_KNOWLEDGE,
            invaderXim.title.STAR_ONION_BRIGADIER,
            invaderXim.title.QUICK_FIXER,
            invaderXim.title.FAKE_MOUSTACHED_INVESTIGATOR,
            invaderXim.title.CUPIDS_FLORIST,
            invaderXim.title.TARUTARU_MURDER_SUSPECT,
            invaderXim.title.HEXER_VEXER,
            invaderXim.title.GREAT_GRAPPLER_SCORPIO,
            invaderXim.title.CERTIFIED_ADVENTURER,
            invaderXim.title.BOND_FIXER,
            invaderXim.title.FOSSILIZED_SEA_FARER,
            invaderXim.title.MOGS_KIND_MASTER,
        },
    },
    {
        cost = 400,
        title =
        {
            invaderXim.title.HAKKURU_RINKURUS_BENEFACTOR,
            invaderXim.title.SPOILSPORT,
            invaderXim.title.PILGRIM_TO_MEA,
            invaderXim.title.TOTAL_LOSER,
            invaderXim.title.DOCTOR_SHANTOTTOS_FLAVOR_OF_THE_MONTH,
            invaderXim.title.THE_FANGED_ONE,
            invaderXim.title.RAINBOW_WEAVER,
            invaderXim.title.FINE_TUNER,
            invaderXim.title.DOCTOR_SHANTOTTOS_GUINEA_PIG,
            invaderXim.title.GHOSTIE_BUSTER,
            invaderXim.title.NIGHT_SKY_NAVIGATOR,
            invaderXim.title.DELIVERER_OF_TEARFUL_NEWS,
            invaderXim.title.DOWN_PIPER_PIPE_UPPERER,
            invaderXim.title.DOCTOR_YORAN_ORAN_SUPPORTER,
            invaderXim.title.DOCTOR_SHANTOTTO_SUPPORTER,
            invaderXim.title.PROFESSOR_KORU_MORU_SUPPORTER,
            invaderXim.title.STAR_ORDAINED_WARRIOR,
            invaderXim.title.SHADOW_BANISHER,
            invaderXim.title.MOGS_EXCEPTIONALLY_KIND_MASTER,
            invaderXim.title.FRIEND_OF_THE_HELMED,
            invaderXim.title.DEED_VERIFIER,
        },
    },
    {
        cost = 500,
        title =
        {
            invaderXim.title.PARAGON_OF_THIEF_EXCELLENCE,
            invaderXim.title.PARAGON_OF_BLACK_MAGE_EXCELLENCE,
            invaderXim.title.PARAGON_OF_RANGER_EXCELLENCE,
            invaderXim.title.PARAGON_OF_SUMMONER_EXCELLENCE,
            invaderXim.title.CERTIFIED_RHINOSTERY_VENTURER,
            invaderXim.title.DREAM_DWELLER,
            invaderXim.title.HERO_ON_BEHALF_OF_WINDURST,
            invaderXim.title.VICTOR_OF_THE_BALGA_CONTEST,
            invaderXim.title.MOGS_LOVING_MASTER,
            invaderXim.title.HEIR_OF_THE_NEW_MOON,
            invaderXim.title.SEEKER_OF_TRUTH,
            invaderXim.title.FUGITIVE_MINISTER_BOUNTY_HUNTER,
            invaderXim.title.GUIDING_STAR,
            invaderXim.title.VESTAL_CHAMBERLAIN,
            invaderXim.title.DYNAMIS_WINDURST_INTERLOPER,
            invaderXim.title.HEIR_TO_THE_REALM_OF_DREAMS,
        },
    },
    {
        cost = 600,
        title =
        {
            invaderXim.title.FREESWORD,
            invaderXim.title.MERCENARY,
            invaderXim.title.MERCENARY_CAPTAIN,
            invaderXim.title.COMBAT_CASTER,
            invaderXim.title.TACTICIAN_MAGICIAN,
            invaderXim.title.WISE_WIZARD,
            invaderXim.title.PATRIARCH_PROTECTOR,
            invaderXim.title.CASTER_CAPTAIN,
            invaderXim.title.MASTER_CASTER,
            invaderXim.title.MERCENARY_MAJOR,
            invaderXim.title.KNITTING_KNOW_IT_ALL,
            invaderXim.title.LOOM_LUNATIC,
            invaderXim.title.ACCOMPLISHED_WEAVER,
            invaderXim.title.BOUTIQUE_OWNER,
            invaderXim.title.BONE_BEAUTIFIER,
            invaderXim.title.SHELL_SCRIMSHANDER,
            invaderXim.title.ACCOMPLISHED_BONEWORKER,
            invaderXim.title.CURIOSITY_SHOP_OWNER,
            invaderXim.title.FASTRIVER_FISHER,
            invaderXim.title.COASTLINE_CASTER,
            invaderXim.title.ACCOMPLISHED_ANGLER,
            invaderXim.title.FISHMONGER_OWNER,
            invaderXim.title.GOURMAND_GRATIFIER,
            invaderXim.title.BANQUET_BESTOWER,
            invaderXim.title.ACCOMPLISHED_CHEF,
            invaderXim.title.RESTAURANT_OWNER,
        },
    },
    {
        cost = 700,
        title =
        {
            invaderXim.title.MOG_HOUSE_HANDYPERSON,
            invaderXim.title.ARRESTER_OF_THE_ASCENSION,
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
