# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

SpecScoreApi::User.create(nick: 'Dagobert', email:'dago@bert')
SpecScoreApi::User.create(nick: 'Donald', email:'donald@duck')

SpecScoreApi::User.all.each do |user|
  project = SpecScoreApi::Project.create(name: user.nick + 's_project', owner_id: user.id)
  user.projects << project
end

SpecScoreApi::Project.all.each do |project|
  SpecScoreApi::User.all.each do |user|
    SpecScoreApi::Teammate.create(project: project, user: user)
  end
end