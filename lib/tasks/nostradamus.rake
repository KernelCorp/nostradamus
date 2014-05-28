namespace :nostradamus do
  task category_resave: :environment do
    Category.each &:save
  end

  task migrate_question: :environment do
    Category.each do |cat|
      cat.questions.each do |q|
        NewQuestion.create _id: q.id, title: q.title, text: q.text, end_date: q.end_date, start_date: q.start_date,
                           right_answer: q.right_answer, status: q.status, category: cat, image: q.image
      end
    end
  end
end