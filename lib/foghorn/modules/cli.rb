require 'open3'
require 'rainbow'

module Foghorn
  module Cli

    def self.command_successful?(command)
      stdout_str, stderr_str, status = ::Open3.capture3(command)
      (status == 0) ? true : false
    end

    def self.execute(command, messge)
      stdout_str, stderr_str, status = ::Open3.capture3(command)
      STDOUT.puts format_response(status, messge)
      unless status.success?
        STDERR.puts stdout_str
        exit 1
      end
    end

    def self.format_response(status, message)
      format = "%-40s %s"
      if status.success?
        return sprintf(format, message, "PASS".color(:green))
      else
        return sprintf(format, message, "FAIL".color(:red))
      end
    end

  end
end
