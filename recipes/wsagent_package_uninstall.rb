#
# Cookbook Name:: dynatrace
# Recipes:: wsagent_package_uninstall
#
# Copyright 2016, Dynatrace
#

include_recipe 'dynatrace::node_info'

unless platform_family?('debian', 'fedora', 'rhel')
  raise 'Unsupported platform family.'
end

installation_path = "#{node['dynatrace']['wsagent_package']['linux']['installer']['prefix_dir']}/dynatrace"
installer_cache_dir = "#{Chef::Config['file_cache_path']}/dynatrace"

# NOTE: this may also delete files from other Dynatrace packages that share the same directory (e.g. /opt/dynatrace)!
dynatrace_uninstall_package 'Uninstall Dynatrace WebServer Agent package' do
  installation_path installation_path
  installer_cache_path installer_cache_dir
  service_name 'dynaTraceWebServerAgent'
end
