class EmployeesController < ApplicationController
  def index
    @employees = Employee.all
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def new
    @employee = Employee.new
    @departments = Department.all
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      flash[:success] = 'Employee was successfully created.'
      redirect_to employees_path
    else
      @departments = Department.all
      flash.now[:error] = 'There was an error creating the employee.'
      render :new
    end
  end

  def edit
    @employee = Employee.find(params[:id])
    @departments = Department.all
  end

  def update
    @employee = Employee.find(params[:id])
    if @employee.update(employee_params)
      flash[:success] = 'Employee was successfully updated.'
      redirect_to employees_path
    else
      @departments = Department.all
      flash.now[:error] = 'There was an error updating the employee.'
      render :edit
    end
  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
    flash[:success] = 'Employee was successfully destroyed.'
    redirect_to employees_path
  end

  def bills
    @employee = Employee.find(params[:id])
    @bills = @employee.bills
  end

  private

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :email, :designation, :department_id)
  end
end
