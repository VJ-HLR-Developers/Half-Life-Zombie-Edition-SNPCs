AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_hlr/hlze/crasher.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.StartHealth = 300
ENT.HullType = HULL_HUMAN
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.BloodColor = VJ.BLOOD_COLOR_YELLOW -- The blood type, this will determine what it should use (decal, particle, etc.)
ENT.BloodParticle = {"vj_hlr_blood_yellow"}
ENT.BloodDecal = {"VJ_HLR1_Blood_Yellow"} -- Decals to spawn when it's damaged
ENT.HasBloodPool = false -- Does it have a blood pool?
ENT.VJ_NPC_Class = {"CLASS_ZOMBIE"} -- NPCs with the same class with be allied to each other

ENT.HasMeleeAttack = true -- Should the SNPC have a melee attack?
ENT.AnimTbl_MeleeAttack = {ACT_MELEE_ATTACK1}
ENT.MeleeAttackDamage = 75
ENT.TimeUntilMeleeAttackDamage = false -- This counted in seconds | This calculates the time until it hits something
ENT.MeleeAttackDistance = 50 -- How close does it have to be until it attacks?
ENT.MeleeAttackDamageDistance = 80 -- How far does the damage go?

ENT.HasRangeAttack = true -- Should the SNPC have a range attack?
ENT.RangeAttackProjectiles = "obj_vj_hlr1_gonomegut" -- The entity that is spawned when range attacking
ENT.AnimTbl_RangeAttack = {ACT_RANGE_ATTACK1} -- Range Attack Animations
ENT.RangeAttackMaxDistance = 600 -- This is how far away it can shoot
ENT.RangeAttackMinDistance = 200 -- How close does it have to be until it uses melee?
ENT.TimeUntilRangeAttackProjectileRelease = false -- How much time until the projectile code is ran?
ENT.NextRangeAttackTime = 6 -- How much time until it can use a range attack?
ENT.RangeAttackPos_Up = 60 -- Up/Down spawning position for range attack
ENT.RangeAttackPos_Forward = 20 -- Forward/ Backward spawning position for range attack
ENT.RangeAttackPos_Right = 0 -- Right/Left spawning position for range attack

ENT.HasExtraMeleeAttackSounds = true -- Set to true to use the extra melee attack sounds
ENT.DisableFootStepSoundTimer = true -- If set to true, it will disable the time system for the footstep sound code, allowing you to use other ways like model events
ENT.AnimTbl_Walk = {ACT_WALK} -- Set the running animations | Put multiple to let the base pick a random animation when it moves
ENT.AnimTbl_Run = {ACT_WALK} -- Set the running animations | Put multiple to let the base pick a random animation when it moves
ENT.HasDeathAnimation = false -- Does it play an animation when it dies?
//ENT.DeathAnimationTime = 0.8 -- Time until the SNPC spawns its corpse and gets removed

	-- ====== NPC Controller Data ====== --
ENT.ControllerParams = {
	CameraMode = 1, -- Sets the default camera mode | 1 = Third Person, 2 = First Person
	ThirdP_Offset = Vector(30, 30, -60), -- The offset for the controller when the camera is in third person
	FirstP_Bone = "Bip01 Neck", -- If left empty, the base will attempt to calculate a position for first person
	FirstP_Offset = Vector(5, 0, 8), -- The offset for the controller when the camera is in first person
	FirstP_ShrinkBone = true, -- Should the bone shrink? Useful if the bone is obscuring the player's view
	FirstP_CameraBoneAng = 0, -- Should the camera's angle be affected by the bone's angle? | 0 = No, 1 = Pitch, 2 = Yaw, 3 = Roll
	FirstP_CameraBoneAng_Offset = 0, -- How much should the camera's angle be rotated by? | Useful for weird bone angles
}

	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
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
ENT.SoundTbl_BeforeMeleeAttack = {"vj_hlr/hlze/zombie/zombie_melee2.wav"}
ENT.SoundTbl_MeleeAttackExtra = {"vj_hlr/gsrc/npc/zombie/claw_strike1.wav","vj_hlr/gsrc/npc/zombie/claw_strike2.wav","vj_hlr/gsrc/npc/zombie/claw_strike3.wav"}
ENT.SoundTbl_MeleeAttackMiss = {"vj_hlr/gsrc/npc/zombie/claw_miss1.wav","vj_hlr/gsrc/npc/zombie/claw_miss2.wav"}

ENT.GeneralSoundPitch1 = 100
ENT.FootstepSoundPitch1 = 70
ENT.FootstepSoundPitch2 = 70
ENT.GibOnDeathDamagesTable = {"All"}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
	self:SetCollisionBounds(Vector(24,24,85),Vector(-24,-24,0))
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnInput(key,activator,caller,data)
	//print(key)
	if key == "event_emit step" then
		self:PlayFootstepSound()
	end
	if key == "event_emit hand" then
		VJ_EmitSound(self,"npc/zombie/foot_slide" .. math.random(1,3) .. ".wav",72)
	end
	if key == "event_mattack" then
		self:ExecuteMeleeAttack()
	end
	if key == "event_rattack" then
		self:ExecuteRangeAttack()
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:RangeAttackProjVelocity(TheProjectile)
	return self:CalculateProjectile("Curve",self:GetPos() +self:GetUp() *self.RangeAttackPos_Up +self:GetForward() *self.RangeAttackPos_Forward, self:GetEnemy():GetPos() +self:GetEnemy():OBBCenter() +self:GetEnemy():GetRight() *math.Rand(-90,90) +self:GetEnemy():GetForward() *math.Rand(-90,90) +self:GetEnemy():GetUp() *math.Rand(-90,90), 600)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:HandleGibOnDeath(dmginfo,hitgroup)
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
	if self.CanGibOnDeathEffects == true then
		local bloodeffect = EffectData()
		bloodeffect:SetOrigin(self:GetPos() +self:OBBCenter())
		bloodeffect:SetColor(VJ_Color2Byte(Color(255,221,35)))
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
	
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/agib1.mdl",{BloodType="Yellow",BloodDecal="VJ_HLR_Blood_Yellow",Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/agib2.mdl",{BloodType="Yellow",BloodDecal="VJ_HLR_Blood_Yellow",Pos=self:LocalToWorld(Vector(0,0,20))})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/agib3.mdl",{BloodType="Yellow",BloodDecal="VJ_HLR_Blood_Yellow",Pos=self:LocalToWorld(Vector(0,0,30))})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/agib4.mdl",{BloodType="Yellow",BloodDecal="VJ_HLR_Blood_Yellow",Pos=self:LocalToWorld(Vector(0,0,35))})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/agib5.mdl",{BloodType="Yellow",BloodDecal="VJ_HLR_Blood_Yellow",Pos=self:LocalToWorld(Vector(0,0,50))})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/agib6.mdl",{BloodType="Yellow",BloodDecal="VJ_HLR_Blood_Yellow",Pos=self:LocalToWorld(Vector(0,0,55))})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/agib7.mdl",{BloodType="Yellow",BloodDecal="VJ_HLR_Blood_Yellow",Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/agib8.mdl",{BloodType="Yellow",BloodDecal="VJ_HLR_Blood_Yellow",Pos=self:LocalToWorld(Vector(0,0,45))})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/agib9.mdl",{BloodType="Yellow",BloodDecal="VJ_HLR_Blood_Yellow",Pos=self:LocalToWorld(Vector(0,0,25))})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/agib10.mdl",{BloodType="Yellow",BloodDecal="VJ_HLR_Blood_Yellow",Pos=self:LocalToWorld(Vector(0,0,15))})
	VJ_EmitSound(self,"physics/flesh/flesh_bloody_break.wav",85,100)
	VJ_EmitSound(self,"physics/flesh/flesh_bloody_break.wav",85,100)
	self:PlaySoundSystem("Gib", "vj_base/gib/splat.wav")
	return true
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomDeathAnimationCode(dmginfo,hitgroup)
	if hitgroup == HITGROUP_HEAD then
		self.AnimTbl_Death = {ACT_DIE_GUTSHOT,ACT_DIE_HEADSHOT}
	else
		self.AnimTbl_Death = {ACT_DIEBACKWARD,ACT_DIEFORWARD,ACT_DIESIMPLE}
	end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/