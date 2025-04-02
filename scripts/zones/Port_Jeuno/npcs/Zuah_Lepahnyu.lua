-----------------------------------
-- Area: Port Jeuno
--  NPC: ZuahLepahnyu
-- Title Change NPC
-- !pos 0 0 8 246
-----------------------------------
---@type TNpcEntity
local entity = {}

local eventId = 330
local titleInfo =
{
    {
        cost = 200,
        title =
        {
            invaderXim.title.VISITOR_TO_ABYSSEA,
            invaderXim.title.FRIEND_OF_ABYSSEA,
            invaderXim.title.WARRIOR_OF_ABYSSEA,
            invaderXim.title.STORMER_OF_ABYSSEA,
            invaderXim.title.DEVASTATOR_OF_ABYSSEA,
            invaderXim.title.HERO_OF_ABYSSEA,
            invaderXim.title.CHAMPION_OF_ABYSSEA,
            invaderXim.title.CONQUEROR_OF_ABYSSEA,
            invaderXim.title.SAVIOR_OF_ABYSSEA,
        },
    },
    {
        cost = 300,
        title =
        {
            invaderXim.title.GOLDWING_SQUASHER,
            invaderXim.title.SILAGILITH_DETONATOR,
            invaderXim.title.SURTR_SMOTHERER,
            invaderXim.title.DREYRUK_PREDOMINATOR,
            invaderXim.title.SAMURSK_VITIATOR,
        },
    },
    {
        cost = 400,
        title =
        {
            invaderXim.title.YAANEI_CRASHER,
            invaderXim.title.KUTHAREI_UNHORSER,
            invaderXim.title.SIPPOY_CAPTURER,
            invaderXim.title.RANI_DECROWNER,
            invaderXim.title.ORTHRUS_DECAPITATOR,
            invaderXim.title.DRAGUA_SLAYER,
            invaderXim.title.BENNU_DEPLUMER,
            invaderXim.title.HEDJEDJET_DESTINGER,
            invaderXim.title.CUIJATENDER_DESICCATOR,
            invaderXim.title.BRULO_EXTINGUISHER,
            invaderXim.title.PANTOKRATOR_DISPROVER,
            invaderXim.title.APADEMAK_ANNIHILATOR,
            invaderXim.title.ISGEBIND_DEFROSTER,
            invaderXim.title.RESHEPH_ERADICATOR,
            invaderXim.title.EMPOUSA_EXPURGATOR,
            invaderXim.title.INDRIK_IMMOLATOR,
            invaderXim.title.OGOPOGO_OVERTURNER,
            invaderXim.title.RAJA_REGICIDE,
            invaderXim.title.ALFARD_DETOXIFIER,
            invaderXim.title.AZDAJA_ABOLISHER,
            invaderXim.title.AMPHITRITE_SHUCKER,
            invaderXim.title.FUATH_PURIFIER,
            invaderXim.title.KILLAKRIQ_EXCORIATOR,
            invaderXim.title.MAERE_BESTIRRER,
            invaderXim.title.WYRM_GOD_DEFIER,
        },
    },
    {
        cost = 500,
        title =
        {
            invaderXim.title.TITLACAUAN_DISMEMBERER,
            invaderXim.title.SMOK_DEFOGGER,
            invaderXim.title.AMHULUK_INUNDATER,
            invaderXim.title.PULVERIZER_DISMANTLER,
            invaderXim.title.DURINN_DECEIVER,
            invaderXim.title.KARKADANN_EXOCULATOR,
            invaderXim.title.TEMENOS_EMANCIPATOR,
            invaderXim.title.APOLLYON_RAZER,
            invaderXim.title.UMAGRHK_MANEMANGLER,
        },
    },
    {
        cost = 600,
        title =
        {
            invaderXim.title.KARKINOS_CLAWCRUSHER,
            invaderXim.title.CARABOSSE_QUASHER,
            invaderXim.title.OVNI_OBLITERATOR,
            invaderXim.title.RUMINATOR_CONFOUNDER,
            invaderXim.title.FISTULE_DRAINER,
            invaderXim.title.TURUL_GROUNDER,
            invaderXim.title.BLOODEYE_BANISHER,
            invaderXim.title.SATIATOR_DEPRIVER,
            invaderXim.title.CHLORIS_UPROOTER,
            invaderXim.title.MYRMECOLEON_TAMER,
            invaderXim.title.GLAVOID_STAMPEDER,
            invaderXim.title.USURPER_DEPOSER,
            invaderXim.title.ULHUADSHI_DESICCATOR,
            invaderXim.title.ITZPAPALOTL_DECLAWER,
            invaderXim.title.SOBEK_MUMMIFIER,
            invaderXim.title.CIREIN_CROIN_HARPOONER,
            invaderXim.title.BUKHIS_TETHERER,
            invaderXim.title.SEDNA_TUSKBREAKER,
            invaderXim.title.CLEAVER_DISMANTLER,
            invaderXim.title.EXECUTIONER_DISMANTLER,
            invaderXim.title.SEVERER_DISMANTLER,
        },
    },
    {
        cost = 700,
        title =
        {
            invaderXim.title.HADHAYOSH_HALTERER,
            invaderXim.title.BRIAREUS_FELLER,
            invaderXim.title.ECCENTRICITY_EXPUNGER,
            invaderXim.title.KUKULKAN_DEFANGER,
            invaderXim.title.IRATHAM_CAPTURER,
            invaderXim.title.LACOVIE_CAPSIZER,
            invaderXim.title.LUSCA_DEBUNKER,
            invaderXim.title.TRISTITIA_DELIVERER,
            invaderXim.title.KETEA_BEACHER,
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
