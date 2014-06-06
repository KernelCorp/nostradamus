class EventsController < InheritedResources::Base
  actions :index

  def index
    @events = current_user.events
    @new_events = Array.new
    if current_user.events_last_viewed_at.nil?
      @new_events = @events
    else
      @events.each do |event|
        if current_user.events_last_viewed_at < event.created_at
          @new_events << event
        end
      end
    end
    current_user.events_last_viewed_at = DateTime.now()
    current_user.save!
  end

end
