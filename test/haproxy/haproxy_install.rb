describe apt('ppa:vbernat/haproxy-1.8') do
  it { should exist }
  it { should be_enabled }
end

describe file('/etc/init/haproxy.override') do
  it { should exist }
end

describe package('haproxy') do
  it { should be_installed }
end
