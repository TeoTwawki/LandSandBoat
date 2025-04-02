-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Moozo-Koozo
--  Title Change NPC
-- !pos 83 0 120 230
-----------------------------------
---@type TNpcEntity
local entity = {}

local eventId = 675
local titleInfo =
{
    {
        cost = 200,
        title =
        {
            invaderXim.title.NEW_ADVENTURER,
            invaderXim.title.BEAN_CUISINE_SALTER,
            invaderXim.title.DAYBREAK_GAMBLER,
            invaderXim.title.ENTRANCE_DENIED,
            invaderXim.title.RABBITER,
            invaderXim.title.ROYAL_GRAVE_KEEPER,
            invaderXim.title.COURIER_EXTRAORDINAIRE,
            invaderXim.title.RONFAURIAN_RESCUER,
            invaderXim.title.PICKPOCKET_PINCHER,
            invaderXim.title.THE_PURE_ONE,
            invaderXim.title.LOST_CHILD_OFFICER,
            invaderXim.title.SILENCER_OF_THE_LAMBS,
            invaderXim.title.LOST_FOUND_OFFICER,
            invaderXim.title.GREEN_GROCER,
            invaderXim.title.THE_BENEVOLENT_ONE,
            invaderXim.title.KNIGHT_IN_TRAINING,
            invaderXim.title.ADVERTISING_EXECUTIVE,
            invaderXim.title.FAMILY_COUNSELOR,
            invaderXim.title.MOGS_MASTER,
            invaderXim.title.VERMILLION_VENTURER,
            invaderXim.title.DISCERNING_INDIVIDUAL,
            invaderXim.title.VERY_DISCERNING_INDIVIDUAL,
            invaderXim.title.EXTREMELY_DISCERNING_INDIVIDUAL,
        },
    },
    {
        cost = 300,
        title =
        {
            invaderXim.title.SHEEPS_MILK_DELIVERER,
            invaderXim.title.THE_PIOUS_ONE,
            invaderXim.title.APIARIST,
            invaderXim.title.FAITH_LIKE_A_CANDLE,
            invaderXim.title.LIZARD_SKINNER,
            invaderXim.title.BUG_CATCHER,
            invaderXim.title.SPELUNKER,
            invaderXim.title.ARMS_TRADER,
            invaderXim.title.THIRD_RATE_ORGANIZER,
            invaderXim.title.ROYAL_WEDDING_PLANNER,
            invaderXim.title.CONSORT_CANDIDATE,
            invaderXim.title.CERTIFIED_ADVENTURER,
            invaderXim.title.VAMPIRE_HUNTER_D_MINUS,
            invaderXim.title.A_MOSS_KIND_PERSON,
            invaderXim.title.FANG_FINDER,
            invaderXim.title.TRAVELING_MEDICINE_MAN,
            invaderXim.title.CAT_SKINNER,
            invaderXim.title.CARP_DIEM,
            invaderXim.title.SECOND_RATE_ORGANIZER,
            invaderXim.title.MOGS_KIND_MASTER,
        },
    },
    {
        cost = 400,
        title =
        {
            invaderXim.title.FIRST_RATE_ORGANIZER,
            invaderXim.title.PILGRIM_TO_HOLLA,
            invaderXim.title.TRIED_AND_TESTED_KNIGHT,
            invaderXim.title.HEIR_TO_THE_HOLY_CREST,
            invaderXim.title.OBSIDIAN_STORM,
            invaderXim.title.TALKS_WITH_TONBERRIES,
            invaderXim.title.SHADOW_BANISHER,
            invaderXim.title.MOGS_EXCEPTIONALLY_KIND_MASTER,
        },
    },
    {
        cost = 500,
        title =
        {
            invaderXim.title.SEARING_STAR,
            invaderXim.title.STRIKING_STAR,
            invaderXim.title.SOOTHING_STAR,
            invaderXim.title.SABLE_STAR,
            invaderXim.title.SCARLET_STAR,
            invaderXim.title.SONIC_STAR,
            invaderXim.title.SAINTLY_STAR,
            invaderXim.title.SHADOWY_STAR,
            invaderXim.title.SAVAGE_STAR,
            invaderXim.title.SINGING_STAR,
            invaderXim.title.SNIPING_STAR,
            invaderXim.title.SLICING_STAR,
            invaderXim.title.SNEAKING_STAR,
            invaderXim.title.SPEARING_STAR,
            invaderXim.title.SUMMONING_STAR,
            invaderXim.title.SAPPHIRE_STAR,
            invaderXim.title.SURGING_STAR,
            invaderXim.title.SWAYING_STAR,
            invaderXim.title.SPRIGHTLY_STAR,
            invaderXim.title.SAGACIOUS_STAR,
        },
    },
    {
        cost = 600,
        title =
        {
            invaderXim.title.ROOK_BUSTER,
            invaderXim.title.BANNERET,
            invaderXim.title.GOLD_BALLI_STAR,
            invaderXim.title.MYTHRIL_BALLI_STAR,
            invaderXim.title.SILVER_BALLI_STAR,
            invaderXim.title.BRONZE_BALLI_STAR,
            invaderXim.title.BALLISTAGER,
            invaderXim.title.FINAL_BALLI_STAR,
            invaderXim.title.BALLI_STAR_ROYALE,
            invaderXim.title.PARAGON_OF_RED_MAGE_EXCELLENCE,
            invaderXim.title.PARAGON_OF_WHITE_MAGE_EXCELLENCE,
            invaderXim.title.PARAGON_OF_PALADIN_EXCELLENCE,
            invaderXim.title.PARAGON_OF_DRAGOON_EXCELLENCE,
            invaderXim.title.HEIR_OF_THE_GREAT_ICE,
            invaderXim.title.MOGS_LOVING_MASTER,
            invaderXim.title.SAN_DORIAN_ROYAL_HEIR,
            invaderXim.title.DYNAMIS_SAN_DORIA_INTERLOPER,
        },
    },
    {
        cost = 700,
        title =
        {
            invaderXim.title.ROYAL_ARCHER,
            invaderXim.title.ROYAL_SPEARMAN,
            invaderXim.title.ROYAL_SQUIRE,
            invaderXim.title.ROYAL_SWORDSMAN,
            invaderXim.title.ROYAL_CAVALIER,
            invaderXim.title.ROYAL_GUARD,
            invaderXim.title.GRAND_KNIGHT_OF_THE_REALM,
            invaderXim.title.GRAND_TEMPLE_KNIGHT,
            invaderXim.title.RESERVE_KNIGHT_CAPTAIN,
            invaderXim.title.ELITE_ROYAL_GUARD,
            invaderXim.title.WOOD_WORSHIPER,
            invaderXim.title.LUMBER_LATHER,
            invaderXim.title.ACCOMPLISHED_CARPENTER,
            invaderXim.title.ANVIL_ADVOCATE,
            invaderXim.title.FORGE_FANATIC,
            invaderXim.title.ACCOMPLISHED_BLACKSMITH,
            invaderXim.title.ARMORY_OWNER,
            invaderXim.title.HIDE_HANDLER,
            invaderXim.title.LEATHER_LAUDER,
            invaderXim.title.ACCOMPLISHED_TANNER,
            invaderXim.title.SHOESHOP_OWNER,
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
