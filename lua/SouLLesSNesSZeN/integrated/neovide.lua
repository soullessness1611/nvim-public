-------------------------------------------------
-- Neovide Configurations
-------------------------------------------------
-- Option 1:
-- Neovide Configurations
if vim.g.neovide then
	-- vim.keymap.set("n", "<D-s>", ":w<CR>") -- Save
	-- vim.keymap.set("v", "<D-c>", '"+y') -- Copy
	-- vim.keymap.set("n", "<D-v>", '"+P') -- Paste normal mode
	-- vim.keymap.set("v", "<D-v>", '"+P') -- Paste visual mode
	-- vim.keymap.set("c", "<D-v>", "<C-R>+") -- Paste command mode
	-- vim.keymap.set("i", "<D-v>", '<ESC>l"+Pli') -- Paste insert mode

	-- Specify the font used by Neovide
	-- vim.o.guifont = "MesloLGM_Nerd_Font:h14"
	-- vim.o.guifont = "CaskaydiaCove Nerd Font:h13.0"
	-- vim.o.guifont = "MonoLisa:h13.0"
	-- This is limited by the refresh rate of your physical hardware, but can be
	-- lowered to increase battery life
	-- This setting is only effective when not using vsync,
	-- for example by passing --no-vsync on the commandline.
	vim.g.neovide_refresh_rate = 60
	-- This is how fast the cursor animation "moves", default 0.06
	-- vim.g.neovide_cursor_animation_length = 0.04
	-- Default 0.7
	-- vim.g.neovide_cursor_trail_size = 0.7

	-- produce particles behind the cursor, if want to disable them, set it to ""
	vim.g.neovide_cursor_vfx_mode = "railgun"
	-- vim.g.neovide_cursor_vfx_mode = "torpedo"
	-- vim.g.neovide_cursor_vfx_mode = "pixiedust"
	-- vim.g.neovide_cursor_vfx_mode = "sonicboom"
	-- vim.g.neovide_cursor_vfx_mode = "ripple"
	-- vim.g.neovide_cursor_vfx_mode = "wireframe"
	-- vim.g.neovide_cursor_vfx_mode = "wireframe"

	-- Really weird issue in which my winbar would be drawn multiple times as I
	-- scrolled down the file, this fixed it, found in:
	-- https://github.com/neovide/neovide/issues/1550
	vim.g.neovide_scroll_animation_length = 0

	-- NEOVIDE CONFIGURATIONS Optional (recommended)
	vim.g.neovide_fullscreen = false
	vim.g.neovide_floating_blur_amount_x = 4.0
	vim.g.floaterm_winblend = 15
	vim.g.neovide_floating_blur_amount_y = 4.0
	vim.g.neovide_remember_window_size = true
	vim.g.neovide_transparency = 0.0
	vim.g.transparency = 0.7
	-- vim.g.neovide_background_color = "#0f1117"
	vim.g.neovide_transparency = 0.7
	vim.g.neovide_padding_top = 10
	vim.g.neovide_padding_bottom = 10
	vim.g.neovide_padding_right = 10
	vim.g.neovide_padding_left = 10
	vim.g.neovide_cursor_animation_length = 0.13
	vim.g.neovide_cursor_trail_length = 0.8
	-- vim.g.neovide_cursor_vfx_mode = "railgun" -- Railgun particles behind cursor
	vim.g.neovide_cursor_vfx_opacity = 200.0
	vim.g.neovide_cursor_vfx_particle_lifetime = 1.2
	vim.g.neovide_cursor_vfx_particle_density = 7.0
	vim.g.neovide_cursor_vfx_particle_speed = 10.0
	vim.g.neovide_cursor_vfx_particle_phase = 1.5
	vim.g.neovide_cursor_vfx_particle_curl = 1.0
	vim.g.neovide_cursor_unfocused_outline_width = 0.125
	vim.g.neovide_floating_corner_radius = 10.0
	vim.g.neovide_hide_mouse_when_typing = true
end

-- Option 2:
-- vim.g.neovide_padding_top = 10
-- vim.g.neovide_padding_bottom = 10
-- vim.g.neovide_padding_right = 10
-- vim.g.neovide_padding_left = 10
--
-- vim.g.neovide_scale_factor = 1.0
--
-- -- Helper function for transparency formatting
-- local alpha = function()
-- 	return string.format("%x", math.floor(255 * vim.g.transparency or 0.8))
-- end
-- -- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
-- vim.g.neovide_transparency = 0.6
-- vim.g.transparency = 0
-- vim.g.neovide_background_color = "#0f1117" .. alpha()
--
-- vim.g.neovide_floating_blur_amount_x = 2.0
-- vim.g.neovide_floating_blur_amount_y = 2.0
--
-- vim.g.neovide_hide_mouse_when_typing = true
--
-- vim.g.neovide_scroll_animation_length = 0.1
--
-- vim.g.neovide_theme = "auto"
-- vim.g.neovide_refresh_rate = 60
-- vim.g.neovide_confirm_quit = true
-- vim.g.neovide_cursor_animation_length = 0.1
-- vim.g.neovide_cursor_trail_length = 10
-- vim.g.neovide_cursor_antialiasing = true
-- vim.g.neovide_cursor_vfx_particle_lifetime = 1.2
-- vim.g.neovide_cursor_vfx_particle_speed = 20.0
-- vim.g.neovide_cursor_vfx_particle_density = 10.0
--
-- vim.g.neovide_cursor_animate_in_insert_mode = true
-- vim.g.neovide_cursor_animate_in_normal_mode = true
-- vim.g.neovide_cursor_animate_in_visual_mode = true
-- vim.g.neovide_cursor_animate_in_replace_mode = true
-- vim.g.neovide_cursor_animate_in_command_mode = true
-- vim.g.neovide_cursor_animate_in_term_mode = true
-- vim.g.neovide_cursor_vfx_mode = "railgun"
