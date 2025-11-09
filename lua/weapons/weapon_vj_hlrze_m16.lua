AddCSLuaFile()

SWEP.Base = "weapon_vj_base"
SWEP.PrintName = "M16"
SWEP.Author = "DrVrej"
SWEP.Contact = "http://steamcommunity.com/groups/vrejgaming"
SWEP.Category = "Half-Life Resurgence"
	-- NPC Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.NPC_NextPrimaryFire = false
SWEP.NPC_ReloadSound = {"vj_hlr/gsrc/npc/hgrunt/gr_reload1.wav"}
SWEP.NPC_ReloadSoundLevel = 100

SWEP.NPC_HasSecondaryFireNext = true
SWEP.NPC_SecondaryFireSoundLevel = 85
SWEP.NPC_SecondaryFireNext = {6, 10}
SWEP.NPC_SecondaryFireNextT = CurTime() + 3
	-- Main Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.MadeForNPCsOnly = true
SWEP.ReplacementWeapon = {"weapon_hl1_mp5", "weapon_mp5_hl1"}
SWEP.WorldModel = "models/vj_hlr/hlze/weapons/m16.mdl"
SWEP.HoldType = "smg"
	-- World Model ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.WorldModel_UseCustomPosition = true
SWEP.WorldModel_CustomPositionAngle = Vector(2,2,0)
SWEP.WorldModel_CustomPositionOrigin = Vector(0,0,0)
SWEP.WorldModel_CustomPositionBone = "Bip01 R Hand"
	-- Primary Fire ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Primary.Damage = 5
SWEP.Primary.ClipSize = 50
SWEP.Primary.Ammo = "SMG1"
SWEP.Primary.Sound = {"vj_hlr/hlze/hks1.wav", "vj_hlr/hlze/hks2.wav", "vj_hlr/hlze/hks3.wav"}
SWEP.Primary.DistantSound = "vj_hlr/gsrc/wep/mp5/hks_distant_new.wav"

-- Custom
local validModels = {
    ["models/vj_hlr/hlze/hgrunt.mdl"] = true,
    ["models/vj_hlr/hlze/barney.mdl"] = true,
    ["models/vj_hlr/hlze/scientist.mdl"] = true,
}
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:Init()
	timer.Simple(0.1, function()
		if IsValid(self) && IsValid(self:GetOwner()) && VJ.HLR_Weapon_CheckModel(self, validModels) then
			self.NPC_NextPrimaryFire = false
			if self:GetOwner():GetModel() == "models/vj_hlr/hlze/scientist.mdl" then
				self.WorldModel_CustomPositionAngle = Vector(2, 2, -10)
				self.WorldModel_CustomPositionOrigin = Vector(-2, -2, -2)
			end
		end
	end)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:DoImpactEffect(tr, damageType)
	return VJ.HLR1_Effect_Impact(tr)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:OnDrawWorldModel()
	return !IsValid(self:GetOwner())
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:PrimaryAttackEffects(owner)
	self.PrimaryEffects_MuzzleFlash = false
	muz = ents.Create("env_sprite")
	muz:SetKeyValue("model","vj_hl/sprites/muzzleflash1.vmt")
	muz:SetKeyValue("scale",""..math.Rand(0.45,0.6))
	muz:SetKeyValue("GlowProxySize","2.0") -- Size of the glow to be rendered for visibility testing.
	muz:SetKeyValue("HDRColorScale","1.0")
	muz:SetKeyValue("renderfx","14")
	muz:SetKeyValue("rendermode","3") -- Set the render mode to "3" (Glow)
	muz:SetKeyValue("renderamt","255") -- Transparency
	muz:SetKeyValue("disablereceiveshadows","0") -- Disable receiving shadows
	muz:SetKeyValue("framerate","10.0") -- Rate at which the sprite should animate, if at all.
	muz:SetKeyValue("spawnflags","0")
	muz:SetParent(self)
	muz:Fire("SetParentAttachment",self.PrimaryEffects_MuzzleAttachment)
	muz:SetAngles(Angle(math.random(-100,100),math.random(-100,100),math.random(-100,100)))
	muz:Spawn()
	muz:Activate()
	muz:Fire("Kill","",0.08)
	self.BaseClass.PrimaryAttackEffects(self, owner)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:NPC_SecondaryFire()
	local pos = self:GetNWVector("VJ_CurBulletPos")
	local proj = ents.Create("obj_vj_hlr1_grenade_40mm")
	proj:SetPos(pos)
	proj:SetAngles(self.Owner:GetAngles())
	proj:SetOwner(self.Owner)
	proj:Spawn()
	proj:Activate()
	local phys = proj:GetPhysicsObject()
	if IsValid(phys) then
		phys:Wake()
		phys:SetVelocity(self.Owner:CalculateProjectile("Curve", pos, self.Owner:GetEnemy():GetPos() + self.Owner:GetEnemy():OBBCenter(), 4000))
	end
	VJ.EmitSound(self.Owner,{"vj_hlr/gsrc/wep/mp5/glauncher.wav","vj_hlr/gsrc/wep/mp5/glauncher2.wav"},90)
end