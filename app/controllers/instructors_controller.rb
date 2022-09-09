class InstructorsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :not_found
    rescue_from ActiveRecord::RecordInvalid, with: :invalid_response
    def index
        instructors = Instructor.all 
        render json: instructors

    end

    def show 
       instructor = Instructor.find(params[:id])
       render json: instructor
    end

    def create 
        instructor = Instructor.create(instructor_params)
        render json: instructor, status: :created
    end

    def update 

        instructor = Instruction.find(params{:id})
        instructor.update(instructor_params)
        render json: instructor
    end 

    def destroy 

        instructor = Instruction.find(params[:id])
        instructor.destroy
        head :no_content
    end



    private

    def instructor_params

        params.permit(:name)
    end

    def invalid_response 
        render json: {error: "invalid data"}, status: :unprocessable_entity 
    end


    def not_found 
        render json: {error: "Instructor not found"}, status: :not_found
    end
end
