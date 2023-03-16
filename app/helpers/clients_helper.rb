module ClientsHelper
  def status_parser(status)
    if status.downcase === 'active'
      'success'
    elsif status.downcase === 'finish'
      'primary'
    else
      'warning'
    end
  end

  def get_next_date(meetings)
    if meetings.blank?
      return ''
    end
    meetings.sort { |a, b| (a[:start_time] - DateTime.now).abs <=> (b[:start_time] - DateTime.now).abs }[0][:start_time].strftime("%Y-%m-%d %H:%M")
  end
end
