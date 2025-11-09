AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.StartHealth = 90
ENT.CanUseGrenade = false
ENT.RangeAttackProjectiles = "" -- Entities that it can spawn when range attacking | table = Picks randomly
ENT.TimeUntilRangeAttackProjectileRelease = false
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_FootStep = {"vj_hlr/gsrc/pl_step1.wav","vj_hlr/gsrc/pl_step2.wav","vj_hlr/gsrc/pl_step3.wav","vj_hlr/gsrc/pl_step4.wav"}
ENT.SoundTbl_Idle = {"vj_hlr/gsrc/npc/zombie/zo_idle1.wav","vj_hlr/gsrc/npc/zombie/zo_idle2.wav","vj_hlr/gsrc/npc/zombie/zo_idle3.wav","vj_hlr/gsrc/npc/zombie/zo_idle4.wav"}
ENT.SoundTbl_Alert = {"vj_hlr/gsrc/npc/zombie/zo_alert10.wav","vj_hlr/gsrc/npc/zombie/zo_alert20.wav","vj_hlr/gsrc/npc/zombie/zo_alert30.wav"}
ENT.SoundTbl_BeforeMeleeAttack = {"vj_hlr/gsrc/npc/zombie/zo_attack1.wav","vj_hlr/gsrc/npc/zombie/zo_attack2.wav"}
ENT.SoundTbl_Pain = {"vj_hlr/gsrc/npc/zombie/zo_pain1.wav","vj_hlr/gsrc/npc/zombie/zo_pain2.wav"}
ENT.SoundTbl_MeleeAttackExtra = {"vj_hlr/gsrc/npc/zombie/claw_strike1.wav","vj_hlr/gsrc/npc/zombie/claw_strike2.wav","vj_hlr/gsrc/npc/zombie/claw_strike3.wav"}
ENT.SoundTbl_MeleeAttackMiss = {"vj_hlr/gsrc/npc/zombie/claw_miss1.wav","vj_hlr/gsrc/npc/zombie/claw_miss2.wav"}
ENT.SoundTbl_Death = {"vj_hlr/gsrc/npc/zombie/zo_pain1.wav","vj_hlr/gsrc/npc/zombie/zo_pain2.wav"}

ENT.GeneralSoundPitch1 = 100
ENT.BodyGroups = {
	[0] = 2,
	[1] = math.random(2,3),
}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
	self:SetBodygroup(0,self.BodyGroups[0])
	if self.CanUseGrenade then
		self:SetBodygroup(1,3)
	else self:SetBodygroup(1,2) end
	self.GrenadePulled = false
--	self.AnimationTranslations[ACT_IDLE] = {ACT_IDLE}
--	self.AnimationTranslations[ACT_WALK] = {ACT_WALK_STIMULATED}
--	self.AnimationTranslations[ACT_RUN] = {ACT_WALK_STIMULATED}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Explode()
	self.GrenadePulled = false
	local grenent = ents.Create("obj_vj_hlr1_grenade")
	grenent:SetPos(self:GetPos() +self:OBBCenter())
	grenent.FuseTime = 0
	grenent.RadiusDamageRadius = 300
	grenent.RadiusDamage = 100
	grenent:Spawn()
	grenent:Activate()
	grenent.PrintName = "Zombie Grenade"
	grenent.FuseTime = 0
	self:HandleGibOnDeath(dmginfo,hitgroup)
	gamemode.Call("OnNPCKilled",self,self,self,dmginfo)
	self:Remove()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:GrenadeCode()
	if self.GrenadePulled == true then return end
	if self.Crippled then return end
	self.AnimationTranslations[ACT_IDLE] = {ACT_IDLE_AGITATED}
	self.AnimationTranslations[ACT_RUN] = {ACT_RUN_AGITATED}
	self.AnimationTranslations[ACT_WALK] = {ACT_RUN_AGITATED}
	self.GrenadePulled = true
	self.HasMeleeAttack = false
	self:PlayAnim(ACT_RANGE_ATTACK1,true,0.6,false)
	timer.Simple(0.3,function()
		if self:IsValid() then
			self:SetBodygroup(2,1)
			timer.Simple(5,function() if IsValid(self) then self:Explode() end end)
		end
	end)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDamaged(dmginfo, hitgroup, status)
	if hitgroup == 3 then
		dmginfo:ScaleDamage(0.5)
		--VJ.EmitSound(self,"vj_hlr/fx/ric" .. math.random(1,5) .. ".wav",88,100)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDeath(dmginfo, hitgroup, status)
	if status == "Init" && self.GrenadePulled == true then
		self:SetBodygroup(2,0)
		local grenent = ents.Create("obj_vj_hlr1_grenade")
		grenent:SetPos(self:GetPos() +self:OBBCenter())
		grenent.RadiusDamageRadius = 300
		grenent.RadiusDamage = 100
		grenent:Spawn()
		grenent:Activate()
		grenent.PrintName = "Zombie Grenade"
	end
	if status == "DeathAnim" then
		if self.Crippled then return end
		if hitgroup == HITGROUP_HEAD then
			self.AnimTbl_Death = {ACT_DIE_HEADSHOT}
		else
			self.AnimTbl_Death = {ACT_DIEBACKWARD,ACT_DIESIMPLE}
		end
	end
end

function ENT:OnRangeAttack(status, enemy) 
self:GrenadeCode()
end