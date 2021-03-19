require 'spec_helper_acceptance'

describe 'singularity class:' do
  context 'default parameters' do
    it 'runs successfully' do
      pp = <<-EOS
      include singularity
      EOS

      apply_manifest(pp, catch_failures: true)
      apply_manifest(pp, catch_changes: true)
    end

    describe file('/etc/singularity/singularity.conf') do
      it { is_expected.to be_file }
      it { is_expected.to be_mode 644 }
      it { is_expected.to be_owned_by 'root' }
      it { is_expected.to be_grouped_into 'root' }
    end

    describe command('singularity exec library://alpine cat /etc/alpine-release') do
      its(:exit_status) { is_expected.to eq(0) }
      its(:stdout) { is_expected.to match %r{[0-9]+.[0-9]+.[0-9]+} }
    end
  end
end
