namespace :nostra do
  desc "Destroy orphaned events"
  task clear_events: :environment do
    events = Event.where(question: nil)
    puts "Find #{events.count} bad event"
    events.destroy
  end

end
