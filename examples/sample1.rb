# -*- coding: utf-8 -*-

require "active_record"
require "../lib/wresque_wrapper"

ActiveSupport.on_load(:active_record) { include WresqueWrapper }

ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :database => ":memory:")
ActiveRecord::Migration.verbose = false
ActiveRecord::Schema.define do
  create_table :users do |t|
  end
end

class User < ActiveRecord::Base
  def self.foo
    "ok"
  end
  def foo
    "ok"
  end
end

WresqueWrapper.default_queue = :queue1
WresqueWrapper.default_queue    # => :queue1

User.default_queue              # => nil
User.default_queue = :queue2
User.default_queue              # => :queue2

User.delay                      # => #<WresqueWrapper::Proxy:0x007ff041614a20 @target=User(id: integer), @klass=User(id: integer), @target_id=nil, @queue=:queue2>
User.delay.queue                # => :queue2
User.delay(:inline => true)     # => User(id: integer)
User.delay(:inline => true).foo # => "ok"

user = User.create!
user.delay                      # => #<WresqueWrapper::Proxy:0x007ff0416a0278 @target=#<User id: 1>, @klass=User(id: integer), @target_id=1, @queue=:queue2>
user.delay.queue                # => :queue2
user.delay(:inline => true)     # => #<User id: 1>
user.delay(:inline => true).foo # => "ok"
