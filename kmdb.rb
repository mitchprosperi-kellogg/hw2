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
Movie.destroy_all
Studio.destroy_all
Actor.destroy_all
Role.destroy_all

# Generate models and tables, according to the domain model.
# TODO! DONE

# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.
# TODO!

#Movie
batman_begins = Movie.new 
batman_begins["title"] = "Batman Begins"
batman_begins["year_released"] = '2005'
batman_begins["rated"] = "PG-13"
#batman_begins["studio"] = "Warner Bros."
batman_begins.save

the_dark_knight = Movie.new 
the_dark_knight["title"] = "The Dark Knight"
the_dark_knight["year_released"] = '2008'
the_dark_knight["rated"] = "PG-13"
#the_dark_knight["studio"] = "Warner Bros."
the_dark_knight.save

the_dark_knight_rises = Movie.new 
the_dark_knight_rises["title"] = "The Dark Knight Rises"
the_dark_knight_rises["year_released"] = '2012'
the_dark_knight_rises["rated"] = "PG-13"
#the_dark_knight_rises["studio"] = "Warner Bros."
the_dark_knight_rises.save

#Studio
warner_bros = Studio.new 
warner_bros["name"] = "Warner Bros."
warner_bros.save

#Actor
actors = Actor.new 
actors["name"] = "Christian Bale"
actors.save

actors = Actor.new 
actors["name"] = "Michael Caine"
actors.save

actors = Actor.new 
actors["name"] = "Liam Neeson"
actors.save

actors = Actor.new 
actors["name"] = "Katie Holmes"
actors["name"] = "Gary Oldman"
actors["name"] = "Heath Ledger"
actors["name"] = "Aaron Eckhart"
actors["name"] = "Maggie Gyllenhaal"
actors["name"] = "Tom Hardy"
actors["name"] = "Joseph Gordon-Levitt"
actors["name"] = "Anne Hathaway"
actors.save

actors = Actor.new 
actors["name"] = "Gary Oldman"
actors.save

actors = Actor.new 
actors["name"] = "Heath Ledger"
actors.save

actors = Actor.new 
actors["name"] = "Aaron Eckhart"
actors.save

actors = Actor.new 
actors["name"] = "Maggie Gyllenhaal"
actors.save

actors = Actor.new 
actors["name"] = "Tom Hardy"
actors.save

actors = Actor.new 
actors["name"] = "Joseph Gordon-Levitt"
actors.save

actors = Actor.new 
actors["name"] = "Anne Hathaway"
actors.save


roles = Role.new
roles["character_name"] = "Bruce Wanye"
roles.save

roles = Role.new
roles["character_name"] = "Alfred"
roles.save

roles = Role.new
roles["character_name"] = "Ras Al Ghul"
roles.save

roles = Role.new
roles["character_name"] = "Rachel Dawes"
roles.save

roles = Role.new
roles["character_name"] = "Commissioner Gordon"
roles.save

roles = Role.new
roles["character_name"] = "Joker"
roles.save

roles = Role.new
roles["character_name"] = "Harvey Dent"
roles.save

roles = Role.new
roles["character_name"] = "Rachel Dawes"
roles.save

roles = Role.new
roles["character_name"] = "Bane"
roles.save

roles = Role.new
roles["character_name"] = "John Blake"
roles.save

roles = Role.new
roles["character_name"] = "Selina Kyle"
roles.save

#puts Movie.all.count
#puts Studio.all.count
#puts Actor.all.count
#puts Role.all.count


# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output.

# Like the second query, I'm unable to join to the studio table for some reason. 

movies = Movie.all
studios = Studio.all

for movie in movies
    #Display title, year released, and rating
    title = movie["title"]
  year_released = movie["year_released"]
    rated = movie["rated"]
    #Find studio
    studio_id = Studio.find_by({"id" => movie["studio_id"]}) # this doesn't seem to be working, not sure why
    studio_name = studio_id["name"] #------this seems to be causing issues, not sure why
 puts "#{title} #{year_released} #{rated}"
end 


# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.

# I'm unable to figure this out after several hours of reviewing notes/labs and attempting different methods. 
# Not sure what I'm doing wrong. 

movies = Movie.all
studios = Studio.all
actors = Actor.all
roles = Role.all

for role in roles
    #Display title
    movie_id = Movie.find.by({"movie_id" => role["movie_id"] })
    movie_name = movie_id["name"]
    #Find actor
    actor = Actor.find.by({"actor_id" => role["actor_id"] })
    #Find role
    character_name = role["character_name"]
   puts "#{movie_name} #{actor} #{character_name}"
  end 
