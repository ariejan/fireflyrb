include Nanoc3::Helpers::LinkTo
include Nanoc3::Helpers::Filtering
include Nanoc3::Helpers::XMLSitemap

def image_tag(filename, options = {})
  options = {
    :align   => nil,
    :border  => 'none',
    :class   => nil,
    :width   => nil,
    :style   => nil,
    :caption => nil,
    :src     => "/images/#{filename}"
  }.merge(options)

  width     = options.delete(:width) || options.delete(:size)
  klass     = ['illustration', options.delete(:class), options[:align] ? "align_#{options[:align]}": nil].compact.join(" ")
  caption   = options.delete(:caption)
  tag_opts  = options.map { |k,v| v.nil? ? nil : "#{k.to_s}='#{v}'" }.compact.join(" ")

  out = []
  out << "<div class='#{klass}' style='width: #{width}px;'>"
  out << "<img #{tag_opts}>"
  out << "<p class='caption'>#{caption}</p>" if caption
  out << "</div>"
  out.join("\n")
end

