class OutputDecorator
  def initialize outpus
    @outpus = outpus
  end

  def run
    @outpus.each_with_index do |output, number|
      print decore output, number+1
    end
  end

  def decore output, number
    "\e[34mOutput ##{number}\e[0m: \e[32m#{output}\e[0m\n"
  end
end
