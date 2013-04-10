module Chromelogger
  class Console
    include Singleton

    HEADER_NAME = 'X-ChromeLogger-Data'

    def initialize
      @console = {
        :version => Chromelogger::VERSION,
        :columns => ['log', 'backtrace', 'type'],
        :rows => []
      }
    end

    def self.log(*args)
      instance.write('', args)
    end

    def self.warn(*args)
      instance.write('warn', args)
    end

    def self.error(*args)
      instance.write('error', args)
    end

    def self.get_header
      header = instance.header
      instance.reset!

      header
    end

    def write(type, args)
      args.map! do |arg|
        unless [String, Fixnum, Float, Integer, Array, Hash, TrueClass, FalseClass, NilClass].include?(arg.class)
          arg = { '___class_name' => arg.class.to_s }
        end
      end

      backtrace = $@.join($/) unless $@.nil?

      @console[:rows] << [args, backtrace, type]
    end

    def header
      unless @console[:rows].empty?
        json_data = @console.to_json

        { HEADER_NAME => Base64.strict_encode64(json_data) }
      end
    end

    def reset!
      @console[:rows].clear
    end

  end

  class Middleware
    def initialize(app)
      @app = app
    end

    def call(env)
      status, headers, response = @app.call(env)
      console_header = Console.get_header
      headers.merge!(console_header) unless console_header.nil?
      [status, headers, response]
    end
  end
end
