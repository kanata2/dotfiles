Pry.editor = 'vim'
Pry.config.color = true
Pry.config.history.should_save = true
Pry.config.prompt = [
  proc { |target_self, nest_level, pry|
    "[\e[34m#{pry.input_array.size}\e[0m] \e[31m#{RUBY_VERSION}\e[0m: #{pry.config.prompt_name}(\e[32m\e[1m#{Pry.view_clip(target_self)}\e[0m)#{":#{nest_level}" unless nest_level.zero?}> "
  },

  proc { |target_self, nest_level, pry|
    "[\e[34m#{pry.input_array.size}\e[0m] \e[31m#{RUBY_VERSION}\e[0m: #{pry.config.prompt_name}(\e[32m\e[1m#{Pry.view_clip(target_self)}\e[0m)#{":#{nest_level}" unless nest_level.zero?}* "
  }
]

# PryByebug
if defined?(PryByebug)
  {
    'c': 'continue',
    'n': 'next',
    's': 'step',
    'f': 'finish'
  }.each do |key, val|
    Pry.commands.alias_command(key, val)
  end
end

