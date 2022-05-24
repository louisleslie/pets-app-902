class PetsController < ApplicationController
    before_action :find_pet, only: [:show, :edit, :update, :destroy]

    def index
        @pets = Pet.all
    end

    def show
    end

    def new
        @pet = Pet.new
    end

    def create
        @pet = Pet.new(pet_params)
        if @pet.save
            redirect_to pet_path(@pet)
        else
            render "new", status: :unprocessable_entity
        end
    end

    def edit
    end
    
    def update
        if @pet.update(pet_params)
            redirect_to pet_path(@pet)
        else
            render "edit", status: :unprocessable_entity
        end
    end

    def destroy
        @pet.destroy
        redirect_to pets_path, status: :see_other
    end

    private
    def find_pet
        @pet = Pet.find(params[:id])
    end

    def pet_params
        params.require(:pet).permit(:name, :species, :date_found, :claimed)
    end
end
