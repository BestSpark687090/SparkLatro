if SPL.config.stakes then
    SMODS.Stake{
        key="sparkstake",
        applied_stakes = { "gold" },    
        above_stake = "gold",
        prefix_config = {applied_stakes = {mod = false}},
        atlas="spark",
        sticker_atlas="sealspectrals",
        sticker_pos={x=0, y=0},
        modifiers = function()
            G.GAME.win_ante = 12
        end,
    }
end