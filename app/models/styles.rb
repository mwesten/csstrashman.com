class Styles < ActiveRecord::Base
  attr_accessible :css, :sass, :url

  validates :url, presence: true

  def calculate_css
    self.css = `phantomjs lib/css-ratiocinator/ratiocinate.js "#{url}"`
    self.css = self.css.sub /^.*\/\* Computing/m, '/* Computing'
    self.save
  end
end
