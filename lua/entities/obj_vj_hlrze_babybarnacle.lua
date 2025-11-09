/*--------------------------------------------------
	*** Copyright (c) 2025 by The One Epicplayer, All rights reserved. ***
--------------------------------------------------*/
AddCSLuaFile()

ENT.Type 			= "anim"
ENT.Base 			= "obj_vj_hlr1_toxicspit"
ENT.PrintName		= "Baby Barnacle"
ENT.Author 			= "The One Epicplayer"
ENT.Contact 		= "http://steamcommunity.com/groups/vrejgaming"
ENT.Information		= "Projectile, usually used for NPCs & Weapons"
ENT.Category		= "Half-Life Resurgence"

if CLIENT then
	VJ.AddKillIcon("obj_vj_hlrze_babybarnacle", ENT.PrintName, VJ.KILLICON_PROJECTILE)
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if !SERVER then return end

ENT.Model = "models/vj_hlr/hlze/weapons/w_barnaclegun.mdl"
ENT.RadiusDamageRadius = 20
ENT.RadiusDamage = 30
ENT.DecalTbl_DeathDecals = false
ENT.SoundTbl_Idle = {"vj_hlr/gsrc/npc/bullchicken/bc_acid1.wav", "vj_hlr/gsrc/npc/bullchicken/bc_acid2.wav"}
ENT.SoundTbl_OnCollide = {"vj_hlr/gsrc/npc/bullchicken/bc_spithit1.wav", "vj_hlr/gsrc/npc/bullchicken/bc_spithit2.wav"}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
	self.Scale = 1
	self:SetNoDraw(false)
	self:SetAngles(self:GetVelocity():GetNormal():Angle())
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDestroy(data, phys)
	local spr = ents.Create("env_sprite")
	spr:SetKeyValue("model","vj_hl/sprites/bigspit_impact.vmt")
	spr:SetKeyValue("GlowProxySize","2.0")
	spr:SetKeyValue("HDRColorScale","1.0")
	spr:SetKeyValue("renderfx","0")
	spr:SetKeyValue("rendermode","2")
	spr:SetKeyValue("renderamt","255")
	spr:SetKeyValue("disablereceiveshadows","0")
	spr:SetKeyValue("mindxlevel","0")
	spr:SetKeyValue("maxdxlevel","0")
	spr:SetKeyValue("framerate","15.0")
	spr:SetKeyValue("spawnflags","0")
	spr:SetKeyValue("scale",tostring(self.Scale *0.3))
	spr:SetPos(data.HitPos)
	spr:Spawn()
	spr:Fire("Kill","",0.3)
	timer.Simple(0.3, function() if IsValid(spr) then spr:Remove() end end)
end