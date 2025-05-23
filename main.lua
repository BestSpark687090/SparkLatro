if not SparkLatro then 
    SparkLatro = {}
end
-- assert(SMODS.load_file('functions.lua'))()   4
SparkLatro.ModID = SMODS.current_mod
SPL = SMODS.current_mod
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
SPL.config_tab = SMODS.load_file('configtab.lua')
SMODS.Tag{
    key="skull",
    atlas="skull",
    pos = {x=0,y=0},
    loc_txt={
        name="Skull Tag",
        text={
            "Brings you straight into {C:attention,E:1}Ante 39{}.",
            "{C:inactive}Good luck surviving.{}",
        },
    },
    in_pool = function(self,args)
        if G.GAME.round_resets.ante >= 39 then
            return false,{allow_duplicates = false}
        end
        return true,{allow_duplicates = false}
    end,
    apply = function(self,tag,context)
        tag:yep("Good\nluck!",HEX("ff0000"),function()
            ease_ante(39)
            return true
        end)
    end
}

SMODS.Achievement{
    key = "how",
    loc_txt = {
        name="what how",
        description = "somehow play the entire deck i guess"
    },
    atlas = "achieve",
    reset_on_startup=true,
    pos = {x=1,y=0},
    hidden_pos = {x=0,y=0},
    unlock_condition = function(self,args)
        if args.handname == "SPL_The Entire Deck" then
            return true
        end
    end
}
init_localization()
-- SMODS.current_mod.process_loc_text()
SMODS.PokerHand{
    key = 'The Entire Deck',
    visible = false,
    chips = 525252525252525252525252525252,
    mult = 52525252525252525252525252525,
    l_chips = 52525252525252525252525252525,
    l_mult = 5252525252525252525252525252,
        loc_txt = {
        ['en-us'] = {
            name = 'The Entire Deck',
            description = {
                'Every single card',
                'in a normal 52-card deck.',
                'WHAT.'
            }
        }
    },
    example = {
        { 'S_A',    true },
                { 'H_A',    true },
                { 'C_A',    true },
                { 'D_A',    true },
                { 'S_K',    true },
                { 'H_K',    true },
                { 'C_K',    true },
                { 'D_K',    true },
                { 'S_Q',    true },
                { 'H_Q',    true },
                { 'C_Q',    true },
                { 'D_Q',    true },
                { 'S_J',    true },
                { 'H_J',    true },
                { 'C_J',    true },
                { 'D_J',    true },
                { 'S_T',    true },
                { 'H_T',    true },
                { 'C_T',    true },
                { 'D_T',    true },
                { 'S_9',    true },
                { 'H_9',    true },
                { 'C_9',    true },
                { 'D_9',    true },
                { 'S_8',    true },
                { 'H_8',    true },
                { 'C_8',    true },
                { 'D_8',    true },
                { 'S_7',    true },
                { 'H_7',    true },
                { 'C_7',    true },
                { 'D_7',    true },
                { 'S_6',    true },
                { 'H_6',    true },
                { 'C_6',    true },
                { 'D_6',    true },
                { 'S_5',    true },
                { 'H_5',    true },
                { 'C_5',    true },
                { 'D_5',    true },
                { 'S_4',    true },
                { 'H_4',    true },
                { 'C_4',    true },
                { 'D_4',    true },
                { 'S_3',    true },
                { 'H_3',    true },
                { 'C_3',    true },
                { 'D_3',    true },
                { 'S_2',    true },
                { 'H_2',    true },
                { 'C_2',    true },
                { 'D_2',    true },
    },
		evaluate = function(parts, hand)
		    if #hand >= 52 then
		        local deck_booleans = {}
		        local scored_cards = {}
		        for i = 1, 52 do
		            table.insert(deck_booleans, false)    -- i could write this out but nobody wants to see that
		        end
		        local wilds = {}
		        for i, card in ipairs(hand) do
		            if (card.config.center_key ~= 'm_wild' and not card.config.center.any_suit)
		            and (card.config.center_key ~= 'm_stone' and not card.config.center.no_rank) then    -- i don't know if these are different... this could be completely redundant but redundant is better than broken
		                local rank = card:get_id()
		                local suit = card.base.suit
		                local suit_int = 0
		                suit_table = {"Spades", "Hearts", "Clubs", "Diamonds"}
		                for i = 1, 4 do
		                    if suit == suit_table[i] then suit_int = i end
		                end
		                if suit_int > 0 then    -- check for custom rank here to prevent breakage?
		                    deck_booleans[suit_int+((rank-2)*4)] = true
		                    table.insert(scored_cards, card)
		                end
		            elseif (card.config.center_key == 'm_wild' or card.config.center.any_suit) then
		                table.insert(wilds, card)
		            end
		        end
		        for i, card in ipairs(wilds) do    -- this 100% breaks with custom ranks
		            local rank = card:get_id()
		            for i = 1, 4 do
		                if not deck_booleans[i+((rank-2)*4)] then
		                    deck_booleans[i+((rank-2)*4)] = true
		                    break
		                end
		            end
		            table.insert(scored_cards, card)
		        end
		        local entire_deck = true
		        for i = 1, #deck_booleans do
		            if deck_booleans[i] == false then entire_deck = false break end
		        end
		        if entire_deck == true then
                    playedEntireDeck = true
		            return {scored_cards}
		        end
		    else
                playedEntireDeck = false
            end
		    return
		end,
}