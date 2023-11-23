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

    def create
        @appointment = Appointment.new(appointment_params)
        if @appointment.save
            render json: { message: 'Appointment created successfully.',
            animal: AnimalSerializer.new(appointment.animal).serializable_hash[:data][:attributes],
            vet: VetSerializer.new(appointment.vet).serializable_hash[:data][:attributes] },
            status: :created
        else
            render json: { errors: @appointment.errors.full_messages }, status: :unprocessable_entity
        end
    end

    private

    def appointment_params
        params.require(:appointment).permit(:date, :time, :location, :duration, :animal_id, :vet_id)
    end
end
