vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

local Liam_Fugitive = vim.api.nvim_create_augroup("ThePrimeagen_Fugitive", {})

local autocmd = vim.api.nvim_create_autocmd
autocmd("BufWinEnter", {
    group = Liam_Fugitive,
    pattern = "*",
    callback = function()
        if vim.bo.ft ~= "fugitive" then
            return
        end

        local bufnr = vim.api.nvim_get_current_buf()
        local opts = {buffer = bufnr, remap = false}
        vim.keymap.set("n", "<leader>p", function()
            vim.cmd.Git('push')
        end, opts)


        -- rebase always
        vim.keymap.set("n", "<leader>P", function()
            vim.cmd.Git({'pull',  '--rebase'})
        end, opts)

        -- NOTE: It allows me to easily set the branch I am pushing and any tracking
        -- needed if I did not set the branch up correctly
        vim.keymap.set("n", "<leader>t", ":Git push -u origin ", opts);
    end,
})

-- The script you provided seems to be written in Lua and designed to work with Neovim, a powerful text editor that's an extended version of Vim. Let's break down the code to understand what it's doing:
--
-- 1. **Setting up a key mapping for Git command**: 
--    - `vim.keymap.set("n", "<leader>gs", vim.cmd.Git)`: This binds the `<leader>gs` key combination in normal mode (`"n"`) to the `vim.cmd.Git` command, allowing you to execute a Git command from within Neovim.
--
-- 2. **Creating an augroup named "Liam_Fugitive"**:
--    - `local Liam_Fugitive = vim.api.nvim_create_augroup("Liam_Fugitive", {})`: This creates an augroup (autocommand group) called "Liam_Fugitive." Augroups are used in Vim to group together autocommands, so that they can be easily enabled or disabled together.
--
--
-- 3. **Defining an autocmd**:
--    - The rest of the code sets up an autocmd (autocommand) within the defined augroup. An autocmd executes specified commands automatically when certain events occur. This autocmd is set to trigger on the "BufWinEnter" event, meaning when you enter a buffer window.
--
-- 4. **Checking the filetype and returning if not "fugitive"**:
--    - Inside the callback function, there is a check `if vim.bo.ft ~= "fugitive" then return end`, which ensures that the following code only runs if the filetype of the buffer is "fugitive."
--
-- 5. **Setting up key mappings for specific Git operations**:
--    - If the condition is met, the code sets up specific key mappings for the current buffer related to Git operations:
--
--      - `<leader>p` to push.
--      - `<leader>P` to pull with rebase.
--      - `<leader>t` to push to the specified origin and set up tracking if needed.
--
-- These key mappings make it easier for the user to perform specific Git operations while working with files of the "fugitive" type within Neovim.
--
-- Overall, the script provides convenience in working with Git repositories, especially for a user who wants to perform common Git actions from within the editor without having to switch to a terminal. The specific key mappings and commands could be related to a particular workflow or set of practices followed by the user or development team.
