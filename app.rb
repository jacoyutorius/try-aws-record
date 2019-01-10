require 'aws-record'
require 'pp'

Aws.config.update(endpoint: 'http://localhost:8002')

class User
	include Aws::Record
	integer_attr :id, hash_key: true
	string_attr :name
	integer_attr :age
	list_attr :posts
	map_attr :bio
end

# create db
cfg = Aws::Record::TableConfig.define do |t|
  t.model_class(User)
  t.read_capacity_units(5)
  t.write_capacity_units(2)
end
cfg.migrate!


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