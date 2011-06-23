#
# Cookbook Name:: munin
# Recipe:: resque_hudson_plugin
#
# Copyright 2010, afistfulofservers
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "munin::client"
munin_servers = search(:node, "chef_environment:#{node.chef_environment} AND munin_server:true")

unless munin_servers.empty?

  package "ruby-devel"
  gem_package "redis"
  gem_package "SystemTimer"

  cookbook_file "/usr/share/munin/plugins/resque_hudson" do
    source "plugins/resque_hudson.rb"
    #notifies :restart, "service[munin-node]"
    mode 0755
  end

  link "/etc/munin/plugins/resque_hudson" do
    to "/usr/share/munin/plugins/resque_hudson"
    #notifies :restart, "service[munin-node]"
  end

end

