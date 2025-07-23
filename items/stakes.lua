if SPL.config.stakes then
    SMODS.Stake{
        key="sparkstake",
        applied_stakes = {},
        atlas="spark",
        sticker_atlas="sealspectrals",
        sticker_pos={x=0, y=0},
        modifiers = function()
            G.GAME.win_ante = math.floor(G.GAME.win_ante*1.5)
        end,
    }
end