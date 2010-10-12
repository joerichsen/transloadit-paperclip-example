Paperclip.interpolates :unique_prefix do |attachment, style|
  attachment.instance.send("#{attachment.name}_unique_prefix")
end

