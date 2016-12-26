require 'open-uri'

material_url = "http://cs229.stanford.edu/materials.html"
root_url = "http://cs229.stanford.edu/"

html = open(material_url).read

pat1 = /"(http:\/\/cs229.stanford.edu\/)?([\d\w_\/-]+\.pdf)"/
links = html.scan(pat1).to_a

dir_name = "files/"

Dir.mkdir(dir_name) unless Dir.exist?(dir_name)

for link in links
	filename = link[1].gsub('/','-')
	puts filename
	full_url = root_url + link[1]
	puts full_url
	open(dir_name + filename, 'wb') do |file|
	  file << open(full_url).read
	end
end