require 'spec_helper'
require 'ships'

RSpec.describe Carrier do
  it 'is an instance of Carrier' do
    expect(subject.class.name).to eq 'Carrier'
  end

  it 'is a child of ship' do
    expect(Carrier.superclass.name).to eq 'Ship'
  end

  it 'defaults to size 5' do
    expect(subject.size).to eq 5
  end
end

RSpec.describe Battleship do
  it 'is an instance of Battleship' do
    expect(subject.class.name).to eq 'Battleship'
  end

  it 'is a child of ship' do
    expect(Battleship.superclass.name).to eq 'Ship'
  end

  it 'defaults to size 5' do
    expect(subject.size).to eq 4
  end
end

RSpec.describe Cruiser do
  it 'is an instance of Cruiser' do
    expect(subject.class.name).to eq 'Cruiser'
  end

  it 'is a child of ship' do
    expect(Cruiser.superclass.name).to eq 'Ship'
  end

  it 'defaults to size 5' do
    expect(subject.size).to eq 3
  end
end

RSpec.describe Submarine do
  it 'is an instance of Submarine' do
    expect(subject.class.name).to eq 'Submarine'
  end

  it 'is a child of ship' do
    expect(Submarine.superclass.name).to eq 'Ship'
  end

  it 'defaults to size 5' do
    expect(subject.size).to eq 3
  end
end

RSpec.describe Destroyer do
  it 'is an instance of Destroyer' do
    expect(subject.class.name).to eq 'Destroyer'
  end

  it 'is a child of ship' do
    expect(Destroyer.superclass.name).to eq 'Ship'
  end

  it 'defaults to size 5' do
    expect(subject.size).to eq 2
  end
end
