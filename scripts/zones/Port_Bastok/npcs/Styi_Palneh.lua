-----------------------------------
-- Area: Port Bastok
--  NPC: Styi Palneh
-- Title Change NPC
-- !pos 28 4 -15 236
-----------------------------------
---@type TNpcEntity
local entity = {}

local eventId = 200
local titleInfo =
{
    {
        cost = 200,
        title =
        {
            invaderXim.title.NEW_ADVENTURER,
            invaderXim.title.BASTOK_WELCOMING_COMMITTEE,
            invaderXim.title.BUCKET_FISHER,
            invaderXim.title.PURSUER_OF_THE_PAST,
            invaderXim.title.MOMMYS_HELPER,
            invaderXim.title.HOT_DOG,
            invaderXim.title.STAMPEDER,
            invaderXim.title.RINGBEARER,
            invaderXim.title.ZERUHN_SWEEPER,
            invaderXim.title.TEARJERKER,
            invaderXim.title.CRAB_CRUSHER,
            invaderXim.title.BRYGID_APPROVED,
            invaderXim.title.GUSTABERG_TOURIST,
            invaderXim.title.MOGS_MASTER,
            invaderXim.title.CERULEAN_SOLDIER,
            invaderXim.title.DISCERNING_INDIVIDUAL,
            invaderXim.title.VERY_DISCERNING_INDIVIDUAL,
            invaderXim.title.EXTREMELY_DISCERNING_INDIVIDUAL,
            invaderXim.title.APOSTATE_FOR_HIRE,
        },
    },
    {
        cost = 300,
        title =
        {
            invaderXim.title.SHELL_OUTER,
            invaderXim.title.PURSUER_OF_THE_TRUTH,
            invaderXim.title.QIJIS_FRIEND,
            invaderXim.title.TREASURE_SCAVENGER,
            invaderXim.title.SAND_BLASTER,
            invaderXim.title.DRACHENFALL_ASCETIC,
            invaderXim.title.ASSASSIN_REJECT,
            invaderXim.title.CERTIFIED_ADVENTURER,
            invaderXim.title.QIJIS_RIVAL,
            invaderXim.title.CONTEST_RIGGER,
            invaderXim.title.KULATZ_BRIDGE_COMPANION,
            invaderXim.title.AVENGER,
            invaderXim.title.AIRSHIP_DENOUNCER,
            invaderXim.title.STAR_OF_IFRIT,
            invaderXim.title.PURPLE_BELT,
            invaderXim.title.MOGS_KIND_MASTER,
            invaderXim.title.TRASH_COLLECTOR,
        },
    },
    {
        cost = 400,
        title =
        {
            invaderXim.title.BEADEAUX_SURVEYOR,
            invaderXim.title.PILGRIM_TO_DEM,
            invaderXim.title.BLACK_DEATH,
            invaderXim.title.DARK_SIDER,
            invaderXim.title.SHADOW_WALKER,
            invaderXim.title.SORROW_DROWNER,
            invaderXim.title.STEAMING_SHEEP_REGULAR,
            invaderXim.title.SHADOW_BANISHER,
            invaderXim.title.MOGS_EXCEPTIONALLY_KIND_MASTER,
            invaderXim.title.HYPER_ULTRA_SONIC_ADVENTURER,
            invaderXim.title.GOBLIN_IN_DISGUISE,
            invaderXim.title.BASTOKS_SECOND_BEST_DRESSED,
        },
    },
    {
        cost = 500,
        title =
        {
            invaderXim.title.PARAGON_OF_WARRIOR_EXCELLENCE,
            invaderXim.title.PARAGON_OF_MONK_EXCELLENCE,
            invaderXim.title.PARAGON_OF_DARK_KNIGHT_EXCELLENCE,
            invaderXim.title.HEIR_OF_THE_GREAT_EARTH,
            invaderXim.title.MOGS_LOVING_MASTER,
            invaderXim.title.HERO_AMONG_HEROES,
            invaderXim.title.DYNAMIS_BASTOK_INTERLOPER,
            invaderXim.title.MASTER_OF_MANIPULATION,
        },
    },
    {
        cost = 600,
        title =
        {
            invaderXim.title.LEGIONNAIRE,
            invaderXim.title.DECURION,
            invaderXim.title.CENTURION,
            invaderXim.title.JUNIOR_MUSKETEER,
            invaderXim.title.SENIOR_MUSKETEER,
            invaderXim.title.MUSKETEER_COMMANDER,
            invaderXim.title.GOLD_MUSKETEER,
            invaderXim.title.PRAEFECTUS,
            invaderXim.title.SENIOR_GOLD_MUSKETEER,
            invaderXim.title.PRAEFECTUS_CASTRORUM,
            invaderXim.title.ANVIL_ADVOCATE,
            invaderXim.title.FORGE_FANATIC,
            invaderXim.title.ACCOMPLISHED_BLACKSMITH,
            invaderXim.title.ARMORY_OWNER,
            invaderXim.title.TRINKET_TURNER,
            invaderXim.title.SILVER_SMELTER,
            invaderXim.title.ACCOMPLISHED_GOLDSMITH,
            invaderXim.title.JEWELRY_STORE_OWNER,
            invaderXim.title.FORMULA_FIDDLER,
            invaderXim.title.POTION_POTENTATE,
            invaderXim.title.ACCOMPLISHED_ALCHEMIST,
            invaderXim.title.APOTHECARY_OWNER,
        },
    },
    {
        cost = 700,
        title =
        {
            invaderXim.title.MOG_HOUSE_HANDYPERSON,
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
