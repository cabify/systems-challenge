describe file('/etc/consul.d/20-agent.json') do
  it { should exist }
  it { should be_file }
end
