# encoding: utf-8

class TasksController < ApplicationController
  
  # GET /tasks
  def index
    @tasks = Task.order("date")
    @tasks_done = Task.where(:done => true).order("date")
    @tasks_not_done = Task.where(:done => false).order("date")
  end

  # GET /tasks/1
  def show
    @task = Task.find(params[:id])
  end

  # GET /tasks/new
  def new
    @task = Task.new
    @update_button_text = "Utwórz zadanie"
  end

  # GET /tasks/1/edit
  def edit
    @task = Task.find(params[:id])
    @update_button_text = "Aktualizuj zadanie"

  end

  # POST /tasks
  def create
    @task = Task.new(params[:task])

    if @task.save
      redirect_to @task, notice: 'Zadanie zostało utworzone.'
    else
      render action: "new"
    end
  end

  # PUT /tasks/1
  def update
    @task = Task.find(params[:id])

    if @task.update_attributes(params[:task])
      redirect_to @task, notice: 'Zadanie zostało uaktualnone.'

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
    @tasks_done = Task.where(:done => true).order("date")
    @tasks_not_done = Task.where(:done => false).order("date")

    @task = Task.find(params[:id])
    @task.toggle!(:done)
    render :nothing => true
  end
end
