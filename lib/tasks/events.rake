namespace :nostra do

  desc "Destroy orphaned events"
  task clear_events: :environment do
    Event.where(question: nil).all.destroy
  end

  task search_events: :environment do
    bad_events = Array.new
    Event.each do |event|
      if !((event.type == 'new_question') || (event.type == 'close_question'))
        puts 'ERROR: Event ' + event.id + ' has wrong type'
        bad_events = bad_events | [event]
      end
      if event.created_at == nil
        puts 'ERROR: Event ' + event.id + ' has no timestamps'
        bad_events = bad_events | [event]
      end
      if !(event.question.is_a? Question)
        puts 'ERROR: Event ' + event.id + ' has bad question'
      end
    end
    puts 'Bad events list: '
    bad_events.each do |event|
      puts event.id
    end
  end

end
