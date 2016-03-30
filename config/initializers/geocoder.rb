redis_conf = File.read(Rails.root.join("config/redis", "#{Rails.env}.conf"))
port = /port.(\d+)/.match(redis_conf)[1]

Geocoder.configure(

  # geocoding service (see below for supported options):
  :lookup => :yandex,

  # to use an API key:
  # :api_key => "...",

  # geocoding service request timeout, in seconds (default 3):
  :timeout => 5,

  # set default units to kilometers:
  # :units => :km,

  # caching (see below for details):
  :cache => Redis.new(:port => port)

)