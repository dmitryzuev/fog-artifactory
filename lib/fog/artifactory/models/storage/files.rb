require 'fog/core/collection'
require 'fog/artifactory/models/storage/file'

module Fog
  module Storage
    class Artifactory
      class Files < Fog::Collection
        model Fog::Storage::Artifactory::File

        attribute :directory

        def get(key, options = {}, &block)
          # TODO: implement
        end

        def head(key, options = {})
          # TODO: implement
        end

        def new(attributes = {})
          # TODO: implement
        end
      end
    end
  end
end
