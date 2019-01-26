require 'spec_helper'

RSpec.describe Board do
  it 'is an instance of board class' do
    expect(subject.class.name).to eq 'Board'
  end

  it 'includes length width and state attributes on board' do
    expect(subject.respond_to?(:length)).to eq(true)
    expect(subject.respond_to?(:width)).to eq(true)
    expect(subject.respond_to?(:state)).to eq(true)
  end

  it 'defaults board size is 10 by 10' do
    expect(subject.length).to eq 10
    expect(subject.width).to eq 10
  end

  it 'default board size is 10' do
    expect(subject.state[0].length).to eq 10
    expect(subject.state.length).to eq 10
  end

  it 'can set length, width and state attributes on board' do
    can_set_attribute(:length, subject, 50)
    can_set_attribute(:width, subject, 50)
    can_set_attribute(:state, subject, 'fake_state')
  end
end
