require 'spec_helper'

describe Api::ShipmentsController do

  describe '#index' do

    before do
      2.times { FactoryGirl.create :shipment }
      get :index, format: 'json'
    end

    it { should respond_with :success }

    describe 'json response' do
      let(:json_result) { JSON.parse response.body }
      subject { json_result }
      it { should have(2).shipments }

      context 'first item' do
        subject { json_result.first }
        its(:keys) { should =~ %w(id id_code arrival_time destination_port origin_port freighter_type) }
      end
    end
  end

  describe 'routing' do
    it 'responds to api/shipments.json' do
      { get: 'api/shipments.json' }.should route_to controller: 'api/shipments', action: 'index', format: 'json'
    end
  end

end
