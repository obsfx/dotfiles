-- ~/.config/nvim/lua/plugins/init.lua
return {
  -- themes (ensure colorscheme is available early)
  { "gruvbox-community/gruvbox", lazy = false, priority = 1000 },
  { "rebelot/kanagawa.nvim", lazy = true },
  { "marko-cerovac/material.nvim", lazy = true },
  { "loctvl842/monokai-pro.nvim", lazy = true },
  { "metalelf0/jellybeans-nvim", lazy = true },

  -- core
  { "tpope/vim-fugitive", lazy = false },
  { "ericpruitt/tmux.vim", ft = "tmux", rtp = "vim/" },
  { "roxma/vim-tmux-clipboard" },
  { "nvim-tree/nvim-web-devicons", lazy = true },

  -- git signs in gutter
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add = { text = "│" },
        change = { text = "│" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "┆" },
      },
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = bufnr, silent = true, desc = desc })
        end
        -- navigation
        map("n", "]c", function()
          if vim.wo.diff then return "]c" end
          vim.schedule(function() gs.next_hunk() end)
          return "<Ignore>"
        end, "Next hunk")
        map("n", "[c", function()
          if vim.wo.diff then return "[c" end
          vim.schedule(function() gs.prev_hunk() end)
          return "<Ignore>"
        end, "Prev hunk")
        -- actions
        map("n", "<Leader>hs", gs.stage_hunk, "Stage hunk")
        map("n", "<Leader>hr", gs.reset_hunk, "Reset hunk")
        map("n", "<Leader>hu", gs.undo_stage_hunk, "Undo stage hunk")
        map("n", "<Leader>hp", gs.preview_hunk, "Preview hunk")
        map("n", "<Leader>hb", function() gs.blame_line({ full = true }) end, "Blame line")
      end,
    },
  },

  -- telescope (keymaps defined immediately, loads on use)
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<Leader>s", "<cmd>Telescope find_files<CR>", silent = true },
      { "<Leader>g", "<cmd>Telescope live_grep<CR>", silent = true },
    },
    config = function()
      local actions = require("telescope.actions")
      require("telescope").setup({
        defaults = {
          layout_config = { vertical = { width = 1 } },
          mappings = { i = { ["<esc>"] = actions.close } },
          file_ignore_patterns = { "node_modules", "node_modules/*" },
        },
        pickers = {
          find_files = { disable_devicons = true },
          live_grep = { disable_devicons = true },
        },
      })
    end,
  },

  -- treesitter (foundational, eager)
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      local ok, configs = pcall(require, "nvim-treesitter.configs")
      if not ok then return end

      configs.setup({
        ensure_installed = {
          "javascript", "typescript", "tsx",
          "lua", "json", "html", "css", "scss",
          "go", "bash", "vim", "vue", "svelte", "graphql",
          "c", "python",
        },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        auto_install = false,
      })
    end,
  },

  -- colorizer (first-buffer)
  {
    "norcalli/nvim-colorizer.lua",
    event = { "BufReadPre", "BufNewFile" },
    config = function() require("colorizer").setup() end,
  },

  -- autopairs
  { "windwp/nvim-autopairs", event = "InsertEnter", config = true },

  -- language utilities
  { "mattn/emmet-vim", ft = { "html", "css", "scss", "javascriptreact", "typescriptreact", "vue", "svelte" } },
  { "fatih/vim-go", ft = "go" },

  -- completion
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
    config = function()
      local ok_cmp, cmp = pcall(require, "cmp")
      if not ok_cmp then return end
      local luasnip = require("luasnip")

      local ok_loader, loader = pcall(require, "luasnip.loaders.from_vscode")
      if ok_loader then loader.lazy_load() end

      cmp.setup({
        snippet = { expand = function(args) luasnip.lsp_expand(args.body) end },
        mapping = cmp.mapping.preset.insert({
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "path" },
          { name = "buffer" },
        }),
      })

      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }),
      })
    end,
  },

  -- mason
  { "williamboman/mason.nvim", lazy = false, priority = 900, config = true },
  {
    "mason-org/mason-lspconfig.nvim",
    lazy = false,
    priority = 800,
    dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
    config = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local ok_cmp, cmp_lsp = pcall(require, "cmp_nvim_lsp")
      if ok_cmp then
        capabilities = cmp_lsp.default_capabilities(capabilities)
      end

      -- Set capabilities for all servers
      local servers = {
        "lua_ls", "gopls", "pyright", "clangd",
        "html", "cssls", "jsonls", "eslint", "tailwindcss",
        "svelte", "ts_ls", "vue_ls",
      }
      for _, name in ipairs(servers) do
        vim.lsp.config(name, { capabilities = capabilities })
      end

      require("mason-lspconfig").setup({
        automatic_enable = true,
        ensure_installed = servers,
      })
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "williamboman/mason.nvim" },
    cmd = { "MasonToolsInstall", "MasonToolsUpdate" },
    opts = {
      ensure_installed = {
        "stylua", "prettierd", "gofumpt", "goimports", "shfmt",
        "eslint_d", "flake8", "golangci-lint", "shellcheck",
        "vue-language-server",
      },
      run_on_start = false,
      auto_update = false,
    },
  },

  -- LSP
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    priority = 850,
    config = function()
      -- LSP keymaps via LspAttach
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("lsp_keymaps", { clear = true }),
        callback = function(ev)
          local bufnr = ev.buf
          local function bmap(mode, lhs, rhs)
            vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true })
          end
          bmap("n", "K", vim.lsp.buf.hover)
          bmap("n", "gd", vim.lsp.buf.definition)
          bmap("n", "gD", vim.lsp.buf.declaration)
          bmap("n", "gi", vim.lsp.buf.implementation)
          bmap("n", "gr", vim.lsp.buf.references)
          bmap("n", "<Leader>rn", vim.lsp.buf.rename)
          bmap("n", "<Leader>ca", vim.lsp.buf.code_action)
          bmap("n", "<Leader>k", vim.diagnostic.open_float)
        end,
      })

      -- Server-specific configs
      vim.lsp.config("lua_ls", {
        settings = { Lua = { diagnostics = { globals = { "vim" } } } },
      })

      vim.diagnostic.config({
        virtual_text = true,
        severity_sort = true,
        float = { border = "rounded" },
      })
    end,
  },

  -- formatting (first-buffer so BufWritePre autocmd exists immediately)
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local ok, conform = pcall(require, "conform")
      if not ok then return end

      conform.setup({
        formatters_by_ft = {
          lua = { "stylua" },

          javascript = { "prettierd", "prettier" },
          javascriptreact = { "prettierd", "prettier" },
          typescript = { "prettierd", "prettier" },
          typescriptreact = { "prettierd", "prettier" },
          svelte = { "prettierd", "prettier" },
          vue = { "prettierd", "prettier" },
          css = { "prettierd", "prettier" },
          scss = { "prettierd", "prettier" },
          html = { "prettierd", "prettier" },
          json = { "prettierd", "prettier" },
          yaml = { "prettierd", "prettier" },
          markdown = { "prettierd", "prettier" },

          go = { "gofumpt", "goimports", "gofmt" },
          sh = { "shfmt" },
        },
        format_on_save = nil,
      })

      vim.api.nvim_create_autocmd("BufWritePre", {
        group = vim.api.nvim_create_augroup("format_on_save", { clear = true }),
        callback = function(args)
          conform.format({
            bufnr = args.buf,
            lsp_fallback = true,
            timeout_ms = 3000,
          })
        end,
      })

      vim.keymap.set("n", "<Leader>f", function()
        conform.format({ lsp_fallback = true, timeout_ms = 3000 })
      end, { silent = true })
    end,
  },

  -- linting (first-buffer)
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local ok, lint = pcall(require, "lint")
      if not ok then return end

      lint.linters_by_ft = {
        javascript = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        typescript = { "eslint_d" },
        typescriptreact = { "eslint_d" },
        svelte = { "eslint_d" },
        vue = { "eslint_d" },

        python = { "flake8" },
        go = { "golangcilint" },
        sh = { "shellcheck" },
      }

      local function try_lint_safe()
        local linters = lint.linters_by_ft[vim.bo.filetype] or {}
        local available = {}
        for _, name in ipairs(linters) do
          local linter = lint.linters[name]
          if linter then
            local cmd = linter.cmd
            if type(cmd) == "function" then
              cmd = cmd()
            end
            if type(cmd) == "string" and vim.fn.executable(cmd) == 1 then
              table.insert(available, name)
            end
          end
        end
        if #available > 0 then
          lint.try_lint(available)
        end
      end

      local grp = vim.api.nvim_create_augroup("linting", { clear = true })
      vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "InsertLeave" }, {
        group = grp,
        callback = try_lint_safe,
      })

      vim.keymap.set("n", "<Leader>l", try_lint_safe, { silent = true })
    end,
  },
}
