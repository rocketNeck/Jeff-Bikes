# README


Ruby version: 2.4.0
Rails: 5


Jeff Bikes is a web application built to help my friend Jeff keep track of all of the bikes in his database.
It is built using Ruby on Rails, with Devise, cloudinary, aws s3, carrierwave, etc. It is a CRUD app utilizing MVC patterns, REST, and postgresql database.
For styles I am using sass, bootstrap, and css. This is at the same time, a fun project and a useful tool for a friend.

To play around you should:
1. clone locally
2. run bundler
3. install figaro  `$ bundle exec figaro install`
4. set up pgsql local database server and connection in database.yml
5. rake db:migrate
6. in config/application.yml set the secret_key/app_id/secret/etc. to your sendgrid/facebook/google_oauth2/aws s3/ etc. ENV variables

Then hack away! :)

Any questions? email me homestarflyer@gmail.com

Copyright (c) 2016 Jesse L Lawson

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
