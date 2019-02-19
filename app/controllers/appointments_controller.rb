class AppointmentsController < ApplicationController
	before_action :set_appointment ,except: [:index, :new, :create, :all]
	# before_action :require_login
	
	def index
		@appointments = current_user.appointments
	end

	def new
		@appointment = Appointment.new

	end

	def create
		appointment = current_user.appointments.new(appointment_params)
			if appointment.save
				flash[:notice] = 'Appointment requested, please wait for a text on your phone to confirm the status'
				redirect_to user_appointments_path(current_user.id)
			else
				flash[:error] = 'Unfortunately something went wrong, please try again!'
				redirect_to user_appointments_path(current_user.id)
			end
	end

	def edit
		@appointment = Appointment.find(params[:id])
	end

	def show
	end

	def update
		if @appointment.update(appointment_params)
			flash[:notice] = 'Appointment updated, please wait for a text on your phone to confirm the status'
			redirect_to user_appointments_path(current_user.id)
		else
			flash[:error] = 'Unfortunately something went wrong, please try again!'
			redirect_to user_appointments_path(current_user.id)
		end
	end

	def destroy
		if @appointment.destroy
			redirect_to user_appointments_path(current_user.id)
			flash[:notice] = 'Deleted'
		else
			redirect_to user_appointments_path(current_user.id)
			flash[:error] = 'Something is wrong'
		end
	end

	def all
		@appointments = Appointment.all
	end

	private
	def appointment_params
		params.require(:appointment).permit(
			:appointment_date,
			:appointment_info
		)
	end
	def set_appointment
		@appointment = Appointment.find(params[:id])
	end

end
