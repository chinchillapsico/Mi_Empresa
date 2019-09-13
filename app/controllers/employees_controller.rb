class EmployeesController < ApplicationController
    def create
        @employee = Employee.new(employee_params)
        @employee.company = Company.find(params[:company_id])
        #el empleado comod efinimos en los modelos necesita de un area y una compañia, el area esta definida en strong params, pero compañia no, por lo que se agrega de esa manera .company
        @employee.save

        redirect_to @employee.company
        # esta ruta se hace automaticamente y redirecciona a companies id a la que hace referencia es lo smimso a redirect_to company_path(@employee_id)
    end

    def destroy
        @employee = Employee.find(params[:company_id])
        @employee.destroy
        redirect_to @employee.company
    end 

    private
    def employee_params
        params.require(:employee).permit(:first_name, :last_name, :email, :area_id )
    end
end
