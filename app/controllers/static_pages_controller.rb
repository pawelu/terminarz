class StaticPagesController < ApplicationController
  def leave
    @leave_days = "Fri Jul 13 2012 00:00:00 GMT+0200 (CEST),Thu Jul 12 2012 00:00:00 GMT+0200 (CEST),Wed Jul 18 2012 00:00:00 GMT+0200 (CEST),Mon Jul 23 2012 00:00:00 GMT+0200 (CEST),Tue Aug 14 2012 00:00:00 GMT+0200 (CEST)"
    
    @days_selected = params[:days_selected]
    @days_used = params[:days_used]

    respond_to do |format|
      format.js
      format.html
    end
  end

  def changelog
  end
end
