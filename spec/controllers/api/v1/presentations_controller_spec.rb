# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe Api::V1::PresentationsController, type: :controller do
  let!(:demo) { create(:demo) }
  let!(:slide_one) { create(:slide, :web, demo: demo) }
  let(:json_body) { JSON.parse(response.body) }
  let(:now) { Time.now }

  describe 'POST #create' do
    context 'with demo' do
      let(:params) do
        { demo_id: demo.id }
      end

      it 'creates a presentation for the demo' do
        expect { post :create, params: params }.to change { Presentation.count }.by(1)
      end

      context 'when presentation is created' do
        let(:presentation) { demo.reload.presentations.last }

        before do
          post :create, params: params
        end

        it 'assigns presentation to actual demo' do
          expect(presentation.id).to eq(json_body['id'])
        end

        it 'start_at is assigned' do
          expect(presentation.start_at).not_to be_nil
        end

        it 'active slide is the first one' do
          expect(presentation.active_slide_id).to eq(demo.slides.first.id)
        end

        it 'presented slides has first slide' do
          expect(presentation.presented_slides.length).to eq(1)
        end

        it 'presented slides has start at and correct slide id' do
          slides = presentation.presented_slides
          expect(slides.first['id']).to eq(demo.slides.first.id)
          expect(slides.first['start_at']).not_to be_nil
          expect(slides.first['end_at']).to be_nil
        end
      end
    end
  end

  describe 'PATCH #update' do
    let!(:presentation) { create(:presentation, start_at: now, demo: demo) }
    let(:params) { { id: presentation.id } }

    before do
      patch :update, params: params
    end

    context 'when stopping presentation, updating end time' do
      let(:params) do
        {
          id: presentation.id,
          presentation: {
            end_at: true
          }
        }
      end

      it 'assigns an end_date' do
        expect(presentation.reload.end_at).not_to be_nil
      end

      it 'returns amount of time' do
        expect(json_body['time_spent']).not_to be_nil
        expect(json_body['time_spent']).to eq('less than a minute')
      end
    end

    context 'when updating active_slide' do
      let(:slide_two) { create(:slide, :html, demo: demo) }

      let(:params) do
        {
          id: presentation.id,
          presentation: {
            active_slide_id: slide_two.id
          }
        }
      end

      it 'active slide is changed' do
        expect(presentation.reload.active_slide_id).to eq(slide_two.id)
      end

      it 'previous presented slide has end_time' do
        slides = presentation.reload.presented_slides
        first_slide = slides.select { |s| s['id'] == slide_one.id }.first

        expect(first_slide['end_at']).not_to be_nil
        expect(first_slide['time_spent']).not_to be_nil
      end

      it 'the next presented slide has start_at time' do
        slides = presentation.reload.presented_slides
        first_slide = slides.select { |s| s['id'] == slide_two.id }.first

        expect(first_slide).not_to be_nil
        expect(first_slide['start_at']).not_to be_nil
      end
    end
  end

  describe 'GET #show' do
    let!(:presentation) { create(:presentation, start_at: now, demo: demo) }

    let(:params) do
      {
        id: presentation.id
      }
    end

    before do
      get :show, params: params
    end

    it 'returns payload' do
      expect(response).to be_successful
      expect(json_body).not_to be_nil
    end

    context 'when there is no presentation http 404' do
      let(:params) { { id: '3232' } }

      it 'returns empty payload' do
        expect(response).to be_successful
        expect(json_body).to be_nil
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
