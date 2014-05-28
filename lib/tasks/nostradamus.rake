namespace :nostradamus do
  task category_resave: :environment do
    Category.each &:save
  end

  task migrate_question: :environment do
    Category.each do |cat|
      cat.questions.destroy_all
    end
  end
end