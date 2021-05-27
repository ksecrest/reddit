class TopicsController < ApplicationController
  # follow the pattern 
  # change Model_name -> @parent.model_names
  # for the index no .all
  # render component: 'ModelNames', props: { model_names: @model_names, parent: @parent }
  # before action to define @parent 
  # before action :set_parent
  # private 
  #     def set_parent
  #       @parent = Parent.find(params[:parent_id ])
  #     end
  before_action :set_sub
  before_action :set_topic, only: [:show, :edit, :update, :destroy]
  def index
    @topics = @sub.topics 
    render component: 'Topics', props: { topics: @topics, sub: @sub }
  end
  def show
    render component: 'Topic', props: { topic: @topic, sub: @sub }
  end
  def new
    @topic = @sub.topics.new 
    render component: 'TopicNew', props: { topic: @topic, sub: @sub }
  end
  def create
    @topic = @sub.topics.new(topic_params)
    if @topic.save
      redirect_to root_path
    else
      render component: 'TopicNew', props: { topic: @topic, sub: @sub }
    end
  end
  def edit
    render component: 'TopicEdit', props: { topic: @topic, sub: @sub }
  end
  def update
    if @topic.update(topic_params)
      redirect_to root_path
    else
      render component: 'TopicEdit', props: { topic: @topic, sub: @sub }
    end
  end
  def destroy
    @topic.destroy
    redirect_to root_path
  end
  private 
    def set_sub
      @sub = Sub.find(params[:sub_id])
    end
    def set_topic
      @topic = Topic.find(params[:id])
      # @topic = @sub.topics.find(params[:id])
    end
    def topic_params 
      params.require(:topic).permit(:title, :body)
    end
end