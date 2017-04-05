require 'assessments_helper'

students = [*1..20].shuffle

20.times do
  Assessment.seed do |a|
    a.date = Faker::Date.between(10.years.ago, Date.today)
    a.score = Random.rand(100.0).truncate(2).to_s
    a.student_id = students.pop
  end
end
