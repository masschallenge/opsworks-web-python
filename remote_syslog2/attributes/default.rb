# Overwrite this in your cookbook
default['remote_syslog2']['config'] = {
  files: [],
  exclude_files: [],
  exclude_patterns: [],
  hostname: node['hostname'],
  destination: {
    host: 'logs2.papertrailapp.com',
    port: 12345
  }
}

# These attributes probably shouldn't be changed unless they specifically need to be
default['remote_syslog2']['config_file'] = '/srv/www/mc/current/log_files.yml'
default['remote_syslog2']['pid_dir'] = '/var/run'
default['remote_syslog2']['install']['download_file'] = 'https://s3.amazonaws.com/masschallenge-deployment/remote_syslog_linux_386.tar.gz'
default['remote_syslog2']['install']['download_path'] = '/tmp/remote_syslog.tar.gz'
default['remote_syslog2']['install']['extract_path'] = '/tmp'
default['remote_syslog2']['install']['extracted_path'] = '/tmp/remote_syslog'
default['remote_syslog2']['install']['extracted_bin'] = 'remote_syslog'
default['remote_syslog2']['install']['bin_path'] = '/usr/local/bin'
default['remote_syslog2']['install']['bin'] = 'remote_syslog2'
