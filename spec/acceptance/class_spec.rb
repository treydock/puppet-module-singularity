require 'spec_helper_acceptance'

describe 'singularity class:' do
  context 'default parameters' do
    it 'runs successfully' do
      pp = <<-EOS
      class { 'singularity': }
      EOS

      apply_manifest(pp, catch_failures: true)
      apply_manifest(pp, catch_changes: true)
    end

    describe package('singularity') do
      it { is_expected.to be_installed }
    end

    describe file('/etc/singularity/singularity.conf') do
      it { is_expected.to be_file }
      it { is_expected.to be_mode 644 }
      it { is_expected.to be_owned_by 'root' }
      it { is_expected.to be_grouped_into 'root' }
    end
  end
end
