require 'fog/core/model'

module Fog
  module Storage
    class Artifactory
      class File < Fog::Model
        identity :key, aliases: 'path'

        attribute :name
        attribute :rev, aliases: 'rev'
        attribute :content_encoding, aliases: 'Content-Encoding'
        attribute :content_length, aliases: ['size']
        attribute :content_type, aliases: 'mime_type'
        attribute :last_modified, aliases: ['client_mtime']

        def body
          # TODO: implement
        end

        def body=(new_body)
          # TODO: implement
        end

        def directory
          @directory
        end

        def destroy
          # TODO: implement
        end

        def save(options = {})
          # TODO: implement
        end

        def public_url
          # TODO: implement
        end

        def url
          # TODO: implement
        end
      end
    end
  end
end
