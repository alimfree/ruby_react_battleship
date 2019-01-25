require 'spec_helper'
require 'fleet'

RSpec.describe Fleet do
	it 'responds to all possible ship types'
		expect(subject.respond_to?(:carrier)).to eq true
		expect(subject.respond_to?(:battleship)).to eq true
		expect(subject.respond_to?(:cuiser)).to eq true
		expect(subject.respond_to?(:submarine)).to eq true
		expect(subject.respond_to?(:destroyer)).to eq true		
	end
end