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

describe TagsController do
  
  let!(:node) { FactoryGirl.create(:node) }
  let(:user) { FactoryGirl.create(:user) }
  let(:tag) { node.tags.create(:name => 'java', user: user) }
  

  # This should return the minimal set of attributes required to create a valid
  # Tag. As you add validations to Tag, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    { "name" => "java", "description" => ""}
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # TagsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all tags as @tags" do
      tag.should_not be_nil
      get :index, {}
      response.should be_success
    end
  end

  describe "GET show" do
    it "assigns the requested tag as @tag" do
      tag.should_not be_nil
      get :show, { :id => tag.to_param }
      assigns(:tag).should eq(tag)
    end
  end
  
  context "As a login user, User should can" do
    
    before(:each) { sign_in user }

    describe "GET new" do
      it "assigns a new tag as @tag" do
        get :new, {}
        assigns(:tag).should be_a_new(Tag)
      end
    end

    describe "GET edit" do
      it "assigns the requested tag as @tag" do
        tag.should_not be_nil
        get :edit, {:id => tag.to_param}
        assigns(:tag).should eq(tag)
      end
    end

    describe "POST create" do
      describe "with valid params" do
        xit "creates a new Tag" do
          expect {
            post :create, {:tag => valid_attributes }
          }.to change(Tag, :count).by(1)
        end

        it "assigns a newly created tag as @tag" do
          post :create, {:tag => valid_attributes}
          assigns(:tag).should be_a(Tag)
          assigns(:tag).should be_persisted
        end

        it "redirects to the created tag" do
          post :create, {:tag => valid_attributes}
          response.should redirect_to(tag)
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved tag as @tag" do
          # Trigger the behavior that occurs when invalid params are submitted
          Tag.any_instance.stub(:save).and_return(false)
          post :create, {:tag => { "name" => "invalid value" }}
          assigns(:tag).should be_a_new(Tag)
        end

        it "re-renders the 'new' template" do
          # Trigger the behavior that occurs when invalid params are submitted
          Tag.any_instance.stub(:save).and_return(false)
          post :create, {:tag => { "name" => "invalid value" }}
          response.should render_template("new")
        end
      end
    end

    describe "PUT update" do
      describe "with valid params" do
        it "updates the requested tag" do
          tag.should_not be_nil
          # Assuming there are no other tags in the database, this
          # specifies that the Tag created on the previous line
          # receives the :update_attributes message with whatever params are
          # submitted in the request.
          Tag.any_instance.should_receive(:update_attributes).with({ "name" => "java".parameterize })
          put :update, {:id => tag.to_param, :tag => { "name" => "java" }}
        end

        it "assigns the requested tag as @tag" do
          tag.should_not be_nil
          put :update, {:id => tag.to_param, :tag => valid_attributes}
          assigns(:tag).name.should eq(tag.name.parameterize)
        end

        it "redirects to the tag" do
          tag.should_not be_nil
          put :update, {:id => tag.to_param, :tag => valid_attributes}
          response.should redirect_to(tag)
        end
      end

      describe "with invalid params" do
        it "assigns the tag as @tag" do
          tag.should_not be_nil
          # Trigger the behavior that occurs when invalid params are submitted
          Tag.any_instance.stub(:save).and_return(false)
          put :update, {:id => tag.to_param, :tag => { "name" => "" }}
          assigns(:tag).should eq(tag)
        end

        it "re-renders the 'edit' template" do
          tag.should_not be_nil
          # Trigger the behavior that occurs when invalid params are submitted
          Tag.any_instance.stub(:save).and_return(false)
          put :update, {:id => tag.to_param, :tag => { name: "" }}
          response.should render_template("edit")
        end
      end
    end

    describe "DELETE destroy" do
      xit "destroys the requested tag" do
        tag.should_not be_nil
        expect {
          delete :destroy, {:id => tag.to_param}
        }.to change{node.tags.count}.by(-1)
      end

      it "redirects to the tags list" do
        tag.should_not be_nil
        delete :destroy, {:id => tag.to_param}
        response.should redirect_to(tags_url)
      end
    end
  end

end
