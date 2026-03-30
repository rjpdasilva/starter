return {
  {
    "dhananjaylatkar/cscope_maps.nvim",
    dependencies = {
      "folke/snacks.nvim",
    },
    opts = {
      prefix = "`c", -- prefix to trigger maps

      -- cscope related defaults
      cscope = {
        exec = "cscope",
        picker = "snacks",
        picker_opts = {
          ---@class snacks.picker.Config
          snacks = {
            -- layout = 'vertical', -- Use "vertical" or "horizontal" if you want to use presets
            ---@class snacks.picker.layout.Config
            layout = {
              layout = {
                height = 0.85, -- Take up 85% of the total height
                width = 0.9, -- Take up 90% of the total width (adjust as needed)
                box = "horizontal", -- Horizontal layout (input and list on the left, preview on the right)
                { -- Left side (input and list)
                  box = "vertical",
                  width = 0.6, -- List and input take up 60% of the width
                  border = "rounded",
                  { win = "input", height = 1, border = "bottom" },
                  { win = "list", border = "none" },
                },
                { win = "preview", border = "rounded", width = 0.4 }, -- Preview window takes up 40% of the width
              },
            },
            ---@class snacks.picker.win.Config
            win = {
              preview = {
                wo = { wrap = true },
              },
            },
          }, -- snacks
        }, -- picker_opts
        skip_picker_for_single_result = true,
        db_build_cmd = { script = "default", args = { "-bqkvR" } },
        tag = {
          keymap = true,
          order = { "cs", "tag_picker", "tag" }, -- any combination of these 3 (ops can be excluded)
        },
      },
    },
  },
}
