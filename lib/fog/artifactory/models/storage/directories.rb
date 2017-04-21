require 'fog/core/collection'
require 'fog/artifactory/models/storage/directory'

module Fog
  module Storage
    class Artifactory
      class Directories < Fog::Collection
        model Fog::Storage::Artifactory::Directory

        def all
          data = service.client.get('/api/repositories')
          load(data)
        end

        def get(key, _options = {})
          data = service.client.get("/api/repositories/#{key}")
          new(key: data['key'])
        rescue Artifactory::Error::HTTPError => _e
          nil
        end
      end
    end
  end
end
