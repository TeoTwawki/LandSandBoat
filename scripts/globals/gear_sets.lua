-----------------------------------
-- Gear sets
-- Allows the use of gear sets with modifiers
-----------------------------------
xi = xi or {}
invaderXim.gear_sets = invaderXim.gear_sets or {}

-- Table Notes:
-- minEquipped and maxEquipped are optional parameters.  If not set, minEquipped will be set to
-- a value of 2, and maxEquipped will be set to 0 (not limited).  Mod parameters are the total value
-- of currently equipped pieces from minEquipped..N (Where N is maxEquipped or the maximum number)
-- of matches defined within the items table.

local gearSets =
{
    [1] = -- Usukane's set (5% Haste)
    {
        items =
        {
            invaderXim.item.USUKANE_SOMEN,
            invaderXim.item.USUKANE_HARAMAKI,
            invaderXim.item.USUKANE_GOTE,
            invaderXim.item.USUKANE_HIZAYOROI,
            invaderXim.item.USUKANE_SUNE_ATE,
        },
        minEquipped = 5,
        mods =
        {
            { invaderXim.mod.HASTE_GEAR, 500 },
        },
    },

    [2] = -- Skadi's set (5% critrate is guess)
    {
        items =
        {
            invaderXim.item.SKADIS_VISOR,
            invaderXim.item.SKADIS_CUIRIE,
            invaderXim.item.SKADIS_BAZUBANDS,
            invaderXim.item.SKADIS_CHAUSSES,
            invaderXim.item.SKADIS_JAMBEAUX,
        },
        minEquipped = 5,
        mods =
        {
            { invaderXim.mod.CRITHITRATE, 5 },
        },
    },

    [3] = -- Ares's set (5% DA)
    {
        items =
        {
            invaderXim.item.ARES_MASK,
            invaderXim.item.ARES_CUIRASS,
            invaderXim.item.ARES_GAUNTLETS,
            invaderXim.item.ARES_FLANCHARD,
            invaderXim.item.ARES_SOLLERETS,
        },
        minEquipped = 5,
        mods =
        {
            { invaderXim.mod.DOUBLE_ATTACK, 5 },
        },
    },

    [4] = -- Denali Jacket Set (Increases Accuracy +20)
    {
        items =
        {
            invaderXim.item.DENALI_BONNET,
            invaderXim.item.DENALI_JACKET,
            invaderXim.item.DENALI_WRISTBANDS,
            invaderXim.item.DENALI_KECKS,
            invaderXim.item.DENALI_GAMASHES,
        },
        minEquipped = 5,
        mods =
        {
            { invaderXim.mod.ACC, 20 },
        },
    },

    [5] = -- Askar Korazin Set (Max HP Boost %10)
    {
        items =
        {
            invaderXim.item.ASKAR_ZUCCHETTO,
            invaderXim.item.ASKAR_KORAZIN,
            invaderXim.item.ASKAR_MANOPOLAS,
            invaderXim.item.ASKAR_DIRS,
            invaderXim.item.ASKAR_GAMBIERAS,
        },
        minEquipped = 5,
        mods =
        {
            { invaderXim.mod.HPP, 10 },
        },
    },

    [6] = -- Pahluwan Khazagand Set (Needs Verification)
    {
        items =
        {
            invaderXim.item.PAHLUWAN_QALANSUWA,
            invaderXim.item.PAHLUWAN_KHAZAGAND,
            invaderXim.item.PAHLUWAN_DASTANAS,
            invaderXim.item.PAHLUWAN_SERAWEELS,
            invaderXim.item.PAHLUWAN_CRACKOWS,
        },
        minEquipped = 5,
        mods =
        {
            { invaderXim.mod.SUBTLE_BLOW, 8 },
        },
    },

    [7] = -- Morrigan's Robe Set (+5 Magic. Atk Bonus)
    {
        items =
        {
            invaderXim.item.MORRIGANS_CORONAL,
            invaderXim.item.MORRIGANS_ROBE,
            invaderXim.item.MORRIGANS_CUFFS,
            invaderXim.item.MORRIGANS_SLOPS,
            invaderXim.item.MORRIGANS_PIGACHES,
        },
        minEquipped = 5,
        mods =
        {
            { invaderXim.mod.MATT, 5 },
        },
    },

    [8] = -- Marduk's Jubbah Set (5% fastcast)
    {
        items =
        {
            invaderXim.item.MARDUKS_TIARA,
            invaderXim.item.MARDUKS_JUBBAH,
            invaderXim.item.MARDUKS_DASTANAS,
            invaderXim.item.MARDUKS_SHALWAR,
            invaderXim.item.MARDUKS_CRACKOWS,
        },
        minEquipped = 5,
        mods =
        {
            { invaderXim.mod.FASTCAST, 5 },
        },
    },

    [9] = -- Goliard Saio Set - Total Set Bonus +10% Magic Def. Bonus
    {
        items =
        {
            invaderXim.item.GOLIARD_CHAPEAU,
            invaderXim.item.GOLIARD_SAIO,
            invaderXim.item.GOLIARD_CUFFS,
            invaderXim.item.GOLIARD_TREWS,
            invaderXim.item.GOLIARD_CLOGS,
        },
        minEquipped = 5,
        mods =
        {
            { invaderXim.mod.MDEF, 10 },
        },
    },

    [10] = -- Yigit Gomlek Set (1mp per tick) Adds "Refresh" effect
    {
        items =
        {
            invaderXim.item.YIGIT_TURBAN,
            invaderXim.item.YIGIT_GOMLEK,
            invaderXim.item.YIGIT_GAGES,
            invaderXim.item.YIGIT_SERAWEELS,
            invaderXim.item.YIGIT_CRACKOWS,
        },
        minEquipped = 5,
        mods =
        {
            { invaderXim.mod.REFRESH, 1 },
        },
    },

    [11] = -- Perle Hauberk Set (Haste +5%)
    {
        items =
        {
            invaderXim.item.PERLE_SALADE,
            invaderXim.item.PERLE_HAUBERK,
            invaderXim.item.PERLE_MOUFLES,
            invaderXim.item.PERLE_BRAYETTES,
            invaderXim.item.PERLE_SOLLERETS,
        },
        minEquipped = 5,
        mods =
        {
            { invaderXim.mod.HASTE_GEAR, 500 },
        },
    },

    [12] = -- Aurore Doublet Set (Store TP +8)
    {
        items =
        {
            invaderXim.item.AURORE_BERET,
            invaderXim.item.AURORE_DOUBLET,
            invaderXim.item.AURORE_GLOVES,
            invaderXim.item.AURORE_BRAIS,
            invaderXim.item.AURORE_GAITERS,
        },
        minEquipped = 5,
        mods =
        {
            { invaderXim.mod.STORETP, 8 }
        },
    },

    [13] = -- Teal Set: Fast Cast +4-10%
    {
        items =
        {
            invaderXim.item.TEAL_CHAPEAU,
            invaderXim.item.TEAL_SAIO,
            invaderXim.item.TEAL_CUFFS,
            invaderXim.item.TEAL_SLOPS,
            invaderXim.item.TEAL_PIGACHES,
        },
        minEquipped = 2,
        mods =
        {
            { invaderXim.mod.FASTCAST, 4, 6, 8, 10 },
        },
    },

    [14] = -- Calma Armor Set haste%6
    {
        items =
        {
            invaderXim.item.CALMA_ARMET,
            invaderXim.item.CALMA_BREASTPLATE,
            invaderXim.item.CALMA_GAUNTLETS,
            invaderXim.item.CALMA_HOSE,
            invaderXim.item.CALMA_LEGGINGS,
        },
        minEquipped = 5,
        mods =
        {
            { invaderXim.mod.HASTE_GEAR, 600 },
        },
    },

    [15] = -- Magavan Armor Set  magic accuracy +5
    {
        items =
        {
            invaderXim.item.MAGAVAN_BERET,
            invaderXim.item.MAGAVAN_FROCK,
            invaderXim.item.MAGAVAN_MITTS,
            invaderXim.item.MAGAVAN_SLOPS,
            invaderXim.item.MAGAVAN_CLOGS,
        },
        minEquipped = 5,
        mods =
        {
            { invaderXim.mod.MACC, 5 },
        },
    },

    [16] = -- Mustela Harness Set  crit rate 5%
    {
        items =
        {
            invaderXim.item.MUSTELA_MASK,
            invaderXim.item.MUSTELA_HARNESS,
            invaderXim.item.MUSTELA_GLOVES,
            invaderXim.item.MUSTELA_BRAIS,
            invaderXim.item.MUSTELA_BOOTS,
        },
        minEquipped = 5,
        mods =
        {
            { invaderXim.mod.CRITHITRATE, 5 },
        },
    },

    [17] = -- Bowman's set: Ranged atk +15
    {
        items =
        {
            invaderXim.item.BOWMANS_MASK,
            invaderXim.item.BOWMANS_LEDELSENS,
        },
        minEquipped = 2,
        mods =
        {
            { invaderXim.mod.RATT, 15 },
        },
    },

    [18] = -- Fourth Division Brune Set
    {
        items =
        {
            invaderXim.item.FOURTH_DIVISION_HAUBE,
            invaderXim.item.FOURTH_DIVISION_BRUNNE,
            invaderXim.item.FOURTH_DIVISION_HENTZES,
            invaderXim.item.FOURTH_DIVISION_SCHOSS,
            invaderXim.item.FOURTH_DIVISION_SCHUHS,
        },
        minEquipped = 2,
        mods =
        {
            { invaderXim.mod.ATT, 1, 5, 10, 15 },
        },
    },

    [19] = -- Cobra Unit Harness Set (Needs Verification)
    {
        items =
        {
            invaderXim.item.COBRA_UNIT_CAP,
            invaderXim.item.COBRA_UNIT_HARNESS,
            invaderXim.item.COBRA_UNIT_MITTENS,
            invaderXim.item.COBRA_UNIT_SUBLIGAR,
            invaderXim.item.COBRA_UNIT_LEGGINGS,
        },
        minEquipped = 2,
        mods =
        {
            { invaderXim.mod.COUNTER, 1, 2, 3, 4 },
        },
    },

    [20] = -- Cobra Unit Robe Set (Needs Verification)
    {
        items =
        {
            invaderXim.item.COBRA_UNIT_CLOCHE,
            invaderXim.item.COBRA_UNIT_ROBE,
            invaderXim.item.COBRA_UNIT_GLOVES,
            invaderXim.item.COBRA_UNIT_TREWS,
            invaderXim.item.COBRA_UNIT_CRACKOWS,
        },
        minEquipped = 2,
        mods =
        {
            { invaderXim.mod.MACC, 1, 2, 3, 4 },
        },
    },

    [21] = -- Iron Ram Chainmail Set.
    {
        items =
        {
            invaderXim.item.IRON_RAM_HELM,
            invaderXim.item.IRON_RAM_CHAINMAIL,
            invaderXim.item.IRON_RAM_MUFFLERS,
            invaderXim.item.IRON_RAM_BREECHES,
            invaderXim.item.IRON_RAM_SOLLERETS,
        },
        minEquipped = 2,
        mods =
        {
            { invaderXim.mod.ACC, 1, 2, 3, 4 },
            { invaderXim.mod.ATT, 1, 2, 3, 4 },
        },
    },

    [22] = -- Fourth Division Cuirass Set
    {
        items =
        {
            invaderXim.item.FOURTH_DIVISION_ARMET,
            invaderXim.item.FOURTH_DIVISION_CUIRASS,
            invaderXim.item.FOURTH_DIVISION_GAUNTLETS,
            invaderXim.item.FOURTH_DIVISION_CUISSES,
            invaderXim.item.FOURTH_DIVISION_SABATONS,
        },
        minEquipped = 2,
        mods =
        {
            { invaderXim.mod.HP, 10, 20, 30, 40 },
        },
    },

    [23] = -- Cobra Unit Coat Set
    {
        items =
        {
            invaderXim.item.COBRA_UNIT_HAT,
            invaderXim.item.COBRA_UNIT_COAT,
            invaderXim.item.COBRA_UNIT_CUFFS,
            invaderXim.item.COBRA_UNIT_SLOPS,
            invaderXim.item.COBRA_UNIT_PIGACHES,
        },
        minEquipped = 2,
        mods =
        {
            { invaderXim.mod.MP, 10, 20, 30, 40 },
        },
    },

    [24] = -- Amir Korazin Set
    {
        items =
        {
            invaderXim.item.AMIR_PUGGAREE,
            invaderXim.item.AMIR_KORAZIN,
            invaderXim.item.AMIR_KOLLUKS,
            invaderXim.item.AMIR_DIRS,
            invaderXim.item.AMIR_BOOTS,
        },
        minEquipped = 5,
        mods =
        {
            { invaderXim.mod.UDMGBREATH, -800 },
            { invaderXim.mod.UDMGMAGIC,  -800 },
        },
    },

    [25] = -- Hachiryu Haramaki Set - Store TP
    {
        items =
        {
            invaderXim.item.HACHIRYU_HARAMAKI,
            invaderXim.item.HACHIRYU_KOTE,
            invaderXim.item.HACHIRYU_HAIDATE,
            invaderXim.item.HACHIRYU_SUNE_ATE,
        },
        minEquipped = 2,
        mods =
        {
            { invaderXim.mod.STORETP, 5, 10, 20 },
        },
    },

    [26] = -- Ravager's Armor +2 Set - Double attack double damage chance
    {
        items =
        {
            invaderXim.item.RAVAGERS_MASK_P2,
            invaderXim.item.RAVAGERS_LORICA_P2,
            invaderXim.item.RAVAGERS_MUFFLERS_P2,
            invaderXim.item.RAVAGERS_CUISSES_P2,
            invaderXim.item.RAVAGERS_CALLIGAE_P2,
        },
        minEquipped = 2,
        mods =
        {
            { invaderXim.mod.DA_DOUBLE_DMG_RATE, 2, 3, 4, 5 },
        },
    },

    [27] = -- Fazheluo Mail Set. Set Bonus: "Double Attack"+5%. Active with any 2 pieces.
    {
        items =
        {
            invaderXim.item.FAZHELUO_HELM,
            invaderXim.item.FAZHELUO_HELM_P1,
            invaderXim.item.FAZHELUO_MAIL,
            invaderXim.item.FAZHELUO_RADIANT_MAIL,
            invaderXim.item.FAZHELUO_MAIL_P1,
        },
        minEquipped = 2,
        mods =
        {
            { invaderXim.mod.DOUBLE_ATTACK, 5 },
        },
    },

    [28] = -- Cuauhtli Harness Set. Set Bonus: Haste+8%. Active with any 2 pieces.
    {
        items =
        {
            invaderXim.item.CUAUHTLI_HEADPIECE,
            invaderXim.item.CUAUHTLI_HEADPIECE_P1,
            invaderXim.item.CUAUHTLI_HARNESS,
            invaderXim.item.MEXTLI_HARNESS,
            invaderXim.item.CUAUHTLI_HARNESS_P1,
        },
        minEquipped = 2,
        mods =
        {
            { invaderXim.mod.HASTE_GEAR, 800 },
        },
    },

    [29] = -- Hyskos Robe Set. Set Bonus: Magic Accuracy+5. Active with any 2 pieces.
    {
        items =
        {
            invaderXim.item.HYKSOS_KHAT,
            invaderXim.item.HYKSOS_KHAT_P1,
            invaderXim.item.HYKSOS_ROBE,
            invaderXim.item.ANHUR_ROBE,
            invaderXim.item.HYKSOS_ROBE_P1,
        },
        minEquipped = 2,
        mods =
        {
            { invaderXim.mod.MACC, 5 },
        },
    },

    [30] = -- Ogier's Armor Set. Set Bonus: Adds "Refresh" invaderXim.effect. Provides 1 mp/tick for 2-3 pieces worn, 2 mp/tick for 4-5 pieces worn.
    {
        items =
        {
            invaderXim.item.OGIERS_HELM,
            invaderXim.item.OGIERS_SURCOAT,
            invaderXim.item.OGIERS_GAUNTLETS,
            invaderXim.item.OGIERS_BREECHES,
            invaderXim.item.OGIERS_LEGGINGS,
        },
        minEquipped = 2,
        mods =
        {
            { invaderXim.mod.REFRESH, 1, 1, 2, 2 },
        },
    },

    [31] = -- Athos's Armor Set. Set Bonus: Increases rate of critical hits. Gives +3% for the first 2 pieces and +1% for every additional piece.
    {
        items =
        {
            invaderXim.item.ATHOSS_CHAPEAU,
            invaderXim.item.ATHOSS_TABARD,
            invaderXim.item.ATHOSS_GLOVES,
            invaderXim.item.ATHOSS_TIGHTS,
            invaderXim.item.ATHOSS_BOOTS,
        },
        minEquipped = 2,
        mods =
        {
            { invaderXim.mod.CRITHITRATE, 3, 4, 5, 6 },
        },
    },

    [32] = -- Rubeus Armor Set. Set Bonus: Enhances "Fast Cast" effect. 2 or 3 pieces equipped: Fast Cast +4, 4 or 5 pieces equipped: Fast Cast +10
    {
        items =
        {
            invaderXim.item.RUBEUS_BANDEAU,
            invaderXim.item.RUBEUS_JACKET,
            invaderXim.item.RUBEUS_GLOVES,
            invaderXim.item.RUBEUS_SPATS,
            invaderXim.item.RUBEUS_BOOTS,
        },
        minEquipped = 2,
        mods =
        {
            { invaderXim.mod.FASTCAST, 4, 4, 10, 10 },
        },
    },

    [33] = -- Navarch's Attire +2 Set. Set Bonus: Augments "Quick Draw". Quick Draw will occasionally deal triple damage.
    {
        items =
        {
            invaderXim.item.NAVARCHS_TRICORNE_P2,
            invaderXim.item.NAVARCHS_FRAC_P2,
            invaderXim.item.NAVARCHS_GANTS_P2,
            invaderXim.item.NAVARCHS_CULOTTES_P2,
            invaderXim.item.NAVARCHS_BOTTES_P2,
        },
        minEquipped = 2,
        mods =
        {
            { invaderXim.mod.QUICK_DRAW_TRIPLE_DAMAGE, 2, 3, 4, 5 },
        },
    },

    [34] = -- Charis Attire +2 Set. Set Bonus: Augments "Samba". Occasionally doubles damage with Samba up. Adds approximately 1-2% per piece past the first.
    {
        items =
        {
            invaderXim.item.CHARIS_TIARA_P2,
            invaderXim.item.CHARIS_CASAQUE_P2,
            invaderXim.item.CHARIS_BANGLES_P2,
            invaderXim.item.CHARIS_TIGHTS_P2,
            invaderXim.item.CHARIS_TOE_SHOES_P2,
        },
        minEquipped = 2,
        mods =
        {
            { invaderXim.mod.SAMBA_DOUBLE_DAMAGE, 2, 3, 4, 5 },
        },
    },

    [35] = -- Iga Garb +2 Set. Set Bonus: Augments "Dual Wield". Attacks made while dual wielding occasionally add an extra attack
    {
        items =
        {
            invaderXim.item.IGA_ZUKIN_P2,
            invaderXim.item.IGA_NINGI_P2,
            invaderXim.item.IGA_TEKKO_P2,
            invaderXim.item.IGA_HAKAMA_P2,
            invaderXim.item.IGA_KYAHAN_P2,
        },
        minEquipped = 2,
        mods =
        {
            { invaderXim.mod.EXTRA_DUAL_WIELD_ATTACK, 2, 3, 4, 5 },
        }
    },

    [36] = -- Sylvan Attire +2 Set. Set Bonus: Augments "Rapid Shot". Rapid Shots occasionally deal double damage.
    {
        items =
        {
            invaderXim.item.SYLVAN_GAPETTE_P2,
            invaderXim.item.SYLVAN_CABAN_P2,
            invaderXim.item.SYLVAN_GLOVELETTES_P2,
            invaderXim.item.SYLVAN_BRAGUES_P2,
            invaderXim.item.SYLVAN_BOTTILLONS_P2,
        },
        minEquipped = 2,
        mods =
        {
            { invaderXim.mod.RAPID_SHOT_DOUBLE_DAMAGE, 2, 3, 4, 5 },
        },
    },

    [37] = -- Creed Armor +2 Set. Set Bonus: Occasionally absorbs damage taken. Set proc believed to be somewhere around 5%, more testing needed. Verification Needed Absorb rate likely varies with # of set pieces.
    {
        items =
        {
            invaderXim.item.CREED_ARMET_P2,
            invaderXim.item.CREED_CUIRASS_P2,
            invaderXim.item.CREED_GAUNTLETS_P2,
            invaderXim.item.CREED_CUISSES_P2,
            invaderXim.item.CREED_SABATONS_P2,
        },
        minEquipped = 2,
        mods =
        {
            { invaderXim.mod.ABSORB_DMG_CHANCE, 2, 3, 4, 5 },
        },
    },

    [38] = -- Unkai Domaru +2 Set. Set Bonus: Augments "Zanshin". Zanshin attacks will occasionally deal double damage.
    {
        items =
        {
            invaderXim.item.UNKAI_KABUTO_P2,
            invaderXim.item.UNKAI_DOMARU_P2,
            invaderXim.item.UNKAI_KOTE_P2,
            invaderXim.item.UNKAI_HAIDATE_P2,
            invaderXim.item.UNKAI_SUNE_ATE_P2,
        },
        minEquipped = 2,
        mods =
        {
            { invaderXim.mod.ZANSHIN_DOUBLE_DAMAGE, 2, 3, 4, 5 },
        },
    },

    [39] = -- Tantra Attire +2 Set. Set Bonus: Augments "Kick Attacks". Occasionally allows a second Kick Attack during an attack round without the use of Footwork.
    {
        items =
        {
            invaderXim.item.TANTRA_CROWN_P2,
            invaderXim.item.TANTRA_CYCLAS_P2,
            invaderXim.item.TANTRA_GLOVES_P2,
            invaderXim.item.TANTRA_HOSE_P2,
            invaderXim.item.TANTRA_GAITERS_P2,
        },
        minEquipped = 2,
        mods =
        {
            { invaderXim.mod.EXTRA_KICK_ATTACK, 2, 3, 4, 5 },
        },
    },

    [40] = -- Raider's Attire +2 Set. Set Bonus: Augments "Triple Attack". Occasionally causes the second and third hits of a Triple Attack to deal triple damage.Verification Needed Requires a minimum of two pieces.
    {
        items =
        {
            invaderXim.item.RAIDERS_BONNET_P2,
            invaderXim.item.RAIDERS_VEST_P2,
            invaderXim.item.RAIDERS_ARMLETS_P2,
            invaderXim.item.RAIDERS_CULOTTES_P2,
            invaderXim.item.RAIDERS_POULAINES_P2,
        },
        minEquipped = 2,
        mods =
        {
            { invaderXim.mod.TA_TRIPLE_DMG_RATE, 2, 3, 4, 5 },
        },
    },

    [41] = -- Orison Attire +2 Set. Set Bonus: Augments elemental resistance spells. Bar Elemental spells will occasionally nullify damage of the same element.
    {
        items =
        {
            invaderXim.item.ORISON_CAP_P2,
            invaderXim.item.ORISON_BLIAUD_P2,
            invaderXim.item.ORISON_MITTS_P2,
            invaderXim.item.ORISON_PANTALOONS_P2,
            invaderXim.item.ORISON_DUCKBILLS_P2,
        },
        minEquipped = 2,
        mods =
        {
            { invaderXim.mod.BAR_ELEMENT_NULL_CHANCE, 2, 3, 4, 5 },
        },
    },

    [42] = -- Savant's Attire +2 Set. Set Bonus: Augments Grimoire. Spells that match your current Arts will occasionally cast instantly, without recast.
    {
        items =
        {
            invaderXim.item.SAVANTS_BONNET_P2,
            invaderXim.item.SAVANTS_GOWN_P2,
            invaderXim.item.SAVANTS_BRACERS_P2,
            invaderXim.item.SAVANTS_PANTS_P2,
            invaderXim.item.SAVANTS_LOAFERS_P2,
        },
        minEquipped = 2,
        mods =
        {
            { invaderXim.mod.GRIMOIRE_INSTANT_CAST, 2, 3, 4, 5 },
        },
    },

    [43] = -- Paramount Earring Sets. Set Bonus: HP+30, VIT+6, Accuracy+6, Ranged Accuracy+6. Set Bonus is active with any 2 items(Earring+Weapon or Weapon+Weapon)
    {
        items =
        {
            invaderXim.item.PARAMOUNT_EARRING,
            invaderXim.item.SINFENDER,
            invaderXim.item.FLEETWING,
            invaderXim.item.KEBBIE,
            invaderXim.item.USESHI,
            invaderXim.item.FARSEER,
            invaderXim.item.AMANOKAKOYUMI,
            invaderXim.item.OSORAKU,
            invaderXim.item.BALISARDE,
        },
        minEquipped = 2,
        maxEquipped = 2,
        mods =
        {
            { invaderXim.mod.HP,  30 },
            { invaderXim.mod.VIT,  6 },
            { invaderXim.mod.ACC,  6 },
            { invaderXim.mod.RACC, 6 },
        },
    },

    [44] = -- Supremacy Earring Sets. Set Bonus: STR+6, Attack+4, Ranged Attack+4, "Magic Atk. Bonus"+2. Active with any 2 items(Earring+Weapon)
    {
        items =
        {
            invaderXim.item.SUPREMACY_EARRING,
            invaderXim.item.ACANTHA_SHAVERS,
            invaderXim.item.CATALYST,
            invaderXim.item.MERVEILLEUSE,
            invaderXim.item.MURDERER,
            invaderXim.item.SKYSTRIDER,
            invaderXim.item.SPARTH,
            invaderXim.item.VENDETTA,
        },
        minEquipped = 2,
        maxEquipped = 2,
        mods =
        {
            { invaderXim.mod.STR,  6 },
            { invaderXim.mod.ATT,  4 },
            { invaderXim.mod.RATT, 4 },
            { invaderXim.mod.MATT, 2 },
        },
    },

    [45] = -- Brilliant Earring Set. Set Bonus: Evasion, HP Recovered while healing, Reduces Emnity. Active with any 2 items(Earring+Weapon)
    {
        items =
        {
            invaderXim.item.BRILLIANT_EARRING,
            invaderXim.item.MUKADEMARU,
            invaderXim.item.ALASTOR,
            invaderXim.item.GRANDEUR,
            invaderXim.item.CLEARPATH,
            invaderXim.item.FAUCHEUSE,
            invaderXim.item.SILKTONE,
            invaderXim.item.BASILISK,
            invaderXim.item.YAGENTOSHIRO,
        },
        minEquipped = 2,
        maxEquipped = 2,
        mods =
        {
            { invaderXim.mod.EVA,    10 },
            { invaderXim.mod.HPHEAL, 10 },
            { invaderXim.mod.ENMITY, -5 },
        }
    },

    [46] = -- Twilight Mail Set. Set Bonus: Auto-Reraise
    {
        items =
        {
            invaderXim.item.TWILIGHT_HELM,
            invaderXim.item.TWILIGHT_MAIL,
        },
        minEquipped = 2,
        mods =
        {
            { invaderXim.mod.RERAISE_III, 1 },
        },
    },

    [54] = -- Bladeborn/Steelflash Earrings
    {
        items =
        {
            invaderXim.item.STEELFLASH_EARRING,
            invaderXim.item.BLADEBORN_EARRING,
        },
        minEquipped = 2,
        mods =
        {
            { invaderXim.mod.DOUBLE_ATTACK, 7 },
        },
    },

    [55] = -- Dudgeon/Heartseeker Earrings
    {
        items =
        {
            invaderXim.item.DUDGEON_EARRING,
            invaderXim.item.HEARTSEEKER_EARRING,
        },
        minEquipped = 2,
        mods =
        {
            { invaderXim.mod.DUAL_WIELD, 7 },
        },
    },

    [56] = -- Psystorm/Lifestorm Earrings
    {
        items =
        {
            invaderXim.item.LIFESTORM_EARRING,
            invaderXim.item.PSYSTORM_EARRING,
        },
        minEquipped = 2,
        mods =
        {
            { invaderXim.mod.MACC, 12 },
        },
    },

    [57] = -- Samurai 109/119 af3
    {
        items =
        {
            invaderXim.item.KASUGA_DOMARU,
            invaderXim.item.KASUGA_DOMARU_P1,
            invaderXim.item.KASUGA_SUNE_ATE_P1,
            invaderXim.item.KASUGA_HAIDATE,
            invaderXim.item.KASUGA_HAIDATE_P1,
            invaderXim.item.KASUGA_KABUTO,
            invaderXim.item.KASUGA_KABUTO_P1,
            invaderXim.item.KASUGA_KOTE,
            invaderXim.item.KASUGA_KOTE_P1,
            invaderXim.item.KASUGA_SUNE_ATE,
        },
        minEquipped = 2,
        mods =
        {
            { invaderXim.mod.ZANSHIN_DOUBLE_DAMAGE, 2, 3, 4, 5 },
        },
    },

    [58] = -- MNK 109/119 af3
    {
        items =
        {
            invaderXim.item.BHIKKU_GAITERS_P1,
            invaderXim.item.BHIKKU_GAITERS,
            invaderXim.item.BHIKKU_HOSE_P1,
            invaderXim.item.BHIKKU_HOSE,
            invaderXim.item.BHIKKU_GLOVES_P1,
            invaderXim.item.BHIKKU_GLOVES,
            invaderXim.item.BHIKKU_CYCLAS_P1,
            invaderXim.item.BHIKKU_CYCLAS,
            invaderXim.item.BHIKKU_CROWN_P1,
            invaderXim.item.BHIKKU_CROWN,
        },
        minEquipped = 2,
        mods =
        {
            { invaderXim.mod.EXTRA_KICK_ATTACK, 2, 3, 4, 5 },
        },
    },

    [59] = -- 109/119 WAR AF3
    {
        items =
        {
            invaderXim.item.BOII_MASK,
            invaderXim.item.BOII_MASK_P1,
            invaderXim.item.BOII_CALLIGAE,
            invaderXim.item.BOII_CALLIGAE_P1,
            invaderXim.item.BOII_CUISSES_P1,
            invaderXim.item.BOII_CUISSES,
            invaderXim.item.BOII_MUFFLERS_P1,
            invaderXim.item.BOII_MUFFLERS,
            invaderXim.item.BOII_LORICA_P1,
            invaderXim.item.BOII_LORICA,
        },
        minEquipped = 2,
        mods =
        {
            { invaderXim.mod.DA_DOUBLE_DMG_RATE, 2, 3, 4, 5 },
        },
    },

    [60] = -- 109/119 THF AF3
    {
        items =
        {
            invaderXim.item.SKULKERS_BONNET,
            invaderXim.item.SKULKERS_BONNET_P1,
            invaderXim.item.SKULKERS_POULAINES,
            invaderXim.item.SKULKERS_POULAINES_P1,
            invaderXim.item.SKULKERS_CULOTTES,
            invaderXim.item.SKULKERS_CULOTTES_P1,
            invaderXim.item.SKULKERS_ARMLETS_P1,
            invaderXim.item.SKULKERS_ARMLETS,
            invaderXim.item.SKULKERS_VEST,
            invaderXim.item.SKULKERS_VEST_P1,
        },
        minEquipped = 2,
        mods =
        {
            { invaderXim.mod.TA_TRIPLE_DMG_RATE, 2, 3, 4, 5 },
        },
    },

    [61] = -- 109/119 RNG AF3
    {
        items =
        {
            invaderXim.item.AMINI_CABAN,
            invaderXim.item.AMINI_CABAN_P1,
            invaderXim.item.AMINI_GAPETTE_P1,
            invaderXim.item.AMINI_GAPETTE,
            invaderXim.item.AMINI_BOTTILLONS,
            invaderXim.item.AMINI_BOTTILLONS_P1,
            invaderXim.item.AMINI_BRAGUE,
            invaderXim.item.AMINI_BRAGUE_P1,
            invaderXim.item.AMINI_GLOVELETTES,
            invaderXim.item.AMINI_GLOVELETTES_P1,
        },
        minEquipped = 2,
        mods =
        {
            { invaderXim.mod.RAPID_SHOT_DOUBLE_DAMAGE, 2, 3, 4, 5 },
        },
    },

    [62] = -- 109/119 PLD AF3
    {
        items =
        {
            invaderXim.item.CHEVALIERS_CUIRASS,
            invaderXim.item.CHEVALIERS_CUIRASS_P1,
            invaderXim.item.CHEVALIERS_ARMET,
            invaderXim.item.CHEVALIERS_ARMET_P1,
            invaderXim.item.CHEVALIERS_SABATONS_P1,
            invaderXim.item.CHEVALIERS_SABATONS,
            invaderXim.item.CHEVALIERS_GAUNTLETS,
            invaderXim.item.CHEVALIERS_GAUNTLETS_P1,
            invaderXim.item.CHEVALIERS_CUISSES,
            invaderXim.item.CHEVALIERS_CUISSES_P1,
        },
        minEquipped = 2,
        mods =
        {
            { invaderXim.mod.ABSORB_DMG_CHANCE, 2, 3, 4, 5 },
        },
    },

    [63] = -- 109/119 NIN AF3
    {
        items =
        {
            invaderXim.item.HATTORI_NINGI,
            invaderXim.item.HATTORI_NINGI_P1,
            invaderXim.item.HATTORI_ZUKIN,
            invaderXim.item.HATTORI_ZUKIN_P1,
            invaderXim.item.HATTORI_TEKKO,
            invaderXim.item.HATTORI_TEKKO_P1,
            invaderXim.item.HATTORI_HAKAMA,
            invaderXim.item.HATTORI_HAKAMA_P1,
            invaderXim.item.HATTORI_KYAHAN,
            invaderXim.item.HATTORI_KYAHAN_P1,
        },
        minEquipped = 2,
        mods =
        {
            { invaderXim.mod.EXTRA_DUAL_WIELD_ATTACK, 2, 3, 4, 5 },
        },
    },

    [64] = -- 109/119 COR AF3
    {
        items =
        {
            invaderXim.item.CHASSEURS_BOTTES,
            invaderXim.item.CHASSEURS_BOTTES_P1,
            invaderXim.item.CHASSEURS_TRICORNE,
            invaderXim.item.CHASSEURS_TRICORNE_P1,
            invaderXim.item.CHASSEURS_FRAC,
            invaderXim.item.CHASSEURS_FRAC_P1,
            invaderXim.item.CHASSEURS_GANTS,
            invaderXim.item.CHASSEURS_GANTS_P1,
            invaderXim.item.CHASSEURS_CULOTTES,
            invaderXim.item.CHASSEURS_CULOTTES_P1,
        },
        minEquipped = 2,
        mods =
        {
            { invaderXim.mod.QUICK_DRAW_TRIPLE_DAMAGE, 2, 3, 4, 5 },
        },
    },

    [65] = -- 109/119 SCH AF3
    {
        items =
        {
            invaderXim.item.ARBATEL_PANTS,
            invaderXim.item.ARBATEL_PANTS_P1,
            invaderXim.item.ARBATEL_LOAFERS,
            invaderXim.item.ARBATEL_LOAFERS_P1,
            invaderXim.item.ARBATEL_BONNET,
            invaderXim.item.ARBATEL_BONNET_P1,
            invaderXim.item.ARBATEL_GOWN,
            invaderXim.item.ARBATEL_GOWN_P1,
            invaderXim.item.ARBATEL_BRACERS,
            invaderXim.item.ARBATEL_BRACERS_P1,
        },
        minEquipped = 2,
        mods =
        {
            { invaderXim.mod.GRIMOIRE_INSTANT_CAST, 2, 3, 4, 5 },
        },
    },

    [66] = -- 109/119 WHM AF3
    {
        items =
        {
            invaderXim.item.EBERS_PANTALOONS,
            invaderXim.item.EBERS_PANTALOONS_P1,
            invaderXim.item.EBERS_DUCKBILLS,
            invaderXim.item.EBERS_DUCKBILLS_P1,
            invaderXim.item.EBERS_CAP,
            invaderXim.item.EBERS_CAP_P1,
            invaderXim.item.EBERS_BLIAUD,
            invaderXim.item.EBERS_BLIAUD_P1,
            invaderXim.item.EBERS_MITTS,
            invaderXim.item.EBERS_MITTS_P1,
        },
        minEquipped = 2,
        mods =
        {
            { invaderXim.mod.BAR_ELEMENT_NULL_CHANCE, 2, 3, 4, 5 },
        },
    },

    [67] = -- Heka/Nefer body + NQ or HQ Khat = 2 tick refresh
    {
        items =
        {
            invaderXim.item.HEKAS_KALASIRIS,
            invaderXim.item.NEFER_KHAT,
            invaderXim.item.NEFER_KHAT_P1,
            invaderXim.item.NEFER_KALASIRIS,
            invaderXim.item.NEFER_KALASIRIS_P1,
        },
        minEquipped = 2,
        maxEquipped = 2,
        mods =
        {
            { invaderXim.mod.REFRESH, 3 },
        },
    },

    [68] = -- Dasra's/Nasatya's Ring set gives HP/MP +50
    {
        items =
        {
            invaderXim.item.NASATYAS_RING,
            invaderXim.item.DASRAS_RING,
        },
        minEquipped = 2,
        mods =
        {
            { invaderXim.mod.HP, 50 },
            { invaderXim.mod.MP, 50 },
        },
    },

    [69] = -- Helenus's/Cassandra's earring set: Mag atk bonus+5 and Mag acc +5
    {
        items =
        {
            invaderXim.item.HELENUSS_EARRING,
            invaderXim.item.CASSANDRAS_EARRING,
        },
        minEquipped = 2,
        mods =
        {
            { invaderXim.mod.MATT, 5 },
            { invaderXim.mod.MACC, 5 },
        },
    },

    [70] = -- Lava's/Kusha's earring set: Atk+6/Acc+12
    {
        items =
        {
            invaderXim.item.LAVAS_RING,
            invaderXim.item.KUSHAS_RING,
        },
        minEquipped = 2,
        mods =
        {
            { invaderXim.mod.ATT,  6 },
            { invaderXim.mod.ACC, 12 },
            { invaderXim.mod.DEF,  6 },
        },
    },

    [71] = -- Iron Ram Haubert Set
    {
        items =
        {
            invaderXim.item.IRON_RAM_SALLET,
            invaderXim.item.IRON_RAM_HAUBERK,
            invaderXim.item.IRON_RAM_DASTANAS,
            invaderXim.item.IRON_RAM_HOSE,
            invaderXim.item.IRON_RAM_GREAVES,
        },
        minEquipped = 2,
        mods =
        {
            { invaderXim.mod.FIRE_MEVA,    5, 10, 15, 30 },
            { invaderXim.mod.ICE_MEVA,     5, 10, 15, 30 },
            { invaderXim.mod.WIND_MEVA,    5, 10, 15, 30 },
            { invaderXim.mod.EARTH_MEVA,   5, 10, 15, 30 },
            { invaderXim.mod.THUNDER_MEVA, 5, 10, 15, 30 },
            { invaderXim.mod.WATER_MEVA,   5, 10, 15, 30 },
            { invaderXim.mod.LIGHT_MEVA,   5, 10, 15, 30 },
            { invaderXim.mod.DARK_MEVA,    5, 10, 15, 30 },
        },
    },

    [72] = -- Altdorf's/Wilhelm's earring: AGI+8
    {
        items =
        {
            invaderXim.item.ALTDORFS_EARRING,
            invaderXim.item.WILHELMS_EARRING,
        },
        minEquipped = 2,
        mods =
        {
            { invaderXim.mod.AGI, 8 },
        },
    },

    [73] = -- Gothic Gauntlets/Sabatons: Atk/RAtk +5
    {
        items =
        {
            invaderXim.item.GOTHIC_GAUNTLETS,
            invaderXim.item.GOTHIC_SABATONS,
        },
        minEquipped = 2,
        mods =
        {
            { invaderXim.mod.ATT,  5 },
            { invaderXim.mod.RATT, 5 },
        },
    },

    [74] = -- Teal Set +1: Fast Cast +4-10%
    {
        items =
        {
            invaderXim.item.TEAL_CHAPEAU_P1,
            invaderXim.item.TEAL_SAIO_P1,
            invaderXim.item.TEAL_CUFFS_P1,
            invaderXim.item.TEAL_SLOPS_P1,
            invaderXim.item.TEAL_PIGACHES_P1,
        },
        minEquipped = 2,
        mods =
        {
            { invaderXim.mod.FASTCAST, 4, 6, 8, 10 },
        },
    },

    [75] = -- Aurore Set +1: Store TP +2-8
    {
        items =
        {
            invaderXim.item.AURORE_BERET_P1,
            invaderXim.item.AURORE_DOUBLET_P1,
            invaderXim.item.AURORE_GLOVES_P1,
            invaderXim.item.AURORE_BRAIS_P1,
            invaderXim.item.AURORE_GAITERS_P1,
        },
        minEquipped = 2,
        mods =
        {
            { invaderXim.mod.STORETP, 2, 4, 6, 8 },
        },
    },

    [76] = -- Perle Set +1: Haste +2-5%
    {
        items =
        {
            invaderXim.item.PERLE_SALADE_P1,
            invaderXim.item.PERLE_HAUBERK_P1,
            invaderXim.item.PERLE_MOUFLES_P1,
            invaderXim.item.PERLE_BRAYETTES_P1,
            invaderXim.item.PERLE_SOLLERETS_P1,
        },
        minEquipped = 2,
        mods =
        {
            { invaderXim.mod.HASTE_GEAR, 2, 3, 4, 5 },
        },
    },

    [77] = -- Morrigan's Attire Set +1: Magic Atk. Bonus +3-9%
    {
        items =
        {
            invaderXim.item.MORRIGANS_CORONAL_P1,
            invaderXim.item.MORRIGANS_ROBE_P1,
            invaderXim.item.MORRIGANS_CUFFS_P1,
            invaderXim.item.MORRIGANS_SLOPS_P1,
            invaderXim.item.MORRIGANS_PIGACHES_P1,
        },
        minEquipped = 2,
        mods =
        {
            { invaderXim.mod.MATT, 3, 5, 7, 9 },
        },
    },

    [78] = -- Marduk's Attire Set +1: Fast Cast +3-9%
    {
        items =
        {
            invaderXim.item.MARDUKS_TIARA_P1,
            invaderXim.item.MARDUKS_JUBBAH_P1,
            invaderXim.item.MARDUKS_DASTANAS_P1,
            invaderXim.item.MARDUKS_SHALWAR_P1,
            invaderXim.item.MARDUKS_CRACKOWS_P1,
        },
        minEquipped = 2,
        mods =
        {
            { invaderXim.mod.FASTCAST, 3, 5, 7, 9 },
        },
    },

    [79] = -- Usukane Armor Set +1: Haste +3-9%
    {
        items =
        {
            invaderXim.item.USUKANE_SOMEN_P1,
            invaderXim.item.USUKANE_HARAMAKI_P1,
            invaderXim.item.USUKANE_GOTE_P1,
            invaderXim.item.USUKANE_HIZAYOROI_P1,
            invaderXim.item.USUKANE_SUNE_ATE_P1,
        },
        minEquipped = 2,
        mods =
        {
            { invaderXim.mod.HASTE_GEAR, 300, 500, 700, 900 },
        },
    },

    [80] = -- Skadi's Attire Set +1: Critical hit rate +3-9%
    {
        items =
        {
            invaderXim.item.SKADIS_VISOR_P1,
            invaderXim.item.SKADIS_CUIRIE_P1,
            invaderXim.item.SKADIS_BAZUBANDS_P1,
            invaderXim.item.SKADIS_CHAUSSES_P1,
            invaderXim.item.SKADIS_JAMBEAUX_P1,
        },
        minEquipped = 2,
        mods =
        {
            { invaderXim.mod.CRITHITRATE, 3, 5, 7, 9 },
        },
    },

    [81] = -- Ares' Armor Set +1: Double Attack +3-9%
    {
        items =
        {
            invaderXim.item.ARES_MASK_P1,
            invaderXim.item.ARES_CUIRASS_P1,
            invaderXim.item.ARES_GAUNTLETS_P1,
            invaderXim.item.ARES_FLANCHARD_P1,
            invaderXim.item.ARES_SOLLERETS_P1,
        },
        minEquipped = 2,
        mods =
        {
            { invaderXim.mod.DOUBLE_ATTACK, 3, 5, 7, 9 },
        },
    },

    [82] = -- Alcedo Cuisses and Gauntlets: Magic damage taken -5%
    {
        items =
        {
            invaderXim.item.ALCEDO_GAUNTLETS,
            invaderXim.item.ALCEDO_CUISSES,
        },
        minEquipped = 2,
        mods =
        {
            { invaderXim.mod.DMGMAGIC, -500 },
        },
    },

    [83] = -- Sulevia's Armor Set +2: Subtle Blow +5-20
    {
        items =
        {
            invaderXim.item.SULEVIAS_RING,
            invaderXim.item.SULEVIAS_MASK_P2,
            invaderXim.item.SULEVIAS_PLATEMAIL_P2,
            invaderXim.item.SULEVIAS_GAUNTLETS_P2,
            invaderXim.item.SULEVIAS_CUISSES_P2,
            invaderXim.item.SULEVIAS_LEGGINGS_P2,
        },
        minEquipped = 2,
        maxEquipped = 5,
        mods =
        {
            { invaderXim.mod.SUBTLE_BLOW, 5, 10, 15, 20 },
        },
    },

    [84] = -- Hizamaru Armor Set +2: Counter +4-16%
    {
        items =
        {
            invaderXim.item.HIZAMARU_RING,
            invaderXim.item.HIZAMARU_SOMEN_P2,
            invaderXim.item.HIZAMARU_HARAMAKI_P2,
            invaderXim.item.HIZAMARU_KOTE_P2,
            invaderXim.item.HIZAMARU_HIZAYOROI_P2,
            invaderXim.item.HIZAMARU_SUNE_ATE_P2,
        },
        minEquipped = 2,
        maxEquipped = 5,
        mods =
        {
            { invaderXim.mod.COUNTER, 4, 8, 12, 16 },
        },
    },

    [85] = -- Inyanga Armor Set +2: Refresh +1-4
    {
        items =
        {
            invaderXim.item.INYANGA_RING,
            invaderXim.item.INYANGA_TIARA_P2,
            invaderXim.item.INYANGA_JUBBAH_P2,
            invaderXim.item.INYANGA_DASTANAS_P2,
            invaderXim.item.INYANGA_SHALWAR_P2,
            invaderXim.item.INYANGA_CRACKOWS_P2,
        },
        minEquipped = 2,
        maxEquipped = 5,
        mods =
        {
            { invaderXim.mod.REFRESH, 1, 2, 3, 4 },
        },
    },

    [86] = -- Meghanada Armor Set +2: Regen +3-12
    {
        items =
        {
            invaderXim.item.MEGHANADA_RING,
            invaderXim.item.MEGHANADA_VISOR_P2,
            invaderXim.item.MEGHANADA_CUIRIE_P2,
            invaderXim.item.MEGHANADA_GLOVES_P2,
            invaderXim.item.MEGHANADA_CHAUSSES_P2,
            invaderXim.item.MEGHANADA_JAMBEAUX_P2,
        },
        minEquipped = 2,
        maxEquipped = 5,
        mods =
        {
            { invaderXim.mod.REGEN, 3, 6, 9, 12 },
        },
    },

    [87] = -- Jhakri Armor Set +2: Fast Cast +1-4%
    {
        items =
        {
            invaderXim.item.JHAKRI_RING,
            invaderXim.item.JHAKRI_CORONAL_P2,
            invaderXim.item.JHAKRI_ROBE_P2,
            invaderXim.item.JHAKRI_CUFFS_P2,
            invaderXim.item.JHAKRI_SLOPS_P2,
            invaderXim.item.JHAKRI_PIGACHES_P2,
        },
        minEquipped = 2,
        maxEquipped = 5,
        mods =
        {
            { invaderXim.mod.FASTCAST, 1, 2, 3, 4 },
        },
    },

    [88] = -- Flamma Armor Set +2 STR/DEX/VIT +8-32
    {
        items =
        {
            invaderXim.item.FLAMMA_RING,
            invaderXim.item.FLAMMA_ZUCCHETTO_P2,
            invaderXim.item.FLAMMA_KORAZIN_P2,
            invaderXim.item.FLAMMA_MANOPOLAS_P2,
            invaderXim.item.FLAMMA_DIRS_P2,
            invaderXim.item.FLAMMA_GAMBIERAS_P2,
        },
        minEquipped = 2,
        maxEquipped = 5,
        mods =
        {
            { invaderXim.mod.STR, 8, 16, 24, 32 },
            { invaderXim.mod.DEX, 8, 16, 24, 32 },
            { invaderXim.mod.VIT, 8, 16, 24, 32 },
        },
    },

    [89] = -- Tali'ah Armor Set +2 DEX/VIT/CHR +8-32
    {
        items =
        {
            invaderXim.item.TALIAH_RING,
            invaderXim.item.TALIAH_TURBAN_P2,
            invaderXim.item.TALIAH_MANTEEL_P2,
            invaderXim.item.TALIAH_GAGES_P2,
            invaderXim.item.TALIAH_SERAWEELS_P2,
            invaderXim.item.TALIAH_CRACKOWS_P2,
        },
        minEquipped = 2,
        maxEquipped = 5,
        mods =
        {
            { invaderXim.mod.DEX, 8, 16, 24, 32 },
            { invaderXim.mod.VIT, 8, 16, 24, 32 },
            { invaderXim.mod.CHR, 8, 16, 24, 32 },
        }
    },

    [90] = -- Mummu Armor Set +2 DEX/AGI/CHR +8-32
    {
        items =
        {
            invaderXim.item.MUMMU_RING,
            invaderXim.item.MUMMU_BONNET_P2,
            invaderXim.item.MUMMU_JACKET_P2,
            invaderXim.item.MUMMU_WRISTS_P2,
            invaderXim.item.MUMMU_KECKS_P2,
            invaderXim.item.MUMMU_GAMASHES_P2,
        },
        minEquipped = 2,
        maxEquipped = 5,
        mods =
        {
            { invaderXim.mod.DEX, 8, 16, 24, 32 },
            { invaderXim.mod.AGI, 8, 16, 24, 32 },
            { invaderXim.mod.CHR, 8, 16, 24, 32 },
        },
    },

    [91] = -- Ayanmo Armor Set +2 STR/VIT/MND +8-32
    {
        items =
        {
            invaderXim.item.AYANMO_RING,
            invaderXim.item.AYANMO_ZUCCHETTO_P2,
            invaderXim.item.AYANMO_CORAZZA_P2,
            invaderXim.item.AYANMO_MANOPOLAS_P2,
            invaderXim.item.AYANMO_COSCIALES_P2,
            invaderXim.item.AYANMO_GAMBIERAS_P2,
        },
        minEquipped = 2,
        maxEquipped = 5,
        mods =
        {
            { invaderXim.mod.STR, 8, 16, 24, 32 },
            { invaderXim.mod.VIT, 8, 16, 24, 32 },
            { invaderXim.mod.MND, 8, 16, 24, 32 },
        }
    },

    [92] = -- Mallquis Armor Set +2 VIT/INT/MND +8-32
    {
        items =
        {
            invaderXim.item.MALLQUIS_RING,
            invaderXim.item.MALLQUIS_CHAPEAU_P2,
            invaderXim.item.MALLQUIS_SAIO_P2,
            invaderXim.item.MALLQUIS_CUFFS_P2,
            invaderXim.item.MALLQUIS_TREWS_P2,
            invaderXim.item.MALLQUIS_CLOGS_P2,
        },
        minEquipped = 2,
        maxEquipped = 5,
        mods =
        {
            { invaderXim.mod.VIT, 8, 16, 24, 32 },
            { invaderXim.mod.INT, 8, 16, 24, 32 },
            { invaderXim.mod.MND, 8, 16, 24, 32 },
        }
    },

    [93] = -- AF1 119 +2/3 WAR
    {
        items =
        {
            invaderXim.item.REGAL_RING,
            invaderXim.item.PUMMELERS_CALLIGAE_P2,
            invaderXim.item.PUMMELERS_CALLIGAE_P3,
            invaderXim.item.PUMMELERS_CUISSES_P2,
            invaderXim.item.PUMMELERS_CUISSES_P3,
            invaderXim.item.PUMMELERS_MUFFLERS_P2,
            invaderXim.item.PUMMELERS_MUFFLERS_P3,
            invaderXim.item.PUMMELERS_LORICA_P2,
            invaderXim.item.PUMMELERS_LORICA_P3,
            invaderXim.item.PUMMELERS_MASK_P2,
            invaderXim.item.PUMMELERS_MASK_P3,
        },
        minEquipped = 2,
        maxEquipped = 5,
        mods =
        {
            { invaderXim.mod.ACC,  15, 30, 45, 60 },
            { invaderXim.mod.RACC, 15, 30, 45, 60 },
            { invaderXim.mod.MACC, 15, 30, 45, 60 },
        },
    },

    [94] = -- AF1 119 +2/3 MNK
    {
        items =
        {
            invaderXim.item.REGAL_RING,
            invaderXim.item.ANCHORITES_GAITERS_P2,
            invaderXim.item.ANCHORITES_GAITERS_P3,
            invaderXim.item.ANCHORITES_HOSE_P2,
            invaderXim.item.ANCHORITES_HOSE_P3,
            invaderXim.item.ANCHORITES_GLOVES_P2,
            invaderXim.item.ANCHORITES_GLOVES_P3,
            invaderXim.item.ANCHORITES_CYCLAS_P2,
            invaderXim.item.ANCHORITES_CYCLAS_P3,
            invaderXim.item.ANCHORITES_CROWN_P2,
            invaderXim.item.ANCHORITES_CROWN_P3,
        },
        minEquipped = 2,
        maxEquipped = 5,
        mods =
        {
            { invaderXim.mod.ACC,  15, 30, 45, 60 },
            { invaderXim.mod.RACC, 15, 30, 45, 60 },
            { invaderXim.mod.MACC, 15, 30, 45, 60 },
        },
    },

    [95] = -- AF1 119 +2/3 WHM
    {
        items =
        {
            invaderXim.item.REGAL_EARRING,
            invaderXim.item.THEOPHANY_DUCKBILLS_P2,
            invaderXim.item.THEOPHANY_DUCKBILLS_P3,
            invaderXim.item.THEOPHANY_PANTALOONS_P2,
            invaderXim.item.THEOPHANY_PANTALOONS_P3,
            invaderXim.item.THEOPHANY_MITTS_P2,
            invaderXim.item.THEOPHANY_MITTS_P3,
            invaderXim.item.THEOPHANY_BLIAUT_P2,
            invaderXim.item.THEOPHANY_BLIAUT_P3,
            invaderXim.item.THEOPHANY_CAP_P2,
            invaderXim.item.THEOPHANY_CAP_P3,
        },
        minEquipped = 2,
        maxEquipped = 5,
        mods =
        {
            { invaderXim.mod.ACC,  15, 30, 45, 60 },
            { invaderXim.mod.RACC, 15, 30, 45, 60 },
            { invaderXim.mod.MACC, 15, 30, 45, 60 },
        },
    },

    [96] = -- AF1 119 +2/3 BLM
    {
        items =
        {
            invaderXim.item.REGAL_EARRING,
            invaderXim.item.SPAEKONAS_SABOTS_P2,
            invaderXim.item.SPAEKONAS_SABOTS_P3,
            invaderXim.item.SPAEKONAS_TONBAN_P2,
            invaderXim.item.SPAEKONAS_TONBAN_P3,
            invaderXim.item.SPAEKONAS_GLOVES_P2,
            invaderXim.item.SPAEKONAS_GLOVES_P3,
            invaderXim.item.SPAEKONAS_COAT_P2,
            invaderXim.item.SPAEKONAS_COAT_P3,
            invaderXim.item.SPAEKONAS_PETASOS_P2,
            invaderXim.item.SPAEKONAS_PETASOS_P3,
        },
        minEquipped = 2,
        maxEquipped = 5,
        mods =
        {
            { invaderXim.mod.ACC,  15, 30, 45, 60 },
            { invaderXim.mod.RACC, 15, 30, 45, 60 },
            { invaderXim.mod.MACC, 15, 30, 45, 60 },
        },
    },

    [97] = -- AF1 119 +2/3 RDM
    {
        items =
        {
            invaderXim.item.REGAL_EARRING,
            invaderXim.item.ATROPHY_BOOTS_P2,
            invaderXim.item.ATROPHY_BOOTS_P3,
            invaderXim.item.ATROPHY_TIGHTS_P2,
            invaderXim.item.ATROPHY_TIGHTS_P3,
            invaderXim.item.ATROPHY_GLOVES_P2,
            invaderXim.item.ATROPHY_GLOVES_P3,
            invaderXim.item.ATROPHY_TABARD_P2,
            invaderXim.item.ATROPHY_TABARD_P3,
            invaderXim.item.ATROPHY_CHAPEAU_P2,
            invaderXim.item.ATROPHY_CHAPEAU_P3,
        },
        minEquipped = 2,
        maxEquipped = 5,
        mods =
        {
            { invaderXim.mod.ACC,  15, 30, 45, 60 },
            { invaderXim.mod.RACC, 15, 30, 45, 60 },
            { invaderXim.mod.MACC, 15, 30, 45, 60 },
        },
    },

    [98] = -- AF1 119 +2/3 THF
    {
        items =
        {
            invaderXim.item.REGAL_RING,
            invaderXim.item.PILLAGERS_POULAINES_P2,
            invaderXim.item.PILLAGERS_POULAINES_P3,
            invaderXim.item.PILLAGERS_CULOTTES_P2,
            invaderXim.item.PILLAGERS_CULOTTES_P3,
            invaderXim.item.PILLAGERS_ARMLETS_P2,
            invaderXim.item.PILLAGERS_ARMLETS_P3,
            invaderXim.item.PILLAGERS_VEST_P2,
            invaderXim.item.PILLAGERS_VEST_P3,
            invaderXim.item.PILLAGERS_BONNET_P2,
            invaderXim.item.PILLAGERS_BONNET_P3,
        },
        minEquipped = 2,
        maxEquipped = 5,
        mods =
        {
            { invaderXim.mod.ACC,  15, 30, 45, 60 },
            { invaderXim.mod.RACC, 15, 30, 45, 60 },
            { invaderXim.mod.MACC, 15, 30, 45, 60 },
        },
    },

    [99] = -- AF1 119 +2/3 PLD
    {
        items =
        {
            invaderXim.item.REGAL_RING,
            invaderXim.item.REVERENCE_LEGGINGS_P2,
            invaderXim.item.REVERENCE_LEGGINGS_P3,
            invaderXim.item.REVERENCE_BREECHES_P2,
            invaderXim.item.REVERENCE_BREECHES_P3,
            invaderXim.item.REVERENCE_GAUNTLETS_P2,
            invaderXim.item.REVERENCE_GAUNTLETS_P3,
            invaderXim.item.REVERENCE_SURCOAT_P2,
            invaderXim.item.REVERENCE_SURCOAT_P3,
            invaderXim.item.REVERENCE_CORONET_P2,
            invaderXim.item.REVERENCE_CORONET_P3,
        },
        minEquipped = 2,
        maxEquipped = 5,
        mods =
        {
            { invaderXim.mod.ACC,  15, 30, 45, 60 },
            { invaderXim.mod.RACC, 15, 30, 45, 60 },
            { invaderXim.mod.MACC, 15, 30, 45, 60 },
        },
    },

    [100] = -- AF1 119 +2/3 DRK
    {
        items =
        {
            invaderXim.item.REGAL_RING,
            invaderXim.item.IGNOMINY_SOLLERETS_P2,
            invaderXim.item.IGNOMINY_SOLLERETS_P3,
            invaderXim.item.IGNOMINY_FLANCHARD_P2,
            invaderXim.item.IGNOMINY_FLANCHARD_P3,
            invaderXim.item.IGNOMINY_GAUNTLETS_P2,
            invaderXim.item.IGNOMINY_GAUNTLETS_P3,
            invaderXim.item.IGNOMINY_CUIRASS_P2,
            invaderXim.item.IGNOMINY_CUIRASS_P3,
            invaderXim.item.IGNOMINY_BURGEONET_P2,
            invaderXim.item.IGNOMINY_BURGEONET_P3,
        },
        minEquipped = 2,
        maxEquipped = 5,
        mods =
        {
            { invaderXim.mod.ACC,  15, 30, 45, 60 },
            { invaderXim.mod.RACC, 15, 30, 45, 60 },
            { invaderXim.mod.MACC, 15, 30, 45, 60 },
        },
    },

    [101] = -- AF1 119 +2/3 BST
    {
        items =
        {
            invaderXim.item.REGAL_RING,
            invaderXim.item.TOTEMIC_GAITERS_P2,
            invaderXim.item.TOTEMIC_GAITERS_P3,
            invaderXim.item.TOTEMIC_TROUSERS_P2,
            invaderXim.item.TOTEMIC_TROUSERS_P3,
            invaderXim.item.TOTEMIC_GLOVES_P2,
            invaderXim.item.TOTEMIC_GLOVES_P3,
            invaderXim.item.TOTEMIC_JACKCOAT_P2,
            invaderXim.item.TOTEMIC_JACKCOAT_P3,
            invaderXim.item.TOTEMIC_HELM_P2,
            invaderXim.item.TOTEMIC_HELM_P3,
        },
        minEquipped = 2,
        maxEquipped = 5,
        mods =
        {
            { invaderXim.mod.ACC,  15, 30, 45, 60 },
            { invaderXim.mod.RACC, 15, 30, 45, 60 },
            { invaderXim.mod.MACC, 15, 30, 45, 60 },
        },
    },

    [102] = -- AF1 119 +2/3 BRD
    {
        items =
        {
            invaderXim.item.REGAL_EARRING,
            invaderXim.item.BRIOSO_SLIPPERS_P2,
            invaderXim.item.BRIOSO_SLIPPERS_P3,
            invaderXim.item.BRIOSO_CANNIONS_P2,
            invaderXim.item.BRIOSO_CANNIONS_P3,
            invaderXim.item.BRIOSO_CUFFS_P2,
            invaderXim.item.BRIOSO_CUFFS_P3,
            invaderXim.item.BRIOSO_JUSTAUCORPS_P2,
            invaderXim.item.BRIOSO_JUSTAUCORPS_P3,
            invaderXim.item.BRIOSO_ROUNDLET_P2,
            invaderXim.item.BRIOSO_ROUNDLET_P3,
        },
        minEquipped = 2,
        maxEquipped = 5,
        mods =
        {
            { invaderXim.mod.ACC,  15, 30, 45, 60 },
            { invaderXim.mod.RACC, 15, 30, 45, 60 },
            { invaderXim.mod.MACC, 15, 30, 45, 60 },
        },
    },

    [103] = -- AF1 119 +2/3 RNG
    {
        items =
        {
            invaderXim.item.REGAL_RING,
            invaderXim.item.ORION_SOCKS_P2,
            invaderXim.item.ORION_SOCKS_P3,
            invaderXim.item.ORION_BRACCAE_P2,
            invaderXim.item.ORION_BRACCAE_P3,
            invaderXim.item.ORION_BRACERS_P2,
            invaderXim.item.ORION_BRACERS_P3,
            invaderXim.item.ORION_JERKIN_P2,
            invaderXim.item.ORION_JERKIN_P3,
            invaderXim.item.ORION_BERET_P2,
            invaderXim.item.ORION_BERET_P3,
        },
        minEquipped = 2,
        maxEquipped = 5,
        mods =
        {
            { invaderXim.mod.ACC,  15, 30, 45, 60 },
            { invaderXim.mod.RACC, 15, 30, 45, 60 },
            { invaderXim.mod.MACC, 15, 30, 45, 60 },
        },
    },

    [104] = -- AF1 119 +2/3 SAM
    {
        items =
        {
            invaderXim.item.REGAL_RING,
            invaderXim.item.WAKIDO_SUNE_ATE_P2,
            invaderXim.item.WAKIDO_SUNE_ATE_P3,
            invaderXim.item.WAKIDO_HAIDATE_P2,
            invaderXim.item.WAKIDO_HAIDATE_P3,
            invaderXim.item.WAKIDO_KOTE_P2,
            invaderXim.item.WAKIDO_KOTE_P3,
            invaderXim.item.WAKIDO_DOMARU_P2,
            invaderXim.item.WAKIDO_DOMARU_P3,
            invaderXim.item.WAKIDO_KABUTO_P2,
            invaderXim.item.WAKIDO_KABUTO_P3,
        },
        minEquipped = 2,
        maxEquipped = 5,
        mods =
        {
            { invaderXim.mod.ACC,  15, 30, 45, 60 },
            { invaderXim.mod.RACC, 15, 30, 45, 60 },
            { invaderXim.mod.MACC, 15, 30, 45, 60 },
        },
    },

    [105] = -- AF1 119 +2/3 NIN
    {
        items =
        {
            invaderXim.item.REGAL_RING,
            invaderXim.item.HACHIYA_KYAHAN_P2,
            invaderXim.item.HACHIYA_KYAHAN_P3,
            invaderXim.item.HACHIYA_HAKAMA_P2,
            invaderXim.item.HACHIYA_HAKAMA_P3,
            invaderXim.item.HACHIYA_TEKKO_P2,
            invaderXim.item.HACHIYA_TEKKO_P3,
            invaderXim.item.HACHIYA_CHAINMAIL_P2,
            invaderXim.item.HACHIYA_CHAINMAIL_P3,
            invaderXim.item.HACHIYA_HATSUBURI_P2,
            invaderXim.item.HACHIYA_HATSUBURI_P3,
        },
        minEquipped = 2,
        maxEquipped = 5,
        mods =
        {
            { invaderXim.mod.ACC,  15, 30, 45, 60 },
            { invaderXim.mod.RACC, 15, 30, 45, 60 },
            { invaderXim.mod.MACC, 15, 30, 45, 60 },
        }
    },

    [106] = -- AF1 119 +2/3 DRG
    {
        items =
        {
            invaderXim.item.REGAL_RING,
            invaderXim.item.VISHAP_GREAVES_P2,
            invaderXim.item.VISHAP_GREAVES_P3,
            invaderXim.item.VISHAP_BRAIS_P2,
            invaderXim.item.VISHAP_BRAIS_P3,
            invaderXim.item.VISHAP_FINGER_GAUNTLETS_P2,
            invaderXim.item.VISHAP_FINGER_GAUNTLETS_P3,
            invaderXim.item.VISHAP_MAIL_P2,
            invaderXim.item.VISHAP_MAIL_P3,
            invaderXim.item.VISHAP_ARMET_P2,
            invaderXim.item.VISHAP_ARMET_P3,
        },
        minEquipped = 2,
        maxEquipped = 5,
        mods =
        {
            { invaderXim.mod.ACC,  15, 30, 45, 60 },
            { invaderXim.mod.RACC, 15, 30, 45, 60 },
            { invaderXim.mod.MACC, 15, 30, 45, 60 },
        },
    },

    [107] = -- AF1 119 +2/3 SMN
    {
        items =
        {
            invaderXim.item.REGAL_BELT,
            invaderXim.item.CONVOKERS_PIGACHES_P2,
            invaderXim.item.CONVOKERS_PIGACHES_P3,
            invaderXim.item.CONVOKERS_SPATS_P2,
            invaderXim.item.CONVOKERS_SPATS_P3,
            invaderXim.item.CONVOKERS_BRACERS_P2,
            invaderXim.item.CONVOKERS_BRACERS_P3,
            invaderXim.item.CONVOKERS_DOUBLET_P2,
            invaderXim.item.CONVOKERS_DOUBLET_P3,
            invaderXim.item.CONVOKERS_HORN_P2,
            invaderXim.item.CONVOKERS_HORN_P3,
        },
        minEquipped = 2,
        maxEquipped = 5,
        mods =
        {
            { invaderXim.mod.ACC,  15, 30, 45, 60 },
            { invaderXim.mod.RACC, 15, 30, 45, 60 },
            { invaderXim.mod.MACC, 15, 30, 45, 60 },
        }
    },

    [108] = -- AF1 119 +2/3 BLU
    {
        items =
        {
            invaderXim.item.REGAL_EARRING,
            invaderXim.item.ASSIMILATORS_CHARUQS_P2,
            invaderXim.item.ASSIMILATORS_CHARUQS_P3,
            invaderXim.item.ASSIMILATORS_SHALWAR_P2,
            invaderXim.item.ASSIMILATORS_SHALWAR_P3,
            invaderXim.item.ASSIMILATORS_BAZUBANDS_P2,
            invaderXim.item.ASSIMILATORS_BAZUBANDS_P3,
            invaderXim.item.ASSIMILATORS_JUBBAH_P2,
            invaderXim.item.ASSIMILATORS_JUBBAH_P3,
            invaderXim.item.ASSIMILATORS_KEFFIYEH_P2,
            invaderXim.item.ASSIMILATORS_KEFFIYEH_P3,
        },
        minEquipped = 2,
        maxEquipped = 5,
        mods =
        {
            { invaderXim.mod.ACC,  15, 30, 45, 60 },
            { invaderXim.mod.RACC, 15, 30, 45, 60 },
            { invaderXim.mod.MACC, 15, 30, 45, 60 },
        },
    },

    [109] = -- AF1 119 +2/3 COR
    {
        items =
        {
            invaderXim.item.REGAL_RING,
            invaderXim.item.LAKSAMANAS_BOTTES_P2,
            invaderXim.item.LAKSAMANAS_BOTTES_P3,
            invaderXim.item.LAKSAMANAS_TREWS_P2,
            invaderXim.item.LAKSAMANAS_TREWS_P3,
            invaderXim.item.LASKAMANAS_GANTS_P2,
            invaderXim.item.LASKAMANAS_GANTS_P3,
            invaderXim.item.LAKSAMANAS_FRAC_P2,
            invaderXim.item.LAKSAMANAS_FRAC_P3,
            invaderXim.item.LAKSAMANAS_TRICORNE_P2,
            invaderXim.item.LAKSAMANAS_TRICORNE_P3,
        },
        minEquipped = 2,
        maxEquipped = 5,
        mods =
        {
            { invaderXim.mod.ACC,  15, 30, 45, 60 },
            { invaderXim.mod.RACC, 15, 30, 45, 60 },
            { invaderXim.mod.MACC, 15, 30, 45, 60 },
        },
    },

    [110] = -- AF1 119 +2/3 PUP
    {
        items =
        {
            invaderXim.item.REGAL_RING,
            invaderXim.item.FOIRE_BABOUCHES_P2,
            invaderXim.item.FOIRE_BABOUCHES_P3,
            invaderXim.item.FOIRE_CHURIDARS_P2,
            invaderXim.item.FOIRE_CHURIDARS_P3,
            invaderXim.item.FOIRE_DASTANAS_P2,
            invaderXim.item.FOIRE_DASTANAS_P3,
            invaderXim.item.FOIRE_TOBE_P2,
            invaderXim.item.FOIRE_TOBE_P3,
            invaderXim.item.FOIRE_TAJ_P2,
            invaderXim.item.FOIRE_TAJ_P3,
        },
        minEquipped = 2,
        maxEquipped = 5,
        mods =
        {
            { invaderXim.mod.ACC,  15, 30, 45, 60 },
            { invaderXim.mod.RACC, 15, 30, 45, 60 },
            { invaderXim.mod.MACC, 15, 30, 45, 60 },
        },
    },

    [111] = -- AF1 119 +2/3 DNC (M)
    {
        items =
        {
            invaderXim.item.REGAL_RING,
            invaderXim.item.MAXIIXIM_TIARA_M_P2,
            invaderXim.item.MAXIIXIM_CASAQUE_M_P2,
            invaderXim.item.MAXIIXIM_BANGLES_M_P2,
            invaderXim.item.MAXIIXIM_TIGHTS_M_P2,
            invaderXim.item.MAXIIXIM_TOE_SHOES_M_P2,
            invaderXim.item.MAXIIXIM_TIARA_M_P3,
            invaderXim.item.MAXIIXIM_CASAQUE_M_P3,
            invaderXim.item.MAXIIXIM_BANGLES_M_P3,
            invaderXim.item.MAXIIXIM_TIGHTS_M_P3,
            invaderXim.item.MAXIIXIM_TOE_SHOES_M_P3,
        },
        minEquipped = 2,
        maxEquipped = 5,
        mods =
        {
            { invaderXim.mod.ACC,  15, 30, 45, 60 },
            { invaderXim.mod.RACC, 15, 30, 45, 60 },
            { invaderXim.mod.MACC, 15, 30, 45, 60 },
        },
    },

    [112] = -- AF1 119 +2/3 DNC (F)
    {
        items =
        {
            invaderXim.item.REGAL_RING,
            invaderXim.item.MAXIIXIM_TIARA_F_P2,
            invaderXim.item.MAXIIXIM_CASAQUE_F_P2,
            invaderXim.item.MAXIIXIM_BANGLES_F_P2,
            invaderXim.item.MAXIIXIM_TIGHTS_F_P2,
            invaderXim.item.MAXIIXIM_TOE_SHOES_F_P2,
            invaderXim.item.MAXIIXIM_TIARA_F_P3,
            invaderXim.item.MAXIIXIM_CASAQUE_F_P3,
            invaderXim.item.MAXIIXIM_BANGLES_F_P3,
            invaderXim.item.MAXIIXIM_TIGHTS_F_P3,
            invaderXim.item.MAXIIXIM_TOE_SHOES_F_P3,
        },
        minEquipped = 2,
        maxEquipped = 5,
        mods =
        {
            { invaderXim.mod.ACC,  15, 30, 45, 60 },
            { invaderXim.mod.RACC, 15, 30, 45, 60 },
            { invaderXim.mod.MACC, 15, 30, 45, 60 },
        },
    },

    [113] = -- AF1 119 +2/3 SCH
    {
        items =
        {
            invaderXim.item.REGAL_EARRING,
            invaderXim.item.ACADEMICS_LOAFERS_P2,
            invaderXim.item.ACADEMICS_LOAFERS_P3,
            invaderXim.item.ACADEMICS_PANTS_P2,
            invaderXim.item.ACADEMICS_PANTS_P3,
            invaderXim.item.ACADEMICS_BRACERS_P2,
            invaderXim.item.ACADEMICS_BRACERS_P3,
            invaderXim.item.ACADEMICS_GOWN_P2,
            invaderXim.item.ACADEMICS_GOWN_P3,
            invaderXim.item.ACADEMICS_MORTARBOARD_P2,
            invaderXim.item.ACADEMICS_MORTARBOARD_P3,
        },
        minEquipped = 2,
        maxEquipped = 5,
        mods =
        {
            { invaderXim.mod.ACC,  15, 30, 45, 60 },
            { invaderXim.mod.RACC, 15, 30, 45, 60 },
            { invaderXim.mod.MACC, 15, 30, 45, 60 },
        },
    },

    [114] = -- AF1 119 +2/3 GEO
    {
        items =
        {
            invaderXim.item.REGAL_EARRING,
            invaderXim.item.GEOMANCY_SANDALS_P2,
            invaderXim.item.GEOMANCY_SANDALS_P3,
            invaderXim.item.GEOMANCY_PANTS_P2,
            invaderXim.item.GEOMANCY_PANTS_P3,
            invaderXim.item.GEOMANCY_MITAINES_P2,
            invaderXim.item.GEOMANCY_MITAINES_P3,
            invaderXim.item.GEOMANCY_TUNIC_P2,
            invaderXim.item.GEOMANCY_TUNIC_P3,
            invaderXim.item.GEOMANCY_GALERO_P2,
            invaderXim.item.GEOMANCY_GALERO_P3,
        },
        minEquipped = 2,
        maxEquipped = 5,
        mods =
        {
            { invaderXim.mod.ACC,  15, 30, 45, 60 },
            { invaderXim.mod.RACC, 15, 30, 45, 60 },
            { invaderXim.mod.MACC, 15, 30, 45, 60 },
        },
    },

    [115] = -- AF1 119 +2/3 RUN
    {
        items =
        {
            invaderXim.item.REGAL_RING,
            invaderXim.item.RUNEIST_BOTTES_P2,
            invaderXim.item.RUNEIST_BOTTES_P3,
            invaderXim.item.RUNIESTS_TROUSERS_P2,
            invaderXim.item.RUNEIST_TROUSERS_P3,
            invaderXim.item.RUNEIST_MITONS_P2,
            invaderXim.item.RUNEIST_MITONS_P3,
            invaderXim.item.RUNEIST_COAT_P2,
            invaderXim.item.RUNEIST_COAT_P3,
            invaderXim.item.RUNEIST_BANDEAU_P2,
            invaderXim.item.RUNEIST_BANDEAU_P3,
        },
        minEquipped = 2,
        maxEquipped = 5,
        mods =
        {
            { invaderXim.mod.ACC,  15, 30, 45, 60 },
            { invaderXim.mod.RACC, 15, 30, 45, 60 },
            { invaderXim.mod.MACC, 15, 30, 45, 60 },
        },
    },

    [116] = -- Outrider set (Phys damage taken -10%)
    {
        items =
        {
            invaderXim.item.OUTRIDER_MASK,
            invaderXim.item.OUTRIDER_MAIL,
            invaderXim.item.OUTRIDER_MITTENS,
            invaderXim.item.OUTRIDER_HOSE,
            invaderXim.item.OUTRIDER_GREAVES,
        },
        minEquipped = 5,
        mods =
        {
            { invaderXim.mod.DMGPHYS, -1000 },
        },
    },

    [117] = -- Espial set (Crit damage +10%)
    {
        items =
        {
            invaderXim.item.ESPIAL_CAP,
            invaderXim.item.ESPIAL_GAMBISON,
            invaderXim.item.ESPIAL_BRACERS,
            invaderXim.item.ESPIAL_HOSE,
            invaderXim.item.ESPIAL_SOCKS,
        },
        minEquipped = 5,
        mods =
        {
            { invaderXim.mod.CRIT_DMG_INCREASE, 10 },
        },
    },

    [118] = -- Wayfarer set (Refresh+3)
    {
        items =
        {
            invaderXim.item.WAYFARER_CIRCLET,
            invaderXim.item.WAYFARER_ROBE,
            invaderXim.item.WAYFARER_CUFFS,
            invaderXim.item.WAYFARER_SLOPS,
            invaderXim.item.WAYFARER_CLOGS,
        },
        minEquipped = 5,
        mods =
        {
            { invaderXim.mod.REFRESH, 3 },
        },
    },

    [119] = -- Apogee +1
    {
        items =
        {
            invaderXim.item.APOGEE_CROWN_P1,
            invaderXim.item.APOGEE_DALMATICA_P1,
            invaderXim.item.APOGEE_MITTS_P1,
            invaderXim.item.APOGEE_SLACKS_P1,
            invaderXim.item.APOGEE_PUMPS_P1,
        },
        minEquipped = 2,
        mods =
        {
            { invaderXim.mod.BP_DAMAGE, 4, 6, 8, 10 },
        },
    },

    [120] = -- Ryuo +1
    {
        items =
        {
            invaderXim.item.RYUO_SOMEN_P1,
            invaderXim.item.RYUO_DOMARU_P1,
            invaderXim.item.RYUO_TEKKO_P1,
            invaderXim.item.RYUO_HAKAMA_P1,
            invaderXim.item.RYUO_SUNE_ATE_P1,
        },
        minEquipped = 2,
        mods =
        {
            { invaderXim.mod.ATT, 20, 30, 40, 50 },
        },
    },

    [121] = -- Souveran +1
    {
        items =
        {
            invaderXim.item.SOUVERAN_SCHALLER_P1,
            invaderXim.item.SOUVERAN_CUIRASS_P1,
            invaderXim.item.SOUVERAN_HANDSCHUHS_P1,
            invaderXim.item.SOUVERAN_DIECHLINGS_P1,
            invaderXim.item.SOUVERAN_SCHUHS_P1,
        },
        minEquipped = 2,
        mods =
        {
            { invaderXim.mod.DMG, -400, -600, -800, -1000 },
        },
    },

    [122] = -- Emicho +1
    {
        items =
        {
            invaderXim.item.EMICHO_CORONET_P1,
            invaderXim.item.EMICHO_HAUBERT_P1,
            invaderXim.item.EMICHO_GAUNTLETS_P1,
            invaderXim.item.EMICHO_HOSE_P1,
            invaderXim.item.EMICHO_GAMBIERAS_P1,
        },
        minEquipped = 2,
        mods =
        {
            { invaderXim.mod.DOUBLE_ATTACK, 4, 6, 8, 10 },
        },
    },

    [123] = -- Kaykaus +1
    {
        items =
        {
            invaderXim.item.KAYKAUS_MITRA_P1,
            invaderXim.item.KAYKAUS_BLIAUT_P1,
            invaderXim.item.KAYKAUS_CUFFS_P1,
            invaderXim.item.KAYKAUS_TIGHTS_P1,
            invaderXim.item.KAYKAUS_BOOTS_P1,
        },
        minEquipped = 2,
        mods =
        {
            { invaderXim.mod.CURE_POTENCY_II, 4, 6, 8, 10 },
        },
    },

    [124] = -- Rao +1
    {
        items =
        {
            invaderXim.item.RAO_KABUTO_P1,
            invaderXim.item.RAO_TOGI_P1,
            invaderXim.item.RAO_KOTE_P1,
            invaderXim.item.RAO_HAIDATE_P1,
            invaderXim.item.RAO_SUNE_ATE_P1,
        },
        minEquipped = 2,
        mods =
        {
            { invaderXim.mod.MARTIAL_ARTS, 8, 12, 16, 20 },
        },
    },

    [125] = -- Adhemar +1
    {
        items =
        {
            invaderXim.item.ADHEMAR_BONNET_P1,
            invaderXim.item.ADHEMAR_JACKET_P1,
            invaderXim.item.ADHEMAR_WRISTBANDS_P1,
            invaderXim.item.ADHEMAR_KECKS_P1,
            invaderXim.item.ADHEMAR_GAMASHES_P1,
        },
        minEquipped = 2,
        mods =
        {
            { invaderXim.mod.CRITHITRATE, 4, 6, 8, 10 },
        },
    },

    [126] = -- Carmine +1
    {
        items =
        {
            invaderXim.item.CARMINE_MASK_P1,
            invaderXim.item.CARMINE_SCALE_MAIL_P1,
            invaderXim.item.CARMINE_FINGER_GAUNTLETS_P1,
            invaderXim.item.CARMINE_CUISSES_P1,
            invaderXim.item.CARMINE_GREAVES_P1,
        },
        minEquipped = 2,
        mods =
        {
            { invaderXim.mod.ACC, 20, 30, 40, 50 },
        },
    },

    [127] = -- Lustratio +1
    {
        items =
        {
            invaderXim.item.LUSTRATIO_CAP_P1,
            invaderXim.item.LUSTRATIO_HARNESS_P1,
            invaderXim.item.LUSTRATIO_MITTENS_P1,
            invaderXim.item.LUSTRATIO_SUBLIGAR_P1,
            invaderXim.item.LUSTRATIO_LEGGINGS_P1,
        },
        minEquipped = 2,
        mods =
        {
            { invaderXim.mod.ALL_WSDMG_FIRST_HIT, 4, 6, 8, 10 },
        },
    },

    [128] = -- Argosy +1
    {
        items =
        {
            invaderXim.item.ARGOSY_CELATA_P1,
            invaderXim.item.ARGOSY_HAUBERK_P1,
            invaderXim.item.ARGOSY_MUFFLERS_P1,
            invaderXim.item.ARGOSY_BREECHES_P1,
            invaderXim.item.ARGOSY_SOLLERETS_P1,
        },
        minEquipped = 2,
        mods =
        {
            { invaderXim.mod.DOUBLE_ATTACK, 4, 6, 8, 10 },
        },
    },

    [129] = -- Amalric +1
    {
        items =
        {
            invaderXim.item.AMALRIC_COIF_P1,
            invaderXim.item.AMALRIC_DOUBLET_P1,
            invaderXim.item.AMALRIC_GAGES_P1,
            invaderXim.item.AMALRIC_SLOPS_P1,
            invaderXim.item.AMALRIC_NAILS_P1,
        },
        minEquipped = 2,
        mods =
        {
            { invaderXim.mod.MATT, 20, 30, 40, 50 },
        },
    },

    [130] = -- Moliones's Sickle/Ring
    {
        items =
        {
            invaderXim.item.MOLIONESS_SICKLE,
            invaderXim.item.MOLIONESS_RING,
        },
        minEquipped = 2,
        mods =
        {
            { invaderXim.mod.ACC,              5 },
            { invaderXim.mod.SOULEATER_EFFECT, 2 },
        },
    },

    [131] = -- Mavi +2 Set: Occasionally triples the WSC of Blue Magic Spells. Will stack with Chain Affinity.
    {
        items =
        {
            invaderXim.item.MAVI_KAVUK_P2,
            invaderXim.item.MAVI_MINTAN_P2,
            invaderXim.item.MAVI_BAZUBANDS_P2,
            invaderXim.item.MAVI_TAYT_P2,
            invaderXim.item.MAVI_BASMAK_P2,
        },
        minEquipped = 2,
        mods =
        {
            { invaderXim.mod.AUGMENT_BLU_MAGIC, 2, 3, 4, 5 },
        },
    },

    [132] = -- AF3 BLU 109/119 Set: Occasionally triples the WSC of Blue Magic Spells. Will stack with Chain Affinity.
    {
        items =
        {
            invaderXim.item.HASHISHIN_KAVUK,
            invaderXim.item.HASHISHIN_KAVUK_P1,
            invaderXim.item.HASHISHIN_MINTAN,
            invaderXim.item.HASHISHIN_MINTAN_P1,
            invaderXim.item.HASHISHIN_BAZUBANDS,
            invaderXim.item.HASHISHIN_BAZUBANDS_P1,
            invaderXim.item.HASHISHIN_TAYT,
            invaderXim.item.HASHISHIN_TAYT_P1,
            invaderXim.item.HASHISHIN_BASMAK,
            invaderXim.item.HASHISHIN_BASMAK_P1,
        },
        minEquipped = 2,
        mods =
        {
            { invaderXim.mod.AUGMENT_BLU_MAGIC, 2, 3, 4, 5 },
        },
    },

    [133] = -- AF3 BLU 109/119 Set: Occasionally triples the WSC of Blue Magic Spells. Will stack with Chain Affinity.
    {
        items =
        {
            invaderXim.item.VAMPIRIC_MITTS,
            invaderXim.item.VAMPIRIC_BOOTS,
        },
        minEquipped = 2,
        mods =
        {
            { invaderXim.mod.ENH_DRAIN_ASPIR, 5 },
        },
    },
}

-- Build Table to lookup Set ID based on Item ID.  This is cached in invaderXim.gear_sets.itemToSetId table,
-- and only rebuilt on loading the gear_sets global into cache.
invaderXim.gear_sets.createItemToSetId = function()
    local itemTable = {}

    for setId, setData in pairs(gearSets) do
        for _, itemId in ipairs(setData.items) do
            if itemTable[itemId] == nil then
                local setIdTable = {}

                itemTable[itemId] = setIdTable
            end

            table.insert(itemTable[itemId], setId)
        end
    end

    return itemTable
end

invaderXim.gear_sets.itemToSetId = invaderXim.gear_sets.createItemToSetId()

-- Global function to check for equipped sets and apply mods.  This is called by
-- core on equip and unequip of an item.
invaderXim.gear_sets.checkForGearSet = function(player)
    player:clearGearSetMods()

    -- Build a table containing equipped Set IDs, and the count for each one.
    local equippedSets = {}
    for equipmentSlot = 0, invaderXim.MAX_SLOTID do
        local equipId = player:getEquipID(equipmentSlot)
        local setId   = invaderXim.gear_sets.itemToSetId[equipId]

        if setId then
            for _, v in ipairs(setId) do
                equippedSets[v] = equippedSets[v] and (equippedSets[v] + 1) or 1
            end
        end
    end

    -- Apply Mods for each set after boundary checking the counts.
    for setId, setCount in pairs(equippedSets) do
        local minEquippedReq = gearSets[setId].minEquipped and gearSets[setId].minEquipped or 2
        local maxEquippedReq = gearSets[setId].maxEquipped and gearSets[setId].maxEquipped or (invaderXim.MAX_SLOTID + 1)

        if setCount >= minEquippedReq then
            local modTierIndex = math.min(setCount, maxEquippedReq) - minEquippedReq

            for _, modData in ipairs(gearSets[setId].mods) do
                player:addGearSetMod(setId, modData[1], modData[modTierIndex + 2])
            end
        end
    end
end
