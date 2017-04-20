require 'fog/core/collection'
require 'fog/artifactory/models/storage/directory'

module Fog
  module Storage
    class Artifactory
      class Directories < Fog::Collection
        model Fog::Storage::Artifactory::Directory

        def all
          # TODO: implement
        end

        def get(key, options = {})
          # TODO: implement
        end
      end
    end
  end
end
