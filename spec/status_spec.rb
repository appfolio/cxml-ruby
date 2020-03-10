# frozen_string_literal: true

require 'spec_helper'

describe CXML::Status do
  describe 'instance' do
    it { should respond_to :code }
    it { should respond_to :text }
    it { should respond_to :xml_lang }
    it { should respond_to :success? }
    it { should respond_to :failure? }
  end

  describe '#initialize' do
    it 'assigns attributes from string' do
      str = '<Status xml:lang="en-US" code="200" text="OK"></Status>'
      status = CXML::Status.new(str)

      status.code.should eq(200)
      status.xml_lang.should eq('en-US')
      status.text.should eq('OK')
    end

    it 'assigns attributes from hash' do
      hash = { 'xml:lang' => 'en-US', 'code' => '200', 'text' => 'OK' }
      status = CXML::Status.new(hash)

      status.code.should eq(200)
      status.xml_lang.should eq('en-US')
      status.text.should eq('OK')
    end
  end

  describe '#success?' do
    it 'returns true on 2xx codes' do
      CXML::Status.new('code' => '200').success?.should be true
      CXML::Status.new('code' => '201').success?.should be true
      CXML::Status.new('code' => '281').success?.should be true
    end

    it 'returns false on non 2xx codes' do
      CXML::Status.new('code' => '400').success?.should be false
      CXML::Status.new('code' => '475').success?.should be false
      CXML::Status.new('code' => '500').success?.should be false
    end
  end

  describe '#failure?' do
    it 'returns false on 2xx codes' do
      CXML::Status.new('code' => '200').failure?.should be false
    end
  end
end
