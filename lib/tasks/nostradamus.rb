namespace :nostradamus do
  task category_resave: :environment do
    Category.each &:save
  end
end