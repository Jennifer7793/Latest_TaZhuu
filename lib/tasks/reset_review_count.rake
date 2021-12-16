desc "Recount Review Count"
task :reset_review_size => :environment do
  p Course.all.each do |course|
    Course.reset_counters(course.id, :reviews)
  end
end