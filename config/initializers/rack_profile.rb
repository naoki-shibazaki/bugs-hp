if Rails.env.development?
    require 'rack-mini-profiler'
    Rack::MiniProfiler.config.start_hidden = true
end