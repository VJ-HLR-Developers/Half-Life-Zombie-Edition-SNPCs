AddCSLuaFile()

ENT.Base 			= "obj_vj_spawner_base"
ENT.Type 			= "anim"
ENT.PrintName 		= "Random Zombie (Mutations)"
ENT.Author 			= "The One Epicplayer"
ENT.Contact 		= "http://steamcommunity.com/groups/vrejgaming"
ENT.Category		= "Half-Life Resurgence"
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if !SERVER then return end

ENT.SingleSpawner = true
ENT.EntitiesToSpawn = {
	{Entities = {
		"npc_vj_hlrze_zbreeder",
		"npc_vj_hlrze_zbreeder",
		"npc_vj_hlrze_zrusher",
		"npc_vj_hlrze_zrusher",
		"npc_vj_hlrze_zrusher_scientist",
		"npc_vj_hlrze_zcrasher"
	}},
}