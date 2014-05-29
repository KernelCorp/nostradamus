namespace :nostradamus do
  task category_resave: :environment do
    Category.each &:save
  end

  task add_is_right_to_question: :environment do
    Question.closed.each do |q|
      q.answers.each {|a| a.update_attributes! is_right: (a.value == q.right_answer)}
    end
  end
end
