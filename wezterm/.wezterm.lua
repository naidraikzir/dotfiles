local wezterm = require 'wezterm'

local config = wezterm.config_builder()

local transparent = 'rgba(0, 0, 0, 0)'

config.check_for_updates = false

config.font = wezterm.font('Comic Code Ligatures')
config.font_size = 14
config.line_height = 1
config.default_cursor_style = 'SteadyUnderline'

config.window_padding = { left = '5px', right = '5px', top = '15px', bottom = '5px' }
config.window_decorations = 'RESIZE'
config.native_macos_fullscreen_mode = false
config.window_background_opacity = 0.75
config.macos_window_background_blur = 15
config.window_frame = {
    active_titlebar_bg = transparent,
    inactive_titlebar_bg = transparent,
    font = require('wezterm').font 'Comic Code Ligatures',
    font_size = 12,
}
config.scrollback_lines = 100000
config.enable_scroll_bar = true
config.use_fancy_tab_bar = true
config.tab_max_width = 32

local function basename(s)
    return string.gsub(s, '(.*[/\\])(.*)', '%2')
end

wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
    local pane = tab.active_pane
    local title = pane.title

    if title == 'zsh' or title == 'bash' or title == 'fish' then
        title = basename(pane.current_working_dir.file_path)
    end

    if title == '' or title == nil then
        title = '~'
    end

    local target_width = 15
    local title_length = #title

    if title_length < target_width then
        local padding = target_width - title_length
        title = title .. string.rep(' ', padding)
    end

    if #title > 20 then
        title = string.sub(title, 1, 17) .. '...'
    end

    return {
        { Text = ' ' .. title .. ' ' },
    }
end)

config.colors = {
    foreground = '#ffffff',
    background = '#000000',

    cursor_bg = '#ffffff',
    cursor_fg = '#000000',
    cursor_border = '#ffffff',

    selection_fg = '#ffffff',
    selection_bg = '#666666',

    ansi = {
        '#666666', -- 0
        '#d0679d', -- 1
        '#5de4c7', -- 2
        '#fffac2', -- 3
        '#89ddff', -- 4
        '#fcc5e9', -- 5
        '#add7ff', -- 6
        '#dddddd', -- 7
    },

    brights = {
        '#bbbbbb', -- 8
        '#d0679d', -- 9
        '#5de4c7', -- 10
        '#fffac2', -- 11
        '#add7ff', -- 12
        '#fae4fc', -- 13
        '#89ddff', -- 14
        '#ffffff', -- 15
    },

    tab_bar = {
        active_tab = {
            bg_color = '#222222',
            fg_color = '#ffffff',
        },

        inactive_tab = {
            bg_color = '#000000',
            fg_color = '#bbbbbb',
        },

        new_tab = {
            bg_color = transparent,
            fg_color = '#bbbbbb',
        }
    }
}

local act = wezterm.action
config.keys = {
    -- Move by word: Option + Left Arrow
    {
        key = 'LeftArrow',
        mods = 'OPT',
        action = act.SendKey { key = 'b', mods = 'ALT' },
    },
    -- Move by word: Option + Right Arrow
    {
        key = 'RightArrow',
        mods = 'OPT',
        action = act.SendKey { key = 'f', mods = 'ALT' },
    },
    -- Delete word: Option + Backspace
    {
        key = 'Backspace',
        mods = 'OPT',
        action = act.SendKey { key = 'w', mods = 'CTRL' },
    },
    -- Split Vertically (Side-by-side) like Ghostty CMD+D
    {
        key = 'd',
        mods = 'CMD',
        action = act.SplitHorizontal { domain = 'CurrentPaneDomain' },
    },
    -- Split Horizontally (Top-and-bottom) like Ghostty CMD+Shift+D
    {
        key = 'D',
        mods = 'CMD|SHIFT',
        action = act.SplitVertical { domain = 'CurrentPaneDomain' },
    },
    -- Close current pane like Ghostty CMD+W
    {
        key = 'w',
        mods = 'CMD',
        action = act.CloseCurrentPane { confirm = true },
    },
    -- Move between panes using CMD + [ or ] (Ghostty style)
    {
        key = '[',
        mods = 'CMD',
        action = act.ActivatePaneDirection 'Prev',
    },
    {
        key = ']',
        mods = 'CMD',
        action = act.ActivatePaneDirection 'Next',
    },
}

return config
