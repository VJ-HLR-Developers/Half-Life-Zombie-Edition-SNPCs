include("entities/npc_vj_hlrze_zombie/init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

ENT.Model = "models/vj_hlr/hlze/zombie_hev.mdl"
ENT.StartHealth = 100

-- Custom
ENT.IsHEVZombie = true