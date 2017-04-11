# frozen_string_literal: true

require 'fileutils'

module Ryu39Cop
  class CLI
    def self.start(args)
      action_name = retrieve_command_name(args)
      unless action_name
        print_help
        exit
      end

      instance = self.new
      if instance.public_methods(false).include?(action_name.to_sym)
        instance.__send__(action_name, args)
        exit
      end

      puts "Could not find command #{action_name}."
      print_help
      exit(1)
    rescue => e
      puts e.message
      exit(1)
    end

    def self.retrieve_command_name(args)
      return nil if args.empty?
      meth = args.first.to_s
      args.shift if meth !~ /^\-/
    end

    def self.print_help
      puts 'ryu39cop commands:'
      puts '  init - Setup .rubocop.yml'
    end

    CONFIG_FILE_NAME = '.rubocop.yml'.freeze

    def init(args)
      raise 'usage: ryu39cop init' unless args.empty?
      template_path = File.expand_path('../../templates', __dir__)
      puts "#{File.exist?(CONFIG_FILE_NAME) ? 'overwrite' : 'create'} #{CONFIG_FILE_NAME}"
      FileUtils.copy_file(File.join(template_path, CONFIG_FILE_NAME), CONFIG_FILE_NAME)
    end
  end
end
