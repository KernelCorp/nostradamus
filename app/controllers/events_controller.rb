class EventsController < InheritedResources::Base
  actions :index

  require 'will_paginate/array'

  def index
    @events = current_user.events
    current_user.save!

    @events = @events.sort_by{ |e| e.created_at }.reverse!
    @events = @events.paginate(page: params[:page], per_page: 10)
  end

end
