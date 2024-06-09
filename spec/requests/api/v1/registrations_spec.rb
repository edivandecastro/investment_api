require 'swagger_helper'

RSpec.describe 'Api::V1::User' do

  path '/api/v1/user' do
    post 'Cadastra um usuário' do
      tags 'Users'
      produces 'application/json'
      consumes 'application/json'
      let(:Authorization) { 'Bearer ba599704960ba48ce02a'  }

      parameter name: :user,
                in: :body,
                schema: {
                  type: :object,
                  properties: {
                    user: {
                      type: :object,
                      properties: {
                        name: { type: :string, example: 'The Butcher' },
                        email: { type: :string, example: 'sam_marks@marvin-borer.test' },
                        password: { type: :string, example: '123456' }
                      }
                    }
                  },
                  required: %w[name email password]
                }

      response '201', 'usuário criado com sucesso' do
        schema('$ref' => '#/components/schemas/user_response_object')

        let(:user) do
          {
            user: {
              name: 'The Butcher',
              email: 'sam_marks@marvin-borer.test',
              password: '123456'
            }
          }
        end

        run_test!
      end

      response '422', 'email já cadastrado' do
        example 'application/json', :taken_email, {
          errors: {
            email: [I18n.t('errors.messages.taken')]
          }
        }

        let(:user_created) { create(:user) }
        let(:user) do
          {
            user: {
              name: user_created.name,
              email: user_created.email,
              password: '123456'
            }
          }
        end

        run_test!
      end

      response '422', 'valores em branco ou vazios' do
        example 'application/json', :blank_email, {
          errors: {
            email: [I18n.t('errors.messages.blank')]
          }
        }

        example 'application/json', :blank_password, {
          errors: {
            password: [I18n.t('errors.messages.blank')]
          }
        }

        example 'application/json', :blank_name, {
          errors: {
            name: [I18n.t('errors.messages.blank')]
          }
        }

        let(:user) do
          {
            user: {
              name: '',
              email: '',
              password: ''
            }
          }
        end

        run_test!
      end
    end
  end
end
