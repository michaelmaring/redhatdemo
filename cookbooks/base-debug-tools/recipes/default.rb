#
# Cookbook Name:: affs-base-debug-tools
# Recipe:: default
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

case node[:platform]
when "centos","redhat","fedora","suse","scientific" then
  package "vim-enhanced"
  package "strace"
  package "git"
  package "lsof"
  package "man"
  package "nmap"
  package "telnet"
  package "tcpdump"
  package "mlocate"
  package "setuptool"
  package "yum-utils"
  package "screen"
  package "wget"
when "debian","ubuntu" then
  puts "fix me for debian"
end

