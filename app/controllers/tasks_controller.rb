class TasksController < ApplicationController
  before_action :find_event, except: [:all, :changestatus]


  def show
    @task = Task.find(params[:id])
    @expenses = @task.expenses
  end

  def new
    @task = Task.new
  end

  def create
    @task = @event.tasks.new(task_params)

    if @task.save
      flash[:success] = "Task with #{@task.name} is Created Successfully!"
      redirect_to event_task_path(@event, @task)
    else
      render 'new'
    end

  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])

    if @task.update_attributes(task_params)
      flash[:success] = "Task updated Successfully!"
      redirect_to event_task_path(@event, @task)
    else
      render 'edit'
    end

  end

  def index
    @tasks = @event.tasks.paginate(page: params[:page], per_page:10)
  end

  def destroy
    Task.find(params[:id]).destroy
    flash[:success] = "Task deleted"
    redirect_to event_tasks_path(@event)
  end

  # Task Deallocation
  def deallocate
    task = Task.find(params[:id])
    @task = task.update_attribute(:user_id , nil)
    flash[:success] = "Task Deallocated Successfully!"
    redirect_to event_tasks_path(@event)
  end

  #All tasks
  def all
    @tasks = Task.paginate(page: params[:page], per_page:10)
  end

  #Changing The Status
  def changestatus
    task = Task.find_by name: (params[:name])

    if params[:status] == 'true'
      @task = task.update_attribute(:completed , true )
    else
      @task = task.update_attribute(:completed , false )
    end

    redirect_to action: 'all'
  end

  private

  def task_params
    params.require(:task).permit(:name, :deadline,:completed ,:user_id)
  end

  def find_event
    @event = Event.find(params[:event_id])
  end

end
