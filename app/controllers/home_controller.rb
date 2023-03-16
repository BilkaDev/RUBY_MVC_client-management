class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @meetings_count = Meeting.where('user_id': current_user.id)
                             .where(start_time: Time.zone.now.beginning_of_week..Time.zone.now.end_of_week).length
    @clients = Client.where('user_id': current_user)
    @todos = Todo.where('user_id': current_user)

  end
end
