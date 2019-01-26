require 'spec_helper'
require 'ships'

RSpec.describe Carrier do
  it 'is a subclass of ship' do
    expect(Carrier.superclass.name).to eq 'Ship'
  end

  it 'defaults to size 5' do
    expect(subject.size).to eq 5
  end
end

RSpec.describe Carrier do
  it 'is a subclass of ship' do
    expect(Carrier.superclass.name).to eq 'Ship'
  end

  it 'defaults to size 5' do
    expect(subject.size).to eq 5
  end
end

RSpec.describe Battleship do
  it 'is a subclass of ship' do
    expect(Battleship.superclass.name).to eq 'Ship'
  end

  it 'defaults to size 5' do
    expect(subject.size).to eq 4
  end
end

RSpec.describe Cruiser do
  it 'is a subclass of ship' do
    expect(Cruiser.superclass.name).to eq 'Ship'
  end

  it 'defaults to size 5' do
    expect(subject.size).to eq 3
  end
end

RSpec.describe Submarine do
  it 'is a subclass of ship' do
    expect(Submarine.superclass.name).to eq 'Ship'
  end

  it 'defaults to size 5' do
    expect(subject.size).to eq 3
  end
end

RSpec.describe Destroyer do
  it 'is a subclass of ship' do
    expect(Destroyer.superclass.name).to eq 'Ship'
  end

  it 'defaults to size 5' do
    expect(subject.size).to eq 2
  end
end
