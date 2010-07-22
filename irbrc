require 'rubygems'
# Should go in ~/.irbrc or similar
if RUBY_PLATFORM !~ /java/
   require 'johnson'
end
require 'hpricot'
require 'benchmark'
require 'utility_belt'

# Should go in ~/.irbrc or similar
 
if ENV['RAILS_ENV']
  # Expose ActiveRecord::Base.construct_finder_sql
  # args should be the same hash you'd pass to AR::Base.all
  # ex:
  # >> Foo.construct_sql(:limit => 2, :offset => 2, :conditions => {:bar => 2})
  # => "SELECT * FROM `foos` WHERE (`foos`.`bar` = 2) LIMIT 2, 2"
  IRB.conf[:IRB_RC] = proc do
    class ActiveRecord::Base
      def self.construct_sql(args)
        construct_finder_sql(args)
      end
    end
  end
end


require "rubygems"
require "ap"

IRB::Irb.class_eval do
  def output_value
    ap @context.last_value, 
            :multiline => false,
            :plain  => false,
            :indent => 2,
            :color => {
                :array      => :white,
                :bignum     => :blue,
                :class      => :yellow,
                :date       => :greenish,
                :falseclass => :red,
                :fixnum     => :blue,
                :float      => :blue,
                :hash       => :gray,
                :nilclass   => :red,
                :string     => :yellowish,
                :symbol     => :cyanish,
                :time       => :greenish,
                :trueclass  => :green
            }
  end 
end
puts "Welcome, Anil. All systems working."