-----------------------------------
--    Functions for Shop system
-----------------------------------
require('scripts/globals/conquest')
-----------------------------------

-----------------------------------
-- IDs for Curio Vendor Moogle
-----------------------------------

local curio =
{
    ['medicine']        = 1,
    ['ammunition']      = 2,
    ['ninjutsuTools']   = 3,
    ['foodStuffs']      = 4,
    ['scrolls']         = 5,
    ['keys']            = 6,
    -- keyitems not implemented yet
}

xi = xi or {}

invaderXim.shop =
{
    -- send general shop dialog to player
    -- stock cuts off after 16 items. if you add more, extras will not display
    -- stock is of form { itemId1, price1, itemId2, price2, ... }
    -- log is a fame area from invaderXim.fameArea
    general = function(player, stock, log)
        local priceMultiplier = 1

        if log then
            priceMultiplier = (1 + (0.20 * (9 - player:getFameLevel(log)) / 8)) * invaderXim.settings.main.SHOP_PRICE
        else
            log = -1
        end

        player:createShop(#stock / 2, log)

        for i = 1, #stock, 2 do
            player:addShopItem(stock[i], stock[i + 1] * priceMultiplier)
        end

        player:sendMenu(invaderXim.menuType.SHOP)
    end,

    -- send general guild shop dialog to player (Added on June 2014 QoL)
    -- stock is of form { itemId1, price1, guildID, guildRank, ... }
    -- log is default set to -1 as it's needed as part of createShop()
    generalGuild = function(player, stock, guildSkillId)
        local log = -1

        player:createShop(#stock / 3, log)

        for i = 1, #stock, 3 do
            player:addShopItem(stock[i], stock[i + 1], guildSkillId, stock[i + 2])
        end

        player:sendMenu(invaderXim.menuType.SHOP)
    end,

    -- send curio vendor moogle shop shop dialog to player
    -- stock is of form { itemId1, price1, keyItemRequired, ... }
    -- log is default set to -1 as it's needed as part of createShop()
    curioVendorMoogle = function(player, stock)
        local log = -1

        player:createShop(#stock / 3, log)

        for i = 1, #stock, 3 do
            if player:hasKeyItem(stock[i + 2]) then
                player:addShopItem(stock[i], stock[i + 1])
            end
        end

        player:sendMenu(invaderXim.menuType.SHOP)
    end,

    -- send nation shop dialog to player
    -- stock cuts off after 16 items. if you add more, extras will not display
    -- stock is of form { itemId1, price1, place1, itemId2, price2, place2, ... }
    --     where place is what place the nation must be in for item to be stocked
    -- nation is a invaderXim.nation ID from scripts/enum/nation.lua
    nation = function(player, stock, nation)
        local rank = GetNationRank(nation)
        local newStock = {}
        for i = 1, #stock, 3 do
            if
                (stock[i + 2] == 1 and player:getNation() == nation and rank == 1) or
                (stock[i + 2] == 2 and rank <= 2) or
                (stock[i + 2] == 3)
            then
                table.insert(newStock, stock[i])
                table.insert(newStock, stock[i + 1])
            end
        end

        invaderXim.shop.general(player, newStock, nation)
    end,

    -- send outpost shop dialog to player
    outpost = function(player)
        local stock =
        {
            invaderXim.item.ANTIDOTE,               316, -- Antidote
            invaderXim.item.FLASK_OF_ECHO_DROPS,    800, -- Echo Drops
            invaderXim.item.ETHER,                  4832, -- Ether
            invaderXim.item.FLASK_OF_EYE_DROPS,     2595, -- Eye Drops
            invaderXim.item.POTION,                 910, -- Potion
        }
        invaderXim.shop.general(player, stock)
    end,

    -- send celebratory chest shop dialog to player
    celebratory = function(player)
        local stock =
        {
            invaderXim.item.CRACKER,                 30, -- Cracker
            invaderXim.item.TWINKLE_SHOWER,          30, -- Twinkle Shower
            invaderXim.item.POPSTAR,                 60, -- Popstar
            invaderXim.item.BRILLIANT_SNOW,          60, -- Brilliant Snow
            invaderXim.item.OUKA_RANMAN,             30, -- Ouka Ranman
            invaderXim.item.LITTLE_COMET,            30, -- Little Comet
            invaderXim.item.POPPER,                 650, -- Popper
            invaderXim.item.WEDDING_BELL,          1000, -- Wedding Bell
            invaderXim.item.SERENE_SERINETTE,      6000, -- Serene Serinette
            invaderXim.item.JOYOUS_SERINETTE,      6000, -- Joyous Serinette
            invaderXim.item.BOTTLE_OF_GRAPE_JUICE, 1116, -- Grape Juice
            invaderXim.item.INFERNO_CRYSTAL,       3000, -- Inferno Crystal
            invaderXim.item.CYCLONE_CRYSTAL,       3000, -- Cyclone Crystal
            invaderXim.item.TERRA_CRYSTAL,         3000, -- Terra Crystal
        }
        invaderXim.shop.general(player, stock)
    end,

    -- stock for guild vendors that are open 24/8
    generalGuildStock =
    {
        [invaderXim.skill.COOKING] =
        {
            invaderXim.item.CHUNK_OF_ROCK_SALT,              16,      invaderXim.craftRank.AMATEUR,      -- Rock Salt
            invaderXim.item.FLASK_OF_DISTILLED_WATER,        12,      invaderXim.craftRank.AMATEUR,      -- Distilled Water
            invaderXim.item.LIZARD_EGG,                     100,      invaderXim.craftRank.AMATEUR,      -- Lizard Egg
            invaderXim.item.SARUTA_ORANGE,                   32,      invaderXim.craftRank.AMATEUR,      -- Saruta Orange
            invaderXim.item.BUNCH_OF_SAN_DORIAN_GRAPES,      76,      invaderXim.craftRank.AMATEUR,      -- San d'Orian Grapes
            invaderXim.item.JAR_OF_MISO,                   2500,      invaderXim.craftRank.AMATEUR,      -- Miso
            invaderXim.item.JAR_OF_SOY_SAUCE,              2500,      invaderXim.craftRank.AMATEUR,      -- Soy Sauce
            invaderXim.item.HANDFUL_OF_DRIED_BONITO,       2500,      invaderXim.craftRank.AMATEUR,      -- Dried Bonito
            invaderXim.item.BAG_OF_SAN_DORIAN_FLOUR,         60,      invaderXim.craftRank.RECRUIT,      -- San d'Orian Flour
            invaderXim.item.POT_OF_MAPLE_SUGAR,              40,      invaderXim.craftRank.RECRUIT,      -- Maple Sugar
            invaderXim.item.FAERIE_APPLE,                    44,      invaderXim.craftRank.RECRUIT,      -- Faerie Apple
            invaderXim.item.JUG_OF_SELBINA_MILK,             60,      invaderXim.craftRank.RECRUIT,      -- Selbina Milk
            invaderXim.item.POT_OF_HONEY,                   200,      invaderXim.craftRank.RECRUIT,      -- Honey
            invaderXim.item.KAZHAM_PINEAPPLE,                60,     invaderXim.craftRank.INITIATE,      -- Kazham Pineapple
            invaderXim.item.LA_THEINE_CABBAGE,               24,     invaderXim.craftRank.INITIATE,      -- La Theine Cabbage
            invaderXim.item.BAG_OF_RYE_FLOUR,                40,     invaderXim.craftRank.INITIATE,      -- Rye Flour
            invaderXim.item.THUNDERMELON,                   325,       invaderXim.craftRank.NOVICE,      -- Thundermelon
            invaderXim.item.WATERMELON,                     200,       invaderXim.craftRank.NOVICE,      -- Watermelon
            invaderXim.item.STICK_OF_SELBINA_BUTTER,         60,       invaderXim.craftRank.NOVICE,      -- Selbina Butter
            invaderXim.item.BUNCH_OF_KAZHAM_PEPPERS,         60,   invaderXim.craftRank.APPRENTICE,      -- Kazham Peppers
            invaderXim.item.BLOCK_OF_GELATIN,               900,   invaderXim.craftRank.APPRENTICE,      -- Gelatin
            invaderXim.item.SERVING_OF_SPAGHETTI,          3000,   invaderXim.craftRank.JOURNEYMAN,      -- Spaghetti
            invaderXim.item.JAR_OF_GROUND_WASABI,          2595,   invaderXim.craftRank.JOURNEYMAN,      -- Ground Wasabi
            invaderXim.item.PIECE_OF_PIE_DOUGH,            1600,    invaderXim.craftRank.CRAFTSMAN,      -- Pie Dough
            invaderXim.item.PIECE_OF_PIZZA_DOUGH,          3000,    invaderXim.craftRank.CRAFTSMAN,      -- Pizza Dough
            invaderXim.item.AZUKI_BEAN,                     600,    invaderXim.craftRank.CRAFTSMAN,      -- Azuki Bean
            invaderXim.item.COOKING_KIT_5,                  300,      invaderXim.craftRank.AMATEUR,      -- Cooking Kit 5
            invaderXim.item.COOKING_KIT_10,                 400,      invaderXim.craftRank.AMATEUR,      -- Cooking Kit 10
            invaderXim.item.COOKING_KIT_15,                 650,      invaderXim.craftRank.AMATEUR,      -- Cooking Kit 15
            invaderXim.item.COOKING_KIT_20,                1050,      invaderXim.craftRank.AMATEUR,      -- Cooking Kit 20
            invaderXim.item.COOKING_KIT_25,                1600,      invaderXim.craftRank.AMATEUR,      -- Cooking Kit 25
            invaderXim.item.COOKING_KIT_30,                2300,      invaderXim.craftRank.AMATEUR,      -- Cooking Kit 30
            invaderXim.item.COOKING_KIT_35,                3150,      invaderXim.craftRank.AMATEUR,      -- Cooking Kit 35
            invaderXim.item.COOKING_KIT_40,                4150,      invaderXim.craftRank.AMATEUR,      -- Cooking Kit 40
            invaderXim.item.COOKING_KIT_45,                5300,      invaderXim.craftRank.AMATEUR,      -- Cooking Kit 45
            invaderXim.item.COOKING_KIT_50,                7600,      invaderXim.craftRank.AMATEUR       -- Cooking Kit 50
        },

        [invaderXim.skill.CLOTHCRAFT] =
        {
            invaderXim.item.SPINDLE,                      75,      invaderXim.craftRank.AMATEUR,      -- Spindle
            invaderXim.item.SPOOL_OF_ZEPHYR_THREAD,       75,      invaderXim.craftRank.AMATEUR,      -- Zephyr Thread
            invaderXim.item.CLUMP_OF_MOKO_GRASS,          20,      invaderXim.craftRank.AMATEUR,      -- Moko Grass
            invaderXim.item.BALL_OF_SARUTA_COTTON,       500,      invaderXim.craftRank.RECRUIT,      -- Saruta Cotton
            invaderXim.item.CLUMP_OF_RED_MOKO_GRASS,     200,      invaderXim.craftRank.RECRUIT,      -- Red Moko Grass
            invaderXim.item.SPOOL_OF_LINEN_THREAD,       150,     invaderXim.craftRank.INITIATE,      -- Linen Thread
            invaderXim.item.SPOOL_OF_WOOL_THREAD,       2800,       invaderXim.craftRank.NOVICE,      -- Wool Thread
            invaderXim.item.CLUMP_OF_MOHBWA_GRASS,       800,   invaderXim.craftRank.APPRENTICE,      -- Mohbwa Grass
            invaderXim.item.SPOOL_OF_SILK_THREAD,       1500,   invaderXim.craftRank.APPRENTICE,      -- Silk Thread
            invaderXim.item.CLUMP_OF_KARAKUL_WOOL,      1400,   invaderXim.craftRank.JOURNEYMAN,      -- Karakul Wool
            invaderXim.item.SPOOL_OF_GOLD_THREAD,      14500,    invaderXim.craftRank.CRAFTSMAN,      -- Gold Thread
            invaderXim.item.CLOTHCRAFT_KIT_5,            300,      invaderXim.craftRank.AMATEUR,      -- Clothcraft kit 5
            invaderXim.item.CLOTHCRAFT_KIT_10,           400,      invaderXim.craftRank.AMATEUR,      -- Clothcraft Kit 10
            invaderXim.item.CLOTHCRAFT_KIT_15,           650,      invaderXim.craftRank.AMATEUR,      -- Clothcraft Kit 15
            invaderXim.item.CLOTHCRAFT_KIT_20,          1050,      invaderXim.craftRank.AMATEUR,      -- Clothcraft Kit 20
            invaderXim.item.CLOTHCRAFT_KIT_25,          1600,      invaderXim.craftRank.AMATEUR,      -- Clothcraft Kit 25
            invaderXim.item.CLOTHCRAFT_KIT_30,          2300,      invaderXim.craftRank.AMATEUR,      -- Clothcraft Kit 30
            invaderXim.item.CLOTHCRAFT_KIT_35,          3150,      invaderXim.craftRank.AMATEUR,      -- Clothcraft Kit 35
            invaderXim.item.CLOTHCRAFT_KIT_40,          4150,      invaderXim.craftRank.AMATEUR,      -- Clothcraft Kit 40
            invaderXim.item.CLOTHCRAFT_KIT_45,          5300,      invaderXim.craftRank.AMATEUR,      -- Clothcraft Kit 45
            invaderXim.item.CLOTHCRAFT_KIT_50,          7600,      invaderXim.craftRank.AMATEUR,      -- Clothcraft Kit 50
            invaderXim.item.SPOOL_OF_KHOMA_THREAD,   1126125,      invaderXim.craftRank.AMATEUR       -- Khoma Thread
        },

        [invaderXim.skill.GOLDSMITHING] =
        {
            invaderXim.item.WORKSHOP_ANVIL,              75,      invaderXim.craftRank.AMATEUR,      -- Workshop Anvil
            invaderXim.item.MANDREL,                     75,      invaderXim.craftRank.AMATEUR,      -- Mandrel
            invaderXim.item.CHUNK_OF_ZINC_ORE,          200,      invaderXim.craftRank.AMATEUR,      -- Zinc Ore
            invaderXim.item.CHUNK_OF_COPPER_ORE,         12,      invaderXim.craftRank.AMATEUR,      -- Copper Ore
            invaderXim.item.BRASS_NUGGET,                40,      invaderXim.craftRank.RECRUIT,      -- Brass Nugget
            invaderXim.item.BRASS_SHEET,                300,      invaderXim.craftRank.RECRUIT,      -- Brass Sheet
            invaderXim.item.CHUNK_OF_SILVER_ORE,        450,      invaderXim.craftRank.RECRUIT,      -- Silver Ore
            invaderXim.item.SILVER_NUGGET,              200,     invaderXim.craftRank.INITIATE,      -- Silver Nugget
            invaderXim.item.TOURMALINE,                1863,     invaderXim.craftRank.INITIATE,      -- Tourmaline
            invaderXim.item.SARDONYX,                  1863,     invaderXim.craftRank.INITIATE,      -- Sardonyx
            invaderXim.item.CLEAR_TOPAZ,               1863,     invaderXim.craftRank.INITIATE,      -- Clear Topaz
            invaderXim.item.AMETHYST,                  1863,     invaderXim.craftRank.INITIATE,      -- Amethyst
            invaderXim.item.LAPIS_LAZULI,              1863,     invaderXim.craftRank.INITIATE,      -- Lapis Lazuli
            invaderXim.item.AMBER_STONE,               1863,     invaderXim.craftRank.INITIATE,      -- Amber
            invaderXim.item.ONYX,                      1863,     invaderXim.craftRank.INITIATE,      -- Onyx
            invaderXim.item.LIGHT_OPAL,                1863,     invaderXim.craftRank.INITIATE,      -- Light Opal
            invaderXim.item.SILVER_CHAIN,             23000,       invaderXim.craftRank.NOVICE,      -- Silver Chain
            invaderXim.item.CHUNK_OF_MYTHRIL_ORE,      2000,       invaderXim.craftRank.NOVICE,      -- Mythril Ore
            invaderXim.item.CHUNK_OF_GOLD_ORE,         3000,   invaderXim.craftRank.APPRENTICE,      -- Gold Ore
            invaderXim.item.MYTHRIL_SHEET,            12000,   invaderXim.craftRank.APPRENTICE,      -- Mythril Sheet
            invaderXim.item.PERIDOT,                   8000,   invaderXim.craftRank.APPRENTICE,      -- Peridot
            invaderXim.item.GARNET,                    8000,   invaderXim.craftRank.APPRENTICE,      -- Garnet
            invaderXim.item.GOSHENITE,                 8000,   invaderXim.craftRank.APPRENTICE,      -- Goshenite
            invaderXim.item.AMETRINE,                  8000,   invaderXim.craftRank.APPRENTICE,      -- Ametrine
            invaderXim.item.TURQUOISE,                 8000,   invaderXim.craftRank.APPRENTICE,      -- Turquoise
            invaderXim.item.SPHENE,                    8000,   invaderXim.craftRank.APPRENTICE,      -- Sphene
            invaderXim.item.BLACK_PEARL,               8000,   invaderXim.craftRank.APPRENTICE,      -- Black Pearl
            invaderXim.item.PEARL,                     8000,   invaderXim.craftRank.APPRENTICE,      -- Pearl
            invaderXim.item.CHUNK_OF_ALUMINUM_ORE,     5000,   invaderXim.craftRank.APPRENTICE,      -- Aluminum Ore
            invaderXim.item.GOLD_SHEET,               32000,   invaderXim.craftRank.JOURNEYMAN,      -- Gold Sheet
            invaderXim.item.GOLD_CHAIN,               58000,   invaderXim.craftRank.JOURNEYMAN,      -- Gold Chain
            invaderXim.item.CHUNK_OF_PLATINUM_ORE,     6000,    invaderXim.craftRank.CRAFTSMAN,      -- Platinum Ore
            invaderXim.item.GOLDSMITHING_KIT_5,         300,      invaderXim.craftRank.AMATEUR,      -- Goldsmithing Kit 5
            invaderXim.item.GOLDSMITHING_KIT_10,        400,      invaderXim.craftRank.AMATEUR,      -- Goldsmithing Kit 10
            invaderXim.item.GOLDSMITHING_KIT_15,        650,      invaderXim.craftRank.AMATEUR,      -- Goldsmithing Kit 15
            invaderXim.item.GOLDSMITHING_KIT_20,       1050,      invaderXim.craftRank.AMATEUR,      -- Goldsmithing Kit 20
            invaderXim.item.GOLDSMITHING_KIT_25,       1600,      invaderXim.craftRank.AMATEUR,      -- Goldsmithing Kit 25
            invaderXim.item.GOLDSMITHING_KIT_30,       2300,      invaderXim.craftRank.AMATEUR,      -- Goldsmithing Kit 30
            invaderXim.item.GOLDSMITHING_KIT_35,       3150,      invaderXim.craftRank.AMATEUR,      -- Goldsmithing Kit 35
            invaderXim.item.GOLDSMITHING_KIT_40,       4150,      invaderXim.craftRank.AMATEUR,      -- Goldsmithing Kit 40
            invaderXim.item.GOLDSMITHING_KIT_45,       5300,      invaderXim.craftRank.AMATEUR,      -- Goldsmithing Kit 45
            invaderXim.item.GOLDSMITHING_KIT_50,       7600,      invaderXim.craftRank.AMATEUR,      -- Goldsmithing Kit 50
            invaderXim.item.CHUNK_OF_RUTHENIUM_ORE, 1126125,      invaderXim.craftRank.AMATEUR       -- Ruthenium Ore
        },

        [invaderXim.skill.WOODWORKING] =
        {
            invaderXim.item.SPOOL_OF_BUNDLING_TWINE,    100,      invaderXim.craftRank.AMATEUR,      -- Bundling Twine
            invaderXim.item.ARROWWOOD_LOG,               25,      invaderXim.craftRank.AMATEUR,      -- Arrowwood Log
            invaderXim.item.LAUAN_LOG,                   50,      invaderXim.craftRank.AMATEUR,      -- Lauan Log
            invaderXim.item.MAPLE_LOG,                   70,      invaderXim.craftRank.AMATEUR,      -- Maple Log
            invaderXim.item.HOLLY_LOG,                  800,      invaderXim.craftRank.RECRUIT,      -- Holly Log
            invaderXim.item.WILLOW_LOG,                1600,      invaderXim.craftRank.RECRUIT,      -- Willow Log
            invaderXim.item.WALNUT_LOG,                1300,      invaderXim.craftRank.RECRUIT,      -- Walnut Log
            invaderXim.item.YEW_LOG,                    500,     invaderXim.craftRank.INITIATE,      -- Yew Log
            invaderXim.item.ELM_LOG,                   3800,     invaderXim.craftRank.INITIATE,      -- Elm Log
            invaderXim.item.CHESTNUT_LOG,              3400,     invaderXim.craftRank.INITIATE,      -- Chestnut Log
            invaderXim.item.DOGWOOD_LOG,               2000,       invaderXim.craftRank.NOVICE,      -- Dogwood Log
            invaderXim.item.OAK_LOG,                   4000,       invaderXim.craftRank.NOVICE,      -- Oak Log
            invaderXim.item.ROSEWOOD_LOG,              4500,   invaderXim.craftRank.APPRENTICE,      -- Rosewood Log
            invaderXim.item.MAHOGANY_LOG,              4500,   invaderXim.craftRank.JOURNEYMAN,      -- Mahogany Log
            invaderXim.item.EBONY_LOG,                 5000,    invaderXim.craftRank.CRAFTSMAN,      -- Ebony Log
            invaderXim.item.FEYWEALD_LOG,              5500,    invaderXim.craftRank.CRAFTSMAN,      -- Feyweald Log
            invaderXim.item.SMITHING_KIT_5,             300,      invaderXim.craftRank.AMATEUR,      -- Smithing Kit 5
            invaderXim.item.SMITHING_KIT_10,            400,      invaderXim.craftRank.AMATEUR,      -- Smithing Kit 10
            invaderXim.item.SMITHING_KIT_15,            650,      invaderXim.craftRank.AMATEUR,      -- Smithing Kit 15
            invaderXim.item.SMITHING_KIT_20,           1050,      invaderXim.craftRank.AMATEUR,      -- Smithing Kit 20
            invaderXim.item.SMITHING_KIT_25,           1600,      invaderXim.craftRank.AMATEUR,      -- Smithing Kit 25
            invaderXim.item.SMITHING_KIT_30,           2300,      invaderXim.craftRank.AMATEUR,      -- Smithing Kit 30
            invaderXim.item.SMITHING_KIT_35,           3150,      invaderXim.craftRank.AMATEUR,      -- Smithing Kit 35
            invaderXim.item.SMITHING_KIT_40,           4150,      invaderXim.craftRank.AMATEUR,      -- Smithing Kit 40
            invaderXim.item.SMITHING_KIT_45,           5300,      invaderXim.craftRank.AMATEUR,      -- Smithing Kit 45
            invaderXim.item.SMITHING_KIT_50,           7600,      invaderXim.craftRank.AMATEUR,      -- Smithing Kit 50
            invaderXim.item.CYPRESS_LOG,            1126125,      invaderXim.craftRank.AMATEUR       -- Cypress Log
        },

        [invaderXim.skill.ALCHEMY] =
        {
            invaderXim.item.TRITURATOR,                     75,      invaderXim.craftRank.AMATEUR,      -- Triturator
            invaderXim.item.BEEHIVE_CHIP,                   40,      invaderXim.craftRank.AMATEUR,      -- Beehive Chip
            invaderXim.item.VIAL_OF_MERCURY,              1700,      invaderXim.craftRank.AMATEUR,      -- Mercury
            invaderXim.item.BLOCK_OF_ANIMAL_GLUE,          300,      invaderXim.craftRank.RECRUIT,      -- Animal Glue
            invaderXim.item.PINCH_OF_POISON_DUST,          320,      invaderXim.craftRank.RECRUIT,      -- Poison Dust
            invaderXim.item.VIAL_OF_SLIME_OIL,            1500,     invaderXim.craftRank.INITIATE,      -- Slime Oil
            invaderXim.item.PINCH_OF_BOMB_ASH,             515,     invaderXim.craftRank.INITIATE,      -- Bomb Ash
            invaderXim.item.BOTTLE_OF_AHRIMAN_TEARS,       200,     invaderXim.craftRank.INITIATE,      -- Ahriman Tears
            invaderXim.item.LOOP_OF_GLASS_FIBER,          1200,       invaderXim.craftRank.NOVICE,      -- Glass Fiber
            invaderXim.item.JAR_OF_FIRESAND,              5000,       invaderXim.craftRank.NOVICE,      -- Firesand
            invaderXim.item.FLASH_OF_VITRIOL,              700,   invaderXim.craftRank.APPRENTICE,      -- Vitriol
            invaderXim.item.BOTTLE_OF_SIEGLINDE_PUTTY,    4000,   invaderXim.craftRank.APPRENTICE,      -- Sieglinde Putty
            invaderXim.item.DRYAD_ROOT,                   1800,   invaderXim.craftRank.APPRENTICE,      -- Dryad Root
            invaderXim.item.LOOP_OF_CARBON_FIBER,         1900,   invaderXim.craftRank.JOURNEYMAN,      -- Carbon Fiber
            invaderXim.item.HECTEYES_EYE,                 2100,   invaderXim.craftRank.JOURNEYMAN,      -- Hecteyes Eye
            invaderXim.item.JAR_OF_TOAD_OIL,              3600,   invaderXim.craftRank.JOURNEYMAN,      -- Toad Oil
            invaderXim.item.CERMET_CHUNK,                 5000,    invaderXim.craftRank.CRAFTSMAN,      -- Cermet Chunk
            invaderXim.item.PINCH_OF_VENOM_DUST,          1035,    invaderXim.craftRank.CRAFTSMAN,      -- Venom Dust
            invaderXim.item.ALCHEMY_KIT_5,                 300,      invaderXim.craftRank.AMATEUR,      -- Alchemy Kit 5
            invaderXim.item.ALCHEMY_KIT_10,                400,      invaderXim.craftRank.AMATEUR,      -- Alchemy Kit 10
            invaderXim.item.ALCHEMY_KIT_15,                650,      invaderXim.craftRank.AMATEUR,      -- Alchemy Kit 15
            invaderXim.item.ALCHEMY_KIT_20,               1050,      invaderXim.craftRank.AMATEUR,      -- Alchemy Kit 20
            invaderXim.item.ALCHEMY_KIT_25,               1600,      invaderXim.craftRank.AMATEUR,      -- Alchemy Kit 25
            invaderXim.item.ALCHEMY_KIT_30,               2300,      invaderXim.craftRank.AMATEUR,      -- Alchemy Kit 30
            invaderXim.item.ALCHEMY_KIT_35,               3150,      invaderXim.craftRank.AMATEUR,      -- Alchemy Kit 35
            invaderXim.item.ALCHEMY_KIT_40,               4150,      invaderXim.craftRank.AMATEUR,      -- Alchemy Kit 40
            invaderXim.item.ALCHEMY_KIT_45,               5300,      invaderXim.craftRank.AMATEUR,      -- Alchemy Kit 45
            invaderXim.item.ALCHEMY_KIT_50,               7600,      invaderXim.craftRank.AMATEUR,      -- Alchemy Kit 50
            invaderXim.item.AZURE_LEAF,                1126125,      invaderXim.craftRank.AMATEUR       -- Azure Leaf
        },

        [invaderXim.skill.BONECRAFT] =
        {
            invaderXim.item.SHAGREEN_FILE,                75,      invaderXim.craftRank.AMATEUR,      -- Shagreen File
            invaderXim.item.BONE_CHIP,                   150,      invaderXim.craftRank.AMATEUR,      -- Bone Chip
            invaderXim.item.HANDFUL_OF_FISH_SCALES,       96,      invaderXim.craftRank.AMATEUR,      -- Fish Scales
            invaderXim.item.CHICKEN_BONE,               1500,      invaderXim.craftRank.RECRUIT,      -- Chicken Bone [Recruit]
            invaderXim.item.GIANT_FEMUR,                1400,      invaderXim.craftRank.RECRUIT,      -- Giant Femur [Recruit]
            invaderXim.item.BEETLE_SHELL,                500,     invaderXim.craftRank.INITIATE,      -- Beetle Shell [Initiate]
            invaderXim.item.BEETLE_JAW,                 1000,     invaderXim.craftRank.INITIATE,      -- Beetle Jaw [Initiate]
            invaderXim.item.RAM_HORN,                   1800,       invaderXim.craftRank.NOVICE,      -- Ram Horn [Novice]
            invaderXim.item.BLACK_TIGER_FANG,           2000,       invaderXim.craftRank.NOVICE,      -- Black Tiger Fang [Novice]
            invaderXim.item.CRAB_SHELL,                 2500,   invaderXim.craftRank.APPRENTICE,      -- Crab Shell [Apprentice]
            invaderXim.item.TURTLE_SHELL,               6000,   invaderXim.craftRank.JOURNEYMAN,      -- Turtle Shell [Journeyman]
            invaderXim.item.SCORPION_CLAW,              2400,   invaderXim.craftRank.JOURNEYMAN,      -- Scorpion Claw [Journeyman]
            invaderXim.item.BUGARD_TUSK,                4000,   invaderXim.craftRank.JOURNEYMAN,      -- Bugard Tusk [Journeyman]
            invaderXim.item.SCORPION_SHELL,             3000,    invaderXim.craftRank.CRAFTSMAN,      -- Scorpion Shell [Craftsman]
            invaderXim.item.MARID_TUSK,                 4500,    invaderXim.craftRank.CRAFTSMAN,      -- Marid Tusk [Craftsman]
            invaderXim.item.BONECRAFT_KIT_5,             300,      invaderXim.craftRank.AMATEUR,      -- Bonecraft Kit 5
            invaderXim.item.BONECRAFT_KIT_10,            400,      invaderXim.craftRank.AMATEUR,      -- Bonecraft Kit 10
            invaderXim.item.BONECRAFT_KIT_15,            650,      invaderXim.craftRank.AMATEUR,      -- Bonecraft Kit 15
            invaderXim.item.BONECRAFT_KIT_20,           1050,      invaderXim.craftRank.AMATEUR,      -- Bonecraft Kit 20
            invaderXim.item.BONECRAFT_KIT_25,           1600,      invaderXim.craftRank.AMATEUR,      -- Bonecraft Kit 25
            invaderXim.item.BONECRAFT_KIT_30,           2300,      invaderXim.craftRank.AMATEUR,      -- Bonecraft Kit 30
            invaderXim.item.BONECRAFT_KIT_35,           3150,      invaderXim.craftRank.AMATEUR,      -- Bonecraft Kit 35
            invaderXim.item.BONECRAFT_KIT_40,           4150,      invaderXim.craftRank.AMATEUR,      -- Bonecraft Kit 40
            invaderXim.item.BONECRAFT_KIT_45,           5300,      invaderXim.craftRank.AMATEUR,      -- Bonecraft Kit 45
            invaderXim.item.BONECRAFT_KIT_50,           7600,      invaderXim.craftRank.AMATEUR,      -- Bonecraft Kit 50
            invaderXim.item.FRAGMENT_OF_CYAN_CORAL,  1126125,      invaderXim.craftRank.AMATEUR       -- Cyan Coral
        },

        [invaderXim.skill.LEATHERCRAFT] =
        {
            invaderXim.item.TANNING_VAT,                              75,      invaderXim.craftRank.AMATEUR,      -- Tanning Vat
            invaderXim.item.SHEEPSKIN,                               100,      invaderXim.craftRank.AMATEUR,      -- Sheepskin
            invaderXim.item.RABBIT_HIDE,                              80,      invaderXim.craftRank.AMATEUR,      -- Rabbit Hide
            invaderXim.item.LIZARD_SKIN,                             600,      invaderXim.craftRank.RECRUIT,      -- Lizard Skin
            invaderXim.item.KARAKUL_SKIN,                            600,      invaderXim.craftRank.RECRUIT,      -- Karakul Skin
            invaderXim.item.WOLF_HIDE,                               600,      invaderXim.craftRank.RECRUIT,      -- Wolf Hide
            invaderXim.item.DHALMEL_HIDE,                           2400,     invaderXim.craftRank.INITIATE,      -- Dhalmel Hide
            invaderXim.item.BUGARD_SKIN,                            2500,     invaderXim.craftRank.INITIATE,      -- Bugard Skin
            invaderXim.item.RAM_SKIN,                               1500,       invaderXim.craftRank.NOVICE,      -- Ram Skin
            invaderXim.item.BUFFALO_HIDE,                          16000,   invaderXim.craftRank.APPRENTICE,      -- Buffalo Hide
            invaderXim.item.RAPTOR_SKIN,                            3000,   invaderXim.craftRank.JOURNEYMAN,      -- Raptor Skin
            invaderXim.item.CATOBLEPAS_HIDE,                        2500,   invaderXim.craftRank.JOURNEYMAN,      -- Catoblepas Hide
            invaderXim.item.SMILODON_HIDE,                          3000,    invaderXim.craftRank.CRAFTSMAN,      -- Smilodon Hide
            invaderXim.item.COCKATRICE_SKIN,                        3000,    invaderXim.craftRank.CRAFTSMAN,      -- Cockatrice Skin
            invaderXim.item.LEATHERCRAFT_KIT_5,                      300,      invaderXim.craftRank.AMATEUR,      -- Leathercraft Kit 5
            invaderXim.item.LEATHERCRAFT_KIT_10,                     400,      invaderXim.craftRank.AMATEUR,      -- Leathercraft Kit 10
            invaderXim.item.LEATHERCRAFT_KIT_15,                     650,      invaderXim.craftRank.AMATEUR,      -- Leathercraft Kit 15
            invaderXim.item.LEATHERCRAFT_KIT_20,                    1050,      invaderXim.craftRank.AMATEUR,      -- Leathercraft Kit 20
            invaderXim.item.LEATHERCRAFT_KIT_25,                    1600,      invaderXim.craftRank.AMATEUR,      -- Leathercraft Kit 25
            invaderXim.item.LEATHERCRAFT_KIT_30,                    2300,      invaderXim.craftRank.AMATEUR,      -- Leathercraft Kit 30
            invaderXim.item.LEATHERCRAFT_KIT_35,                    3150,      invaderXim.craftRank.AMATEUR,      -- Leathercraft Kit 35
            invaderXim.item.LEATHERCRAFT_KIT_40,                    4150,      invaderXim.craftRank.AMATEUR,      -- Leathercraft Kit 40
            invaderXim.item.LEATHERCRAFT_KIT_45,                    5300,      invaderXim.craftRank.AMATEUR,      -- Leathercraft Kit 45
            invaderXim.item.LEATHERCRAFT_KIT_50,                    7600,      invaderXim.craftRank.AMATEUR,      -- Leathercraft Kit 50
            invaderXim.item.SQUARE_OF_SYNTHETIC_FAULPIE_LEATHER, 1126125,      invaderXim.craftRank.AMATEUR       -- Synthetic Faulpie Leather
        },

        [invaderXim.skill.SMITHING] =
        {
            invaderXim.item.WORKSHOP_ANVIL,              75,      invaderXim.craftRank.AMATEUR,      -- Workshop Anvil
            invaderXim.item.MANDREL,                     75,      invaderXim.craftRank.AMATEUR,      -- Mandrel
            invaderXim.item.CHUNK_OF_COPPER_ORE,         12,      invaderXim.craftRank.AMATEUR,      -- Copper Ore
            invaderXim.item.BRONZE_NUGGET,               70,      invaderXim.craftRank.AMATEUR,      -- Bronze Nugget
            invaderXim.item.CHUNK_OF_TIN_ORE,            60,      invaderXim.craftRank.RECRUIT,      -- Tin Ore
            invaderXim.item.BRONZE_SHEET,               120,      invaderXim.craftRank.RECRUIT,      -- Bronze Sheet
            invaderXim.item.CHUNK_OF_IRON_ORE,          900,      invaderXim.craftRank.RECRUIT,      -- Iron Ore
            invaderXim.item.CHUNK_OF_KOPPARNICKEL_ORE,  800,     invaderXim.craftRank.INITIATE,      -- Kopparnickel Ore
            invaderXim.item.IRON_NUGGET,                500,     invaderXim.craftRank.INITIATE,      -- Iron Nugget
            invaderXim.item.IRON_SHEET,                6000,     invaderXim.craftRank.INITIATE,      -- Iron Sheet
            invaderXim.item.STEEL_SHEET,              10000,       invaderXim.craftRank.NOVICE,      -- Steel Sheet
            invaderXim.item.STEEL_INGOT,               6000,   invaderXim.craftRank.APPRENTICE,      -- Steel Ingot
            invaderXim.item.LUMP_OF_TAMA_HAGANE,      12000,   invaderXim.craftRank.APPRENTICE,      -- Tama-Hagane
            invaderXim.item.DARKSTEEL_NUGGET,          2700,   invaderXim.craftRank.JOURNEYMAN,      -- Darksteel Nugget
            invaderXim.item.CHUNK_OF_DARKSTEEL_ORE,    7000,   invaderXim.craftRank.JOURNEYMAN,      -- Darksteel Ore
            invaderXim.item.STEEL_NUGGET,               800,   invaderXim.craftRank.JOURNEYMAN,      -- Steel Nugget
            invaderXim.item.DARKSTEEL_SHEET,          28000,   invaderXim.craftRank.JOURNEYMAN,      -- Darksteel Sheet
            invaderXim.item.CHUNK_OF_SWAMP_ORE,        5000,    invaderXim.craftRank.CRAFTSMAN,      -- Swamp Ore
            invaderXim.item.SMITHING_KIT_5,             300,      invaderXim.craftRank.AMATEUR,      -- Smithing Kit 5
            invaderXim.item.SMITHING_KIT_10,            400,      invaderXim.craftRank.AMATEUR,      -- Smithing Kit 10
            invaderXim.item.SMITHING_KIT_15,            650,      invaderXim.craftRank.AMATEUR,      -- Smithing Kit 15
            invaderXim.item.SMITHING_KIT_20,           1050,      invaderXim.craftRank.AMATEUR,      -- Smithing Kit 20
            invaderXim.item.SMITHING_KIT_25,           1600,      invaderXim.craftRank.AMATEUR,      -- Smithing Kit 25
            invaderXim.item.SMITHING_KIT_30,           2300,      invaderXim.craftRank.AMATEUR,      -- Smithing Kit 30
            invaderXim.item.SMITHING_KIT_35,           3150,      invaderXim.craftRank.AMATEUR,      -- Smithing Kit 35
            invaderXim.item.SMITHING_KIT_40,           4150,      invaderXim.craftRank.AMATEUR,      -- Smithing Kit 40
            invaderXim.item.SMITHING_KIT_45,           5300,      invaderXim.craftRank.AMATEUR,      -- Smithing Kit 45
            invaderXim.item.SMITHING_KIT_50,           7600,      invaderXim.craftRank.AMATEUR,      -- Smithing Kit 50
            invaderXim.item.NIOBIUM_ORE,            1126125,      invaderXim.craftRank.AMATEUR       -- Niobium Ore
        }
    },

    curioVendorMoogleStock =
    {
        [curio.medicine] =
        {
            invaderXim.item.POTION,                    300,      invaderXim.ki.RHAPSODY_IN_WHITE,   -- Potion
            invaderXim.item.HI_POTION,                 600,      invaderXim.ki.RHAPSODY_IN_UMBER,   -- Hi-Potion
            invaderXim.item.X_POTION,                 1200,    invaderXim.ki.RHAPSODY_IN_CRIMSON,   -- X-Potion
            -- invaderXim.item.ETHER,                  650,      invaderXim.ki.RHAPSODY_IN_WHITE,   -- Ether / Temporarily(?) removed by SE June 2021
            invaderXim.item.HI_ETHER,                 1300,      invaderXim.ki.RHAPSODY_IN_UMBER,   -- Hi-Ether
            invaderXim.item.SUPER_ETHER,              3000,    invaderXim.ki.RHAPSODY_IN_CRIMSON,   -- Super Ether
            invaderXim.item.ELIXIR,                  15000,      invaderXim.ki.RHAPSODY_IN_AZURE,   -- Elixir
            invaderXim.item.ANTIDOTE,                  300,      invaderXim.ki.RHAPSODY_IN_WHITE,   -- Antidote
            invaderXim.item.FLASK_OF_EYE_DROPS,       1000,      invaderXim.ki.RHAPSODY_IN_UMBER,   -- Eye Drops
            invaderXim.item.FLASK_OF_ECHO_DROPS,       700,      invaderXim.ki.RHAPSODY_IN_UMBER,   -- Echo Drops
            invaderXim.item.BOTTLE_OF_MULSUM,          500,      invaderXim.ki.RHAPSODY_IN_WHITE,   -- Mulsum
            invaderXim.item.PINCH_OF_PRISM_POWDER,     500,      invaderXim.ki.RHAPSODY_IN_WHITE,   -- Prism Powder
            invaderXim.item.POT_OF_SILENT_OIL,         500,      invaderXim.ki.RHAPSODY_IN_WHITE,   -- Silent Oil
            invaderXim.item.FLASK_OF_DEODORIZER,       250,      invaderXim.ki.RHAPSODY_IN_WHITE,   -- Deodorizer
            invaderXim.item.RERAISER,                 1000,      invaderXim.ki.RHAPSODY_IN_AZURE,   -- Reraiser
        },

        [curio.ammunition] =
        {
            invaderXim.item.STONE_QUIVER,              400,      invaderXim.ki.RHAPSODY_IN_WHITE,   -- Stone Quiver
            invaderXim.item.BONE_QUIVER,               680,      invaderXim.ki.RHAPSODY_IN_WHITE,   -- Bone Quiver
            invaderXim.item.IRON_QUIVER,              1200,      invaderXim.ki.RHAPSODY_IN_WHITE,   -- Iron Quiver
            invaderXim.item.BEETLE_QUIVER,            1350,      invaderXim.ki.RHAPSODY_IN_WHITE,   -- Beetle Quiver
            invaderXim.item.SILVER_QUIVER,            2040,      invaderXim.ki.RHAPSODY_IN_WHITE,   -- Silver Quiver
            invaderXim.item.HORN_QUIVER,              2340,      invaderXim.ki.RHAPSODY_IN_WHITE,   -- Horn Quiver
            invaderXim.item.SLEEP_QUIVER,             3150,      invaderXim.ki.RHAPSODY_IN_UMBER,   -- Sleep Quiver
            invaderXim.item.SCORPION_QUIVER,          3500,      invaderXim.ki.RHAPSODY_IN_UMBER,   -- Scorpion Quiver
            invaderXim.item.DEMON_QUIVER,             7000,      invaderXim.ki.RHAPSODY_IN_AZURE,   -- Demon Quiver
            invaderXim.item.KABURA_QUIVER,            8800,      invaderXim.ki.RHAPSODY_IN_AZURE,   -- Kabura Quiver
            invaderXim.item.ANTLION_QUIVER,           9900,    invaderXim.ki.RHAPSODY_IN_CRIMSON,   -- Antlion Quiver
            invaderXim.item.BRONZE_BOLT_QUIVER,        400,      invaderXim.ki.RHAPSODY_IN_WHITE,   -- Bronze Bolt Quiver
            invaderXim.item.BLIND_BOLT_QUIVER,         800,      invaderXim.ki.RHAPSODY_IN_WHITE,   -- Blind Bolt Quiver
            invaderXim.item.ACID_BOLT_QUIVER,         1250,      invaderXim.ki.RHAPSODY_IN_WHITE,   -- Acid Bolt Quiver
            invaderXim.item.SLEEP_BOLT_QUIVER,        1500,      invaderXim.ki.RHAPSODY_IN_WHITE,   -- Sleep Bolt Quiver
            invaderXim.item.BLOODY_BOLT_QUIVER,       2100,      invaderXim.ki.RHAPSODY_IN_WHITE,   -- Bloody Bolt Quiver
            invaderXim.item.VENOM_BOLT_QUIVER,        2100,      invaderXim.ki.RHAPSODY_IN_WHITE,   -- Venom Bolt Quiver
            invaderXim.item.HOLY_BOLT_QUIVER,         2400,      invaderXim.ki.RHAPSODY_IN_WHITE,   -- Holy Bolt Quiver
            invaderXim.item.MYTHRIL_BOLT_QUIVER,      3500,      invaderXim.ki.RHAPSODY_IN_UMBER,   -- Mythril Bolt Quiver
            invaderXim.item.DARKSTEEL_BOLT_QUIVER,    5580,      invaderXim.ki.RHAPSODY_IN_AZURE,   -- Darksteel Bolt Quiver
            invaderXim.item.DARKLING_BOLT_QUIVER,     9460,    invaderXim.ki.RHAPSODY_IN_CRIMSON,   -- Darkling Bolt Quiver
            invaderXim.item.FUSION_BOLT_QUIVER,       9790,    invaderXim.ki.RHAPSODY_IN_CRIMSON,   -- Fusion Bolt Quiver
            invaderXim.item.BRONZE_BULLET_POUCH,       400,      invaderXim.ki.RHAPSODY_IN_WHITE,   -- Bronze Bullet Pouch
            invaderXim.item.BULLET_POUCH,             1920,      invaderXim.ki.RHAPSODY_IN_WHITE,   -- Bullet Pouch
            invaderXim.item.SPARTAN_BULLET_POUCH,     2400,      invaderXim.ki.RHAPSODY_IN_WHITE,   -- Spartan Bullet Pouch
            invaderXim.item.IRON_BULLET_POUCH,        4800,      invaderXim.ki.RHAPSODY_IN_UMBER,   -- Iron Bullet Pouch
            invaderXim.item.SILVER_BULLET_POUCH,      4800,      invaderXim.ki.RHAPSODY_IN_UMBER,   -- Silver Bullet Pouch
            invaderXim.item.CORSAIR_BULLET_POUCH,     7100,      invaderXim.ki.RHAPSODY_IN_AZURE,   -- Corsair Bullet Pouch
            invaderXim.item.STEEL_BULLET_POUCH,       7600,      invaderXim.ki.RHAPSODY_IN_AZURE,   -- Steel Bullet Pouch
            invaderXim.item.DWEOMER_BULLET_POUCH,     9680,    invaderXim.ki.RHAPSODY_IN_CRIMSON,   -- Dweomer Bullet Pouch
            invaderXim.item.OBERON_BULLET_POUCH,      9900,    invaderXim.ki.RHAPSODY_IN_CRIMSON,   -- Oberon Bullet Pouch
            invaderXim.item.SHURIKEN_POUCH,           1400,      invaderXim.ki.RHAPSODY_IN_WHITE,   -- Shuriken Pouch
            invaderXim.item.JUJI_SHURIKEN_POUCH,      2280,      invaderXim.ki.RHAPSODY_IN_WHITE,   -- Juji Shuriken Pouch
            invaderXim.item.MANJI_SHURIKEN_POUCH,     4640,      invaderXim.ki.RHAPSODY_IN_UMBER,   -- Manji Shuriken Pouch
            invaderXim.item.FUMA_SHURIKEN_POUCH,      7000,      invaderXim.ki.RHAPSODY_IN_AZURE,   -- Fuma Shuriken Pouch
            invaderXim.item.IGA_SHURIKEN_POUCH,       9900,    invaderXim.ki.RHAPSODY_IN_CRIMSON,   -- Iga Shuriken Pouch
        },

        [curio.ninjutsuTools] =
        {
            invaderXim.item.TOOLBAG_UCHITAKE,           3000,      invaderXim.ki.RHAPSODY_IN_WHITE,   -- Toolbag (Uchi)
            invaderXim.item.TOOLBAG_TSURARA,            3000,      invaderXim.ki.RHAPSODY_IN_WHITE,   -- Toolbag (Tsurara)
            invaderXim.item.TOOLBAG_KAWAHORI_OGI,       3000,      invaderXim.ki.RHAPSODY_IN_WHITE,   -- Toolbag (Kawahori-Ogi)
            invaderXim.item.TOOLBAG_MAKIBISHI,          3000,      invaderXim.ki.RHAPSODY_IN_WHITE,   -- Toolbag (Makibishi)
            invaderXim.item.TOOLBAG_HIRAISHIN,          3000,      invaderXim.ki.RHAPSODY_IN_WHITE,   -- Toolbag (Hiraishin)
            invaderXim.item.TOOLBAG_MIZU_DEPPO,         3000,      invaderXim.ki.RHAPSODY_IN_WHITE,   -- Toolbag (Mizu-Deppo)
            invaderXim.item.TOOLBAG_SHIHEI,             5000,      invaderXim.ki.RHAPSODY_IN_WHITE,   -- Toolbag (Shihei)
            invaderXim.item.TOOLBAG_JUSATSU,            5000,      invaderXim.ki.RHAPSODY_IN_WHITE,   -- Toolbag (Jusatsu)
            invaderXim.item.TOOLBAG_KAGINAWA,           5000,      invaderXim.ki.RHAPSODY_IN_WHITE,   -- Toolbag (Kaginawa)
            invaderXim.item.TOOLBAG_SAIRUI_RAN,         5000,      invaderXim.ki.RHAPSODY_IN_WHITE,   -- Toolbag (Sairui-Ran)
            invaderXim.item.TOOLBAG_KODOKU,             5000,      invaderXim.ki.RHAPSODY_IN_WHITE,   -- Toolbag (Kodoku)
            invaderXim.item.TOOLBAG_SHINOBI_TABI,       3000,      invaderXim.ki.RHAPSODY_IN_WHITE,   -- Toolbag (Shinobi-Tabi)
            invaderXim.item.TOOLBAG_SANJAKU_TENUGUI,    3000,      invaderXim.ki.RHAPSODY_IN_WHITE,   -- Toolbag (Sanjaku-Tenugui)
            invaderXim.item.TOOLBAG_SOSHI,              5000,    invaderXim.ki.RHAPSODY_IN_CRIMSON,   -- Toolbag (Soshi)
        },
        [curio.foodStuffs] =
        {
            invaderXim.item.JUG_OF_SELBINA_MILK,           60,      invaderXim.ki.RHAPSODY_IN_WHITE,   -- Selbina Milk
            invaderXim.item.FLASK_OF_ORANGE_AU_LAIT,      100,      invaderXim.ki.RHAPSODY_IN_WHITE,   -- Orange au Lait
            invaderXim.item.JUG_OF_ULEGUERAND_MILK,       100,      invaderXim.ki.RHAPSODY_IN_WHITE,   -- Uleguerand Milk
            invaderXim.item.FLASK_OF_APPLE_AU_LAIT,       300,    invaderXim.ki.RHAPSODY_IN_CRIMSON,   -- Apple au Lait
            invaderXim.item.FLASK_OF_PEAR_AU_LAIT,        600,    invaderXim.ki.RHAPSODY_IN_CRIMSON,   -- Pear au Lait
            invaderXim.item.BOTTLE_OF_ORANGE_JUICE,       200,      invaderXim.ki.RHAPSODY_IN_WHITE,   -- Orange Juice
            invaderXim.item.BOTTLE_OF_MELON_JUICE,       1100,    invaderXim.ki.RHAPSODY_IN_CRIMSON,   -- Melon Juice
            invaderXim.item.BOTTLE_OF_YAGUDO_DRINK,      2000,    invaderXim.ki.RHAPSODY_IN_CRIMSON,   -- Yagudo Drink
            invaderXim.item.RICE_BALL,                    160,      invaderXim.ki.RHAPSODY_IN_WHITE,   -- Rice Ball
            invaderXim.item.STRIP_OF_MEAT_JERKY,          120,      invaderXim.ki.RHAPSODY_IN_WHITE,   -- Meat Jerky
            invaderXim.item.SLICE_OF_GRILLED_HARE,        184,      invaderXim.ki.RHAPSODY_IN_WHITE,   -- Grilled Hare
            invaderXim.item.MEAT_MITHKABOB,               720,      invaderXim.ki.RHAPSODY_IN_UMBER,   -- Meat Mithkabob
            -- invaderXim.item.BOILED_CRAB,               550,      invaderXim.ki.RHAPSODY_IN_WHITE,   -- Boiled Crab / Temporarily(?) removed by SE June 2021
            invaderXim.item.FISH_MITHKABOB,              1080,      invaderXim.ki.RHAPSODY_IN_UMBER,   -- Fish Mithkabob
            invaderXim.item.COEURL_SUB,                  1500,      invaderXim.ki.RHAPSODY_IN_WHITE,   -- Coeurl Sub
            invaderXim.item.ROAST_PIPIRA,                 900,      invaderXim.ki.RHAPSODY_IN_WHITE,   -- Roast Pipira
            invaderXim.item.SLICE_OF_ANCHOVY_PIZZA,       500,      invaderXim.ki.RHAPSODY_IN_AZURE,   -- Anchovy Slice
            invaderXim.item.SLICE_OF_PEPPERONI_PIZZA,     400,      invaderXim.ki.RHAPSODY_IN_UMBER,   -- Pepperoni Slice
            invaderXim.item.POT_AUF_FEU,                 3500,    invaderXim.ki.RHAPSODY_IN_CRIMSON,   -- Pot-auf-feu
            invaderXim.item.JACK_O_LANTERN,              1000,      invaderXim.ki.RHAPSODY_IN_WHITE,   -- Jack-o'-Lantern
            invaderXim.item.PLATE_OF_BREAM_SUSHI,        5000,    invaderXim.ki.RHAPSODY_IN_CRIMSON,   -- Bream Sushi
            invaderXim.item.PLATE_OF_DORADO_SUSHI,       4000,    invaderXim.ki.RHAPSODY_IN_CRIMSON,   -- Dorado Sushi
            invaderXim.item.PLATE_OF_CRAB_SUSHI,         1500,    invaderXim.ki.RHAPSODY_IN_CRIMSON,   -- Crab Sushi
            invaderXim.item.CHOCOLATE_CREPE,              500,      invaderXim.ki.RHAPSODY_IN_WHITE,   -- Chocolate Crepe
            invaderXim.item.BUTTER_CREPE,                1000,    invaderXim.ki.RHAPSODY_IN_CRIMSON,   -- Butter Crepe
            invaderXim.item.APPLE_PIE,                    320,      invaderXim.ki.RHAPSODY_IN_WHITE,   -- Apple Pie
            invaderXim.item.MELON_PIE,                    800,      invaderXim.ki.RHAPSODY_IN_WHITE,   -- Melon Pie
            invaderXim.item.PUMPKIN_PIE,                 1200,    invaderXim.ki.RHAPSODY_IN_CRIMSON,   -- Pumpkin Pie
            invaderXim.item.ROAST_MUSHROOM,               344,      invaderXim.ki.RHAPSODY_IN_WHITE,   -- Roast Mushroom
            invaderXim.item.ACORN_COOKIE,                  24,      invaderXim.ki.RHAPSODY_IN_WHITE,   -- Acorn Cookie
            invaderXim.item.GINGER_COOKIE,                 12,      invaderXim.ki.RHAPSODY_IN_AZURE,   -- Ginger Cookie
            invaderXim.item.SUGAR_RUSK,                  1000,      invaderXim.ki.RHAPSODY_IN_WHITE,   -- Sugar Rusk
            invaderXim.item.CHOCOLATE_RUSK,              2000,    invaderXim.ki.RHAPSODY_IN_CRIMSON,   -- Chocolate Rusk
            invaderXim.item.CHERRY_MACARON,              1000,      invaderXim.ki.RHAPSODY_IN_WHITE,   -- Cherry Macaron
            invaderXim.item.COFFEE_MACARON,              2000,    invaderXim.ki.RHAPSODY_IN_CRIMSON,   -- Coffee Macaron
            invaderXim.item.SALTENA,                     1000,      invaderXim.ki.RHAPSODY_IN_WHITE,   -- Saltena
            invaderXim.item.ELSHENA,                     2000,      invaderXim.ki.RHAPSODY_IN_AZURE,   -- Elshena
            invaderXim.item.MONTAGNA,                    2500,    invaderXim.ki.RHAPSODY_IN_CRIMSON,   -- Montagna
            invaderXim.item.STUFFED_PITARU,              1000,      invaderXim.ki.RHAPSODY_IN_WHITE,   -- Stuffed Pitaru
            invaderXim.item.POULTRY_PITARU,              2000,      invaderXim.ki.RHAPSODY_IN_AZURE,   -- Poultry Pitaru
            invaderXim.item.SEAFOOD_PITARU,              2500,    invaderXim.ki.RHAPSODY_IN_CRIMSON,   -- Seafood Pitaru
            invaderXim.item.PIECE_OF_SHIROMOCHI,         3000,    invaderXim.ki.RHAPSODY_IN_CRIMSON,   -- Shiromochi
            invaderXim.item.PIECE_OF_KUSAMOCHI,          3000,    invaderXim.ki.RHAPSODY_IN_CRIMSON,   -- Kusamochi
            invaderXim.item.PIECE_OF_AKAMOCHI,           3000,    invaderXim.ki.RHAPSODY_IN_CRIMSON,   -- Akamochi
            invaderXim.item.BEEF_STEWPOT,               15000,    invaderXim.ki.RHAPSODY_IN_CRIMSON,   -- Beef Stewpot
            invaderXim.item.SERVING_OF_ZARU_SOBA,       15000,    invaderXim.ki.RHAPSODY_IN_CRIMSON,   -- Zaru Soba
            invaderXim.item.SPICY_CRACKER,                450,    invaderXim.ki.RHAPSODY_IN_CRIMSON,   -- Spicy Cracker
        },

        [curio.scrolls] =
        {
            invaderXim.item.SCROLL_OF_INSTANT_WARP,       500,      invaderXim.ki.RHAPSODY_IN_WHITE,   -- Instant Warp
            invaderXim.item.SCROLL_OF_INSTANT_RERAISE,    500,      invaderXim.ki.RHAPSODY_IN_WHITE,   -- Instant Reraise
            invaderXim.item.SCROLL_OF_INSTANT_RETRACE,    500,      invaderXim.ki.RHAPSODY_IN_AZURE,   -- Instant Retrace
            invaderXim.item.SCROLL_OF_INSTANT_PROTECT,    500,      invaderXim.ki.RHAPSODY_IN_WHITE,   -- Instant Protect
            invaderXim.item.SCROLL_OF_INSTANT_SHELL,      500,      invaderXim.ki.RHAPSODY_IN_WHITE,   -- Instant Shell
            invaderXim.item.SCROLL_OF_INSTANT_STONESKIN,  500,      invaderXim.ki.RHAPSODY_IN_UMBER,   -- Instant Stoneskin
        },

        [curio.keys] =
        {
            invaderXim.item.GHEIXIMA_CHEST_KEY,        2500,      invaderXim.ki.RHAPSODY_IN_WHITE,   -- Ghelsba Chest Key
            invaderXim.item.PALBOROUGH_CHEST_KEY,     2500,      invaderXim.ki.RHAPSODY_IN_WHITE,   -- Palborough Chest Key
            invaderXim.item.GIDDEUS_CHEST_KEY,        2500,      invaderXim.ki.RHAPSODY_IN_WHITE,   -- Giddeus Chest Key
            invaderXim.item.RANPERRE_CHEST_KEY,       2500,      invaderXim.ki.RHAPSODY_IN_WHITE,   -- Ranperre Chest Key
            invaderXim.item.DANGRUF_CHEST_KEY,        2500,      invaderXim.ki.RHAPSODY_IN_WHITE,   -- Dangruf Chest Key
            invaderXim.item.HORUTOTO_CHEST_KEY,       2500,      invaderXim.ki.RHAPSODY_IN_WHITE,   -- Horutoto Chest Key
            invaderXim.item.ORDELLE_CHEST_KEY,        2500,      invaderXim.ki.RHAPSODY_IN_WHITE,   -- Ordelle Chest Key
            invaderXim.item.GUSGEN_CHEST_KEY,         2500,      invaderXim.ki.RHAPSODY_IN_WHITE,   -- Gusgen Chest Key
            invaderXim.item.SHAKHRAMI_CHEST_KEY,      2500,      invaderXim.ki.RHAPSODY_IN_WHITE,   -- Shakhrami Chest Key
            invaderXim.item.DAVOI_CHEST_KEY,          2500,      invaderXim.ki.RHAPSODY_IN_WHITE,   -- Davoi Chest Key
            invaderXim.item.BEADEAUX_CHEST_KEY,       2500,      invaderXim.ki.RHAPSODY_IN_WHITE,   -- Beadeaux Chest Key
            invaderXim.item.OZTROJA_CHEST_KEY,        2500,      invaderXim.ki.RHAPSODY_IN_WHITE,   -- Oztroja Chest Key
            invaderXim.item.DELKFUTT_CHEST_KEY,       2500,      invaderXim.ki.RHAPSODY_IN_WHITE,   -- Delkfutt Chest Key
            invaderXim.item.FEIYIN_CHEST_KEY,         2500,      invaderXim.ki.RHAPSODY_IN_WHITE,   -- Fei'Yin Chest Key
            invaderXim.item.ZVAHL_CHEST_KEY,          2500,      invaderXim.ki.RHAPSODY_IN_WHITE,   -- Zvahl Chest Key
            invaderXim.item.ELDIME_CHEST_KEY,         2500,      invaderXim.ki.RHAPSODY_IN_WHITE,   -- Eldieme Chest Key
            invaderXim.item.NEST_CHEST_KEY,           2500,      invaderXim.ki.RHAPSODY_IN_WHITE,   -- Nest Chest Key
            invaderXim.item.GARLAIGE_CHEST_KEY,       2500,      invaderXim.ki.RHAPSODY_IN_WHITE,   -- Garlaige Chest Key
            invaderXim.item.BEADEAUX_COFFER_KEY,      5000,      invaderXim.ki.RHAPSODY_IN_UMBER,   -- Beadeaux Coffer Key
            invaderXim.item.DAVOI_COFFER_KEY,         5000,      invaderXim.ki.RHAPSODY_IN_UMBER,   -- Davoi Coffer Key
            invaderXim.item.OZTROJA_COFFER_KEY,       5000,      invaderXim.ki.RHAPSODY_IN_UMBER,   -- Oztroja Coffer Key
            invaderXim.item.NEST_COFFER_KEY,          5000,      invaderXim.ki.RHAPSODY_IN_UMBER,   -- Nest Coffer Key
            invaderXim.item.ELDIEME_COFFER_KEY,       5000,      invaderXim.ki.RHAPSODY_IN_UMBER,   -- Eldieme Coffer Key
            invaderXim.item.GARLAIGE_COFFER_KEY,      5000,      invaderXim.ki.RHAPSODY_IN_UMBER,   -- Garlaige Coffer Key
            invaderXim.item.ZVAHL_COFFER_KEY,         5000,      invaderXim.ki.RHAPSODY_IN_UMBER,   -- Zvhal Coffer Key
            invaderXim.item.UGGALEPIH_COFFER_KEY,     5000,      invaderXim.ki.RHAPSODY_IN_UMBER,   -- Uggalepih Coffer Key
            invaderXim.item.RANCOR_DEN_COFFER_KEY,    5000,      invaderXim.ki.RHAPSODY_IN_UMBER,   -- Den Coffer Key
            invaderXim.item.KUFTAL_COFFER_KEY,        5000,      invaderXim.ki.RHAPSODY_IN_UMBER,   -- Kuftal Coffer Key
            invaderXim.item.BOYAHDA_COFFER_KEY,       5000,      invaderXim.ki.RHAPSODY_IN_UMBER,   -- Boyahda Coffer Key
            invaderXim.item.CAULDRON_COFFER_KEY,      5000,      invaderXim.ki.RHAPSODY_IN_UMBER,   -- Cauldron Coffer Key
            invaderXim.item.QUICKSAND_COFFER_KEY,     5000,      invaderXim.ki.RHAPSODY_IN_UMBER,   -- Quicksand Coffer Key
            invaderXim.item.GROTTO_CHEST_KEY,         2500,      invaderXim.ki.RHAPSODY_IN_WHITE,   -- Grotto Chest Key
            invaderXim.item.ONZOZO_CHEST_KEY,         2500,      invaderXim.ki.RHAPSODY_IN_WHITE,   -- Onzozo Chest Key
            invaderXim.item.TORAIMARI_COFFER_KEY,     5000,      invaderXim.ki.RHAPSODY_IN_UMBER,   -- Toraimarai Coffer Key
            invaderXim.item.GROTTO_COFFER_KEY,        5000,      invaderXim.ki.RHAPSODY_IN_UMBER,   -- Ru'Aun Coffer Key
            invaderXim.item.GROTTO_COFFER_KEY,        5000,      invaderXim.ki.RHAPSODY_IN_UMBER,   -- Grotto Coffer Key
            invaderXim.item.VELUGANNON_COFFER_KEY,    5000,      invaderXim.ki.RHAPSODY_IN_UMBER,   -- Ve'Lugannon Coffer Key
            invaderXim.item.SACRARIUM_COFFER_KEY,     2500,      invaderXim.ki.RHAPSODY_IN_WHITE,   -- Sacrarium Chest Key
            invaderXim.item.OLDTON_COFFER_KEY,        2500,      invaderXim.ki.RHAPSODY_IN_WHITE,   -- Oldton Chest Key
            invaderXim.item.NEWTON_COFFER_KEY,        5000,      invaderXim.ki.RHAPSODY_IN_UMBER,   -- Newton Coffer Key
            invaderXim.item.PSOXJA_COFFER_KEY,        2500,      invaderXim.ki.RHAPSODY_IN_WHITE,   -- Pso'Xja Chest Key
        }
    }
}
