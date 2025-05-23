<<<<<<< HEAD
return { n= G.UIT.ROOT, config = {r=0.1,minw=10,align="cm",padding=0.5,colour=G.C.BLACK}, nodes = {
        {
            n=G.UIT.C,
            config={
                align="cm",
                padding=0.1,
                colour=G.C.BLACK
            },
            nodes = {
                {n=G.UIT.R,config={colour=G.C.RED,minw=10,r=0,minh=0.75,align="cm"},nodes={
                    {n=G.UIT.T, config = {text="SparkLatro Config",scale="0.5",colour=G.C.WHITE,juice=true,align="cm"}},
                }},
                -- im gonna make label scaling gimme a min :P
                -- so i did it i hope it works
                create_toggle({
                    label="Keybinds",
                    ref_table=SparkLatro.ModID.config,
                    ref_value='keybinds',
                    callback=SPL.save_config(),
                    info={"S : funny sound","CTRL+Shift+R: Restart game"},
                    info_scale=0.35
                }),
                {n=G.UIT.R,config={minw=10,r=0,minh=0.25,align="tm"}}, -- break in line to make it seem cool i guess
                {n=G.UIT.R,config={minw=10,r=0,minh=0.75,align="cm"},nodes={
                    {n=G.UIT.T, config = {text="Game Stuff",scale=0.4,colour=G.C.WHITE,juice=true,align="tm"}},
                }},
                {n=G.UIT.R,config={minw=10,r=0,minh=0.25,align="tm"},nodes={
                    {n=G.UIT.T, config = {text="For if you actually want to modify this stuff. Why though?",scale=0.4,colour=G.C.WHITE,juice=true,align="tm"}},
                }},
                {n=G.UIT.R,config={minw=10,r=0,minh=0.25,align="tm"}}, -- break in line because yes
                create_toggle({
                    label="Decks",
                    ref_table=SparkLatro.ModID.config,
                    ref_value="decks",
                    callback=SPL.save_config(),
                    info={"Enable or disable SparkLatro's decks"},
                    info_scale=0.35,
                }),
                create_toggle({
                    label="Consumables",
                    ref_table=SparkLatro.ModID.config,
                    ref_value="consumables",
                    info={"Enable or disable SparkLatro's Consumables (Planets, Spectrals, etc)"},
                    info_scale=0.35
                }),
                create_toggle({
                    label="Jokers",
                    ref_table=SparkLatro.ModID.config,
                    ref_value="jokers",
                    info={"Enable or disable SparkLatro's Jokers"},
                    info_scale=0.4
                })
            }}
        }
=======
return { n= G.UIT.ROOT, config = {r=0.1,minw=10,align="cm",padding=0.5,colour=G.C.BLACK}, nodes = {
        {
            n=G.UIT.C,
            config={
                align="cm",
                padding=0.1,
                colour=G.C.BLACK
            },
            nodes = {
                {n=G.UIT.R,config={colour=G.C.RED,minw=10,r=0,minh=0.75,align="cm"},nodes={
                    {n=G.UIT.T, config = {text="SparkLatro Config",scale="0.5",colour=G.C.WHITE,juice=true,align="cm"}},
                }},
                -- im gonna make label scaling gimme a min :P
                -- so i did it i hope it works
                create_toggle({
                    label="Keybinds",
                    ref_table=SparkLatro.ModID.config,
                    ref_value='keybinds',
                    callback=SPL.save_config(),
                    info={"S : funny sound, CTRL+Shift+R: Restart game"},
                    info_scale=1
                }),
                {n=G.UIT.R,config={minw=10,r=0,minh=0.25,align="tm"}}, -- break in line to make it seem cool i guess
                {n=G.UIT.R,config={minw=10,r=0,minh=0.75,align="cm"},nodes={
                    {n=G.UIT.T, config = {text="Game Stuff",scale=0.4,colour=G.C.WHITE,juice=true,align="tm"}},
                }},
                {n=G.UIT.R,config={minw=10,r=0,minh=0.25,align="tm"},nodes={
                    {n=G.UIT.T, config = {text="For if you actually want to modify this stuff. Why tho?",scale=0.3,colour=G.C.WHITE,juice=true,align="tm"}},
                }},
                {n=G.UIT.R,config={minw=10,r=0,minh=0.25,align="tm"}}, -- break in line because yes
                create_toggle({
                    label="Decks",
                    ref_table=SparkLatro.ModID.config,
                    ref_value="decks",
                    callback=SPL.save_config(),
                    info={"Enable or disable SparkLatro's decks"}
                }),
                create_toggle({
                    label="Consumables",
                    ref_table=SparkLatro.ModID.config,
                    ref_value="consumables"
                })
            }}
        }
>>>>>>> origin/main
}-- Run `watch config_tab Mods/DebugPlus/examples/watch_config_tab.lua`