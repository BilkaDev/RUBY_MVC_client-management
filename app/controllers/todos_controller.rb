class TodosController < ApplicationController
  before_action :set_todo, only: %i[ show edit update destroy ]

  # GET /todos or /todos.json
  def index
    @todos = Todo.where('user_id': current_user.id)
    @todo = Todo.new
  end

  # GET /todos/1/edit
  def edit
  end

  # POST /todos or /todos.json
  def create
    @todo = Todo.new(todo_params_with_current_user)

    respond_to do |format|
      if @todo.save
        format.html { redirect_to todos_url, notice: "Todo was successfully created." }
        format.json { render todos_url, status: :created, location: @todo }
      else
        format.html { render :index, status: :unprocessable_entity }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /todos/1 or /todos/1.json
  def update
    respond_to do |format|
      if @todo.update(todo_params_with_current_user)
        format.html { redirect_to todos_url, notice: "Todo was successfully updated." }
        format.json { render todos_url, status: :ok }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  def toggle_status
    todo = Todo.find(params['todo_id'])
    todo['status'] = todo['status'] == 0 ? 1 : 0
    todo.save

    respond_to do |format|
      format.html { redirect_to todos_url }
      format.json { render todos_url, status: :ok}
    end
  end

  # DELETE /todos/1 or /todos/1.json
  def destroy
    @todo.destroy

    respond_to do |format|
      format.html { redirect_to todos_url, notice: "Todo was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_todo
    @todo = Todo.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def todo_params
    params.require(:todo).permit(:description, :status)
  end

  def todo_params_with_current_user
    { "description" => todo_params['description'], "status" => todo_params['status'] || 0, "user_id" => current_user.id }
  end
end
