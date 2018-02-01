describe package('unzip') do
  it { should be_installed }
end

[
  '/etc/consul.d',
  '/var/lib/consul',
  '/opt/consul/bin',
  '/var/log/consul'
].each do |consul_path|
  describe directory(consul_path) do
    it { should exist }
    it { should be_directory }
  end
end

describe file('/opt/consul/bin/consul') do
  it { should exist }
  it { should be_file }
  it { should be_executable }
end

describe file('/etc/init/consul.conf') do
  it { should exist }
  it { should be_file }
end
