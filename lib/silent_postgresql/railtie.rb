module SilentPostgresql
  
  class Railtie < Rails::Railtie
    initializer "silent_postgres.insert_into_active_record" do
      ActiveSupport.on_load :active_record do
        begin
          ActiveRecord::ConnectionAdapters::PostgreSQLAdapter.send(:include, SilentPostgresql)
        rescue NameError
        end
      end
    end
  end

end
