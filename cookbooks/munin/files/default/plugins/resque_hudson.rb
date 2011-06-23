#!/usr/bin/env ruby
# encoding: utf-8

require "rubygems"
require "redis"

module Munin
  class ResqueQueues
    def initialize(options)
      @redis = Redis.new(:host => options[:host], :port => options[:port])
    end

    # get all queues except hudson ones
    def get_names
      @redis.keys("*:queue:*").reject {|q| q =~ /hudson/}
    end

    def get_lengths(queues)
      queues.inject({}) do |values, queue|
        values[queue] = @redis.llen(queue)
        values
      end
    end

    def print_labels(queues)
      queues.each do |queue|
        puts "#{queue}.label #{queue}"
      end
    end

    def print_values(values)
      values.each do |key, value|
        puts "#{key.gsub(/:/,'_')}.value #{value}"
      end
    end
  end
end

options = {
  :host => "localhost",
  :port => 6379
}
r = Munin::ResqueQueues.new(options)

if ARGV[0] == "config"
  puts "graph_title Resque queues"
  puts "graph_args --base 1000 -l 0"
  puts "graph_vlabel number of elements in the queue"
  puts "graph_category system"
  puts "graph_info This graph shows how many jobs are in each resque queue."
  r.print_labels(r.get_names)
else
  names_with_lengths = r.get_lengths(r.get_names)
  r.print_values(names_with_lengths)
end
