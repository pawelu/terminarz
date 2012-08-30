module TasksHelper
  def date_diff(date)
    (date - Date.today).to_i
  end

  # bootstrap's progress bar color
  def progress_class(value)
    color_class = case value
                  when 0...15 then "progress-danger"
                  when 15...33 then "progress-warning"
                  else "progress-success"
                  end
  end
end
