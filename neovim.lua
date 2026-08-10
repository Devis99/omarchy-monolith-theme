return {
    {
        "bjarneo/aether.nvim",
        branch = "v3",
        name = "aether",
        priority = 1000,
        opts = {
            colors = {
                bg = "#232136",
                dark_bg = "#1a1929",
                darker_bg = "#12111b",
                lighter_bg = "#2a273f",

                fg = "#e0def4",
                dark_fg = "#908caa",
                light_fg = "#e0def4",
                bright_fg = "#e0def4",
                muted = "#6e6a86",

                red = "#eb6f92",
                yellow = "#f6c177",
                orange = "#f6c177",
                green = "#3e8fb0",
                cyan = "#ea9a97",
                blue = "#9ccfd8",
                magenta = "#c4a7e7",
                brown = "#56526e",

                bright_red = "#eb6f92",
                bright_yellow = "#f6c177",
                bright_green = "#3e8fb0",
                bright_cyan = "#ea9a97",
                bright_blue = "#9ccfd8",
                bright_magenta = "#c4a7e7",

                accent = "#9ccfd8",
                cursor = "#e0def4",
                foreground = "#e0def4",
                background = "#232136",
                selection = "#393552",
                selection_foreground = "#e0def4",
                selection_background = "#3e8fb0",
            },
        },
        config = function(_, opts)
            require("aether").setup(opts)
            vim.cmd.colorscheme("aether")

            -- Enable hot reload
            require("aether.hotreload").setup()

            -- Unified selection colors across the UI; reapply on colorscheme change
            local selection_bg = "#3e8fb0"
            local selection_fg = "#e0def4"
            local function apply_selection_highlights()
                -- schedule to run after other colorscheme tweaks
                vim.schedule(function()
                    vim.api.nvim_set_hl(0, "Visual", { bg = selection_bg, fg = selection_fg })
                    vim.api.nvim_set_hl(0, "VisualNOS", { bg = selection_bg, fg = selection_fg })
                    vim.api.nvim_set_hl(0, "PmenuSel", { bg = selection_bg, fg = selection_fg })
                end)
            end
            apply_selection_highlights()
            vim.api.nvim_create_autocmd({ "ColorScheme", "UIEnter" }, {
                callback = apply_selection_highlights,
                desc = "Keep selection colors consistent",
            })
        end,
    },
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "aether",
        },
    },
}
