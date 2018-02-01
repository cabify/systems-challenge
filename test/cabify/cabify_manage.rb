describe service('cabify') do
  it { should be_enabled }
  it { should be_installed }
  it { should be_running }
end

describe port(8181) do
  it { should be_listening }
  its('addresses') { should include '127.0.0.1' }
end
