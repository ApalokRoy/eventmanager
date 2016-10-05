class ExpensesController < ApplicationController
  before_action :find_event_and_task

  def show
    @expense = Expense.find(params[:id])
  end

  def new
    @expense = Expense.new
  end

  def create
    @expense = @task.expenses.new(expense_params)
    
    if @expense.save
      flash[:success] = "Expense with #{@expense.name} is Created Successfully!"
      redirect_to event_task_expense_path(@event , @task , @expense)
    else
      render 'new'
    end
  end

  def edit
    @expense = Expense.find(params[:id])
  end

  def update
    @expense = Expense.find(params[:id])
    if @expense.update_attributes(expense_params)
      flash[:success] = "Expense updated"
      redirect_to event_task_expense_path(@event, @task, @expense)
    else
      render 'edit'
    end
  end

  def index
    @expenses = @task.expenses.paginate(page: params[:page], per_page:10)
  end

  def destroy
    Expense.find(params[:id]).destroy
    flash[:success] = "Expense deleted"
    redirect_to event_task_expenses_path
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :cost)
  end

  def find_event_and_task
    @event = Event.find(params[:event_id])
    @task = @event.tasks.find(params[:task_id])
  end
end
