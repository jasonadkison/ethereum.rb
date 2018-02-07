require 'spec_helper'

describe Ethereum::Contract do

  let(:client) { Ethereum::IpcClient.new }
  let(:name) { "ContractWithInheritance" }
  let(:path) { "#{Dir.pwd}/spec/fixtures/#{name}.sol" }

  describe "create" do
    it "uses the name to extract the correct contract from solidity compilation" do
      @incorrect = Ethereum::Contract.create(file: path, client: client)
      expect(@incorrect.parent.class_object.to_s).to eq("Ethereum::Contract::ContractParent1")

      @correct = Ethereum::Contract.create(file: path, client: client, name: name)
      expect(@correct.parent.class_object.to_s).to eq("Ethereum::Contract::#{name}")
    end
  end

end
