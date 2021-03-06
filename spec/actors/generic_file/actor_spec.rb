require 'spec_helper'

describe Sufia::GenericFile::Actor do

  let(:user) { FactoryGirl.create(:user) }

  describe "#virus_check" do
    it "should return the results of running ClamAV scanfile method" do
      expect(ClamAV.instance).to receive(:scanfile).and_return(1)
      expect { Sufia::GenericFile::Actor.virus_check(File.new(fixture_path + '/world.png')) }.to raise_error(Sufia::VirusFoundError)
    end
  end

  describe "#featured_work" do
    let(:gf) { FactoryGirl.create(:generic_file, visibility: 'open') }
    let(:actor) { Sufia::GenericFile::Actor.new(gf, user)}

    before { FeaturedWork.create(generic_file_id: gf.noid) }

    after { gf.destroy }

    it "should be removed if document is not public" do
      # Switch document from public to restricted
      attributes = {'permissions'=>{'group' =>{'public' => '1', 'registered'=>'2'}}}
      expect { actor.update_metadata(attributes, 'restricted') }.to change { FeaturedWork.count }.by(-1)
    end
  end

  context "when a label is already specified" do
    let(:generic_file_with_label) do
      GenericFile.new.tap do |f|
        f.apply_depositor_metadata(user.user_key)
        f.label = "test_file.name"
      end
    end

    let(:actor) { Sufia::GenericFile::Actor.new(generic_file_with_label, user)}

    it "uses the label instead of the path" do
      allow(actor).to receive(:save_characterize_and_record_committer).and_return("true")
      actor.create_content(Tempfile.new('foo'), 'tmp\foo', 'content')
      expect(generic_file_with_label.content.dsLabel).to eq generic_file_with_label.label
    end
  end

end
