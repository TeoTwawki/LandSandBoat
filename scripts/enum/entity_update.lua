xi = xi or {}

-- see `enum ENTITYUPDATE` in src\map\packets\basic.h
---@enum invaderXim.entityUpdate
invaderXim.entityUpdate =
{
    ENTITY_SPAWN   = 0,
    ENTITY_SHOW    = 1,
    ENTITY_UPDATE  = 2,
    ENTITY_HIDE    = 3,
    ENTITY_DESPAWN = 4,
}
