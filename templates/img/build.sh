#!/bin/bash
cd /var/www/JackSON
rake data:destroy
rake data:fake['cite/templates/img/license.json.erb','cite/generators/img/license.rb',25,'license']
rake data:fake['cite/templates/img/collection.json.erb','cite/generators/img/collection.rb',50,'collection']
rake data:fake['cite/templates/img/upload.json.erb','cite/generators/img/upload.rb',1000,'upload']
rake data:fake['cite/templates/img/resize.json.erb','cite/generators/img/resize.rb',5000,'resize']
rake data:fake['cite/templates/img/item.json.erb','cite/generators/img/item.rb',1000,'item']
rake data:fake['cite/templates/img/roi.json.erb','cite/generators/img/roi.rb',10000,'roi']
rake triple:make