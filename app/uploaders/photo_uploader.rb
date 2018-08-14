class PhotoUploader < Shrine 
	plugin :upload_options, store: ->(io, context) do
    if context[:version] == :thumb
      {acl: "public-read"}
    else
      {acl: "private"}
    end
  end
end 