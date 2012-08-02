class TasksController < ApplicationController
  
  # GET /tasks
  def index
    @tasks = Task.order("date")
  end

  # GET /tasks/1
  def show
    @task = Task.find(params[:id])
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
    @task = Task.find(params[:id])
  end

  # POST /tasks
  def create
    @task = Task.new(params[:task])

    if @task.save
      redirect_to @task, notice: 'Zadanie zostalo utworzone.'
    else
      render action: "new"
    end
  end

  # PUT /tasks/1
  def update
    @task = Task.find(params[:id])

    if @task.update_attributes(params[:task])
      redirect_to @task, notice: 'Zadanie zostalo uaktualnone.'

    else
      render action: "edit"
    end
  end

  # DELETE /tasks/1
  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    redirect_to tasks_url
  end

  # YES/NO button switcher
  def toggle
    @task = Task.find(params[:id])
    @task.toggle!(:done)
    render :nothing => true
  end
end
