# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::DemosController, type: :controller do
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

  describe 'GET #show' do
    let!(:demo) { create(:demo) }
    let!(:slides) { create_list(:slide, 3, :web, content: 'content', demo_id: demo.id) }

    let(:json_body) { JSON.parse(response.body) }

    before do
      get :show, params: { id: demo.id }
    end

    it 'returns json with the number of slides' do
      expect(json_body['slides'].length).to eq(slides.length)
    end

    it 'success response' do
      expect(response).to be_successful
    end
  end
end
