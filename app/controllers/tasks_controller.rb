class TasksController < ApplicationController

  def index
    @task = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.name == ""
      render :new
    elsif @task.description == ""
      render :new
    else
    @task.save
    redirect_to "#"
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update_attributes(task_params)
    redirect_to "#"
  end

  def destroy
    @task = Task.find(params[:id]).destroy
    redirect_to "#"
  end

  def boolean
    @task = Task.find(params[:id])
    if @task.completed == false
      @task.completed = true
      @task.save
    else @task.completed == true
      @task.completed = false
      @task.save
    end
      redirect_back(fallback_location: "#")
  end
  private
  def task_params
    params.require(:task).permit(:name, :description)
  end
end
