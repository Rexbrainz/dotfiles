-- Gentleman's config
-- return {
--   "MeanderingProgrammer/render-markdown.nvim",
--   dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" }, -- if you use the mini.nvim suite
--   ---@module 'render-markdown'
--   ---@type render.md.UserConfig
--   opts = {
--     heading = {
--       enabled = true,
--       sign = true,
--       style = "full",
--       icons = { "① ", "② ", "③ ", "④ ", "⑤ ", "⑥ " },
--       left_pad = 1,
--     },
--     bullet = {
--       enabled = true,
--       icons = { "●", "○", "◆", "◇" },
--       right_pad = 1,
--       highlight = "render-markdownBullet",
--     },
--     checkbox = {
--       enabled = true,
--       unchecked = {
--         icon = "󰄱     ",
--         highlight = "RenderMarkdownUnchecked",
--       },
--       checked = {
--         icon = "󰱒     ",
--         highlight = "RenderMarkdownChecked",
--       },
--       custom = {
--         todo = { raw = "[-]", rendered = "󰥔     ", highlight = "RenderMarkdownTodo" },
--       },
--     },
--   },
-- }

-- Updated Gentleman's config to address spellcheck and line length error
-- Create an autocmd to override LazyVim's default spellcheck for markdown
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "md" },
  callback = function()
    vim.opt_local.spell = false
    vim.opt_local.conceallevel = 2
  end,
})

return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" },
    opts = {
      on = {
        attach = function()
          -- Mute linter diagnostics (MD013 line length, etc.) strictly for markdown buffers
          vim.diagnostic.enable(false, { bufnr = 0 })
        end,
      },
      heading = {
        enabled = true,
        sign = true,
        style = "full",
        icons = { "① ", "② ", "③ ", "④ ", "⑤ ", "⑥ " },
        left_pad = 1,
      },
      bullet = {
        enabled = true,
        icons = { "●", "○", "◆", "◇" },
        right_pad = 1,
        highlight = "render-markdownBullet",
      },
      checkbox = {
        enabled = true,
        unchecked = {
          icon = "󰄱     ",
          highlight = "RenderMarkdownUnchecked",
        },
        checked = {
          icon = "󰱒     ",
          highlight = "RenderMarkdownChecked",
        },
        custom = {
          todo = { raw = "[-]", rendered = "󰥔     ", highlight = "RenderMarkdownTodo" },
        },
      },
    },
  },
}
