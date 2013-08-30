require_relative '../spec_helper'

describe Foghorn::Deployment do

  let(:dep) { Foghorn::Deployment.new({basename: "base", environment: "env", infra: "infra"})}
  let(:unique_dep) do
    u = dep.clone
    u.unique_name = "unique"
    u
  end

  describe "#name" do
    it "generates name from attrs" do
      dep.name.should == "base-env-infra"
    end

    it "includes unique name" do
      unique_dep.name.should == "base-env-unique-infra"
    end
  end

  describe "#subdomain" do

    context "central" do
      it "excludes infra subdomain" do
        dep.infra = "mtn"
        dep.subdomain.should == "base-env"
      end
    end

    context "shipcloud" do
      it "includes infra subdomain" do
        dep.subdomain.should == "base-env.infra"
      end

      it "includes unique name" do
        unique_dep.subdomain.should == "base-env-unique.infra"
      end
    end

  end
end
