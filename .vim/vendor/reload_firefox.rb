#!/usr/local/bin/ruby
require 'drb/drb'
require 'net/telnet'

WAIT_TIME = 3
RELOAD_TIME = 0.5
DRB_PORT = 7575
DRB_HOST = "base.vmware"
MOZLAB_PORT = 4242

firefox = DRbObject.new_with_uri("druby://#{DRB_HOST}:#{DRB_PORT}")
firefox.reload
