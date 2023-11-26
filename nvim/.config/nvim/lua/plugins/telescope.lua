local Util = require("lazyvim.util")

return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-project.nvim",
        keys = {
          {
            "<C-p>",
            "<cmd>lua require'telescope'.extensions.project.project{display_type = 'full'}<cr>",
            desc = "Telescope Project",
          },
        },
      },
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        enabled = false,
        build = "make",
      },
      { "natecraddock/telescope-zf-native.nvim" },
      { "debugloop/telescope-undo.nvim" },
      {
        "nvim-telescope/telescope-file-browser.nvim",
      },
      {
        "debugloop/telescope-undo.nvim",
        keys = { { "<leader>U", "<cmd>Telescope undo<cr>" } },
        config = function()
          require("telescope").load_extension("undo")
        end,
      },
    },
    opts = function(_, opts)
      local actions = require("telescope.actions")
      local action_state = require("telescope.actions.state")
      local builtins = require("telescope.builtin")
      local action_set = require("telescope.actions.set")

      local multi_open = function(pb)
        local picker = action_state.get_current_picker(pb)
        local multi = picker:get_multi_selection()
        -- my_actions.mark_file(pb)
        actions.select_default(pb) -- the normal enter behaviour
        for _, j in pairs(multi) do
          if j.path ~= nil then -- is it a file -> open it as well:
            vim.cmd(string.format("%s %s", "edit", j.path))
          end
        end
      end

      local picker_config = {}
      for builtin, _ in pairs(builtins) do
        picker_config[builtin] = {
          -- Don't show the matched line since it is already in the preview.
          show_line = false,
          -- Center and unfold when selecting a result.
          attach_mappings = function(prompt_bufnr, _)
            action_set.select:enhance({
              post = function()
                vim.cmd(":normal! zv")
              end,
            })
            actions.center(prompt_bufnr)

            return true
          end,
        }
      end
      opts.defaults = vim.tbl_deep_extend("force", opts.defaults, {
        mappings = {
          i = {
            ["<C-b>"] = function(...)
              return require("telescope.actions").delete_buffer(...)
            end,
            -- Add opening multi-selection support to telescope pickers
            ["<CR>"] = multi_open,
            ["<c-a-t>"] = actions.select_tab,
            ["<C-j>"] = "move_selection_next",
            ["<C-k>"] = "move_selection_previous",
          },
          n = {
            ["<C-b>"] = function(...)
              return require("telescope.actions").delete_buffer(...)
            end,
            -- Add opening multi-selection support to telescope pickers
            ["<CR>"] = multi_open,
          },
        },
        sorting_strategy = "descending",
        layout_strategy = "flex",
        layout_config = {
          horizontal = {
            preview_width = 0.45,
          },
          vertical = {
            width = 0.9,
            height = 0.95,
            preview_height = 0.5,
            preview_cutoff = 0,
          },
          flex = {
            flip_columns = 140,
          },
        },
      })
      opts.pickers = vim.tbl_deep_extend("force", picker_config, {
        -- Open Telescope even if there's only one result.
        lsp_references = { jump_type = "never" },
        lsp_definitions = { jump_type = "never" },
        buffers = { initial_mode = "normal" },
        find_files = {
          find_command = { "rg", "--files", "--hidden", "-g", "!.git" },
        },
        live_grep = {
          -- file_ignore_patterns = { "node_modules", ".git", ".venv" },
          additional_args = function(_)
            return { "--hidden" }
          end,
        },
        vimgrep_arguments = {
          "rg",
          "--hidden",
          "--no-heading",
          "--glob",
          -- "--color=never",
          -- "--with-filename",
          -- "--line-number",
          -- "--column",
          -- "--smart-case",
          -- "-u", -- thats the new thing
        },

        git_status = {
          git_icons = {
            added = " ",
            changed = " ",
            copied = " ",
            deleted = " ",
            renamed = "➡",
            unmerged = " ",
            untracked = " ",
          },
        },
      })
      opts.extensions = {
        project = {
          base_dirs = {
            { path = "~/CU/Fall-2023" },
            { path = "~/Playground" },
            -- { path = "~/.config/nvim/" },
            -- { path = "~/dotfiles/nvim/" },
          },
          order_by = "asc",
          search_by = "title",
        },
        undo = {
          side_by_side = true,
        },
      }
    end,
    keys = {},
    config = function(_, opts)
      local telescope = require("telescope")
      telescope.setup(opts)
      telescope.load_extension("project")
      telescope.load_extension("zf-native")
      telescope.load_extension("undo")
      -- telescope.load_extension("fzf")
    end,
  },
}
