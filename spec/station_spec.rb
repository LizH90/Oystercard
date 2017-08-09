require 'station'

describe Station do

  subject(:station) {described_class.new("London Bridge", "Zone 1")}

  it 'expect to initialize with name' do
    expect(subject.name).to eq "London Bridge"
  end
end
