class StudentsController < ApplicationController

    rescue_from ActiveRecord::RecordNotFound, with: :not_found
    rescue_from ActiveRecord::RecordInvalid, with: :invalid_response
    def index
        students = Student.all 
        render json: students

    end

    def show 
       student = Student.find(params[:id])
       render json: student
    end

    def create 
        student = Student.create(student_params)
        render json: student, status: :created
    end

    def update 

        student = Student.find(params{:id})
        student.update(student_params)
        render json: student
    end 

    def destroy 

        student = Student.find(params[:id])
        student.destroy
        head :no_content
    end



    private

    def student_params

        params.permit(:name, :major, :age, :instuctor_id)
    end

    def invalid_response 
        render json: {error: "invalid data"}, status: :unprocessable_entity 
    end

    def not_found 
        render json: {error: "Instructor not found"}, status: :not_found
    end
end
