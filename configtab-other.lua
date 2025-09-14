SparkLatro.returnAMenu = function(menu_name)

   nodes = {}
   settings = { n = G.UIT.C, config = { align = "tm", padding = 0.05 }, nodes = {} }
   if menu_name == "Game Stuff" then
   -- {n=G.UIT.R,config={minw=10,r=0,minh=0.25,align="cm"}}, -- break in line to make it seem cool i guess
   -- The goofies start Here
   -- i stole this from morefluff i appreciate their hard work. i just used it from how i did it.
   local leftside_nodes = {}
   settings.nodes[#settings.nodes + 1] = {n=G.UIT.R,config={maxw=2,r=0,minh=0.5,align="cm",colour=G.C.RED,},nodes={
      {n=G.UIT.T, config = {text="Game Stuff",scale=0.4,colour=G.C.WHITE,juice=true,align="cm"}},
   }}
   settings.nodes[#settings.nodes + 1] = {n=G.UIT.R,config={minw=0,r=0,minh=0.25,align="cm"},nodes={
      {n=G.UIT.T, config = {text="For if you actually want",scale=0.4,colour=G.C.WHITE,juice=true,align="tm"}},
   }}
   settings.nodes[#settings.nodes +1 ]= {n=G.UIT.R,config={minw=0,r=0,minh=0.25,align="cm"},nodes={
      {n=G.UIT.T, config = {text="to modify this stuff. Why though?",scale=0.4,colour=G.C.WHITE,juice=true,align="tm"}}
   }}
   -- {n=G.UIT.R,config={minw=10,r=0,minh=0.25,align="tm"}}, -- break in line because yes
   -- {n=G.UIT.C,config={minw=10}
   leftside_nodes[#leftside_nodes + 1] = create_toggle({
      label="Decks",
      ref_table=SparkLatro.ModID.config,
      ref_value="decks",
      callback=SPL.save_config(),
      info={"Enable or disable SparkLatro's decks"},
      info_scale=0.4,
   })
   leftside_nodes[#leftside_nodes + 1] = create_toggle({
      label="Consumables",
      ref_table=SparkLatro.ModID.config,
      ref_value="consumables",
      info={"Enable or disable SparkLatro's Consumables","(Planets, Spectrals, etc)"},
      info_scale=0.4
   })
   leftside_nodes[#leftside_nodes + 1] = create_toggle({
      label="Seals",
      ref_table=SparkLatro.ModID.config,
      ref_value="seals",
      info={"Enable or disable SparkLatro's Seals"},
      info_scale=0.4
   })
   local rightside_nodes = {}
   rightside_nodes[#rightside_nodes + 1] = create_toggle({
         label="Jokers",
         ref_table=SparkLatro.ModID.config,
         ref_value="jokers",
         info={"Enable or disable SparkLatro's Jokers"},
         info_scale=0.4
   })
   rightside_nodes[#rightside_nodes + 1] = create_toggle({
         label="Show Tooltips",
         ref_table=SparkLatro.ModID.config,
         ref_value="show_tooltips",
         info={"Enable or Disable SparkLatro's tooltips"},
         info_scale = 0.4,
   })
   rightside_nodes[#rightside_nodes + 1] = create_toggle({
         label = "Custom Consumables",
         ref_table=SparkLatro.ModID.config,
         ref_value="custom_consumables",
         info={"Enable or disable SparkLatro's custom Consumables",
         "(WIP, may be removed or something)"},
         info_scale=0.4
   })
   for _, n in pairs(leftside_nodes) do
      n.config.align = "cr"
   end
   for _, n in pairs(rightside_nodes) do
      n.config.align = "cl"
   end
   local t = {n=G.UIT.R, config={align = "cm",padding = 0.2, minw = 7}, nodes={
        {n=G.UIT.C, config={align = "cl", padding = 0.15}, nodes = leftside_nodes },
        {n=G.UIT.C, config={align = "cr", padding = 0.15}, nodes = rightside_nodes }
   }}
   settings.nodes[#settings.nodes + 1] = t
   end
   config = { n = G.UIT.R, config = { align = "tm", padding = 0 }, nodes = { settings } }
   nodes[#nodes + 1] = config
   return {
      n = G.UIT.ROOT,
      config = {
         emboss = 0.05,
         minh = 6,
         r = 0.1,
         minw = 10,
         align = "cm",
         padding = 0.2,
         colour = G.C.BLACK,
      },
      nodes = nodes,
   }
end
return SparkLatro.returnAMenu