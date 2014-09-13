require 'rubygems'
require 'pp'
require 'irb/completion' #メソッド補完
require 'wirble'	 #color

IRB.conf[:AUTO_INDENT]=true
IRB.conf[:SAVE_HISTORY]=200

Wirble.init
Wirble.colorize

#カレントディレクトリの.irbrcを読み込み
current_irbrc = File.join(Dir.pwd, ".irbrc")
if File.exist?(current_irbrc)
   load current_irbrc
end
