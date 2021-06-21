class Api::TasksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index 
    @tasks = Task.order('created_at DESC')
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      render json: @task, status: 201
    else
      render json: @task.errors, status: 422
    end
  end
  def destroy
    Task.find(params[:id]).destroy!
  end
  # toggle! インスタンスに保存されているbooleanの値を反転させて、データベースに保存する。
  # 処理成功時にtrueをreturnする。
  def update
    Task.find(params[:id]).toggle!(:is_done)
  end

  private

  def task_params
    params.require(:task).permit(:name, :is_done)
  end
end
