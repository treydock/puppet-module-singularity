require 'spec_helper_acceptance'

describe 'singularity class:' do
  context 'default parameters' do
    it 'runs successfully' do
      # TODO: Hack until EPEL module supports EPEL8
      if fact('os.release.major').to_i >= 8
        on hosts, 'puppet resource package epel-release ensure=installed'
        epel_class = "class { 'epel': epel_gpg_managed => false }"
      else
        epel_class = ''
      end
      pp = <<-EOS
      #{epel_class}
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
