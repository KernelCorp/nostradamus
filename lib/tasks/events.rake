namespace :nostra do

  desc "Destroy orphaned events"
  task clear_events: :environment do
    events = Event.where(question: nil)
    puts "Find #{events.count} bad event"
    events.destroy
  end

  task search_bad_events: :environment do
    #Define hash with structure bad_event => error_message
    bad_events = Hash.new
    Event.where(created_at: nil).all.each do |event|
      bad_events[event.id] = 'Created_at field is empty'
    end
    Event.where(question: nil).all.each do |event|
      bad_events[event.id] = 'Event has no question'
    end
    puts bad_events
  end

end
