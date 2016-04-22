require './routes'

# Running before test
Before do
  @train = Train.new "AB5, BC4, CD8, DC8, DE6, AD5, CE2, EB3, AE7"
end
