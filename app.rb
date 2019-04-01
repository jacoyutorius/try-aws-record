require 'aws-record'
require './models/user'

Aws.config.update(endpoint: 'http://localhost:8002')

# create db
cfg = Aws::Record::TableConfig.define do |t|
  t.model_class(User)
  t.read_capacity_units(5)
  t.write_capacity_units(2)
end
cfg.migrate!


if __FILE__ == $0
	require 'pp'

	# create user
	user = User.new({
		id: SecureRandom.uuid,
		name: 'yuto ogi',
		age: 35,
		posts: [
			'Hey!',
			'this is my first post!',
		],
		bio: {
			birthday: '1983-11-24',
			birth_place: 'Hamamatsu, Shizuoka'
		}
	})
	user.save

	pp User.scan
end