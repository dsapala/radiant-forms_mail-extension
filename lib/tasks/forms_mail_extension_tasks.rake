namespace :radiant do
  namespace :extensions do
    namespace :forms_mail do
      
      desc "Copies public assets of the Custom Fields to the instance public/ directory."
      task :migrate => :environment do
        puts "nothing to do"
      end

      desc "Copies public assets of the Forms Mail Extension to the instance public/ directory."
      task :update => :environment do
        puts "nothing to do"
      end
      
    end
  end
end