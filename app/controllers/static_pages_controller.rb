class StaticPagesController < ApplicationController
  def leave
    @leave_days = "1342130400000,1342044000000,1342562400000,1342994400000,1341957600000"
    @days_selected = params[:daysSelected]
    @days_used = params[:daysSelectedCount]

    respond_to do |format|
      format.js
      format.html
    end
  end

  def changelog
  end
end
