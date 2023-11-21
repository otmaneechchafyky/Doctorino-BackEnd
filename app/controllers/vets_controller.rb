class VetsController < ApplicationController
  before_action :set_vet, only: %i[show]
  def index
    @vets = []
    @vets_list = Vet.all
    @vets_list.each do |vet|
      @vets << {
        data: VetSerializer.new(vet).serializable_hash[:data][:attributes],
        specialization: SpecializationSerializer.new(vet.specialization).serializable_hash[:data][:attributes]
      }
    end
    render json: @vets
  end

  def show
    render json: {
      data: VetSerializer.new(@vet).serializable_hash[:data][:attributes],
      specialization: SpecializationSerializer.new(@vet.specialization).serializable_hash[:data][:attributes]
    }
  end

  def destroy
  end

  def create
  end

  private

  def set_vet
    @vet = Vet.find(params[:id])
  end
end
