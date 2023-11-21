class SpecializationsController < ApplicationController
  def index
    @specializations = []
    @specializations_list = Specialization.all
    @specializations_list.each do |specialization|
      @specializations << SpecializationSerializer.new(specialization).serializable_hash[:data][:attributes]
    end
    render json: @specializations
  end
end
