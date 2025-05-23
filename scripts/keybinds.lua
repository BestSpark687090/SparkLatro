if SPL.config.keybinds then
    SMODS.Keybind{
        key="tarot",
        key_pressed="s",
        action = function(self)
            play_sound("tarot1")
        end
    }
    SMODS.Keybind{
        key="Restart Game",
        key_pressed="r",
        held_keys={"lctrl","lshift"},
        action = function(self)
            SMODS.restart_game()
        end
    }
end