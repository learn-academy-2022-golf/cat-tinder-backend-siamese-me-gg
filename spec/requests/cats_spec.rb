require 'rails_helper'

RSpec.describe "Cats", type: :request do

  let(:valid_attributes) do
    {
      'name' => 'Test',
      'age' => 4,
      'enjoys' => 'something amazing',
      'image' => 'howisthispossible'
    }
  end

  let(:invalid_attributes) do
    {
      'name' => '',
      'age' => 'boy',
      'enjoys' => '',
      'image' => 3
    }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      cat = Cat.new(valid_attributes)
      cat.save
      get cats_url
      expect(response).to be_successful
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Cat' do
        expect do
          post cats_url, params: { cat: valid_attributes }
          expect(response).to be_successful
          expect(response).to have_http_status(200)
        end.to change(Cat, :count).by(1)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        {
          'name' => 'New',
          'age' => 4,
          'enjoys' => 'something amazing',
          'image' => 'howisthispossible'
        }
      end

      it 'updates the requested post' do
        cat = Cat.new(valid_attributes)

        cat.save
        patch cat_url(cat), params: { cat: new_attributes }
        cat.reload
        expect(response).to be_successful
        expect(response).to have_http_status(200)
        expect(cat.name).to eq 'New'
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested cat' do
      cat = Cat.new(valid_attributes)
      cat.save
      expect do
        delete cat_url(cat)
      end.to change(Cat, :count).by(-1)
    end
  end

end