require "redis"

redis_conf = File.read(Rails.root.join("config/redis", "#{Rails.env}.conf"))
conf_file = Rails.root.join("config/redis", "#{Rails.env}.conf").to_s
port = /port.(\d+)/.match(redis_conf)[1]
`redis-server #{conf_file}`
res = `ps aux | grep redis-server`

unless res.include?("redis-server") && res.include?("#{Rails.env}.conf")
  raise "Couldn't start redis"
end

REDIS = Redis.new(:port => port)