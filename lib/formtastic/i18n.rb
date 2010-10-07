# coding: utf-8
module Formtastic
  module I18n
    
    DEFAULT_SCOPE = [:formtastic].freeze
    DEFAULT_VALUES = {
        :required       => 'required',
        :yes            => 'Yes',
        :no             => 'No',
        :create         => 'Create {{model}}',
        :update         => 'Update {{model}}'
      }.freeze
    SCOPES = [
        '{{model}}.{{nested_model}}.{{action}}.{{attribute}}',
        '{{model}}.{{action}}.{{attribute}}',
        '{{model}}.{{nested_model}}.{{attribute}}',
        '{{model}}.{{attribute}}',
        '{{nested_model}}.{{attribute}}',
        '{{attribute}}'
      ]
      
    class << self
      
      def translate(*args)
        key = args.shift.to_sym
        options = args.extract_options!
        options.reverse_merge!(:default => DEFAULT_VALUES[key])
        options[:scope] = [DEFAULT_SCOPE, options[:scope]].flatten.compact
        ::I18n.translate(key, *(args << options))
      end
      alias :t :translate
      
      def localize(*args)
        value = args.shift
        options = args.extract_options!
        ::I18n.localize(value, *(args << options))
      end
      alias :l :localize
    end
    
  end
end