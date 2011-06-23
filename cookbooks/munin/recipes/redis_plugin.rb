#
# Cookbook Name:: munin
# Recipe:: redisplugin
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
  cookbook_file "/usr/share/munin/plugins/redis_" do
    source "plugins/redis-v3"
    #notifies :restart, "service[munin-node]"
    mode 0755
  end

  link "/etc/munin/plugins/redis_per_sec" do
    to "/usr/share/munin/plugins/redis_"
    #notifies :restart, "service[munin-node]"
  end

  link "/etc/munin/plugins/redis_used_memory" do
    to "/usr/share/munin/plugins/redis_"
    #notifies :restart, "service[munin-node]"
  end

  link "/etc/munin/plugins/redis_used_memory" do
    to "/usr/share/munin/plugins/redis_"
    #notifies :restart, "service[munin-node]"
  end

  link "/etc/munin/plugins/redis_used_keys" do
    to "/usr/share/munin/plugins/redis_"
    #notifies :restart, "service[munin-node]"
  end
end
