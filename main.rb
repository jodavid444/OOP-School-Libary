require_relative 'app'

def main
  app = App.new
  loop do
    app.run
    puts
  end
end

main
