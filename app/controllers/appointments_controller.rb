class AppointmentsController < ApplicationController
	before_action :set_appointment ,except: [:index, :new, :create, :all]
	
	def index
		@appointments = current_user.appointments
		@appointments = @appointments.order(appointment_date: :asc).page(params[:page])

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
		if params[:search]
	        @appointments = Appointment.all.search_appointment(params[:search]).page params[:page]
	    else
			@appointments = Appointment.all
			@appointments = @appointments.order(user_id: :asc).page(params[:page])
	    end
	end

	private

	def appointment_params
		params.require(:appointment).permit(
			:appointment_date,
			:appointment_info,
			:user_id
		)
	end
	
	def set_appointment
		@appointment = Appointment.find(params[:id])
	end

end
