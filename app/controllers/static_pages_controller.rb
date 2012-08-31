class StaticPagesController < ApplicationController
  before_filter :authenticate_user!, :except => :changelog

  def leave
    @leave_days = current_user.leave_days

    @days_selected = params[:daysSelected]
    @days_used = params[:daysSelectedCount]

    days_all = params[:daysAll]

    if !days_all.nil?
      current_user.leave_all = days_all
      current_user.save
    end

    if !@days_selected.nil?
      current_user.leave_used = @days_used
      current_user.leave_days = @days_selected
      current_user.save
    end

    respond_to do |format|
      format.js
      format.html
    end
  end

  def changelog
  end
end
