require 'spec_helper'
require 'wrapper/wrapper'

describe WresqueWrapper do

  before(:all) do
    module ActiveRecord
      class Base; end
    end
  end

  before(:each) do
    class DummyClass
      include WresqueWrapper
      self.default_queue = :dummy_queue
      def id; 1; end
    end

    ActiveRecord::Base.stubs(:verify_active_connections!).returns(true)

    @dummy = DummyClass.new
  end

  describe "Global default_queue" do
    it do
      WresqueWrapper.should respond_to :default_queue
      WresqueWrapper.should respond_to :default_queue=
    end
  end

  describe "Class methods" do
    describe ".included" do
      it "should add accessors" do
        DummyClass.should respond_to :queue
        DummyClass.should respond_to :default_queue
      end

      it "should add the instance methods" do
        @dummy.should respond_to :delay
      end
    end

    describe ".default_queue" do
      it "should set the default queue" do
        DummyClass.default_queue = :dummier_queue
        DummyClass.default_queue.should == :dummier_queue
      end
    end

    describe ".perform" do
      it "should send the method to an instance if given an id" do
        test_method = :test_method
        test_args = [1, 2, 3]
        DummyClass.expects(:find).once.returns(@dummy)
        @dummy.expects(:send).with(test_method, *test_args).once.returns(true)
        DummyClass.perform(1, test_method, *test_args)
      end

      it "should send the method to the class if no id is given" do
        test_method = :test_method
        test_args = [1, 2, 3]
        DummyClass.expects(:send).with(test_method, *test_args).once.returns(true)
        DummyClass.perform(nil, test_method, *test_args)
      end
    end

    describe ".delay" do
      it "should return the appropriate proxy object" do
        DummyClass.delay.class.should == WresqueWrapper::WrapperProxies::Proxy
      end

      it "should not raise an exception if no queue is set" do
        DummyClass.default_queue = nil
        lambda { DummyClass.delay }.should_not raise_error
      end
    end
  end

  describe "Instance methods" do
    describe "#delay" do
      it "should return the appropriate proxy object" do
        @dummy.delay.class.should == WresqueWrapper::WrapperProxies::Proxy
      end

      it "should not raise an exception if no queue is set" do
        DummyClass.default_queue = nil
        lambda { @dummy.delay }.should_not raise_error
      end
    end
  end

  describe WresqueWrapper::WrapperProxies do
    describe "Proxy for Class" do
      before(:each) do
        @class_proxy = WresqueWrapper::WrapperProxies::Proxy.new(DummyClass, DummyClass, nil, :new_queue)
      end

      describe "#initialize" do
        it "should set the target class's queue" do
          DummyClass.queue.should == :new_queue
        end

        it "should retain the target class" do
          @class_proxy.target.should == DummyClass
        end
      end

      describe "#method_missing" do
      end

      describe "#respond_to?" do
      end
    end

    describe "Proxy for instance" do
      before(:each) do
        @instance_proxy = WresqueWrapper::WrapperProxies::Proxy.new(@dummy, @dummy.class, @dummy.id, :new_queue)
      end

      describe "#initialize" do
        it "should set the target class's queue" do
          DummyClass.queue.should == :new_queue
        end

        it "should retain the target instance" do
          @instance_proxy.target.should == @dummy
        end
      end

      describe "#method_missing" do
      end

      describe "#respond_to?" do
      end
    end
  end
end
