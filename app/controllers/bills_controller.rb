class BillsController < ApplicationController
  def index
    @bills = Bill.all
  end

  def show
    @bill = Bill.find(params[:id])
  end

  def new
    @bill = Bill.new
    @employees = Employee.all
  end

  def create
    @bill = Bill.new(bill_params)
    if @bill.save
      flash[:success] = 'Bill was successfully created.'
      redirect_to bills_path
    else
      @employees = Employee.all
      flash.now[:error] = 'There was an error creating the bill.'
      render :new
    end
  end

  private

  def bill_params
    params.require(:bill).permit(:amount, :bill_type, :submitted_employee_id)
  end
end
