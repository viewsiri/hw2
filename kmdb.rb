# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!
# - Note rubric explanation for appropriate use of external resources.

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)
# - You are welcome to use external resources for help with the assignment (including
#   colleagues, AI, internet search, etc). However, the solution you submit must
#   utilize the skills and strategies covered in class. Alternate solutions which
#   do not demonstrate an understanding of the approaches used in class will receive
#   significant deductions. Any concern should be raised with faculty prior to the due date.

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
# TODO!

Studio.destroy_all
Movie.destroy_all
Actor.destroy_all
Role.destroy_all

# Generate models and tables, according to the domain model.
# TODO!


# rails generate model Studio
# rails generate model Movie
# rails generate model Actor
# rails generate model Role

# rails db.migrate


# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.
# TODO!

studio = Studio.new
studio["name"] = "Warner Bros."
studio.save

# puts "There are #{Studio.all.count} studios"

batman = Studio.find_by({"name" => "Warner Bros."})
movie = Movie.new
movie["title"] = "Batman Begins"
movie["year_released"] = 2005
movie["MPAA"] = "PG-13"
movie["studio_id"] = batman["id"]
movie.save

darkknight = Studio.find_by({"name" => "Warner Bros."})
movie = Movie.new
movie["title"] = "The Dark Knight"
movie["year_released"] = 2008
movie["MPAA"] = "PG-13"
movie["studio_id"] = darkknight["id"]
movie.save

darkknightrises = Studio.find_by({"name" => "Warner Bros."})
movie = Movie.new
movie["title"] = "The Dark Knight Rises"
movie["year_released"] = 2012
movie["MPAA"] = "PG-13"
movie["studio_id"] = darkknightrises["id"]
movie.save

actor = Actor.new
actor["name"] = "Christian Bale"
actor.save

actor = Actor.new
actor["name"] = "Michael Caine"
actor.save

actor = Actor.new
actor["name"] = "Liam Neeson"
actor.save

actor = Actor.new
actor["name"] = "Katie Holmes"
actor.save

actor = Actor.new
actor["name"] = "Gary Oldman"
actor.save

actor = Actor.new
actor["name"] = "Heath Ledger"
actor.save

actor = Actor.new
actor["name"] = "Aaron Eckhart"
actor.save

actor = Actor.new
actor["name"] = "Maggie Gyllenhaal"
actor.save

actor = Actor.new
actor["name"] = "Tom Hardy"
actor.save

actor = Actor.new
actor["name"] = "Joseph Gordon-Levitt"
actor.save

actor = Actor.new
actor["name"] = "Anne Hathaway"
actor.save

# puts "There are #{Actor.all.count} actors"

batman = Movie.find_by({"title" => "Batman Begins"})
christian_bale = Actor.find_by({"name" => "Christian Bale"})
role = Role.new
role["movie_id"] = batman["id"]
role["actor_id"] = christian_bale["id"]
role["character"] = "Bruce Wayne"
role.save

batman = Movie.find_by({"title" => "Batman Begins"})
michael_caine  = Actor.find_by({"name" => "Michael Caine"})
role = Role.new
role["movie_id"] = batman["id"]
role["actor_id"] = michael_caine["id"]
role["character"] = "Alfred"
role.save

batman = Movie.find_by({"title" => "Batman Begins"})
liam_neeson = Actor.find_by({"name" => "Liam Neeson"})
role = Role.new
role["movie_id"] = batman["id"]
role["actor_id"] = liam_neeson["id"]
role["character"] = "Ra's Al Ghul"
role.save

batman = Movie.find_by({"title" => "Batman Begins"})
katie_holmes = Actor.find_by({"name" => "Katie Holmes"})
role = Role.new
role["movie_id"] = batman["id"]
role["actor_id"] = katie_holmes["id"]
role["character"] = "Rachel Dawes"
role.save

batman = Movie.find_by({"title" => "Batman Begins"})
gary_oldman = Actor.find_by({"name" => "Gary Oldman"})
role = Role.new
role["movie_id"] = batman["id"]
role["actor_id"] = gary_oldman["id"]
role["character"] = "Commissioner Gordon"
role.save

darkknight = Movie.find_by({"title" => "The Dark Knight"})
christian_bale = Actor.find_by({"name" => "Christian Bale"})
role = Role.new
role["movie_id"] = darkknight["id"]
role["actor_id"] = christian_bale["id"]
role["character"] = "Bruce Wayne"
role.save

darkknight = Movie.find_by({"title" => "The Dark Knight"})
heath_ledger = Actor.find_by({"name" => "Heath Ledger"})
role = Role.new
role["movie_id"] = darkknight["id"]
role["actor_id"] = heath_ledger["id"]
role["character"] = "Joker"
role.save

darkknight = Movie.find_by({"title" => "The Dark Knight"})
aaron_eckhart = Actor.find_by({"name" => "Aaron Eckhart"})
role = Role.new
role["movie_id"] = darkknight["id"]
role["actor_id"] = aaron_eckhart["id"]
role["character"] = "Harvey Dent"
role.save

darkknight = Movie.find_by({"title" => "The Dark Knight"})
michael_caine = Actor.find_by({"name" => "Michael Caine"})
role = Role.new
role["movie_id"] = darkknight["id"]
role["actor_id"] = michael_caine["id"]
role["character"] = "Alfred"
role.save

darkknight = Movie.find_by({"title" => "The Dark Knight"})
maggie_gyllenhaal  = Actor.find_by({"name" => "Maggie Gyllenhaal"})
role = Role.new
role["movie_id"] = darkknight["id"]
role["actor_id"] = maggie_gyllenhaal["id"]
role["character"] = "Rachel Dawes"
role.save

darkknightrises = Movie.find_by({"title" => "The Dark Knight Rises"})
christian_bale = Actor.find_by({"name" => "Christian Bale"})
role = Role.new
role["movie_id"] = darkknightrises["id"]
role["actor_id"] = christian_bale["id"]
role["character"] = "Bruce Wayne"
role.save

darkknightrises = Movie.find_by({"title" => "The Dark Knight Rises"})
gary_oldman = Actor.find_by({"name" => "Gary Oldman"})
role = Role.new
role["movie_id"] = darkknightrises["id"]
role["actor_id"] = gary_oldman["id"]
role["character"] = "Commissioner Gordon"
role.save

darkknightrises = Movie.find_by({"title" => "The Dark Knight Rises"})
tom_hardy = Actor.find_by({"name" => "Tom Hardy"})
role = Role.new
role["movie_id"] = darkknightrises["id"]
role["actor_id"] = tom_hardy["id"]
role["character"] = "Bane"
role.save

darkknightrises = Movie.find_by({"title" => "The Dark Knight Rises"})
joseph_gordon_levitt = Actor.find_by({"name" => "Joseph Gordon-Levitt"})
role = Role.new
role["movie_id"] = darkknightrises["id"]
role["actor_id"] = joseph_gordon_levitt["id"]
role["character"] = "John Blake"
role.save

darkknightrises = Movie.find_by({"title" => "The Dark Knight Rises"})
anne_hathaway = Actor.find_by({"name" => "Anne Hathaway"})
role = Role.new
role["movie_id"] = darkknightrises["id"]
role["actor_id"] = anne_hathaway["id"]
role["character"] = "Selina Kyle"
role.save

# puts "There are #{Role.all.count} roles"

# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output.
# TODO!

moviesall = Movie.all

for movies in moviesall
    movie_title = movies["title"]
    movie_year = movies["year_released"]
    movie_mpaa = movies["MPAA"]
    movie_studio = movies["studio_id"]
        studio_name = Studio.find_by({"id" => movie_studio})
    puts "#{movie_title} #{movie_year} #{movie_mpaa} #{studio_name["name"]}"
end

# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.
# TODO!

rolesall = Role.all

for roles in rolesall 
    role_movie = roles["movie_id"]
        movie_name = Movie.find_by({"id" => role_movie})
    role_actor = roles["actor_id"]
        actor_name = Actor.find_by({"id" => role_actor})
    role_character = roles["character"]
    puts "#{movie_name["title"]} #{actor_name["name"]} #{role_character}"
end
