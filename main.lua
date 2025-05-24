if not SparkLatro then 
    SparkLatro = {}
end
SparkLatro.ModID = SMODS.current_mod
SPL = SMODS.current_mod
G.FUNCS['updateDatUI'] = function(h)
    print("hello! here is the stuff:")
    print(h.cycle_config)
	local my_menu_uibox = SPL.config_file(h.from_val)
	-- Get the parent of the menu UIBox, because we want to delete and re-create the menu:
	-- print(my_menu_uibox)
	-- local menu_wrap = my_menu_uibox
	
	-- -- Delete the current menu UIBox:
	-- menu_wrap.config.object:remove()
	-- -- Create the new menu UIBox:
	-- menu_wrap.config.object = UIBox({
	-- 	definition = my_menu_function(h.config.my_data),
	-- 	config = {parent = menu_wrap, type = "cm"} -- You MUST specify parent!
	-- })
	-- -- Update the UI:
	-- menu_wrap.UIBox:recalculate()
	SPL.config_tab = SPL.config_file(h.to_val)
end
SPL.save_config = function(self)
    SMODS.save_mod_config(self)
end
SPL:save_config()
local playedEntireDeck = false
SMODS.Sound.register_global(self)
local mod_path = "" .. SMODS.current_mod.path
-- load the scripts folder
local files = NFS.getDirectoryItems(mod_path .. "scripts")
for _, file in ipairs(files) do
	print("[SparkLatro] Loading script " .. file)
	local f, err = SMODS.load_file("scripts/" .. file)
	if err then
		error(err)
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
    f()
end
SPL.config_file = SMODS.load_file('configtab2.lua')
SPL.config_tab = SPL.config_file
G.C.RARITY.rarePlus = HEX("9C2010")
-- init_localization()