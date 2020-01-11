class Image
  attr_accessor :image

  def initialize(image)
    @image = image
  end

  def output_image
    @image.each {|x| puts x.join}
  end
  
  def blur distance
    distance.times do
      blur_coords!
    end
  end

  def blur_coords!
    blur_coords = []

    @image.each_with_index do |row, i|
      row.each_with_index do |x, j|
        blur_coords << [i, j] if x == 1
      end
    end

    blur_coords.each do |i, j|                              # 1, 1
      @image[i][j + 1] = 1 if j + 1 <= @image[i].length - 1 # 1, 2
      @image[i][j - 1] = 1 if j - 1 >= 0                    # 1, 0
      @image[i + 1][j] = 1 if i + 1 <= @image.length - 1    # 2, 1
      @image[i - 1][j] = 1 if i - 1 >= 0                    # 0, 1
    end
  end
end

image = Image.new([
  [0, 0, 0, 0, 0, 0],
  [0, 1, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0],
  [1, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 1],
  [0, 0, 0, 0, 0, 0]
])
image.blur 3
image.output_image