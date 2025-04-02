-----------------------------------
--  ID: 26955
--  Behemoth Suit +1
--  When used, player will obtain one of sixteen random meats or with very low
--  chance either a Beastly or Savory Shank. Possible Normal meats are:
--  Buffalo Meat, Cerberus Meat, Cockatrice Meat, Coeurl Meat, Dhalmel Meat,
--  Dragon Meat, Giant Sheep Meat, Hare Meat, Hydra Meat, Karakul Meat,
--  Land Crab Meat, Lucerewe Meat, Lynx Meat, Orobon Meat, Ruszor Meat,
--  Ziz Meat - Data capture 2022-05
--  Chance of obtaining a Beastly or Savory Shank is very low.
--  2/164 Beastly Shank
--  0/164 Savory Shank
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    local meatList =
    {
        {  9, invaderXim.item.SLICE_OF_BUFFALO_MEAT     },
        {  4, invaderXim.item.SLICE_OF_CERBERUS_MEAT    },
        { 17, invaderXim.item.SLICE_OF_COCKATRICE_MEAT  },
        { 13, invaderXim.item.SLICE_OF_COEURL_MEAT      },
        { 20, invaderXim.item.SLICE_OF_DHALMEL_MEAT     },
        {  5, invaderXim.item.SLICE_OF_DRAGON_MEAT      },
        { 17, invaderXim.item.SLICE_OF_GIANT_SHEEP_MEAT },
        { 22, invaderXim.item.SLICE_OF_HARE_MEAT        },
        {  5, invaderXim.item.CHUNK_OF_HYDRA_MEAT       },
        {  4, invaderXim.item.SLICE_OF_KARAKUL_MEAT     },
        {  9, invaderXim.item.SLICE_OF_LAND_CRAB_MEAT   },
        {  7, invaderXim.item.SLICE_OF_LUCEREWE_MEAT    },
        {  5, invaderXim.item.LYNX_MEAT                 },
        {  9, invaderXim.item.CHUNK_OF_OROBON_MEAT      },
        {  9, invaderXim.item.SLAB_OF_RUSZOR_MEAT       },
        {  7, invaderXim.item.SLICE_OF_ZIZ_MEAT         },
        {  2, invaderXim.item.BEASTLY_SHANK             },
        -- { ?, invaderXim.item.SAVORY_SHANK },
    }

    npcUtil.giveItem(target, { { invaderXim.itemUtils.pickItemRandom(target, meatList), 1 } })
end

return itemObject
