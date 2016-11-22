class Peaks < DelegateClass(Array)
  attr_reader :peak_indicies

  def initialize numbers
    super numbers
    find_peaks
  end

  private

  def find_peaks
    return @peak_indicies if @peak_indicies

    @peak_indicies = []
    self.each_with_index do |num, index|
      next unless measurable?(index)

      if peak?(index, num)
        @peak_indicies << index
      end
    end
  end

  def measurable? index
    return false if self.nil?
    index != 0 && index != (self.length - 1)
  end

  def previous_element index, num=0
    return num unless measurable?(index)
    self[index-1]
  end

  def next_element index, num=0
    return num unless measurable?(index)
    self[index+1]
  end

  def peak? index, num
    previous_element(index, num) < num && next_element(index, num) < num
  end
end
