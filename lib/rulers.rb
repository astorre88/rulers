require 'rulers/array'
require 'rulers/version'
require 'rulers/routing'
require 'rulers/util'
require 'rulers/dependencies'

module Rulers
  class Application
    def call(env)
      # `echo debug > debug.txt`;

      if env['PATH_INFO'] == '/favicon.ico'
        return [404,
          {'Content-Type' => 'text/html'}, []]
      end

      if env['PATH_INFO'] == '/'
        return [200,
          {'Content-Type' => 'text/html'},
            ['Index page. Please, fill it in your project!']]
      end

      klass, act = get_controller_and_action(env)
      controller = klass.new(env)
      begin
        text = controller.send(act)
      rescue
        text = 'Error: 500'
      end
      [200, {'Content-Type' => 'text/html'},
        [text]]
    end
  end

  class Controller
    def initialize(env)
      @env = env
    end

    def env
      @env
    end
  end
end
