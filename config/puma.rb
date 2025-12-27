
#threads_count = ENV.fetch("RAILS_MAX_THREADS", 3)
#threads threads_count, threads_count

# Specifies the `port` that Puma will listen on to receive requests; default is 3000.
#port ENV.fetch("PORT", 3000)

# Allow puma to be restarted by `bin/rails restart` command.
#plugin :tmp_restart

# Run the Solid Queue supervisor inside of Puma for single-server deployments
#plugin :solid_queue if ENV["SOLID_QUEUE_IN_PUMA"]

# Specify the PID file. Defaults to tmp/pids/server.pid in development.
# In other environments, only set the PID file if requested.
#pidfile ENV["PIDFILE"] if ENV["PIDFILE"]


workers Integer(ENV['WEB_CONCURRENCY'] || 2)
threads_count = Integer(ENV['RAILS_MAX_THREADS'] || 5)
threads threads_count, threads_count

preload_app!

rackup DefaultRackup
port ENV['PORT'] || 3000
environment ENV['RACK_ENV'] || 'development'

on_worker_boot do
  ActiveRecord::Base.establish_connection
end