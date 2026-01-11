if SPL.config.blinds then
    SMODS.Blind {
        key = "sparkblind",
        atlas = "sparkblindimg",
        pos = { y = 0 },
        boss_colour = HEX('FE8653'),
        mult = 0,                     -- Dude, this is an insta-win blind, why can't i do this?
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

    -- NUH UH thanos sfx
    SMODS.Sound {
        key = "nuh_uh",
        path = 'nuh_uh.ogg',
        pitch = 1,
        volume = 1,
        sync = false
    }

    SMODS.Blind {
        key = "the_waal",
        atlas = "theWAAL",
        pos = { y = 0 },
        mult = 2,
        boss_colour = HEX("FF00FF"),
        ignore_showdown_check = true,
        set_blind = function(self)
            -- Get REDDENED.
            G.HUD_blind:get_UIE_by_ID("HUD_blind_name").config.object.colours[1][3] = 0
            G.HUD_blind:get_UIE_by_ID("HUD_blind_name").config.object.colours[1][2] = 0
            local scaling = get_blind_amount(G.GAME.round_resets.ante ^ 2)
            G.GAME.blind.chips = scaling
            G.GAME.blind:alert_debuff() -- uhm
        end,
        defeat = function(self)
            -- aw man you defeated me now i gotta get unred :(
            G.HUD_blind:get_UIE_by_ID("HUD_blind_name").config.object.colours[1][3] = 1
            G.HUD_blind:get_UIE_by_ID("HUD_blind_name").config.object.colours[1][2] = 1
        end,
        disable = function(self)
            play_sound("SPL_nuh_uh", 1, 1)
            local scaling = get_blind_amount(G.GAME.round_resets.ante ^ 2)
            G.GAME.blind.chips = scaling
            G.GAME.blind.loc_debuff_lines = G.localization.descriptions.Blind.bl_SPL_the_waal.text
        end,
        in_pool = function(self)
            return true -- :P
        end,
        boss = {
            showdown = false,
            hardcore = true,
        }
    }
    -- Super Low Quality: Every [idk] seconds, quality drops by
    SMODS.Blind{
        key="super_low_quality",
        atlas="super_low_qual_atlas",
        pos = {y=0},
        boss_colour = G.C.RED,
        mult = 3,
        set_blind = function (self)
            G.GAME.SPL_low_qual_countdown = 1 -- dont worry that isnt in seconds
        end,
        defeat = function() G.FUNCS.SPL_resize(1) end,
        disable = function() G.FUNCS.SPL_resize(1) end,
        in_pool = function(self)
            return true
        end,
        boss = {
            showdown = false,
            hardcore = false,
        }
    }
end
