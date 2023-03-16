class MeetingsController < ApplicationController
  before_action :authenticate_user!, only: %i[ index show edit update destroy create ]
  before_action :set_meeting, only: %i[ show edit update destroy confirm confirm_meeting]
  before_action :set_client, only: %i[ show confirm confirm_meeting]
  before_action :set_clients, only: %i[ index edit ]

  # GET /meetings or /meetings.json
  def index
    @meetings = Meeting.where('user_id': current_user.id)
    @meeting = Meeting.new
  end

  # GET /meetings/1 or /meetings/1.json
  def show
  end

  # GET /meetings/1/edit
  def edit
  end

  # GET /meetings/1/confirm
  def confirm
  end

  # POST /meetings or /meetings.json
  def create
    @meeting = Meeting.new(meeting_params.merge(user_id: current_user.id))
    respond_to do |format|
      if @meeting.save
        @user = User.find(@meeting.user_id)
        @client = Client.find(@meeting[:client_id])
        ConfirmMailer.confirm_message(@meeting, @user, @client).deliver_now
        format.html { redirect_to meetings_url, notice: "Meeting was successfully created." }
        format.json { render :show, status: :created, location: @meeting }
      else
        format.html { render :index, status: :unprocessable_entity }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meetings/1 or /meetings/1.json
  def update
    respond_to do |format|
      if @meeting.update(meeting_params)
        format.html { redirect_to meeting_url(@meeting), notice: "Meeting was successfully updated." }
        format.json { render :show, status: :ok, location: @meeting }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meetings/1 or /meetings/1.json
  def destroy
    @meeting.destroy

    respond_to do |format|
      format.html { redirect_to meetings_url, notice: "Meeting was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def confirm_meeting
    @meeting[:confirmed] = 1
    respond_to do |format|
      if @meeting.save
        format.html { redirect_to meeting_confirm_path, notice: "Meeting was successfully updated."}
        format.json { render :confirm, status: :ok, location: :confirm }
      else
        format.html { redirect_to meeting_confirm_path, alert: "Sorry, please contact with us..." }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_meeting
    @meeting = Meeting.find(params[:id].blank? ? params[:meeting_id] : params[:id])
  end

  def set_client
    @client = Client.find(@meeting[:client_id])
  end

  def set_clients
    @clients = Client.where('user_id': current_user.id)
  end

  # Only allow a list of trusted parameters through.
  def meeting_params
    start_time_hour = params[:meeting][:"start_time_hour(4i)"]
    start_time_day = params[:meeting][:start_time]
    start_time = start_time_day + "T" + start_time_hour + ":00"
    end_time = start_time_day + "T" + (start_time_hour.to_i + 1).to_s + ":00"
    params[:meeting][:start_time] = start_time
    params[:meeting][:end_time] = end_time
    params[:meeting][:user_id] = current_user
    params.require(:meeting).permit(:user_id, :client_id, :start_time, :end_time, :confirmed, :details)
  end
end
