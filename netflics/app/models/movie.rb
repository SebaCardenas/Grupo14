class Movie < ApplicationRecord
  has_many :reviews
  belongs_to :category
  has_many :chapters

  validates :movie_img, attachment_presence: true
  has_attached_file :movie_img, styles: { movie_index: "250x350>", movie_show: "325x475>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :movie_img, content_type: /\Aimage\/.*\z/

  def self.search(search)
  where("title LIKE ? OR director LIKE? OR language LIKE? OR actor LIKE?" ,
  "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
  end




  def self.to_csv(user)
    attributes = %w{title n_chapter n_season language total_time}
    $user = user

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |m|
        csv << attributes.map{ |attr| m.send(attr) }
      end
    end  
  end 


  def total_time
    total = 0
     Movie.all.each  do  |m|
       if !$user.watchedseries.blank? && $user.watchedseries.split(",").include?(m.id.to_s)
        m.chapters.each do |c|
          total += c.duration
        end
      else
        m.chapters.each do |c|

          if !$user.watchedchapters.blank? && $user.watchedchapters.split(",").include?(c.id.to_s)
            total += c.duration
          end
        end
        end
      end
      "#{total} minutes"
  end

end
