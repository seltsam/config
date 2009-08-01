# .irbrc

IRB.conf[:AUTO_INDENT] = true
IRB.conf[:SAVE_HISTORY] = 1000

require 'rubygems'

# --- completion
require 'irb/completion'

# --- wirble
require 'wirble'
Wirble.init
Wirble.colorize

# --- refe
module Kernel
	def r(arg) 
		puts `refe #{arg} | nkf -Ew8`
	end
	private :r
end

class Module
	def r(meth = nil)
		if meth
			if instance_methods(false).include? meth.to_s
				puts `refe #{self}##{meth} | nkf -Ew8`
			else
				super
			end
		else
			puts `refe #{self} | nkf -Ew8`
		end	
	end
end

require 'pp'

def self.all_classes
	a = []
	ObjectSpace.each_object(Class){|obj| a << obj.name}
	a
end

# -- less
# from http://sheepman.sakura.ne.jp/diary/?date=20050215#p01
#class IRBLess
#  def setup_pager
#    for pager in [ ENV['PAGER'], "less", "more", 'pager' ].compact.uniq
#      return IO.popen(pager, "w") rescue nil
#    end
#  end
#  def less(obj)
#    pager = setup_pager
#    begin
#      save_stdout = STDOUT.clone
#      STDOUT.reopen(pager)
#      pp obj
#    ensure
#      STDOUT.reopen(save_stdout)
#      save_stdout.close
#      pager.close
#    end
#  end
#end
#
#class Object
#  def |(less)
#    if less.is_a?(IRBLess)
#      less.less(self)
#    end
#  end
#end
#
#class Array
#  alias :orig_bar |
#  def |(less)
#    if less.is_a?(IRBLess)
#      less.less(self)
#    else
#      orig_bar(less)
#    end
#  end
#end
#
#def less
#  IRBLess.new
#end

# multiline history
# from http://sheepman.sakura.ne.jp/diary/?date=20050219#p01


