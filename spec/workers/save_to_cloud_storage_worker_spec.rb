require 'rails_helper'

RSpec.describe SaveToCloudStorageWorker, type: :worker do
  let(:worker) { described_class.new }

  describe "#perform" do
    let(:asset) { FactoryBot.create(:clean_asset) }

    context 'when S3 bucket is configured' do
      let(:cloud_storage) { double(:cloud_storage) }

      before do
        allow(Services).to receive(:cloud_storage).and_return(cloud_storage)
      end

      it 'saves the asset to cloud storage' do
        expect(cloud_storage).to receive(:save).with(asset)

        worker.perform(asset)
      end
    end

    context 'when S3 bucket is not configured' do
      before do
        allow(AssetManager).to receive(:aws_s3_bucket_name).and_return(nil)
      end

      it 'does not attempt to build AWS S3 resource', disable_cloud_storage_stub: true do
        expect(Aws::Resources::Resource).not_to receive(:new)

        worker.perform(asset)
      end
    end
  end
end