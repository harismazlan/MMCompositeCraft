# frozen_string_literal: true

class AppointmentsController < ApplicationController
  before_action :set_appointment, except: %i[index new create all]

  def index
    @appointments = current_user.appointments
    @appointments = @appointments.order(appointment_date: :asc).page(params[:page])
  end

  def new
    if current_user.phone_number == ''
      redirect_to edit_user_path(current_user.id)
      flash[:notice] = 'Please fill in your phone number before creating an appointment!'
    else
      @appointment = Appointment.new
    end
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
    @appointment = Appointment.find(params[:id])
  end

  def update
    if @appointment.update(appointment_params)
      if current_user.admin?
        client = Twilio::REST::Client.new
        client.messages.create(
          from: ENV['TWILIO_PHONE_NUMBER'],
          to: ENV['MY_PHONE_NUMBER'],
          body: 'Your appointment status has been updated! Please login into our website and check the updated status!'
        )
        redirect_to all_appointments_path
        flash[:notice] = 'Appointment updated!'
      else
        redirect_to user_appointments_path(current_user.id)
        flash[:notice] = 'Appointment updated!'
      end
    else
      flash[:error] = 'Unfortunately something went wrong, please try again!'
      if current_user.admin?
        redirect_to all_appointments_path
        flash[:error] = 'Unfortunately something went wrong, please try again!'

      else
        redirect_to user_appointments_path(current_user.id)
        flash[:error] = 'Unfortunately something went wrong, please try again!'
      end
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
      @appointments = @appointments.order(appointment_date: :asc).page(params[:page])
      end
  end

  private

  def appointment_params
    params.require(:appointment).permit(
      :appointment_date,
      :appointment_info,
      :appointment_status,
      :user_id
    )
  end

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end
end
