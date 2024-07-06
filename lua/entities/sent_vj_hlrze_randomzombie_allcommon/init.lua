AddCSLuaFile("shared.lua")
include('shared.lua')

ENT.SingleSpawner = true -- If set to true, it will spawn the entities once then remove itself
ENT.Model = {"models/props_junk/popcan01a.mdl"} -- The models it should spawn with | Picks a random one from the table
ENT.EntitiesToSpawn = {
	{EntityName = "NPC1",SpawnPosition = {vForward=0,vRight=0,vUp=0},Entities = {
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
	},WeaponsList = {""}},
}
