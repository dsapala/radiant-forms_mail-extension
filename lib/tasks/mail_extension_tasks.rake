namespace :radiant do
  namespace :extensions do
    namespace :mail do
      
      desc "Runs the migration of the Mail extension"
      task :migrate => :environment do
        puts "nothing to do"
      end
      
      desc "Copies public assets of the Custom Fields to the instance public/ directory."
      task :update => :environment do
        puts "nothing to do"
      end
      
    end
  end
end