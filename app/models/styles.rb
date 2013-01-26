require 'open4'

class Styles < ActiveRecord::Base
  attr_accessible :css, :sass, :url

  validates :url, presence: true

  def calculate_css
    self.css = `phantomjs lib/css-ratiocinator/ratiocinate.js "#{url}"`
    self.css = self.css.sub /^.*\/\* Computing/m, '/* Computing'
    pid, stdin, stdout, stderr = Open4::popen4 "sass-convert"
    stdin.puts self.css
    stdin.close
    self.sass = stdout.read.strip
    self.save
  end
end
