module ClientsHelper
  def status_parser(status)
    if status.downcase === 'active'
      'success'
    elsif status.downcase === 'finish'
      'primary'
      else 'warning'
    end
  end
end
