#img
Testing process

	cd /var/www/JackSON
	rake data:destroy
	rake data:fake['cite/templates/img/collection.json.erb','cite/generators/img/collection.rb',50,'collection']
	rake data:fake['cite/templates/img/upload.json.erb','cite/generators/img/upload.rb',1000,'upload']
	rake data:fake['cite/templates/img/item.json.erb','cite/generators/img/item.rb',1000,'item']
	rake triple:make
