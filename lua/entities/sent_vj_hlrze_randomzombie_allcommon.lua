AddCSLuaFile()

ENT.Base 			= "obj_vj_spawner_base"
ENT.Type 			= "anim"
ENT.PrintName 		= "Random Zombie (All Standard)"
ENT.Author 			= "The One Epicplayer"
ENT.Contact 		= "http://steamcommunity.com/groups/vrejgaming"
ENT.Category		= "Half-Life Resurgence"
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if !SERVER then return end

ENT.SingleSpawner = true
ENT.EntitiesToSpawn = {
	{Entities = {
		"npc_vj_hlrze_zombie",
		"npc_vj_hlrze_zombie",
		"npc_vj_hlrze_zombie",
		"npc_vj_hlrze_zombie",
		"npc_vj_hlrze_zombie",
		"npc_vj_hlrze_zombie",
		"npc_vj_hlrze_zombie",
		"npc_vj_hlrze_zombie_barney",
		"npc_vj_hlrze_zombie_barney",
		"npc_vj_hlrze_zombie_barney",
		"npc_vj_hlrze_zombie_barney",
		"npc_vj_hlrze_zombie_barney",
		"npc_vj_hlrze_zsoldier",
		"npc_vj_hlrze_zsoldier",
		"npc_vj_hlrze_zsoldier",
		"npc_vj_hlrze_zsoldier_grenade",
		"npc_vj_hlrze_zsoldier_grenade",
		"npc_vj_hlrze_zmassassin",
		"npc_vj_hlrze_zmassassin",
		"npc_vj_hlrze_zmassassin",
		"npc_vj_hlrze_zombie_hev"
	}},
}