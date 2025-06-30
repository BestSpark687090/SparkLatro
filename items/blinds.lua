if SPL.config.blinds then
SMODS.Blind{
    key="sparkblind",
    atlas="sparkblindimg",
    pos = {y=0},
    boss_colour = HEX('FE8653'),
    mult = 0, -- Dude, this is an insta-win blind, why can't i do this?
    ignore_showdown_check = true, -- Heheheha!
    drawn_to_hand = function(self)
        -- pulled straight from debugplus - thanks :)
        if G.STATE ~= G.STATES.SELECTING_HAND then
            return
        end
        G.GAME.chips = 1 -- Why? Funnies.
        G.STATE = G.STATES.HAND_PLAYED
        G.STATE_COMPLETE = true
        end_round()
    end,
    in_pool = function(self)
        return true -- :P
    end,
    boss = {
        showdown = false,
    }
}
end