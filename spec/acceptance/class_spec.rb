require 'spec_helper_acceptance'

describe 'singularity class:' do
  context 'default parameters' do
    it 'should run successfully' do
      pp =<<-EOS
      class { 'singularity': }
      EOS

      apply_manifest(pp, :catch_failures => true)
      apply_manifest(pp, :catch_changes => true)
    end

    describe package('singularity') do
      it { should be_installed }
    end

    describe file('/etc/singularity/singularity.conf') do
      it { should be_file }
      it { should be_mode 644 }
      it { should be_owned_by 'root' }
      it { should be_grouped_into 'root' }
    end
  end
end
