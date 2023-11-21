class VetsController < ApplicationController
  def index
    @vets = []
    @vets_list = Vet.all
    @vets_list.each do |vet|
      @vets << VetSerializer.new(vet).serializable_hash[:data][:attributes]
    end
    render json: @vets
  end

  def show
  end

  def destroy
  end

  def create
  end
end
