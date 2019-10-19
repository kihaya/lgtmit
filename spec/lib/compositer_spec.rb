RSpec.describe Lgtmit::Compositer do
   let(:compositer) { described_class.new("spec/fixtures/rose.jpg") }
   let!(:original_size) { compositer.image.size }

   describe "#configure_image!" do
     before { compositer.configure_image! }
     let(:after_size) { compositer.image.size }

     it "file size changed"  do
       expect(after_size).not_to eq original_size
     end
   end
end
