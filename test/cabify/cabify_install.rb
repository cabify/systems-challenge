bottle_version = attribute('bottle_version', default: '0.12.13')

describe package('python-pip') do
  it { should be_installed }
end

describe pip('bottle') do
  it { should be_installed }
  its('version') { should eq bottle_version }
end

describe file('/opt/cabify/cabify.py') do
  it { should exist }
end
