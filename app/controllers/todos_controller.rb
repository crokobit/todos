class TodosController < ApplicationController
  
  before_action :set_todo, only: [:edit, :show, :update, :destroy]
  
  def index
    @todos = Todo.all    
  end
  
  def new
    @todo = Todo.new
  
  end
  
  def create
    @todo = Todo.create(todo_param) 
    if @todo.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  def edit; end

  def update
    if @todo.update(todo_param)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @todo.destroy
    redirect_to root_path   
  end

  def set_todo
    @todo = Todo.find(params[:id])
  end

  private
  
  def todo_param
    params.require(:todo).permit(:do_what)
  end
  
end
