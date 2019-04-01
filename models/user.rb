require 'aws-record'

class User
	include Aws::Record
	integer_attr :id, hash_key: true
	string_attr :name
	integer_attr :age
	list_attr :posts
	map_attr :bio
end
