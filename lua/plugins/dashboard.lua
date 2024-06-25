return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  opts = function(_, opts)
    local logo = [[
 ____                                 __  __                        
/\  _`\      __                      /\ \/\ \    __                 
\ \ \L\ \   /\_\      __       ___   \ \ \ \ \  /\_\     ___ ___    
 \ \ ,  /   \/\ \   /'_ `\    / __`\  \ \ \ \ \ \/\ \  /' __` __`\  
  \ \ \\ \   \ \ \ /\ \L\ \  /\ \L\ \  \ \ \_/ \ \ \ \ /\ \/\ \/\ \ 
   \ \_\ \_\  \ \_\\ \____ \ \ \____/   \ `\___/  \ \_\\ \_\ \_\ \_\
    \/_/\/ /   \/_/ \/___L\ \ \/___/     `\/__/    \/_/ \/_/\/_/\/_/
                      /\____/                                       
                      \_/__/                                        
            ]]

    logo = string.rep("\n", 8) .. logo .. "\n\n"
    opts.config.header = vim.split(logo, "\n")
    opts.theme = "doom"
  end,
}
