if SPL.config.stakes then
    SMODS.Stake{
        key="sparkstake",
        applied_stakes = {},
        atlas="spark",
        sticker_atlas="sealspectrals",
        sticker_pos={x=0, y=0},
        loc_vars = function(self,info_queue,card)
            return {
                vars = {
                    win_ante = math.floor(8*1.5),
                }
            }
        end,
        modifiers = function()
            G.GAME.win_ante = math.floor(8*1.5)
        end,
    }
end