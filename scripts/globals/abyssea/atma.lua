-----------------------------------
-- Abyssea Atma Global
-----------------------------------
require('scripts/globals/abyssea')
require('scripts/globals/utils')
-----------------------------------
xi = xi or {}
invaderXim.atma = invaderXim.atma or {}

invaderXim.atma.atmaMods =
{
    -- GROUP 1
    [invaderXim.ki.ATMA_OF_THE_LION]                   = { invaderXim.mod.TRIPLE_ATTACK, 7, invaderXim.mod.DMGPHYS, -1000, invaderXim.mod.THUNDERATT, 30 },
    [invaderXim.ki.ATMA_OF_THE_STOUT_ARM]              = { invaderXim.mod.STR, 40, invaderXim.mod.ATT, 50, invaderXim.mod.RATT, 40 },
    [invaderXim.ki.ATMA_OF_THE_TWIN_CLAW]              = { invaderXim.mod.DEF, 40, invaderXim.mod.MDEF, 20, invaderXim.mod.CHARMRES, 20 },
    [invaderXim.ki.ATMA_OF_ALLURE]                     = { invaderXim.mod.MPP, 30, invaderXim.mod.MND, 30, invaderXim.mod.ENMITY, -30 },
    [invaderXim.ki.ATMA_OF_ETERNITY]                   = { invaderXim.mod.CRITICAL_HIT_EVASION, -20, invaderXim.mod.SLOWRES, 30, invaderXim.mod.CURSERES, 30 },
    [invaderXim.ki.ATMA_OF_THE_HEAVENS]                = { invaderXim.mod.MACC, 30, invaderXim.mod.DMGPHYS, -1000, invaderXim.mod.PARALYZERES, 30 },
    [invaderXim.ki.ATMA_OF_THE_BAYING_MOON]            = { invaderXim.mod.ATT, 30, invaderXim.mod.MATT, 30 },
    [invaderXim.ki.ATMA_OF_THE_EBON_HOOF]              = { invaderXim.mod.HPP, 30, invaderXim.mod.SLEEPRES, 50 },
    [invaderXim.ki.ATMA_OF_TREMORS]                    = { invaderXim.mod.DMG, -2000, invaderXim.mod.SILENCERES, 40 },
    [invaderXim.ki.ATMA_OF_THE_SAVAGE_TIGER]           = { invaderXim.mod.AGI, 30, invaderXim.mod.DOUBLE_ATTACK, 10 },
    [invaderXim.ki.ATMA_OF_THE_VORACIOUS_VIOLET]       = { invaderXim.mod.STR, 50, invaderXim.mod.DOUBLE_ATTACK, 10, invaderXim.mod.REGAIN, 20 },
    [invaderXim.ki.ATMA_OF_CLOAK_AND_DAGGER]           = { invaderXim.mod.ACC, 40, invaderXim.mod.EVA, 40 },
    [invaderXim.ki.ATMA_OF_THE_STORMBIRD]              = { invaderXim.mod.ACC, 40, invaderXim.mod.THUNDERATT, 40, invaderXim.mod.REFRESH, 5 },
    [invaderXim.ki.ATMA_OF_THE_NOXIOUS_FANG]           = { invaderXim.mod.SUBTLE_BLOW, 40, invaderXim.mod.WATERATT, 40, invaderXim.mod.POISONRES, 40 },
    [invaderXim.ki.ATMA_OF_VICISSITUDE]                = { invaderXim.mod.DEF, 40, invaderXim.mod.MDEF, 20, invaderXim.mod.REGEN, 15 },
    [invaderXim.ki.ATMA_OF_THE_BEYOND]                 = { invaderXim.mod.MATT, 30, invaderXim.mod.ICEATT, 30, invaderXim.mod.LIGHTATT, 30 },
    [invaderXim.ki.ATMA_OF_STORMBREATH]                = { invaderXim.mod.VIT, 30, invaderXim.mod.DMGBREATH, -3000 },
    [invaderXim.ki.ATMA_OF_GALES]                      = { invaderXim.mod.WINDATT, 30, invaderXim.mod.WIND_MACC, 30 },
    [invaderXim.ki.ATMA_OF_THRASHING_TENDRILS]         = { invaderXim.mod.CHR, 30, invaderXim.mod.CRITHITRATE, 20 },
    [invaderXim.ki.ATMA_OF_THE_DRIFTER]                = { invaderXim.mod.RATT, 30, invaderXim.mod.RACC, 40 },
    [invaderXim.ki.ATMA_OF_THE_STRONGHOLD]             = { invaderXim.mod.ATT, 40, invaderXim.mod.DEF, 40, invaderXim.mod.REGEN, 15 },
    [invaderXim.ki.ATMA_OF_THE_HARVESTER]              = { invaderXim.mod.STR, 30, invaderXim.mod.DOUBLE_ATTACK, 10, invaderXim.mod.SLEEPRES, 40 },
    [invaderXim.ki.ATMA_OF_DUNES]                      = { invaderXim.mod.STORETP, 20, invaderXim.mod.SLOWRES, 40 },
    [invaderXim.ki.ATMA_OF_THE_COSMOS]                 = { invaderXim.mod.DARKATT, 40, invaderXim.mod.AMNESIARES, 40, invaderXim.mod.SILENCERES, 40 },
    [invaderXim.ki.ATMA_OF_THE_SIREN_SHADOW]           = { invaderXim.mod.ATT, 40, invaderXim.mod.EVA, 40, invaderXim.mod.PARALYZERES, 40 },
    [invaderXim.ki.ATMA_OF_THE_IMPALER]                = { invaderXim.mod.DOUBLE_ATTACK, 20, invaderXim.mod.BINDRES, 40, invaderXim.mod.BLINDRES, 40 },
    [invaderXim.ki.ATMA_OF_THE_ADAMANTINE]             = { invaderXim.mod.VIT, 20, invaderXim.mod.DEF, 40 },
    [invaderXim.ki.ATMA_OF_CALAMITY]                   = { invaderXim.mod.SLOWRES, 40, invaderXim.mod.BLINDRES, 40 },
    [invaderXim.ki.ATMA_OF_THE_CLAW]                   = { invaderXim.mod.EARTHATT, 30, invaderXim.mod.EARTH_MACC, 40 },
    [invaderXim.ki.ATMA_OF_BALEFUL_BONES]              = { invaderXim.mod.STR, 20, invaderXim.mod.DARK_MACC, 40 },
    [invaderXim.ki.ATMA_OF_THE_CLAWED_BUTTERFLY]       = { invaderXim.mod.FIRE_MACC, 40, invaderXim.mod.INT, 30 },
    [invaderXim.ki.ATMA_OF_THE_DESERT_WORM]            = { invaderXim.mod.MND, 20, invaderXim.mod.ACC, 40, invaderXim.mod.NULL_MAGICAL_DAMAGE, 5 },
    [invaderXim.ki.ATMA_OF_THE_UNDYING]                = { invaderXim.mod.MND, 40, invaderXim.mod.CONSERVE_MP, 10, invaderXim.mod.ICEATT, 20 },
    [invaderXim.ki.ATMA_OF_THE_IMPREGNABLE_TOWER]      = { invaderXim.mod.HPP, 30, invaderXim.mod.MACC, 40, invaderXim.mod.MATT, 40 },
    [invaderXim.ki.ATMA_OF_THE_SMOLDERING_SKY]         = { invaderXim.mod.ATT, 20, invaderXim.mod.MACC, 40, invaderXim.mod.FIREATT, 30 },
    [invaderXim.ki.ATMA_OF_THE_DEMONIC_SKEWER]         = { invaderXim.mod.STR, 20, invaderXim.mod.TP_BONUS, 20, invaderXim.mod.NULL_PHYSICAL_DAMAGE, 5, invaderXim.mod.NULL_RANGED_DAMAGE, 5 },
    [invaderXim.ki.ATMA_OF_THE_GOLDEN_CLAW]            = { invaderXim.mod.SKILLCHAINBONUS, 20, invaderXim.mod.STR, 20 },
    [invaderXim.ki.ATMA_OF_THE_GLUTINOUS_OOZE]         = { invaderXim.mod.MND, 20, invaderXim.mod.WATER_MACC, 20 },
    [invaderXim.ki.ATMA_OF_THE_LIGHTNING_BEAST]        = { invaderXim.mod.FASTCAST, 20, invaderXim.mod.SPELLINTERRUPT, 20 },
    [invaderXim.ki.ATMA_OF_THE_NOXIOUS_BLOOM]          = { invaderXim.mod.STORETP, 20, invaderXim.mod.WALTZ_POTENCY, 10 },
    [invaderXim.ki.ATMA_OF_THE_GNARLED_HORN]           = { invaderXim.mod.AGI, 50, invaderXim.mod.CRITHITRATE, 20, invaderXim.mod.COUNTER, 10 },
    [invaderXim.ki.ATMA_OF_THE_STRANGLING_WIND]        = { invaderXim.mod.STR, 20, invaderXim.mod.VIT, 20, invaderXim.mod.AGI, 30 },
    [invaderXim.ki.ATMA_OF_THE_DEEP_DEVOURER]          = { invaderXim.mod.SUBTLE_BLOW, 5, invaderXim.mod.STORETP, 5, invaderXim.mod.SONG_SPELLCASTING_TIME, 20 },
    [invaderXim.ki.ATMA_OF_THE_MOUNTED_CHAMPION]       = { invaderXim.mod.VIT, 50, invaderXim.mod.REGEN, 20, invaderXim.mod.ENMITY_LOSS_REDUCTION, -20 },
    [invaderXim.ki.ATMA_OF_THE_RAZED_RUINS]            = { invaderXim.mod.DEX, 50, invaderXim.mod.CRITHITRATE, 30, invaderXim.mod.CRIT_DMG_INCREASE, 30 },
    [invaderXim.ki.ATMA_OF_THE_BLUDGEONING_BRUTE]      = { invaderXim.mod.REGAIN, 10, invaderXim.mod.THUNDER_MEVA, 50, invaderXim.mod.WATER_MEVA, 50 },
    [invaderXim.ki.ATMA_OF_THE_RAPID_REPTILIAN]        = { invaderXim.mod.TRIPLE_ATTACK, 5, invaderXim.mod.DMGBREATH, -4000 },
    [invaderXim.ki.ATMA_OF_THE_WINGED_ENIGMA]          = { invaderXim.mod.HASTE_GEAR, 100 },
    [invaderXim.ki.ATMA_OF_THE_CRADLE]                 = { invaderXim.mod.VIT, 20, invaderXim.mod.DEX, 20 },
    [invaderXim.ki.ATMA_OF_THE_UNTOUCHED]              = { invaderXim.mod.CHR, 20, invaderXim.mod.TRIPLE_ATTACK, 5 },
    [invaderXim.ki.ATMA_OF_THE_SANGUINE_SCYTHE]        = { invaderXim.mod.HPP, 20, invaderXim.mod.CRIT_DMG_INCREASE, 30, invaderXim.mod.ENMITY, 20 },
    [invaderXim.ki.ATMA_OF_THE_TUSKED_TERROR]          = { invaderXim.mod.FASTCAST, 20, invaderXim.mod.WATERATT, 20, invaderXim.mod.WATER_MACC, 20 },
    [invaderXim.ki.ATMA_OF_THE_MINIKIN_MONSTROSITY]    = { invaderXim.mod.REFRESH, 10, invaderXim.mod.INT, 50, invaderXim.mod.ENMITY, -20 },
    [invaderXim.ki.ATMA_OF_THE_WOULD_BE_KING]          = { invaderXim.mod.REGAIN, 100, invaderXim.mod.STORETP, 20, invaderXim.mod.TP_BONUS, 20 },
    [invaderXim.ki.ATMA_OF_THE_BLINDING_HORN]          = { invaderXim.mod.CONSERVE_MP, 20, invaderXim.mod.THUNDERATT, 30, invaderXim.mod.DMGMAGIC, -2000 },
    [invaderXim.ki.ATMA_OF_THE_DEMONIC_LASH]           = { invaderXim.mod.ATT, 40, invaderXim.mod.DOUBLE_ATTACK, 10, invaderXim.mod.MAGIC_ABSORB, 20 },
    [invaderXim.ki.ATMA_OF_APPARITIONS]                = { invaderXim.mod.EVA, 20, invaderXim.mod.WIND_MEVA, 50 },
    [invaderXim.ki.ATMA_OF_THE_SHIMMERING_SHELL]       = { invaderXim.mod.AGI, 20, invaderXim.mod.FIRE_MEVA, 50 },
    [invaderXim.ki.ATMA_OF_THE_MURKY_MIASMA]           = { invaderXim.mod.DARK_MEVA, 50, invaderXim.mod.STUNRES, 30 },
    [invaderXim.ki.ATMA_OF_THE_AVARICIOUS_APE]         = { invaderXim.mod.HASTE_GEAR, 100 }, -- not implemented: Monster Correlation
    [invaderXim.ki.ATMA_OF_THE_MERCILESS_MATRIARCH]    = { invaderXim.mod.MACC, 50, invaderXim.mod.FASTCAST, 20, invaderXim.mod.ENMITY, -50 },
    [invaderXim.ki.ATMA_OF_THE_BROTHER_WOLF]           = { invaderXim.mod.MATT, 20, invaderXim.mod.MDEF, 20, invaderXim.mod.FIRE_MEVA, 100 },
    [invaderXim.ki.ATMA_OF_THE_EARTH_WYRM]             = { invaderXim.mod.EARTH_MEVA, 100, invaderXim.mod.DMG, -2000, invaderXim.mod.FORCE_EARTH_DWBONUS, 1 },
    [invaderXim.ki.ATMA_OF_THE_ASCENDING_ONE]          = { invaderXim.mod.WIND_MEVA, 100, invaderXim.mod.HASTE_GEAR, 500, invaderXim.mod.SNAPSHOT, 5 },
    [invaderXim.ki.ATMA_OF_THE_SCORPION_QUEEN]         = { invaderXim.mod.STORETP, 20, invaderXim.mod.CRITHITRATE, 30, invaderXim.mod.BINDRES, 50 },
    [invaderXim.ki.ATMA_OF_A_THOUSAND_NEEDLES]         = { invaderXim.mod.HPP, 20, invaderXim.mod.MPP, 20, invaderXim.mod.DEX, 10 },
    [invaderXim.ki.ATMA_OF_THE_BURNING_EFFIGY]         = { invaderXim.mod.STR, 20, invaderXim.mod.FORCE_FIRE_DWBONUS, 1 }, -- fire based ws + 0.2 fTP] = {},
    [invaderXim.ki.ATMA_OF_THE_SMITING_BLOW]           = { invaderXim.mod.TP_BONUS, 50, invaderXim.mod.WSACC, 50 },
    [invaderXim.ki.ATMA_OF_THE_LONE_WOLF]              = { invaderXim.mod.ATT, 20, invaderXim.mod.FIREATT, 30 },
    [invaderXim.ki.ATMA_OF_THE_CRIMSON_SCALE]          = { invaderXim.mod.HASTE_GEAR, 300, invaderXim.mod.ENMITY, -20 },
    [invaderXim.ki.ATMA_OF_THE_SCARLET_WING]           = { invaderXim.mod.ELEM, 10, invaderXim.mod.FORCE_WIND_DWBONUS, 1 },
    [invaderXim.ki.ATMA_OF_THE_RAISED_TAIL]            = { invaderXim.mod.ATT, 40, invaderXim.mod.EVA, 40 },
    [invaderXim.ki.ATMA_OF_THE_SAND_EMPEROR]           = { invaderXim.mod.ACC, 40, invaderXim.mod.EVA, 40 },
    [invaderXim.ki.ATMA_OF_THE_OMNIPOTENT]             = { invaderXim.mod.DEX, 50, invaderXim.mod.HASTE_GEAR, 1000, invaderXim.mod.ENMITY, 20 },
    [invaderXim.ki.ATMA_OF_THE_WAR_LION]               = { invaderXim.mod.DEX, 20, invaderXim.mod.THUNDER_MEVA, 100, invaderXim.mod.FORCE_LIGHTNING_DWBONUS, 1 },
    [invaderXim.ki.ATMA_OF_THE_FROZEN_FETTERS]         = { invaderXim.mod.INT, 20, invaderXim.mod.ICE_MEVA, 100, invaderXim.mod.FORCE_ICE_DWBONUS, 1 },
    [invaderXim.ki.ATMA_OF_THE_PLAGUEBRINGER]          = { invaderXim.mod.REGEN, 10, invaderXim.mod.STORETP, 20, invaderXim.mod.DOUBLE_ATTACK, 7 },
    [invaderXim.ki.ATMA_OF_THE_SHRIEKING_ONE]          = { invaderXim.mod.DEF, 60, invaderXim.mod.MDEF, 20, invaderXim.mod.STORETP, 20 },
    [invaderXim.ki.ATMA_OF_THE_HOLY_MOUNTAIN]          = { invaderXim.mod.LIGHT_MEVA, 100, invaderXim.mod.LIGHT_MACC, 50, invaderXim.mod.FORCE_LIGHT_DWBONUS, 1 },
    [invaderXim.ki.ATMA_OF_THE_LAKE_LURKER]            = { invaderXim.mod.MND, 20, invaderXim.mod.WATER_MEVA, 100, invaderXim.mod.FORCE_WATER_DWBONUS, 1 },
    [invaderXim.ki.ATMA_OF_THE_CRUSHING_CUDGEL]        = { invaderXim.mod.ACC, 20, invaderXim.mod.SKILLCHAINDMG, 500 },
    [invaderXim.ki.ATMA_OF_PURGATORY]                  = { invaderXim.mod.VIT, 40, invaderXim.mod.INT, 40 },
    [invaderXim.ki.ATMA_OF_BLIGHTED_BREATH]            = { invaderXim.mod.SONG_SPELLCASTING_TIME, 40, invaderXim.mod.LIGHT_MACC, 40 },
    [invaderXim.ki.ATMA_OF_THE_PERSISTENT_PREDATOR]    = { invaderXim.mod.STORETP, 40, invaderXim.mod.TP_BONUS, 10 },
    [invaderXim.ki.ATMA_OF_THE_STONE_GOD]              = { invaderXim.mod.SUBTLE_BLOW, 40, invaderXim.mod.ENMITY, 40 },
    [invaderXim.ki.ATMA_OF_THE_SUN_EATER]              = { invaderXim.mod.STORETP, 40, invaderXim.mod.TP_BONUS, 40 },
    [invaderXim.ki.ATMA_OF_THE_DESPOT]                 = { invaderXim.mod.CHR, 50, invaderXim.mod.MAGIC_ABSORB, 15, invaderXim.mod.TP_BONUS, 40 },
    [invaderXim.ki.ATMA_OF_THE_SOLITARY_ONE]           = { invaderXim.mod.TRIPLE_ATTACK, 7, invaderXim.mod.DMGBREATH, -2500, invaderXim.mod.ZANSHIN, 10 },
    [invaderXim.ki.ATMA_OF_THE_WINGED_GLOOM]           = { invaderXim.mod.DMG, -2500, invaderXim.mod.REGEN, 2 },
    [invaderXim.ki.ATMA_OF_THE_SEA_DAUGHTER]           = { invaderXim.mod.REGAIN, 50, invaderXim.mod.HASTE_GEAR, -1500, invaderXim.mod.REGEN, 30 },
    [invaderXim.ki.ATMA_OF_THE_HATEFUL_STREAM]         = { }, -- Not yet implemented. No easy way to do this ATMA. No way I am doing bit work in onTick for it..
    [invaderXim.ki.ATMA_OF_THE_FOE_FLAYER]             = { invaderXim.mod.MPP, 20, invaderXim.mod.REFRESH, 20, invaderXim.mod.FASTCAST, 20, invaderXim.mod.MACC, 50 },
    [invaderXim.ki.ATMA_OF_THE_ENDLESS_NIGHTMARE]      = { invaderXim.mod.MND, 20, invaderXim.mod.DARK_MEVA, 100, invaderXim.mod.FORCE_DARK_DWBONUS, 1 },
    [invaderXim.ki.ATMA_OF_THE_SUNDERING_SLASH]        = { invaderXim.mod.ATT, 20, invaderXim.mod.REGAIN, 30 },
    [invaderXim.ki.ATMA_OF_ENTWINED_SERPENTS]          = { invaderXim.mod.ATT, 20, invaderXim.mod.DOUBLE_ATTACK, 15 },
    [invaderXim.ki.ATMA_OF_THE_HORNED_BEAST]           = { invaderXim.mod.ACC, 60, invaderXim.mod.PETRIFYRES, 50 },
    [invaderXim.ki.ATMA_OF_AQUATIC_ARDOR]              = { invaderXim.mod.ABSORB_DMG_CHANCE, 6, invaderXim.mod.MAGIC_ABSORB, 6 },
    [invaderXim.ki.ATMA_OF_THE_FALLEN_ONE]             = { invaderXim.mod.INT, 30, invaderXim.mod.MND, 30 },
    [invaderXim.ki.ATMA_OF_FIRES_AND_FLARES]           = { invaderXim.mod.AGI, 20, invaderXim.mod.RATT, 40 },
    [invaderXim.ki.ATMA_OF_THE_APOCALYPSE]             = { invaderXim.mod.TRIPLE_ATTACK, 15, invaderXim.mod.RERAISE_III, 1, invaderXim.mod.QUICK_MAGIC, 10 },

    -- GROUP 2
    [invaderXim.ki.ATMA_OF_THE_HEIR]                   = { invaderXim.mod.MPP, 5, invaderXim.mod.REGAIN, 5, invaderXim.mod.LIGHT_MACC, 20 },
    [invaderXim.ki.ATMA_OF_THE_HERO]                   = { invaderXim.mod.STR, 10, invaderXim.mod.CRIT_DMG_INCREASE, 15, invaderXim.mod.REGEN, 5 },
    [invaderXim.ki.ATMA_OF_THE_FULL_MOON]              = { invaderXim.mod.INT, 10, invaderXim.mod.MATT, 10, invaderXim.mod.REFRESH, 5 },
    [invaderXim.ki.ATMA_OF_ILLUSIONS]                  = { invaderXim.mod.MND, 10, invaderXim.mod.MAGIC_BURST_BONUS_CAPPED, 10, invaderXim.mod.DAY_NUKE_BONUS, 10 },
    [invaderXim.ki.ATMA_OF_THE_BANISHER]               = { },
    [invaderXim.ki.ATMA_OF_THE_SELLSWORD]              = { },
    [invaderXim.ki.ATMA_OF_A_FUTURE_FABULOUS]          = { },
    [invaderXim.ki.ATMA_OF_CAMARADERIE]                = { },
    [invaderXim.ki.ATMA_OF_THE_TRUTHSEEKER]            = { },
    [invaderXim.ki.ATMA_OF_THE_AZURE_SKY]              = { },
    [invaderXim.ki.ATMA_OF_ECHOES]                     = { },
    [invaderXim.ki.ATMA_OF_DREAD]                      = { },
    [invaderXim.ki.ATMA_OF_AMBITION]                   = { }, -- Note: Speed modifier is the same as positive gear. Meaning, it doesnt stack.
    [invaderXim.ki.ATMA_OF_THE_BEAST_KING]             = { },
    [invaderXim.ki.ATMA_OF_THE_KIRIN]                  = { },
    [invaderXim.ki.ATMA_OF_HELLS_GUARDIAN]             = { },
    [invaderXim.ki.ATMA_OF_LUMINOUS_WINGS]             = { },
    [invaderXim.ki.ATMA_OF_THE_DRAGON_RIDER]           = { },
    [invaderXim.ki.ATMA_OF_THE_IMPENETRABLE]           = { },
    [invaderXim.ki.ATMA_OF_ALPHA_AND_OMEGA]            = { },
    [invaderXim.ki.ATMA_OF_THE_ULTIMATE]               = { },
    [invaderXim.ki.ATMA_OF_THE_HYBRID_BEAST]           = { },
    [invaderXim.ki.ATMA_OF_THE_DARK_DEPTHS]            = { },
    [invaderXim.ki.ATMA_OF_THE_ZENITH]                 = { },
    [invaderXim.ki.ATMA_OF_PERFECT_ATTENDANCE]         = { },
    [invaderXim.ki.ATMA_OF_THE_RESCUER]                = { },
    [invaderXim.ki.ATMA_OF_NIGHTMARES]                 = { },
    [invaderXim.ki.ATMA_OF_THE_EINHERJAR]              = { },
    [invaderXim.ki.ATMA_OF_THE_ILLUMINATOR]            = { },
    [invaderXim.ki.ATMA_OF_THE_BUSHIN]                 = { },
    [invaderXim.ki.ATMA_OF_THE_ACE_ANGLER]             = { },
    [invaderXim.ki.ATMA_OF_THE_MASTER_CRAFTER]         = { }, -- Note: Speed modifier is the same as positive gear. Meaning, it doesnt stack
    [invaderXim.ki.ATMA_OF_INGENUITY]                  = { },
    [invaderXim.ki.ATMA_OF_THE_GRIFFONS_CLAW]          = { },
    [invaderXim.ki.ATMA_OF_THE_FETCHING_FOOTPAD]       = { },
    [invaderXim.ki.ATMA_OF_UNDYING_LOYALTY]            = { },
    [invaderXim.ki.ATMA_OF_THE_ROYAL_LINEAGE]          = { },
    [invaderXim.ki.ATMA_OF_THE_SHATTERING_STAR]        = { },
    [invaderXim.ki.ATMA_OF_THE_COBRA_COMMANDER]        = { },
    [invaderXim.ki.ATMA_OF_ROARING_LAUGHTER]           = { },
    [invaderXim.ki.ATMA_OF_THE_DARK_BLADE]             = { },
    [invaderXim.ki.ATMA_OF_THE_DUCAL_GUARD]            = { },
    [invaderXim.ki.ATMA_OF_HARMONY]                    = { },
    [invaderXim.ki.ATMA_OF_REVELATIONS]                = { },
    [invaderXim.ki.ATMA_OF_THE_SAVIOR]                 = { },
}

local atmaPrice = 100

local function getSortedKeysFromArray(array, isReverse)
    local keys = {}

    for key, v in pairs(array) do
        table.insert(keys, key)
    end

    if isReverse then
        table.sort(keys, function(a, b)
            return a > b
        end)
    else
        table.sort(keys)
    end

    return keys
end

local function getIdByKeyItemId(keyitemId)
    local keys = getSortedKeysFromArray(invaderXim.atma.atmaMods, false)
    for index, v in ipairs(keys) do
        if keyitemId == v then
            return index
        end
    end

    return nil
end

-- Group 1 Atma consists of 4 parameter values, followed by 2 parameter values for
-- Group 2.  Calculate these separately just in case there's future additions or changes.
-- There is minimal impact to efficiency, as we only iterate over each individual
-- key item once.  Depending on opinion, this could easily be combined into one loop
-- in the future; however, we would need to check for the offset to modify parameter
-- number in the array.  See: onTrigger function for handling in a single loop
local function getAtmaMask(player)
    local atmaMask = { 0, 0, 0, 0, 0, 0 }
    local atmaCount = invaderXim.ki.ATMA_OF_THE_APOCALYPSE - invaderXim.ki.ATMA_OF_THE_LION
    local atmaBase = invaderXim.ki.ATMA_OF_THE_LION - 1
    for i = 1, atmaCount + 1 do
        if player:hasKeyItem(atmaBase + i) then
            local parameterNum = math.floor((i + 32) / 32)
            local atmaOffset = bit.lshift(1, (i - 1) % 32)

            atmaMask[parameterNum] = atmaMask[parameterNum] + atmaOffset
        end
    end

    atmaCount = invaderXim.ki.ATMA_OF_THE_SAVIOR - invaderXim.ki.ATMA_OF_THE_HEIR
    atmaBase = invaderXim.ki.ATMA_OF_THE_HEIR - 1
    for i = 1, atmaCount + 1 do
        if player:hasKeyItem(atmaBase + i) then
            local parameterNum = math.floor((i + 32) / 32) + 4
            local atmaOffset = bit.lshift(1, (i - 1) % 32)

            atmaMask[parameterNum] = atmaMask[parameterNum] + atmaOffset
        end
    end

    return atmaMask
end

local function getFreeAtmaSlot(player)
    local lunarAbyssiteCount = invaderXim.abyssea.getAbyssiteTotal(player, invaderXim.abyssea.abyssiteType.LUNAR)

    for atmaSlot = 1, lunarAbyssiteCount do
        if not player:hasStatusEffect(invaderXim.effect.ATMA, atmaSlot) then
            return atmaSlot
        end
    end

    return 0
end

local function hasDuplicateAtmaEffect(player, atmaValue)
    for atmaSlot = 1, 3 do
        local atmaEffect = player:getStatusEffect(invaderXim.effect.ATMA, atmaSlot)

        if atmaEffect and atmaEffect:getPower() == atmaValue then
            return true
        end
    end

    return false
end

local function getAtmasFromMask(mask)
    local atmas =
    {
        bit.band(mask, 0xFF),
        bit.band(bit.rshift(mask, 8), 0xFF),
        bit.band(bit.rshift(mask, 16), 0xFF),
        bit.band(bit.rshift(mask, 24), 0xFF),
    }
    return atmas
end

local function updateReinfusedMask(player, atmaSlot, atmaValue)
    local baseMask = player:getCharVar('ABYSSEA_LAST_ATMA_INFUSED')
    local atmas = getAtmasFromMask(baseMask)
    local newMask = 0
    atmas[atmaSlot] = getIdByKeyItemId(atmaValue)

    if atmaSlot == 1 then
        atmas[2] = 0
        atmas[3] = 0
    end

    for key = 3, 1, -1 do
        newMask = bit.lshift(newMask, 8)

        local value = atmas[key]
        if value ~= 0 then
            newMask = newMask + value
        end
    end

    player:setCharVar('ABYSSEA_LAST_ATMA_INFUSED', newMask)
end

local function getHistoryAtmaArray(player)
    local atmaHistory = {}
    local atmasSaved =
    {
        [1] = getAtmasFromMask(player:getCharVar('ABYSSEA_HISTORY_ATMA1')),
        [2] = getAtmasFromMask(player:getCharVar('ABYSSEA_HISTORY_ATMA2')),
        [3] = getAtmasFromMask(player:getCharVar('ABYSSEA_HISTORY_ATMA3'))
    }
    for i = 1, 3 do
        for _, value in pairs(atmasSaved[i]) do
            table.insert(atmaHistory, value)
        end
    end

    return atmaHistory
end

local function updateHistoryMask(player, atmaValue)
    local currentAtma = getIdByKeyItemId(atmaValue)
    local atmaSaved = getHistoryAtmaArray(player)
    local histo =
    {
        currentAtma
    }

    for i = 1, 3 do
        for _, value in ipairs(atmaSaved) do
            if value ~= currentAtma then
                table.insert(histo, value)
            end
        end
    end

    local index = 1

    for i = 1, 9, 4 do
        local maskAtma = 0
        for j = 3, 0, -1 do
            local indexHisto = i + j
            maskAtma = bit.lshift(maskAtma, 8)
            maskAtma = maskAtma + histo[indexHisto]
        end

        player:setCharVar('ABYSSEA_HISTORY_ATMA'..index, maskAtma)
        index = index + 1
    end
end

local function getLunarAbyssiteMask(player)
    local lunarAbyssiteMask = 0
    local freeSlot = getFreeAtmaSlot(player)

    if freeSlot == 0 then
        return lunarAbyssiteMask
    end

    local lunarAbyssiteArray =
    {
        invaderXim.ki.LUNAR_ABYSSITE1,
        invaderXim.ki.LUNAR_ABYSSITE2,
        invaderXim.ki.LUNAR_ABYSSITE3
    }

    for _, abyssite in ipairs(lunarAbyssiteArray) do
        if player:hasKeyItem(abyssite) then
            lunarAbyssiteMask = bit.lshift(lunarAbyssiteMask, 1) + 1
        end
    end

    return lunarAbyssiteMask
end

local function delAtma(player, slot)
    if player:hasStatusEffect(invaderXim.effect.ATMA, slot) then
        player:delStatusEffect(invaderXim.effect.ATMA, slot)
    end
end

local function delAllAtma(player)
    for atmaSlot = 3, 1, -1 do
        delAtma(player, atmaSlot)
    end
end

local function addAtma(player, selectedAtma)
    local keys = getSortedKeysFromArray(invaderXim.atma.atmaMods, false)
    local atmaValue = keys[selectedAtma]
    local availableAtmaSlot = getFreeAtmaSlot(player)
    if
        availableAtmaSlot > 0 and
        not hasDuplicateAtmaEffect(player, atmaValue)
    then
        player:addStatusEffectEx(invaderXim.effect.ATMA, invaderXim.effect.ATMA, atmaValue, 0, 0, availableAtmaSlot)

        local atmaEffect = player:getStatusEffect(invaderXim.effect.ATMA, availableAtmaSlot)
        atmaEffect:addEffectFlag(invaderXim.effectFlag.ON_ZONE)
        atmaEffect:addEffectFlag(invaderXim.effectFlag.INFLUENCE)
        updateReinfusedMask(player, availableAtmaSlot, atmaValue)
        updateHistoryMask(player, atmaValue)
        player:delCurrency('cruor', atmaPrice)
    end
end

invaderXim.atma.onEffectGain = function(target, effect)
    local atma = effect:getPower()
    local mods = invaderXim.atma.atmaMods[atma]
    if mods ~= nil then
        for i = 1, #mods, 2 do
            target:addMod(mods[i], mods[i + 1])
        end
    end
end

invaderXim.atma.onEffectTick = function(target, effect)
    if not invaderXim.abyssea.isInAbysseaZone(target) then
        target:delStatusEffect(effect)
    end
end

invaderXim.atma.onEffectLose = function(target, effect)
    local atma = effect:getPower()
    local mods = invaderXim.atma.atmaMods[atma]

    if mods ~= nil then
        for i = 1, #mods, 2 do
            target:delMod(mods[i], mods[i + 1])
        end
    end
end

invaderXim.atma.onTrigger = function(player, npc)
    local atmaMask   = getAtmaMask(player)
    local activeAtmaMask = getLunarAbyssiteMask(player)
    local playerCruor = player:getCurrency('cruor')

    for atmaSlot = 3, 1, -1 do
        activeAtmaMask = bit.lshift(activeAtmaMask, 8)
        if player:hasStatusEffect(invaderXim.effect.ATMA, atmaSlot) then

            local keyItemId = player:getStatusEffect(invaderXim.effect.ATMA, atmaSlot):getPower()
            local keyItemIndex = getIdByKeyItemId(keyItemId)

            activeAtmaMask = activeAtmaMask + keyItemIndex
        end
    end

    player:startEvent(2003, playerCruor, activeAtmaMask, atmaMask[1], atmaMask[2], atmaMask[3], atmaMask[4], atmaMask[5], atmaMask[6])
end

invaderXim.atma.onEventUpdate = function(player, csid, option, npc)
    local reinfuseAtma = 0
    local histo =
    {
        [1] = player:getCharVar('ABYSSEA_HISTORY_ATMA1'),
        [2] = player:getCharVar('ABYSSEA_HISTORY_ATMA2'),
        [3] = player:getCharVar('ABYSSEA_HISTORY_ATMA3')
    }

    if
        player:getCharVar('ABYSSEA_LAST_ATMA_INFUSED') ~= 0 and
        not player:hasStatusEffect(invaderXim.effect.ATMA)
    then
        reinfuseAtma = player:getCharVar('ABYSSEA_LAST_ATMA_INFUSED')
    end

    player:updateEvent(reinfuseAtma, histo[1], histo[2], histo[3], 0, 0, 0, 0)
end

invaderXim.atma.onEventFinish = function(player, csid, option, npc)
    local ID = zones[player:getZoneID()]

    local optionSelected = bit.band(option, 0xF)
    if
        optionSelected == 1
    then -- Infuse Atma
        local atma = bit.band(bit.rshift(option, 16), 0xFFFF)
        local orderKeyItem = getSortedKeysFromArray(invaderXim.atma.atmaMods, false)
        player:messageSpecial(ID.text.ATMA_INFUSED, atmaPrice, orderKeyItem[atma])
        addAtma(player, atma)
    elseif optionSelected == 2 then -- Purge atma
        local slot = bit.band(bit.rshift(option, 16), 0xFF)
        if slot == 4 then -- Purge all atma
            player:messageSpecial(ID.text.ALL_ATMA_PURGED)
            delAllAtma(player)
        else
            local effectPower = player:getStatusEffect(invaderXim.effect.ATMA, slot):getPower()
            player:messageSpecial(ID.text.ATMA_PURGED, effectPower)
            delAtma(player, slot)
        end
    elseif
        optionSelected == 3 and
        player:getCharVar('ABYSSEA_LAST_ATMA_INFUSED')
    then -- Reinfuse Atma
        local atmaReinfused = getAtmasFromMask(player:getCharVar('ABYSSEA_LAST_ATMA_INFUSED'))
        local numAtma = 0
        for i = 1, 3 do
            if atmaReinfused[i] ~= 0 then
                addAtma(player, atmaReinfused[i])
                numAtma = numAtma + 1
            end
        end

        player:messageSpecial(ID.text.PREVIOUS_ATMA_INFUSED, atmaPrice * numAtma)
    elseif
        optionSelected == 5
    then -- infuse history
        delAllAtma(player)
        local mask = bit.rshift(option, 17)
        local indexPos = { }
        for i = 1, 12 do
            local submask = bit.band(mask, 0x1)
            if submask == 1 then
                table.insert(indexPos, i)
            end

            mask = bit.rshift(mask, 1)
        end

        local histo = getHistoryAtmaArray(player)

        for _, index in ipairs(indexPos) do
            addAtma(player, histo[index])
        end

        player:messageSpecial(ID.text.HISTORY_ATMA_INFUSED, atmaPrice * #histo)
    end
end
