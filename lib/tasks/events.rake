namespace :nostra do
  desc "Destroy orphaned events"
  task clear_events: :environment do
    Event.where(question: nil).all.destroy
  end

end
