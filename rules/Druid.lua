--[[
AdiButtonAuras - Display auras on action buttons.
Copyright 2013-2016 Adirelle (adirelle@gmail.com)
All rights reserved.

This file is part of AdiButtonAuras.

AdiButtonAuras is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

AdiButtonAuras is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with AdiButtonAuras.  If not, see <http://www.gnu.org/licenses/>.
--]]

local _, addon = ...

if not addon.isClass("DRUID") then return end

AdiButtonAuras:RegisterRules(function()
	Debug('Rules', 'Adding druid rules')

	return {
		ImportPlayerSpells { "DRUID" },

		ShowPower {
			{
				 1079, -- Rip
				22568, -- Ferocious Bite
				22570, -- Maim
				52610, -- Savage Roar
			},
			"COMBO_POINTS"
		},

		Configure {
			"Efflorescence",
			L["Show duration for @NAME"],
			145205,
			"player",
			"PLAYER_TOTEM_UPDATE",
			function(_, model)
				local present, _, startTime, duration = GetTotemInfo(1)
				if present then
					model.highlight = "good"
					model.expiration = startTime + duration
				end
			end,
		},
	}
end)

-- ABA
-- GLOBALS: AddRuleFor BuffAliases BuildAuraHandler_FirstOf BuildAuraHandler_Longest
-- GLOBALS: BuildAuraHandler_Single BuildDesc BuildKey Configure DebuffAliases Debug
-- GLOBALS: DescribeAllSpells DescribeAllTokens DescribeFilter DescribeHighlight
-- GLOBALS: DescribeLPSSource GetBuff GetDebuff GetLib GetPlayerBuff GetPlayerDebuff
-- GLOBALS: ImportPlayerSpells IterateBuffs IterateDebuffs IteratePlayerBuffs
-- GLOBALS: IteratePlayerDebuffs L LongestDebuffOf PassiveModifier PetBuffs PLAYER_CLASS
-- GLOBALS: SelfBuffAliases SelfBuffs SharedSimpleBuffs SharedSimpleDebuffs ShowPower
-- GLOBALS: ShowStacks SimpleBuffs SimpleDebuffs

-- WoW API
-- GLOBALS: GetNumGroupMembers GetRuneCooldown GetShapeshiftFormID GetSpellCharges
-- GLOBALS: GetSpellBonusHealing GetSpellInfo GetTime GetTotemInfo HasPetSpells
-- GLOBALS: IsPlayerSpell UnitCanAttack UnitCastingInfo UnitChannelInfo UnitClass
-- GLOBALS: UnitHealth UnitHealthMax UnitIsDeadOrGhost UnitIsPlayer UnitName UnitPower
-- GLOBALS: UnitPowerMax UnitStagger

-- Lua API
-- GLOBALS: bit ceil floor format ipairs math min pairs print select string table tinsert
