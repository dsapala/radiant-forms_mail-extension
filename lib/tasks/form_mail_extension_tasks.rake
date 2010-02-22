namespace :radiant do
  namespace :extensions do
    namespace :form_mail do
      
      desc "Runs the migration of the Mail extension"
      task :migrate => :environment do
        require 'radiant/extension_migrator'
        if ENV["VERSION"]
          FormExtension.migrator.migrate(ENV["VERSION"].to_i)
        else
          FormExtension.migrator.migrate
        end
      end
      
      desc "Copies public assets of the Custom Fields to the instance public/ directory."
      task :update => :environment do
        puts "nothing to do"
      end
      
    end
  end
end