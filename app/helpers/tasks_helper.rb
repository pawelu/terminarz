module TasksHelper
  def date_diff(date)
    (date - Date.today).to_i
  end

  def progress_class(value)
    color_class = case value
    when 0...15
      "progress-danger"
    when 15...33
      "progress-warning"
    else
      "progress-success"
    end
  end
end
