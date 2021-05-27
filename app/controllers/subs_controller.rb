class SubsController < ApplicationController
  # controller, traffic director
  # depending on the route, it will lead into somewhere on the controller 
  # Actions, anything we are able to do in a app, CRUD, Page, 
  # CRUD      HTTP
  # CREATE => POST
  # READ  => GET
  # UPDATE => PUT
  # Destroy => DELETE
  # Fat models, Skinny controller, logic mostly on models, actions 
  # Convention over configuration, follow the pattern 
  # controller actions must return or redirect to a HTML JSON XML 
  # index (GET) - it will show all of the record in the DB 
  # def index 
  #   @model_names = Model_name.all 
  #   render component: 'ModelNames', props: { model_names: @model_names }
  # end
  # show (GET) - it will show a single record, pass id 
  # def show 
  #   @model_name = Model_name.find(params[:id])
  #   render component: 'ModelName', props: { model_name: @model_name }
  # end
  # new (GET) - render out the new form, create a new item in memory 
  # def new 
  #   @model_name = Model_name.new 
  #   render component: 'ModelNew', props: { model_name: @model_name }
  # end
  # create (POST) - create into the db of the form values
  # def create 
  #   @model_name = Model_name.new(model_name_params)
  #   if @model_name.save 
  #     # either redirect or render something 
  #   else
  #     render component: 'ModelNew', props: { model_name: @model_name }
  #   end
  # end
  # edit (GET) - render out the edit form, pass id 
  # def edit 
  #   @model_name = Model_name.find(params[:id])
  #   render component: 'ModelNameEdit', props: { model_name: @model_name }
  # end
  # update (PUT) -  update in the db with the form value, pass id
  # def update 
  #   @model_name = Model_name.find(params[:id])
  #   if @model_name.update(model_name_params)
  #     # do something or go somewhere 
  #   else
  #     render component: 'ModelNameEdit', props: { model_name: @model_name }
  #   end
  # end
  # destroy (DELETE)- delete the item in the db, pass id
  # def destroy
  #   @model_name = Model_name.find(params[:id])
  #   @model_name.destroy
  #   # or 
  #   Model_name.find(params[:id]).destroy
  # end
  # controller params, is only restricted to what is in the params, and ensure the user 
  # input is vaild 
  # private
  #   def model_name_params
  #     params.require(:model_name).permit(:attr, :fields )
  #   end
  # controller call back- running logic at a certain time, before_action, clean up code
  # before_action :name of the method, only: [:index, :show]
  # before_action :name of the method, except: [:index, :show]
  # def name of the method 
  #   # common code 
  # end
  # #  then delete the common code every where else 
  # before_action :set_model_name, only: [:show, :edit, :update, :destroy]
  # private 
  #   def set_model_name
  #     @model_name = Model_name.find(params[:id])
  #   end
  def index 
    @subs = Sub.all 
    render component: 'Subs', props: { subs: @sub }
  end
  def show
    @sub = Sub.find(params[:id])
    render component: 'Sub', props: { sub: @sub }
  end
  def new
    @sub = Sub.new 
    render component: 'SubNew', props: { sub: @sub }
  end
  def create 
    @sub = Sub.new(sub_params)
    if @sub.save 
      redirect_to root_path
    else
      render component: 'SubNew', props: { sub: @sub }
    end
  end
  def edit
    @sub = Sub.find(params[:id])
    render component: 'SubEdit', props: { sub: @sub }
  end
  def update 
    @sub = Sub.find(params[:id])
    if @sub.update(sub_params)
      redirect_to root_path
    else
      render component: 'SubEdit', props: { sub: @sub }
    end
  end
  def destroy
    @sub = Sub.find(params[:id])
    @sub.destroy 
    redirect_to root_path
    # or
    # Sub.find(params[:id]).destroy
    # redirect_to root_path
  end
  private 
    # { sub: { title: 'title' } }
    # { sub: { title: '' } }
    # { sub: { title: '', age: 23, address: 'dasfasdf' } }
    # { sub: { title: 'SELECT*FROMUSERs', SELECT*FROMUSERs } }
    def sub_params
      params.require(:sub).permit(:title)
    end
end
