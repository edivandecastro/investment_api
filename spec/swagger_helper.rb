# frozen_string_literal: true

require 'rails_helper'

RSpec.configure do |config|
  # Specify a root folder where Swagger JSON files are generated
  # NOTE: If you're using the rswag-api to serve API descriptions, you'll need
  # to ensure that it's configured to serve Swagger from the same folder
  config.openapi_root = Rails.root.join('swagger').to_s

  # Define one or more Swagger documents and provide global metadata for each one
  # When you run the 'rswag:specs:swaggerize' rake task, the complete Swagger will
  # be generated at the provided relative path under openapi_root
  # By default, the operations defined in spec files are added to the first
  # document below. You can override this behavior by adding a openapi_spec tag to the
  # the root example_group in your specs, e.g. describe '...', openapi_spec: 'v2/swagger.json'
  config.openapi_specs = {
    'v1/swagger.yaml' => {
      openapi: '3.0.1',
      info: {
        title: 'Investment API',
        version: 'v1',
        description: 'Esta página contém a documentação de como utilizar os endpoints de Investment APIs'
      },
      security: [
        { bearerAuth: [] }
      ],
      components: {
        securitySchemes: {
          bearerAuth: {
            type: :http,
            scheme: :bearer,
            bearerFormat: 'JWT',
            description: 'Autorizar com o email e senha gerado em área logada'
          }
        },
        schemas: {
          user_response_object: {
            type: :object,
            properties: {
              user: {
                type: :object,
                properties: {
                  id: { type: :string, format: :uuid },
                  name: { type: :string, example: 'The Butcher'  },
                  email: { type: :string, example: 'sam_marks@marvin-borer.test' },
                  token: { type: :string, nullable: true, default: nil },
                  created_at: { type: :string, format: :date },
                  updated_at: { type: :string, format: :date }
                }
              }
            }
          },
          user_response_error_object: {
            type: :object,
            properties: {
              errors: {
                type: :object,
                properties: {
                  name: {
                    type: :array,
                    items: { type: :string }
                  },
                  email: {
                    type: :array,
                    items: { type: :string }
                  },
                  password: {
                    type: :array,
                    items: { type: :string }
                  }
                }
              }
            }
          }
        }
      },
      servers: [
        {
          url: 'https://{enviroment}',
          variables: {
            enviroment: {
              default: 'investment-api-4fni.onrender.com',
              description: 'Ambiente online para utilizar a API',
              enum: [
                'investment-api-4fni.onrender.com'
              ]
            }
          }
        },
        {
          url: 'http://{enviroment}',
          variables: {
            enviroment: {
              default: 'localhost:3000',
              description: 'Ambiente local para utilizar a API',
              enum: [
                'localhost:3000'
              ]
            }
          }
        }
      ]
    }
  }

  # Specify the format of the output Swagger file when running 'rswag:specs:swaggerize'.
  # The openapi_specs configuration option has the filename including format in
  # the key, this may want to be changed to avoid putting yaml in json files.
  # Defaults to json. Accepts ':json' and ':yaml'.
  config.openapi_format = :yaml
end
