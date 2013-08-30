require_relative '../../spec_helper'

describe Foghorn::Cli do

  let(:cli) { Foghorn::Cli }
  let(:status) { obj = double() }
  let(:command) { 'ls' }
  let(:unsuccessful_command) { 'ls ___bad___' }

  describe ".execute" do
    context "when successful command" do
      it "writes PASS message to STDOUT" do
        STDOUT.should_receive(:puts).with(/PASS/)
        cli.execute(command, 'Test message')
      end
    end

    context "when unsuccessful command" do
      it "writes FAIL message to STDOUT and exits" do
        STDOUT.should_receive(:puts).with(/FAIL/)
        expect { cli.execute(unsuccessful_command, 'Test message') }.to raise_error SystemExit
      end

      it "writes subshell's error message to STDERR and exits" do
        STDERR.should_receive(:puts)
        expect { cli.execute(unsuccessful_command, 'Test message') }.to raise_error SystemExit
      end
    end
  end

  describe ".command_successful?" do
    context "when successful command" do
      it "returns true when subshell exits 0" do
        cli.command_successful?(command).should be_true
      end
    end

    context "when unsuccessful command" do
      it "returns true when subshell exits non 0" do
        cli.command_successful?(unsuccessful_command).should be_false
      end
    end
  end

  describe ".format_response" do
    it "formats command responses" do
      status.stub(:success?) { true }
      format_response = cli.send(:format_response, status, 'Test')
      response = "Test                                     \e[32mPASS\e[0m"
      format_response.should == response
    end
  end
end
