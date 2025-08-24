if not SparkLatro then 
    SparkLatro = {}
end
SparkLatro.ModID = SMODS.current_mod
SPL = SMODS.current_mod
SPL.save_config = function(self)
    SMODS.save_mod_config(self)
end
SPL:save_config()
local playedEntireDeck = false
-- SMODS.Sound.register_global(SPL)
local mod_path = "" .. SMODS.current_mod.path
-- load the scripts folder
local files = NFS.getDirectoryItems(mod_path .. "scripts")
for _, file in ipairs(files) do
	print("[SparkLatro] Loading script " .. file)
	local f, err = SMODS.load_file("scripts/" .. file)
	if err then
		error(err)
	end
	if f == nil then
		error("hm somehow the file is nil?")
	end
    f()
end
-- load the items folder
local files = NFS.getDirectoryItems(mod_path .. "items")
for _, file in ipairs(files) do
	print("[SparkLatro] Loading item script " .. file)
	local f, err = SMODS.load_file("items/" .. file)
	if err then
		error(err)
	end
	if f == nil then
		error("hm somehow the file is nil?")
	end
    f()
end
SPL.config_file = SMODS.load_file('configtab.lua')
SPL.config_tab = SPL.config_file
G.C.RARITY.rarePlus = HEX("9C2010")
G.C.RARITY.rarePlusPlus = HEX("FF0000")
-- Talisman Support (I'm probably gonna make that a requirement)
to_big = to_big or function(x) return x end
SparkLatro.upgrades = { -- make the array of upgrades
	j_brainstorm = "j_SPL_mrotsniarb", -- Rare > Rare+
	j_blueprint = "j_SPL_tnirpeulb", -- same ^
	j_SPL_draw_full = "j_SPL_trick_deck",
	j_cry_effarcire = "j_SPL_draw_full" -- lets go, cryptid addition baybee
} 