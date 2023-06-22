# frozen_string_literal: true

require 'rails_helper'
RSpec.describe ContactsController, type: :controller do
  describe 'GET #new' do
    it 'assigns a new contact' do
      get :new
      expect(assigns(:contact)).to be_a_new(Contact)
    end

    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    let(:valid_params) do
      { contact: { name: 'John Doe', email: 'john@example.com', message: 'Hello', subject: 'Test' } }
    end
    let(:invalid_params) { { contact: { name: '', email: '', message: '' } } }

    context 'with valid parameters' do
      it 'redirects to the portfolio display path with a notice' do
        post :create, params: valid_params
        expect(response).to redirect_to(home_path)
        expect(flash[:notice]).to eq('Message sent!')
      end
    end

    context 'with invalid parameters' do
      it 'renders the new template with an error message' do
        post :create, params: invalid_params
        expect(response).to render_template(:new)
        expect(response.status).to eq(422)  # Unprocessable Entity
        expect(flash[:alert]).to eq('Invalid form')
      end
    end

    context 'when a Net::SMTPFatalError occurs' do
      before do
        smtp_fatal = Net::SMTPFatalError.new(valid_params)
        allow_any_instance_of(Contact).to receive(:deliver).and_raise(smtp_fatal)
      end

      it 'renders the new template with a mail server error message' do
        post :create, params: valid_params
        expect(response).to render_template(:new)
        expect(response.status).to eq(422)
        expect(flash[:alert]).to eq('Mail Server Error: try again later')
      end
    end

    context 'when an unexpected error occurs' do
      before do
        allow_any_instance_of(Contact).to receive(:deliver).and_raise(RuntimeError)
      end

      it 'renders the new template with an unexpected error message' do
        post :create, params: valid_params
        expect(response).to render_template(:new)
        expect(response.status).to eq(422)
        expect(flash[:alert]).to eq('Unexpected Error : RuntimeError ')
      end
    end
  end
end
