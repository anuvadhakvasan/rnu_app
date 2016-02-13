# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Shift.delete_all
# Editor.delete_all
# Typist.delete_all
# Reader.delete_all
# Booking.delete_all
models = [Shift, Editor, Typist, Reader, Booking]

models.each do |model|
     model.delete_all
end


mor_shift = Shift.create(name: "Morning")
eve_shift = Shift.create(name: "Evening")

editors =  %w(Srinivasan ChandraMohan Bhoovaraghan Sankaran PraveenKumar Elandjejiane Manavazhagane Karthikeyan)
typists = %w(Devanathan Parimala Sengeni Vasanthy Vanathy Gangammal Anandhi VenkataMohan Santhi Jothikamaraj Vijaya)

readers = %w(Narayanasamy Roshna Malarvizhi Patchiammalle Sundari RamaSubramanian Veeramani Jayalilli Sathguna Vasugi Ahavan Malathy Bharathy KothaiNayaki KalaVaradhan)


editors.each do |e|
    Editor.create(name: e)
end

typists.each do |t|
    Typist.create(name: t)
end

readers.each do |r|
    Reader.create(name: r)
end

t = Date.today
b = t.beginning_of_year
e = t.end_of_year + 2.year
range = (b..e).to_a
final_range = range.map { |d|  d.strftime("%Y-%m-%d") }

final_range.each do |d|
    Booking.create(date: d, shift_id: "1", editor_id: "2")
end    

final_range.each do |d|
     Booking.create(date: d, shift_id: "2", editor_id: "1")
end

# next_date = t + 1.month

# Booking.create(date: next_date, shift_id: "2", editor_id: "1")
    
    
# srinivasan = Editor.create(name: "RSSvasan")
# chandramohan = Editor.create(name: "CMohan")

# devanathan = Typist.create(name: "Devanathan")
# parimala = Typist.create(name: "Parimala")

# roshna = Reader.create(name: "Roshna")
# narayanasamy = Reader.create(name: "Narayanasamy")

  
    

# dates.each do |d|
#      Shift.all.each do |s|
#          Editor.all.each do |e|
#               Typist.all.each do |t|
#                   Reader.all.each do |r|
#                       Booking.create(date: d, shift_id: s.id, editor_id: e.id, typist_id: t.id, reader_id: r.id)
#                   end
#               end
#           end
#       end
# end
