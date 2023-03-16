module MeetingsHelper
  def is_meeting(meeting, hour, day)
    meeting.start_time.hour === hour && meeting.start_time.day.to_s === day
  end

  def get_week_day(day)
    (Date.today.beginning_of_week(:monday) + day).strftime('%d')
  end
end
