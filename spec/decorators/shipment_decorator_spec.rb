require 'spec_helper'

describe ShipmentDecorator do
  before { ApplicationController.new.set_current_view_context }

  describe '#state' do
    let(:decorator) { ShipmentDecorator.new stub('shipment', state: state) }
    subject { decorator }

    context 'with state nil' do
      let(:state) { nil }
      its(:state) { should eql 'unknown' }
    end

    context 'with state set' do
      let(:state) { 'park' }
      its(:state) { should eql 'park' }
    end

  end
end
