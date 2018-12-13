#!usr/bin/ruby

#Dumps wav file from MKV
def mkvwav ( input, output )
  system "ffmpeg -i #{input} -acodec pcm_s16le -ac 2 #{output}"
end

#Creates video from mp3 and image file
def mp3img ( input, output )
  default = "title-card.png"
  puts "Image filename? (default is title-card.png)"
  image = STDIN.gets.chomp
  image = image.to_s.empty? ? default : image
  system "ffmpeg -r 1 -loop 1 -i #{image} -i #{input} -acodec copy -r 1 -shortest #{output}"
end

#Rotate an mp4 video using metadata - no conversion
def rotate ( input, output )
  default = "90"
  puts "Rotation amount? (default is 90)"
  rotation = STDIN.gets.chomp
  rotation = rotation.to_s.empty? ? default : rotation
  system "ffmpeg -i #{input} -map_metadata 0 -metadata:s:v rotate=#{rotation} -codec copy #{output}"
end

def init( script = ARGV[0], input = ARGV[1], output = ARGV[2] )
  case script
  when "mkvwav"
    mkvwav( input, output )
  when "mp3img"
    mp3img( input, output )
  when "rotate"
    rotate( input, output )
  else
    puts "\nfftools"
    puts "--------------"
    puts "mkvwav input.mkv output.wav"
    puts "Dumps wav file from MKV"
    puts "--------------"
    puts "mp3img input.mp3 output.mp4"
    puts "Creates video from mp3 and image file"
    puts "--------------"
    puts "rotate input.mp4 output.mp4"
    puts "Rotate an mp4 video using metadata - no conversion\n\n"
  end
end

init