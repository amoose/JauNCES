redis_conf = File.read(Rails.root.join("config/redis", "#{Rails.env}.conf"))
port = /port.(\d+)/.match(redis_conf)[1]

Geocoder.configure(
  :ip_lookup => :freegeoip,
  freegeoip: { host: 'localhost:8080' },

  # geocoding service request timeout, in seconds (default 3):
  :timeout => 2,

  # set default units to kilometers:
  # :units => :km,

  # caching (see below for details):
  :cache => Redis.new(:port => port)

)