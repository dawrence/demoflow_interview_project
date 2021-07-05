# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DemosController, type: :controller do
  describe 'GET #index' do
    context 'with Demos' do
      let(:demos_number) { 5 }
      let!(:demos) { create_list(:demo, 5) }

      let(:json_body) { JSON.parse(response.body) }

      before do
        get :index
      end

      it 'returns json with the number of demos' do
        expect(json_body.length).to eq(demos_number)
      end
    end

    context 'without Demos' do
      let(:json_body) { JSON.parse(response.body) }

      before do
        get :index
      end

      it 'returns json with the number of demos' do
        expect(json_body.length).to eq(0)
      end
    end
  end
end
