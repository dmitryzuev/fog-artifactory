require 'fog/core/collection'
require 'fog/artifactory/models/storage/file'

module Fog
  module Storage
    class Artifactory
      class Files < Fog::Collection
        model Fog::Storage::Artifactory::File

        attribute :directory

        def all(options = {})
          requires :directory
          options = options.reject { |_key, value| value.nil? || value.to_s.empty? }
          merge_attributes(options)
          load(service.client.get('/api/search/artifact', name: '.*', repos: directory.key)['results'].map do |artifact|
            path = URI.parse(artifact['uri']).path
            endpoint_path = URI.parse(service.client.endpoint).path
            path.slice!(endpoint_path)
            service.client.get(path)
          end)
        end

        def get(key, _options = {}, &_block)
          requires :directory
          new(service.client.get("/api/storage/#{directory.key}#{key}"))
        end

        def head(key, options = {})
          # TODO: implement
        end

        def new(attributes = {})
          requires :directory
          super({ directory: directory }.merge(attributes))
        end
      end
    end
  end
end
