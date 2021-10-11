require 'rails_helper'

RSpec.describe AnswerController, type: :controller do
  let(:question) { FactoryBot.create(:question) }
  describe 'GET #new' do
    before {get :new, params: { question_id: question.id } }

    it 'assigns a new Answer to @answer' do
      expect(assigns(:answer)).to be_a_new(Answer)
    end

    it 'renders new view' do
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    context 'valid attributes' do
      it 'saving answer for question' do
        expect{post :create, params: {question_id: question.id, answer: attributes_for(:answer)}}.to change(question.answers, :count).by(1)
      end
      it 'redirect to show question' do
        post :create, params: {question_id: question.id, answer: attributes_for(:answer)}
        expect(response).to redirect_to question_path(question)
      end
    end

    context 'invalid attributes'do
    it 'not saving answer for question' do
      expect{post :create, params: {question_id: question.id, answer: attributes_for(:invalid_answer)}}.to_not change(question.answers, :count)
    end
    it 're-renders new view' do
      post :create, params: {question_id: question.id, answer: attributes_for(:invalid_answer)}
      expect(response).to render_template :new
    end
    end
  end
end
