AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_hlr/hlze/crasher.mdl"
ENT.StartHealth = 300
ENT.HullType = HULL_HUMAN
ENT.ControllerParams = {
	ThirdP_Offset = Vector(30, 30, -60),
	FirstP_Bone = "Bip01 Neck",
	FirstP_Offset = Vector(5, 0, 8),
}
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_ZOMBIE"}
ENT.BloodColor = VJ.BLOOD_COLOR_YELLOW
ENT.BloodParticle = {"vj_hlr_blood_yellow"}
ENT.BloodDecal = {"VJ_HLR1_Blood_Yellow"}
ENT.HasBloodPool = false

-- Melee attack
ENT.HasMeleeAttack = true
ENT.AnimTbl_MeleeAttack = ACT_MELEE_ATTACK1
ENT.MeleeAttackDamage = 75
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDistance = 60
ENT.MeleeAttackDamageDistance = 80

-- Range attack
ENT.HasRangeAttack = true
ENT.RangeAttackProjectiles = "obj_vj_hlr1_gonomegut"
ENT.AnimTbl_RangeAttack = ACT_RANGE_ATTACK1
ENT.RangeAttackMinDistance = 200
ENT.RangeAttackMaxDistance = 600
ENT.TimeUntilRangeAttackProjectileRelease = false
ENT.NextRangeAttackTime = 6

ENT.HasExtraMeleeAttackSounds = true
ENT.DisableFootStepSoundTimer = true
ENT.GibOnDeathFilter = false
ENT.HasDeathAnimation = false

-- Sounds
ENT.SoundTbl_FootStep = {"vj_hlr/gsrc/pl_step1.wav","vj_hlr/gsrc/pl_step2.wav","vj_hlr/gsrc/pl_step3.wav","vj_hlr/gsrc/pl_step4.wav"}
ENT.SoundTbl_Idle = {
	"vj_hlr/hlze/zombie/zombie_voice_idle1.wav",
	"vj_hlr/hlze/zombie/zombie_voice_idle2.wav",
	"vj_hlr/hlze/zombie/zombie_voice_idle3.wav",
	"vj_hlr/hlze/zombie/zombie_voice_idle4.wav",
	"vj_hlr/hlze/zombie/zombie_voice_idle5.wav",
	"vj_hlr/hlze/zombie/zombie_voice_idle6.wav",
	"vj_hlr/hlze/zombie/zombie_voice_idle7.wav",
	"vj_hlr/hlze/zombie/zombie_voice_idle8.wav",
	"vj_hlr/hlze/zombie/zombie_voice_idle9.wav",
	"vj_hlr/hlze/zombie/zombie_voice_idle10.wav",
	"vj_hlr/hlze/zombie/zombie_voice_idle11.wav",
	"vj_hlr/hlze/zombie/zombie_voice_idle12.wav",
	"vj_hlr/hlze/zombie/zombie_voice_idle13.wav",
	"vj_hlr/hlze/zombie/zombie_voice_idle14.wav"
}
ENT.SoundTbl_Alert = {
	"vj_hlr/hlze/zombie/zombie_alert1.wav",
	"vj_hlr/hlze/zombie/zombie_alert2.wav",
	"vj_hlr/hlze/zombie/zombie_alert3.wav"
}
ENT.SoundTbl_Pain = {
	"vj_hlr/hlze/zombie/zombie_pain1.wav",
	"vj_hlr/hlze/zombie/zombie_pain2.wav",
	"vj_hlr/hlze/zombie/zombie_pain3.wav",
	"vj_hlr/hlze/zombie/zombie_pain4.wav",
	"vj_hlr/hlze/zombie/zombie_pain5.wav",
	"vj_hlr/hlze/zombie/zombie_pain6.wav",
	"vj_hlr/hlze/zombie/zombie_pain7.wav"
}
ENT.SoundTbl_Death = {
	"vj_hlr/hlze/zombie/zombie_death3.wav"
}
ENT.SoundTbl_BeforeMeleeAttack = "vj_hlr/hlze/zombie/zombie_melee2.wav"
ENT.SoundTbl_MeleeAttackExtra = {"vj_hlr/gsrc/npc/zombie/claw_strike1.wav","vj_hlr/gsrc/npc/zombie/claw_strike2.wav","vj_hlr/gsrc/npc/zombie/claw_strike3.wav"}
ENT.SoundTbl_MeleeAttackMiss = {"vj_hlr/gsrc/npc/zombie/claw_miss1.wav","vj_hlr/gsrc/npc/zombie/claw_miss2.wav"}

ENT.MainSoundPitch = 100
ENT.FootstepSoundPitch = 70
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
	self:SetCollisionBounds(Vector(24, 24, 85), Vector(-24, -24, 0))
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnInput(key, activator, caller, data)
	//print(key)
	if key == "event_emit step" then
		self:PlayFootstepSound()
	elseif key == "event_emit hand" then
		VJ.EmitSound(self, "npc/zombie/foot_slide" .. math.random(1, 3) .. ".wav", 72)
	elseif key == "event_mattack" then
		self:ExecuteMeleeAttack()
	elseif key == "event_rattack" then
		self:ExecuteRangeAttack()
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SetAnimationTranslations(wepHoldType)
	self.AnimationTranslations[ACT_RUN] = ACT_WALK
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:RangeAttackProjPos(projectile)
	return self:GetPos() + self:GetUp() * 60 + self:GetForward() * 20
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:RangeAttackProjVel(projectile)
	return VJ.CalculateTrajectory(self, self:GetEnemy(), "Curve", projectile:GetPos(), 1, 10) + Vector(math.random(-120, 120), math.random(-120, 120), math.random(-120, 120))
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:HandleGibOnDeath(dmginfo, hitgroup)
	self.HasDeathSounds = false
	for i=1,math.random(15,30) do
		local class
		if math.random(1,3) == 1 then
			class = "obj_vj_hlr1_toxicspit"
		else
			class = "obj_vj_hlr1_gonomegut"
		end
		local spit = ents.Create(class)
		spit:SetPos(self:GetPos() +self:OBBCenter())
		spit:SetAngles(Angle(math.random(0,360),math.random(0,360),math.random(0,360)))
		spit:SetOwner(self)
		spit:Spawn()
		spit:Activate()
		local phys = spit:GetPhysicsObject()
		if IsValid(phys) then
			phys:SetVelocity(Vector(math.Rand(-100,100),math.Rand(-100,100),math.Rand(-100,100)) *2 +self:GetUp() *200)
		end
	end
	if self.HasGibOnDeathEffects == true then
		local bloodeffect = EffectData()
		bloodeffect:SetOrigin(self:GetPos() +self:OBBCenter())
		bloodeffect:SetColor(VJ.Color2Byte(Color(255,221,35)))
		bloodeffect:SetScale(120)
		util.Effect("VJ_Blood1",bloodeffect)
		
		local bloodspray = EffectData()
		bloodspray:SetOrigin(self:GetPos() +self:OBBCenter())
		bloodspray:SetScale(8)
		bloodspray:SetFlags(3)
		bloodspray:SetColor(1)
		util.Effect("bloodspray",bloodspray)
		util.Effect("bloodspray",bloodspray)
		
		local effectdata = EffectData()
		effectdata:SetOrigin(self:GetPos() +self:OBBCenter())
		effectdata:SetScale(1)
		util.Effect("StriderBlood",effectdata)
		util.Effect("StriderBlood",effectdata)
	end
	
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/agib1.mdl",{BloodType="Yellow",CollisionDecal="VJ_HLR1_Blood_Yellow",Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/agib2.mdl",{BloodType="Yellow",CollisionDecal="VJ_HLR1_Blood_Yellow",Pos=self:LocalToWorld(Vector(0,0,20))})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/agib3.mdl",{BloodType="Yellow",CollisionDecal="VJ_HLR1_Blood_Yellow",Pos=self:LocalToWorld(Vector(0,0,30))})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/agib4.mdl",{BloodType="Yellow",CollisionDecal="VJ_HLR1_Blood_Yellow",Pos=self:LocalToWorld(Vector(0,0,35))})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/agib5.mdl",{BloodType="Yellow",CollisionDecal="VJ_HLR1_Blood_Yellow",Pos=self:LocalToWorld(Vector(0,0,50))})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/agib6.mdl",{BloodType="Yellow",CollisionDecal="VJ_HLR1_Blood_Yellow",Pos=self:LocalToWorld(Vector(0,0,55))})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/agib7.mdl",{BloodType="Yellow",CollisionDecal="VJ_HLR1_Blood_Yellow",Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/agib8.mdl",{BloodType="Yellow",CollisionDecal="VJ_HLR1_Blood_Yellow",Pos=self:LocalToWorld(Vector(0,0,45))})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/agib9.mdl",{BloodType="Yellow",CollisionDecal="VJ_HLR1_Blood_Yellow",Pos=self:LocalToWorld(Vector(0,0,25))})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/agib10.mdl",{BloodType="Yellow",CollisionDecal="VJ_HLR1_Blood_Yellow",Pos=self:LocalToWorld(Vector(0,0,15))})
	VJ.EmitSound(self,"physics/flesh/flesh_bloody_break.wav",85,100)
	VJ.EmitSound(self,"physics/flesh/flesh_bloody_break.wav",85,100)
	self:PlaySoundSystem("Gib", "vj_base/gib/splat.wav")
	return true
end