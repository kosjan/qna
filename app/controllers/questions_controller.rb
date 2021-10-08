class QuestionsController < ApplicationController
  #GET index
  def index
    @questions = Question.all
  end
end
