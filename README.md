# README

a Blog Application, that uses a RESTful API to do the
following:

- Authenticate Users (Login, Signup)
- Each user has the following fields (name, email, password, image)
- User will log in using his email and password
- All other api endpoints are not accessible without authentication
- Use JWT for API authentication
CRUD Posts
- Each post has the following fields (title, body, author, tags, comments) ​ Please
note that the author is a separate entity which is the user model.
- Users/authors can only edit/delete their own posts
- Users/authors can add comments on any post
- Users/authors can only edit/delete their own comments
- Users/authors can update the post tags
- Each post must have at least one tag
- All posts must be deleted after 24 hours of its creation date
Using Ruby On Rails framework, mysql database, Sidekiq and redis (to schedule post deletion)

dockerized at branch dockerize
-

Using a docker-compose file for the whole stack, you can run `docker-compose up` to run
the whole stack without any extra commands or setup

