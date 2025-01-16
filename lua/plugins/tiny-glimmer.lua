return {
  "rachartier/tiny-glimmer.nvim",
  event = "VeryLazy",
  opts = {
    {
      enabled = true,
      default_animation = "fade",
      refresh_interval_ms = 6,

      overwrite = {
        search = {
          enabled = false,
          default_animation = "pulse",

          --- Keys to navigate to the next match after `n` or `N`
          next_mapping = "zzzv", -- Can be empty or nil
          prev_mapping = "zzzv", -- Can be empty or nil
        },
        paste = {
          enabled = false,
          default_animation = "reverse_fade",
        },
      },

      -- Only use if you have a transparent background
      -- It will override the highlight group background color for `to_color` in all animations
      transparency_color = nil,
      animations = {
        fade = {
          max_duration = 400,
          min_duration = 300,
          easing = "outQuad",
          chars_for_max_duration = 10,
        },
        reverse_fade = {
          max_duration = 380,
          min_duration = 300,
          easing = "outBack",
          chars_for_max_duration = 10,
        },
        bounce = {
          max_duration = 500,
          min_duration = 400,
          chars_for_max_duration = 20,
          oscillation_count = 1,
        },
        left_to_right = {
          max_duration = 350,
          min_duration = 350,
          chars_for_max_duration = 25,
          lingering_time = 50,
        },
        pulse = {
          max_duration = 600,
          min_duration = 400,
          chars_for_max_duration = 15,
          pulse_count = 2,
          intensity = 1.2,
        },

        custom = {
          max_duration = 350,
          chars_for_max_duration = 40,
          color = hl_visual_bg,

          -- Custom effect function
          -- @param self table The effect object
          -- @param progress number The progress of the animation [0, 1]
          --
          -- Should return a color and a progress value
          -- that represents how much of the animation should be drawn
          effect = function(self, progress)
            return self.settings.color, progress
          end,
        },
      },
      virt_text = {
        priority = 2048,
      },
    },
    -- your configuration
  },
}
