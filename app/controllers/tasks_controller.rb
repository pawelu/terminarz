# encoding: utf-8

class TasksController < ApplicationController

  before_filter :authenticate_user!
  
  # GET /tasks
  def index
    # @tasks = Task.order("date")

    @tasks_done = current_user.tasks.where(:done => true).order("date")
    @tasks_not_done = current_user.tasks.where(:done => false).order("date")
  end

  # GET /tasks/1
  def show
    @task = current_user.tasks.find(params[:id])
  end

  # GET /tasks/new
  def new
    @task = current_user.tasks.new
    @update_button_text = "Utwórz zadanie"
  end

  # GET /tasks/1/edit
  def edit
    @task = current_user.tasks.find(params[:id])
    @update_button_text = "Aktualizuj zadanie"

  end

  # POST /tasks
  def create
    @task = current_user.tasks.new(params[:task])

    if @task.save
      redirect_to @task, notice: 'Zadanie zostało utworzone.'
    else
      render action: "new"
    end
  end

  # PUT /tasks/1
  def update
    @task = current_user.tasks.find(params[:id])

    if @task.update_attributes(params[:task])
      redirect_to @task, notice: 'Zadanie zostało uaktualnone.'

    else
      render action: "edit"
    end
  end

  # DELETE /tasks/1
  def destroy
    @task = current_user.tasks.find(params[:id])
    @task.destroy

    redirect_to tasks_url
  end

  # YES/NO button switcher
  def toggle
    @task = current_user.tasks.find(params[:id])
    @task.toggle!(:done)

    @tasks_done = current_user.tasks.where(:done => true).order("date")
    @tasks_not_done = current_user.tasks.where(:done => false).order("date")

    respond_to do |format|
      format.js
      format.html { render :nothing => true }
    end
  end
end
