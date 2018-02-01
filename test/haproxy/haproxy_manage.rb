describe service('haproxy') do
  it { should be_enabled }
  it { should be_installed }
  it { should be_running }
end

describe port(8080) do
  it { should be_listening }
  its('addresses') { should include '0.0.0.0' }
end
