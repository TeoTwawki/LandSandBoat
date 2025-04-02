-----------------------------------
-- Area: Mhaura
--  NPC: Willah Maratahya
-- Title Change NPC
-- !pos 23 -8 63 249
-----------------------------------
---@type TNpcEntity
local entity = {}

local eventId = 10001
local titleInfo =
{
    {
        cost = 200,
        title =
        {
            invaderXim.title.PURVEYOR_IN_TRAINING,
            invaderXim.title.ONE_STAR_PURVEYOR,
            invaderXim.title.TWO_STAR_PURVEYOR,
            invaderXim.title.THREE_STAR_PURVEYOR,
        },
    },
    {
        cost = 300,
        title =
        {
            invaderXim.title.FOUR_STAR_PURVEYOR,
            invaderXim.title.FIVE_STAR_PURVEYOR,
            invaderXim.title.HEIR_OF_THE_GREAT_LIGHTNING,
            invaderXim.title.ORCISH_SERJEANT,
            invaderXim.title.BRONZE_QUADAV,
            invaderXim.title.YAGUDO_INITIATE,
            invaderXim.title.MOBLIN_KINSMAN,
            invaderXim.title.DYNAMIS_BUBURIMU_INTERLOPER,
        },
    },
    {
        cost = 400,
        title =
        {
            invaderXim.title.FODDERCHIEF_FLAYER,
            invaderXim.title.WARCHIEF_WRECKER,
            invaderXim.title.DREAD_DRAGON_SLAYER,
            invaderXim.title.OVERLORD_EXECUTIONER,
            invaderXim.title.DARK_DRAGON_SLAYER,
            invaderXim.title.ADAMANTKING_KILLER,
            invaderXim.title.BLACK_DRAGON_SLAYER,
            invaderXim.title.MANIFEST_MAULER,
            invaderXim.title.BEHEMOTHS_BANE,
            invaderXim.title.ARCHMAGE_ASSASSIN,
            invaderXim.title.HELIXIMANE,
            invaderXim.title.GIANT_KILLER,
            invaderXim.title.LICH_BANISHER,
            invaderXim.title.JELLYBANE,
            invaderXim.title.BOGEYDOWNER,
            invaderXim.title.BEAKBENDER,
            invaderXim.title.SKULLCRUSHER,
            invaderXim.title.MORBOLBANE,
            invaderXim.title.GOLIATH_KILLER,
            invaderXim.title.MARYS_GUIDE,
        },
    },
    {
        cost = 500,
        title =
        {
            invaderXim.title.SIMURGH_POACHER,
            invaderXim.title.ROC_STAR,
            invaderXim.title.SERKET_BREAKER,
            invaderXim.title.CASSIENOVA,
            invaderXim.title.THE_HORNSPLITTER,
            invaderXim.title.TORTOISE_TORTURER,
            invaderXim.title.MON_CHERRY,
            invaderXim.title.BEHEMOTH_DETHRONER,
            invaderXim.title.THE_VIVISECTOR,
            invaderXim.title.DRAGON_ASHER,
            invaderXim.title.EXPEDITIONARY_TROOPER,
        },
    },
    {
        cost = 600,
        title =
        {
            invaderXim.title.ADAMANTKING_USURPER,
            invaderXim.title.OVERLORD_OVERTHROWER,
            invaderXim.title.DEITY_DEBUNKER,
            invaderXim.title.FAFNIR_SLAYER,
            invaderXim.title.ASPIDOCHELONE_SINKER,
            invaderXim.title.NIDHOGG_SLAYER,
            invaderXim.title.MAAT_MASHER,
            invaderXim.title.KIRIN_CAPTIVATOR,
            invaderXim.title.CACTROT_DESACELERADOR,
            invaderXim.title.LIFTER_OF_SHADOWS,
            invaderXim.title.TIAMAT_TROUNCER,
            invaderXim.title.VRTRA_VANQUISHER,
            invaderXim.title.WORLD_SERPENT_SLAYER,
            invaderXim.title.XOLOTL_XTRAPOLATOR,
            invaderXim.title.BOROKA_BELEAGUERER,
            invaderXim.title.OURYU_OVERWHELMER,
            invaderXim.title.VINEGAR_EVAPORATOR,
            invaderXim.title.VIRTUOUS_SAINT,
            invaderXim.title.BYE_BYE_TAISAI,
            invaderXim.title.TEMENOS_LIBERATOR,
            invaderXim.title.APOLLYON_RAVAGER,
            invaderXim.title.WYRM_ASTONISHER,
            invaderXim.title.NIGHTMARE_AWAKENER,
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
