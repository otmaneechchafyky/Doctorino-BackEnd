class AppointmentsController < ApplicationController
    def index
        @appointments = []
        @appointments_list = Appointment.all
        @appointments_list.each do |appointment|
          @appointments << {
            data: AppointmentSerializer.new(appointment).serializable_hash[:data][:attributes],
            animal: AnimalSerializer.new(appointment.animal).serializable_hash[:data][:attributes],
            vet: VetSerializer.new(appointment.vet).serializable_hash[:data][:attributes]
          }
        end
        render json: @appointments
    end
end
