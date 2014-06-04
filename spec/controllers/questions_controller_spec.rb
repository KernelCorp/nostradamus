require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe QuestionsController do

  # This should return the minimal set of attributes required to create a valid
  # Question. As you add validations to Question, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "title" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # QuestionsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all questions as @questions" do
      question = FactoryGirl.create :question
      get :index, {category_id: question.category}, valid_session
      assigns(:questions).should eq([question])
    end
  end

  describe "GET show" do
    it "assigns the requested question as @question" do
      question = FactoryGirl.create :question
      get :show, {category_id: question.category, id: question.to_param}, valid_session
      assigns(:question).should eq(question)
    end
  end

  describe "GET new" do
    before :each do
      @category = FactoryGirl.create :category
      @user = FactoryGirl.create :user, account: 2000
      sign_in @user
    end
    it "assigns a new question as @question" do
      get :new, {category_id: @category.to_param}, valid_session
      assigns(:question).should be_a_new(Question)
    end

    it 'allowed only for users with account > 1000' do
      @user.update_attributes! account: 0
      expect{get :new, {category_id: @category.to_param}}.to raise_error(CanCan::AccessDenied)
    end
  end

  describe "GET edit" do
    it "assigns the requested question as @question" do
      question = FactoryGirl.create :question
      sign_in question.user
      get :edit, {category_id: question.category, id: question.to_param}, valid_session
      assigns(:question).should eq(question)
    end
  end

  describe "POST create" do
    before do
      @category = FactoryGirl.create :category
      @user = FactoryGirl.create :user, account: 2000
      sign_in @user
    end

    describe "with valid params" do
      it "creates a new Question" do
        expect {
          post :create, {category_id: @category.to_param, question: valid_attributes}, valid_session
        }.to change{@category.reload.questions.count}.by(1)
      end

      it "assigns a newly created question as @question" do
        post :create, {category_id: @category.to_param, question: valid_attributes}, valid_session
        assigns(:question).should be_a(Question)
        assigns(:question).should be_persisted
      end

      it "redirects to the created question" do
        post :create, {category_id: @category.to_param, question: valid_attributes}, valid_session
        response.should redirect_to(Question.last)
      end

      it 'question was added to user' do
        expect{
          post :create, {category_id: @category.to_param, question: valid_attributes}
        }.to change{@user.questions.count}.by(1)
      end
    end

  end

  describe "PUT update" do
    describe "with valid params" do
      before :each do
        @question = FactoryGirl.create :question 
        sign_in @question.user
      end
      it "updates the requested question" do
        Question.any_instance.should_receive(:update).with({ "title" => "MyString" })
        put :update, {category_id: @question.category, id: @question.to_param, question: valid_attributes}, valid_session
      end

      it "assigns the requested question as @question" do
        put :update, {category_id: @question.category, id: @question.to_param, question: valid_attributes}, valid_session
        assigns(:question).should eq(@question)
      end

      it "redirects to the question" do
        put :update, {category_id: @question.category, id: @question.to_param, :question => valid_attributes}, valid_session
        response.should redirect_to([@question.category, @question])
      end
    end


  end

  describe "DELETE destroy" do
    before :each do
      @question = FactoryGirl.create :question
      @category = @question.category
      sign_in @question.user
    end
    it "destroys the requested question" do
      expect {
        delete :destroy, {category_id: @question.category, id: @question.to_param}, valid_session
      }.to change{@category.reload.questions.count}.by(-1)
    end

    it "redirects to the questions list" do
      delete :destroy, {category_id: @question.category, id: @question.to_param}, valid_session
      response.should redirect_to(category_questions_url)
    end
  end

  describe 'PUT close' do
    before :each do
      @question = FactoryGirl.create :question
      sign_in @question.user
      put :close, category_id: @question.category, id: @question, right_answer: true
    end

    it "change status to 'closed'" do
      expect(@question.reload.status).to eq('closed')
    end

    it 'change right_answer' do
      expect(@question.reload.right_answer).to be_true
    end
  end

end
