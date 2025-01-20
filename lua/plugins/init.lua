return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },
  {
    "themaxmarchuk/tailwindcss-colors.nvim"
  },
  {
    "rcarriga/nvim-notify",
    config = function()
      require("notify").setup({
        background_colour = "NotifyBackground",
        fps = 30,
        -- default icons
        icons = {
          DEBUG = "",
          ERROR = "",
          INFO = "",
          TRACE = "✎",
          WARN = ""
        },
        --
        --  custom icons
        -- icons = {
        --   ERROR = "❌",
        --   WARN = "⚠️",
        --   INFO = "ℹ️",
        --   DEBUG = "🐞",
        --   TRACE = "🔍",
        -- },
        level = 2,
        minimum_width = 50,
        render = "compact",
        stages = "fade_in_slide_out",
        time_formats = {
          notification = "%T",
          notification_history = "%FT%T"
        },
        timeout = 2000,
        top_down = true
      })
    end
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
      -- {
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = false,
          ["vim.lsp.util.stylize_markdown"] = false,
          ["cmp.entry.get_documentation"] = false, -- requires hrsh7th/nvim-cmp
        },
        signature = {
          enabled = false
        }
      },
      -- you can enable a preset for easier configuration
      presets = {
        bottom_search = true,         -- use a classic bottom cmdline for search
        command_palette = true,       -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false,           -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false,       -- add a border to hover docs and signature help
      },
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify"
    }
  },
  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "toppair/peek.nvim",
    build = "deno task --quiet build:fast",
    keys = {
      {
        "<leader>op",
        function()
          local peek = require "peek"
          if peek.is_open() then
            peek.close()
          else
            peek.open()
          end
        end,
        desc = "Peek (Markdown Preview)",
      },
    },
    opts = { theme = "dark", app = "browser" },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "markdown",
        "typescript",
        "javascript",
        "tsx",
        "rust",
      },
    },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
  },
  {
    "windwp/nvim-ts-autotag",
    lazy = false,
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "simrat39/rust-tools.nvim",
    server = {
      on_attach = function(_, bufnr)
        -- Hover actions
        vim.keymap.set("n", "<C-space>", require("rust-tools").hover_actions.hover_actions, { buffer = bufnr })
        -- Code action groups
        vim.keymap.set("n", "<Leader>a", require("rust-tools").code_action_group.code_action_group, { buffer = bufnr })
      end,
    },
  },
  {
    "nvim-pack/nvim-spectre",
    on_attach = function(_)
      require("spectre").setup()
    end,
  },
  -- {
  --   "nvim-lua/plenary.nvim",
  -- },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",  -- required
      "sindrets/diffview.nvim", -- optional - Diff integration
      -- Only one of these is needed.
      -- "nvim-telescope/telescope.nvim", -- optional
      "ibhagwan/fzf-lua", -- optional
      -- "echasnovski/mini.pick",       -- optional
    },
    config = function()
      require("neogit").setup()
      dofile(vim.g.base46_cache .. "git")
      dofile(vim.g.base46_cache .. "neogit")
    end,
  },
  {
    'JoosepAlviste/nvim-ts-context-commentstring',
    requires = 'nvim-treesitter/nvim-treesitter',
    config = function()
      require 'nvim-treesitter.configs'.setup {
        context_commentstring = {
          enable = true,
          enable_autocmd = false,
        }
      }
    end
  },
  {
    "folke/ts-comments.nvim",
    opts = {},
    event = "VeryLazy",
    enabled = vim.fn.has("nvim-0.10.0") == 1,
  },
  {
    "nvim-neorg/neorg",
    lazy = false,  -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    version = "*", -- Pin Neorg to the latest stable release
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require('neorg').setup {
        load = {
          ["core.defaults"] = {},
          ["core.concealer"] = {},
          ["core.integrations.treesitter"] = {
            configure_parsers = true,
            install_parsers = true
          },
          ["core.summary"] = {},
          ["core.dirman"] = {
            config = {
              workspaces = {
                notes = "~/Documents/Notes",
                business = "~/Business"
              }
            }
          }
        }
      }
    end
  },
  { "vim-pandoc/vim-pandoc-syntax", config = function() vim.g.vim_markdown_conceal_code_blocks = 0 end, },
  {
    'neoclide/coc.nvim',
    branch = 'release',
    run = 'yarn install --frozen-lockfile',
    config = function()
      vim.api.nvim_command('source ~/.config/nvim/coc-config.vim')
    end
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "pyright"
      }
    }
  },
}
