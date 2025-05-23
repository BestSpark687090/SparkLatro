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
        tag:yep("Good luck!",HEX("ff0000"),function()
            ease_ante(39)
            G.GAME.round_resets.ante = 39  -- setting this just in case :P
            return true
        end)
    end
}