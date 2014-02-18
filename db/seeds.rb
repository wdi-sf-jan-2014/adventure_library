# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# adv = Adventure.create!(:title => "#{name}'s Test Adventure",
# 	:author => name)
# adv.pages.create!(:name => "start",
# 	:text => "This is a great text adventure which is beginning right now!  I can't wait to [[see the end|end]]")
# adv.pages.create!(:name => "end",
# 	:text => "Wow that adventure was amazing!")

# My name as name for all seed Adventures
name = "Nathan"


# Story 1
# Include Title/Author/GUID for Adventure Model
adv = Adventure.create!(:title => "#{name}'s Excellent Adventure",
  :author => name,
  :guid => SecureRandom.urlsafe_base64(10)
  )
adv.pages.create!(:name => "start",
  :text => "This is a great text adventure which is beginning right now!  I can't wait to [[see the end|end]]")
adv.pages.create!(:name => "end",
  :text => "Wow that adventure was amazing!")


# Story 2
# Include Title/Author/GUID for Adventure Model
adv = Adventure.create!(:title => "#{name}'s Bogus Journey",
  :author => name,
  :guid => SecureRandom.urlsafe_base64(10)
  )
adv.pages.create!(:name => "start",
  :text => "This is a great text adventure which is beginning right now!  I can't wait to [[see the end|end]]")
adv.pages.create!(:name => "end",
  :text => "Wow that adventure was amazing!")